package com.authenticate.ws;

import java.util.Map;

import javax.ws.rs.FormParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

@Produces("application/json")
@Path("/accessToken")
@SuppressWarnings("rawtypes")
public class AccessTokenResource {
	@POST
	@Path("/check")
	@Produces("application/json")
	public String checkAccessToken(@FormParam("accessToken") String accessToken) {

		if (LoginResource.listAccessToken == null)
			return "false";
		else {
			for (Object o : LoginResource.listAccessToken.entrySet()) {

				Map.Entry entry = (Map.Entry) o;
				if (entry.getValue().equals(accessToken))
					return "true";
			}
		}
		return "false";
	}
	@POST
	@Path("/getAccessToken")
	@Produces("application/json")
	public String getAccessToken(@FormParam("authenCode") String authenCode) {

		if (LoginResource.listAccessToken == null)
			return "false";
		else {
			for (Object o : LoginResource.listAccessToken.entrySet()) {

				Map.Entry entry = (Map.Entry) o;
				if (entry.getKey().equals(authenCode))
					return (String) entry.getValue();
			}
		}
		return "false";
	}
}
