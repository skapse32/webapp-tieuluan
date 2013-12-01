package com.authenticate.ws;

import java.util.Hashtable;
import java.util.Random;
import java.util.UUID;

import javax.ws.rs.FormParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

import org.forgerock.opendj.ldap.Connection;
import org.forgerock.opendj.ldap.DN;
import org.forgerock.opendj.ldap.LDAPConnectionFactory;
import org.forgerock.opendj.ldap.SearchScope;
import org.forgerock.opendj.ldap.responses.SearchResultEntry;
@Produces("application/json")
@Path("/login")
public class LoginResource {
	static Hashtable<String, String> listUserName;
	static Hashtable<String, String> listAccessToken;
	
	public LoginResource() {
		if (listUserName == null) listUserName = new Hashtable<String, String>();
		if (listAccessToken == null) listAccessToken = new Hashtable<String, String>();
	}	

	@POST
	@Path("/loginpost")
	@Produces("application/json")
	public String getLoginPost(@FormParam("username") String username,
			@FormParam("password") String password) {
		Connection connection = null;
		try {
			final LDAPConnectionFactory factory = new LDAPConnectionFactory("localhost", 1389);
			connection = factory.getConnection();
			final SearchResultEntry entry = connection.searchSingleEntry("dc=springldap,dc=com", 
					SearchScope.WHOLE_SUBTREE, "(uid=" + username + ")", "*");
			DN bindDN = entry.getName();
			connection.bind(bindDN.toString(), password.toCharArray());
			Random r = new Random();
			String authenCode = "";
			for (int i = 0; i < 10; i++) {
				authenCode += (char)(r.nextInt(26) + 97);
			}
			listUserName.put(username, authenCode);
			return authenCode;
		} catch (final Exception e) {
			return "";
		} finally {
			if (connection != null) {
				connection.close();
			}
		}
	}
	
	@POST
	@Path("/accessToken")
	@Produces("application/json")
	public String getAccessToken(@FormParam("authenCode") String authenCode) {
		if (listUserName.containsValue(authenCode)) {
			String accessToken = UUID.randomUUID().toString();
			listAccessToken.put(authenCode, accessToken);
			return accessToken;
		}
		return "";
	}

}