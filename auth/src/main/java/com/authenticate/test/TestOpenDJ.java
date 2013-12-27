package com.authenticate.test;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

import org.forgerock.opendj.ldap.Connection;
import org.forgerock.opendj.ldap.Entries;
import org.forgerock.opendj.ldap.Entry;
import org.forgerock.opendj.ldap.ErrorResultException;
import org.forgerock.opendj.ldap.ErrorResultIOException;
import org.forgerock.opendj.ldap.LDAPConnectionFactory;
import org.forgerock.opendj.ldap.LinkedHashMapEntry;
import org.forgerock.opendj.ldap.SearchResultReferenceIOException;
import org.forgerock.opendj.ldap.SearchScope;
import org.forgerock.opendj.ldap.TreeMapEntry;
import org.forgerock.opendj.ldap.requests.ModifyRequest;
import org.forgerock.opendj.ldap.responses.SearchResultEntry;
import org.forgerock.opendj.ldif.ConnectionEntryReader;

import com.authenticate.pojo.User;

public class TestOpenDJ {

	public static void main(String[] args) throws UnsupportedEncodingException, ErrorResultException, ErrorResultIOException, SearchResultReferenceIOException {
		// TODO Auto-generated method stub
		Connection connection = null;
		List<User> users = new ArrayList<User>();
		final LDAPConnectionFactory factory = new LDAPConnectionFactory(
				"0.0.0.0", 1389);
		connection = factory.getConnection();
		final ConnectionEntryReader reader = connection
				.search("dc=springldap,dc=com", SearchScope.WHOLE_SUBTREE,
						"uid=*", "*");
		while (reader.hasNext()) {
			if (!reader.isReference()) {
				User user = new User();
				SearchResultEntry entry = reader.readEntry();
				user.setHoTen(entry.parseAttribute("fullname").asString());
				user.setStatus(entry.parseAttribute("status").asString());
				user.setUsername(entry.parseAttribute("uid").asString());
				user.setEmail(entry.parseAttribute("mail").asString());
				user.setDiaChi(entry.parseAttribute("address").asString());
				user.setDienThoai(entry.parseAttribute("telephoneNumber")
						.asString());
				user.setNgaySinh(entry.parseAttribute("birthday").asString());
				if(entry.parseAttribute("sex") != null){
					user.setGioiTinh(entry.parseAttribute("sex").asBoolean());
				}else{
					user.setGioiTinh(true);
				}
				user.setTrangThai(entry.parseAttribute("status").asInteger());
				System.out.println(user);
				users.add(user);
			}
		}
		System.out.println(users);

		if (connection != null) {
			connection.close();
		}
	}
}
