package com.authenticate.ws;

import java.util.Map;
import java.util.Set;

import javax.ws.rs.FormParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;

import org.forgerock.opendj.ldap.Connection;
import org.forgerock.opendj.ldap.LDAPConnectionFactory;
import org.forgerock.opendj.ldap.SearchScope;
import org.forgerock.opendj.ldap.responses.SearchResultEntry;
@SuppressWarnings("rawtypes")
@Path("/role")
public class RoleResource {

	@POST
	@Path("/getRoleUser")
	public String getRole1(@FormParam("accessToken") String accessToken) {
		String username = "";
		String authenCode= "";
		if (LoginResource.listAccessToken == null || LoginResource.listUserName == null) return null;
		else {
			for (Object o: LoginResource.listAccessToken.entrySet()) {	
				Map.Entry entry = (Map.Entry) o;
		        if(entry.getValue().equals(accessToken))
		        {
		        	authenCode = entry.getKey().toString();
		        	break;
		        }
		    }
			for (Object o: LoginResource.listUserName.entrySet()) {	
				Map.Entry entry = (Map.Entry) o;
		        if(entry.getValue().equals(authenCode))
		        {
		        	username = entry.getKey().toString();
		        	break;
		        }
		    }
		}
		
		Connection connection = null;
		String[] group = new String[]{"User","Admin"};
		try {
			LDAPConnectionFactory factory = new LDAPConnectionFactory(
					"localhost", 1389);
			connection = factory.getConnection();
			SearchResultEntry entry = null;
			entry = connection.searchSingleEntry("dc=springldap,dc=com", 
					SearchScope.WHOLE_SUBTREE, "(uid=" + username + ")", "*");
			String cn = "cn=" + entry.parseAttribute("cn").asString();
			for (int i = 0; i < group.length; i++) {
				entry = connection.searchSingleEntry("ou=groups,dc=springldap,dc=com", 
						SearchScope.WHOLE_SUBTREE, "(cn=" + group[i] + ")", "*");
				Set<String> users = entry.parseAttribute("uniqueMember").asSetOfString("");
				for (String j : users) {
					if (j.contains(cn)) {	
						return group[i];
					}
				}
			}	
		} catch (final Exception e) {
			return "error";
		} finally {
			if (connection != null) {
				connection.close();
			}
		}
		return "norole";
	}
	
}