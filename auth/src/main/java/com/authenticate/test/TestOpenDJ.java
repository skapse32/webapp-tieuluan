package com.authenticate.test;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import org.forgerock.opendj.ldap.Connection;
import org.forgerock.opendj.ldap.Entries;
import org.forgerock.opendj.ldap.Entry;
import org.forgerock.opendj.ldap.ErrorResultException;
import org.forgerock.opendj.ldap.LDAPConnectionFactory;
import org.forgerock.opendj.ldap.LinkedHashMapEntry;
import org.forgerock.opendj.ldap.TreeMapEntry;
import org.forgerock.opendj.ldap.requests.ModifyRequest;

public class TestOpenDJ {

	public static void main(String[] args) throws UnsupportedEncodingException {
		// TODO Auto-generated method stub
		Entry entry = new LinkedHashMapEntry("cn=nvh"
				+ ",ou=users,dc=springldap,dc=com")
				.addAttribute("cn", "nvh")
				.addAttribute("uid", "nvh")
				.addAttribute("objectclass", "myobjectclass")
				.addAttribute("userPassword", "talavua")
				
				.addAttribute("fullname", URLDecoder.decode("Nguyễn Văn Hòa", "UTF-8"))
		.addAttribute("address",  URLDecoder.decode("43 Hàn Thuyên", "UTF-8"))
		.addAttribute("telephoneNumber", "01289816416")
		.addAttribute("sex", true)
		.addAttribute("birthday", "04-12-1992")
		.addAttribute("mail", "nvh0412@gmail.com")
		.addAttribute("status", 1);

		final LDAPConnectionFactory factory = new LDAPConnectionFactory(
				"0.0.0.0", 389);
		Connection connection = null;
		try {
			connection = factory.getConnection();
			connection.bind("cn=Directory Manager", "talavua".toCharArray());
			connection.add(entry);
			// Them user vao group
			entry = new LinkedHashMapEntry(
					"cn=User,ou=groups,dc=springldap,dc=com");
			Entry old = TreeMapEntry.deepCopyOfEntry(entry);
			entry = entry.replaceAttribute("uniqueMember", "cn=" + "nvh"
					+ ",ou=users,dc=springldap,dc=com");
			ModifyRequest request = Entries.diffEntries(old, entry);
			connection.modify(request);
		} catch (final ErrorResultException e) {
			e.printStackTrace();
		} finally {
			if (connection != null) {
				connection.close();
			}
		}
	}

}
