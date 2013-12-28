package com.nvh.daugia.interceptor;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.core.NewCookie;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.nvh.daugia.model.jpa.User;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
import com.sun.jersey.api.representation.Form;
import com.tieuluan.daugia.function.Server;

public class InterceptorInit implements HandlerInterceptor {

	private Logger log = LoggerFactory.getLogger(InterceptorInit.class);

	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {

	}

	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {

	}

	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object arg2) throws Exception {
		HttpSession session = request.getSession();
		if (session.getAttribute("sessionid") == null) {
			ClientConfig config = new DefaultClientConfig();
			Client client = Client.create(config);
			WebResource webResource = client.resource(Server.addressAuctionWS);
			ClientResponse clresponse = null;
			// get session id
			clresponse = webResource.path("user/getSessionID").post(
					ClientResponse.class);
			if (clresponse.getStatus() == 200) {
				session.setAttribute("sessionid",
						clresponse.getEntity(String.class));
			} else {
				response.sendRedirect("/" + Server.web + "/denied");
				return false;
			}
		}
		// co session ID trong day
		// lay authencode tu trong cookie ra.

		// send request xuong authenService de lay accessToken
		ClientConfig cofig = new DefaultClientConfig();
		Client client = Client.create(cofig);
		WebResource resource = client.resource(Server.addressAuthenWS);
		Form form = new Form();
		String authenCode= "";
		form.add("authenCode", authenCode);
		String accessToken = resource.path("accessToken/getAccessToken").post(
				String.class, form);
		if (accessToken.equals("false")) {
			// khong ton tai authencode.
			return true;
		} else {
			// send accessToken xuong authen de lay Role nguoi dung.
			form.add("accessToken", accessToken);
			String role = resource.path("role/getRoleUser").post(String.class,
					form);
			session.setAttribute("role", role);
			return true;
		}
	}

}