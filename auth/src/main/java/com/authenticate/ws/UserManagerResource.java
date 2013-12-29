package com.authenticate.ws;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Collection;

import javax.ws.rs.FormParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.forgerock.opendj.ldap.Connection;
import org.forgerock.opendj.ldap.DN;
import org.forgerock.opendj.ldap.Entries;
import org.forgerock.opendj.ldap.Entry;
import org.forgerock.opendj.ldap.ErrorResultException;
import org.forgerock.opendj.ldap.LDAPConnectionFactory;
import org.forgerock.opendj.ldap.LinkedHashMapEntry;
import org.forgerock.opendj.ldap.ModificationType;
import org.forgerock.opendj.ldap.ResultCode;
import org.forgerock.opendj.ldap.RootDSE;
import org.forgerock.opendj.ldap.SearchScope;
import org.forgerock.opendj.ldap.TreeMapEntry;
import org.forgerock.opendj.ldap.controls.PermissiveModifyRequestControl;
import org.forgerock.opendj.ldap.requests.CompareRequest;
import org.forgerock.opendj.ldap.requests.ModifyRequest;
import org.forgerock.opendj.ldap.requests.Requests;
import org.forgerock.opendj.ldap.responses.CompareResult;
import org.forgerock.opendj.ldap.responses.SearchResultEntry;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


@Produces("application/json")
@Path("/usermanager")
public class UserManagerResource {

	final LDAPConnectionFactory factory = new LDAPConnectionFactory("0.0.0.0", 1389);
	private Logger log = LoggerFactory.getLogger(UserManagerResource.class);
	
	@POST
	@Path("/addUser")
	@Produces("application/json;")
	public String addUser(@FormParam("username") String username,
			@FormParam("password") String password,
			@FormParam("fullname") String fullname,
			@FormParam("address") String address,
			@FormParam("telephoneNumber") String telephoneNumber,
			@FormParam("sex") boolean sex,
			@FormParam("birthday") String birthday,
			@FormParam("mail") String mail) throws UnsupportedEncodingException {
		log.info("Come here " + username);
		Entry entry = new LinkedHashMapEntry("cn=" + username + ",ou=users,dc=springldap,dc=com")
				.addAttribute("cn", username)
				.addAttribute("uid", username)
				.addAttribute("objectclass", "myobjectclass")
				.addAttribute("userPassword", password)
				.addAttribute("fullname", URLDecoder.decode(fullname, "UTF-8"))
				.addAttribute("address",  URLDecoder.decode(address, "UTF-8"))
				.addAttribute("telephoneNumber", telephoneNumber)
				.addAttribute("sex", sex)
				.addAttribute("birthday", birthday)
				.addAttribute("mail", mail)
				.addAttribute("status", 1);

		Connection connection = null;
		try {
			connection = factory.getConnection();
			connection.bind("cn=Directory Manager", "talavua".toCharArray());
			connection.add(entry);
			// Them user vao group chua xac nhan tai khoan DeactiveUser.
			entry = new LinkedHashMapEntry("cn=DeactiveUser,ou=groups,dc=springldap,dc=com");
			Entry old = TreeMapEntry.deepCopyOfEntry(entry);
			entry = entry.replaceAttribute("member",
					"cn=" + username + ",ou=users,dc=springldap,dc=com");
			ModifyRequest request = Entries.diffEntries(old, entry);
			connection.modify(request);
			// loi dau cho nay ak'/ kg dk user dc
			log.info("1. ok");
		} catch (final ErrorResultException e) {

			log.info("2. error");
			return "error";
		} finally {
			if (connection != null) {
				connection.close();
			}

			log.info("3. finally");
		}

		log.info("4. success");
		return "success";
	}
	
	@POST
	@Path("/checkUser")
	@Produces(MediaType.TEXT_PLAIN)
	public String checkUser(@FormParam("username") String username){
		log.info("Checking username: " + username);
		try {
			connection = factory.getConnection();

			SearchResultEntry entry = connection.searchSingleEntry("dc=springldap,dc=com",
					SearchScope.WHOLE_SUBTREE, "(uid="+username+")", "cn");
			DN bindDN = entry.getName();
			System.out.println("user exist " + bindDN + "!.");
			return "true";
		} catch (ErrorResultException e) {
			System.err.println("error " + e.getMessage());
		} finally {
			if (connection != null) {
				connection.close();
			}
		}
		return "false";
	}
	

	@POST
	@Path("/checkEmail")
	@Produces(MediaType.TEXT_PLAIN)
	public String checkEmail(@FormParam("email") String email){
		log.info("Checking email: " + email);
		
		try {
			connection = factory.getConnection();

			SearchResultEntry entry = connection.searchSingleEntry("dc=springldap,dc=com",
					SearchScope.WHOLE_SUBTREE, "(mail="+email+")", "cn");
			DN bindDN = entry.getName();
			System.out.println("email exist " + bindDN + "!.");
			return "true";
		} catch (ErrorResultException e) {
			System.err.println("error " + e.getMessage());
		} finally {
			if (connection != null) {
				connection.close();
			}
		}
		return "false";
	}
	
	@POST
	@Path("/activeUser")
	@Produces("application/json;")
	public String addUser(@FormParam("phoneNumber") String phoneNumber) throws UnsupportedEncodingException {
		log.info("Active phoneNumber " + phoneNumber);
		return null;
	}
	
	private static Connection connection = null;
	
	@POST
	@Path("/banUser")
	@Produces("application/json;")
	public String banUser(@FormParam("username") String username) throws UnsupportedEncodingException {
		log.info("banned user " + username);		
		final String userGroupDN = "cn=User,ou=groups,dc=springldap,dc=com";
        final String bannedGroupDN = "cn=BannedUser,ou=groups,dc=springldap,dc=com";
        final ModificationType delType = getModificationType("del");
        final ModificationType addType = getModificationType("add");
		try {
			connection = factory.getConnection();
			 
			final String user = "cn=Directory Manager";
            final char[] password = "talavua".toCharArray();
            connection.bind(user, password);
			
			final SearchResultEntry entry = connection.searchSingleEntry("dc=springldap,dc=com", 
					SearchScope.WHOLE_SUBTREE, "&(uid=" + username + ")", "cn");
			DN userDN = entry.getName();
			PermissiveModify(delType,userDN,userGroupDN);
			PermissiveModify(addType,userDN,bannedGroupDN);
			if (connection != null) {
                connection.close();
            }
			return "success";
		}catch (final ErrorResultException e) {
            System.err.println(e.getMessage());
            System.exit(e.getResult().getResultCode().intValue());
            if (connection != null) {
                connection.close();
            }
            return "error";
        }
	}
	
	@POST
	@Path("/activeBannedUser")
	@Produces("application/json;")
	public String activeBannedUser(@FormParam("username") String username) throws UnsupportedEncodingException {
		log.info("active user " + username);		
		final String userGroupDN = "cn=BannedUser,ou=groups,dc=springldap,dc=com";
        final String bannedGroupDN = "cn=User,ou=groups,dc=springldap,dc=com";
        final ModificationType delType = getModificationType("del");
        final ModificationType addType = getModificationType("add");
		try {
			connection = factory.getConnection();
			
			final String user = "cn=Directory Manager";
            final char[] password = "talavua".toCharArray();
            connection.bind(user, password);
			
			final SearchResultEntry entry = connection.searchSingleEntry("dc=springldap,dc=com", 
					SearchScope.WHOLE_SUBTREE, "&(uid=" + username + ")", "cn");
			DN userDN = entry.getName();
			PermissiveModify(delType,userDN,userGroupDN);
			PermissiveModify(addType,userDN,bannedGroupDN);
			if (connection != null) {
                connection.close();
            }
			return "success";
		}catch (final ErrorResultException e) {
            System.err.println(e.getMessage());
            System.exit(e.getResult().getResultCode().intValue());
            if (connection != null) {
                connection.close();
            }
            return "error";
        }
	}
	
	 private static void PermissiveModify(ModificationType modType,DN userDN,String groupDN) {
		 Collection<String> controls;
		try {
			controls = RootDSE.readRootDSE(connection).getSupportedControls();
		 if (controls.contains(PermissiveModifyRequestControl.OID)) {
			 
             final ModifyRequest request = Requests.newModifyRequest(groupDN)
                     .addControl(PermissiveModifyRequestControl.newControl(true))
                     .addModification(modType, "member", userDN);
             connection.modify(request);

         }else {
            
             final CompareRequest request =
                     Requests.newCompareRequest(groupDN, "member", userDN);
             CompareResult result = connection.compare(request);

             if (modType == ModificationType.ADD) {
                 if (result.getResultCode() == ResultCode.COMPARE_FALSE) {
                     System.out.println("Member does not yet belong to group."
                             + " Adding it...");
                     final ModifyRequest addMember =
                             Requests.newModifyRequest(groupDN)
                                 .addModification(modType, "member", userDN);
                     connection.modify(addMember);
                 }
             }

             if (modType == ModificationType.DELETE) {
                 if (result.getResultCode() == ResultCode.COMPARE_TRUE) {
                     System.out.println("Member belongs to group."
                             + " Removing it...");
                     final ModifyRequest delMember =
                             Requests.newModifyRequest(groupDN)
                                 .addModification(modType, "member", userDN);
                     connection.modify(delMember);
                 }
             }  

         }
		} catch (ErrorResultException e) {
			e.printStackTrace();
		}
	 }
	 private static ModificationType getModificationType(String operation) {
         if (!(operation.equalsIgnoreCase("add") || operation.equalsIgnoreCase("del"))) {
        	 System.err.println("error!!");
         }
         return (operation.equalsIgnoreCase("add"))
                 ? ModificationType.ADD : ModificationType.DELETE;
     }
}
