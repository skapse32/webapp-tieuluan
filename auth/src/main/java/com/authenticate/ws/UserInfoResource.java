package com.authenticate.ws;

import java.io.IOException;
import java.security.GeneralSecurityException;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.PBEParameterSpec;
import javax.ws.rs.FormParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

import org.forgerock.opendj.ldap.Connection;
import org.forgerock.opendj.ldap.DN;
import org.forgerock.opendj.ldap.LDAPConnectionFactory;
import org.forgerock.opendj.ldap.SearchScope;
import org.forgerock.opendj.ldap.responses.SearchResultEntry;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import sun.misc.BASE64Decoder;

import com.authenticate.pojo.User;

@Produces("application/json")
@Path("/userinfo")
public class UserInfoResource {
	private static final char[] KEY = "enfldsgbnlsngdlksdsgm".toCharArray();
	private static final byte[] SALT = { (byte) 0xde, (byte) 0x33, (byte) 0x10,
			(byte) 0x12, (byte) 0xde, (byte) 0x33, (byte) 0x10, (byte) 0x12, };
	Logger logger = LoggerFactory.getLogger(UserInfoResource.class);
	@POST
	@Path("/username")
	@Produces("application/json")
	public User getUserInfoPOST(@FormParam("username") String username) {
		Connection connection = null;
		User user = new User();
		try {
			logger.info("Come to read user");
			final LDAPConnectionFactory factory = new LDAPConnectionFactory("0.0.0.0", 1389);
			connection = factory.getConnection();
			final SearchResultEntry entry = connection.searchSingleEntry("dc=springldap,dc=com", 
					SearchScope.WHOLE_SUBTREE, "(uid=" + username + ")", "*");
			user.setHoTen(entry.parseAttribute("fullname").asString());
			user.setStatus("1");
			user.setUsername(username);
			user.setEmail(entry.parseAttribute("mail").asString());
			user.setDiaChi(entry.parseAttribute("address").asString());
			user.setDienThoai(entry.parseAttribute("telephoneNumber").asString());
			user.setNgaySinh(entry.parseAttribute("birthday").asString());
			user.setGioiTinh(entry.parseAttribute("sex").asBoolean());
			user.setTrangThai(entry.parseAttribute("status").asInteger());
			logger.info(user.toString());
			return user;
		} catch (final Exception e) {
			user.setStatus("error");
			return user;
		} finally {
			if (connection != null) {
				connection.close();
			}
		}
	}

	@POST
	@Path("/password")
	@Produces("application/json")
	public String getUserPassPOST(@FormParam("username") String username,
			@FormParam("password") String password,
			@FormParam("newPassword") String newPassword) {
		Connection connection = null;
		try {
			String passDecrypt = decrypt(password);
			// Check username and password
			LDAPConnectionFactory factory = new LDAPConnectionFactory("localhost", 1389);
			connection = factory.getConnection();
			SearchResultEntry entry = connection.searchSingleEntry("dc=springldap,dc=com", 
					SearchScope.WHOLE_SUBTREE, "(uid="+ username + ")", "*");
			DN bindDN = entry.getName();
			connection.bind(bindDN.toString(), passDecrypt.toCharArray());
			// Update password
			String newPassDecrypt = decrypt(newPassword);
			String str = "cmd /C C:/OpenDJ-2.5.0/bat/ldappasswordmodify" +
					" --port 1389" + 
					" --authzID \"dn:cn=" + username + ",ou=users,dc=springldap,dc=com\""+
					" --currentPassword " + passDecrypt + 
					" --newPassword " + newPassDecrypt;
			Process process = Runtime.getRuntime().exec(str);
			synchronized (process) {
				process.wait(2000);			
			}
			connection.bind(bindDN.toString(), newPassDecrypt.toCharArray());
			return "success";
		} catch (final Exception e) {
			return "error";
		} finally {
			if (connection != null) {
				connection.close();
			}
		}
	}

	private static String decrypt(String password) throws GeneralSecurityException, IOException {
		SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("PBEWithMD5AndDES");
		SecretKey key = keyFactory.generateSecret(new PBEKeySpec(KEY));
		Cipher pbeCipher = Cipher.getInstance("PBEWithMD5AndDES");
		pbeCipher.init(Cipher.DECRYPT_MODE, key, new PBEParameterSpec(SALT, 20));
		return new String(pbeCipher.doFinal(base64Decode(password)), "UTF-8");
	}

	private static byte[] base64Decode(String property) throws IOException {
		return new BASE64Decoder().decodeBuffer(property);
	}
}