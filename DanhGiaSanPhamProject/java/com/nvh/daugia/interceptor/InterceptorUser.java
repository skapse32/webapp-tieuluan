package com.nvh.daugia.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.core.NewCookie;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
import com.sun.jersey.api.representation.Form;
import com.tieuluan.daugia.function.Server;

public class InterceptorUser implements HandlerInterceptor {

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
		// filter
		if (session.getAttribute("username") == null) {
			
			ClientConfig cofig = new DefaultClientConfig();
			Client client = Client.create(cofig);
			WebResource resource = client.resource(Server.addressAuctionWS);
			Form form = new Form();
			String authenCode= request.getParameter("authcode");
			String username = request.getParameter("username");
			form.add("authencode", authenCode);
			form.add("username", username);
			String result = resource
					.path("user/access")
					.cookie(new NewCookie("JSESSIONID", session.getAttribute("sessionid").toString()))
					.post(String.class, form);
			System.out.println(result);
			if (result.equals("false")) {
				// khong ton tai authencode. => vao trang login.
				response.sendRedirect("/" + Server.web + "/login");
				return false;
			} else {
				// send accessToken xuong authen de lay Role nguoi dung.
				resource = client.resource(Server.addressAuctionWS);
				String role = resource.path("user/getRoleUser").cookie(new NewCookie("JSESSIONID", session
						.getAttribute("sessionid").toString())).post(String.class);
				session.setAttribute("role", role);
				session.setAttribute("username", username);
				return true;
			}
		}
		if (session.getAttribute("role") == null) {
			response.sendRedirect("/" + Server.web + "/login");
			return false;
		}
		if (session.getAttribute("role").equals("BannedUser")) {
			response.sendRedirect("/" + Server.web + "/denied");
			return false;
		}
		return true;
	}

}
