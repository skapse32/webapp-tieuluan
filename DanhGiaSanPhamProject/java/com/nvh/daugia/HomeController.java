package com.nvh.daugia;

import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.core.NewCookie;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
import com.sun.jersey.api.representation.Form;
import com.tieuluan.daugia.function.Server;

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory
			.getLogger(HomeController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		if (request.getSession().getAttribute("username") == null) {
			if (session.getAttribute("sessionid") == null) {
				ClientConfig config = new DefaultClientConfig();
				Client client = Client.create(config);
				WebResource webResource = client
						.resource(Server.addressAuctionWS);
				ClientResponse clresponse = null;
				// get session id
				clresponse = webResource.path("user/getSessionID").post(
						ClientResponse.class);
				if (clresponse.getStatus() == 200) {
					session.setAttribute("sessionid",
							clresponse.getEntity(String.class));
				} else {
					return "redirect:/" + Server.web + "/login";
				}
				System.out.println(request.getPathInfo());
				if (request.getPathInfo() == null) {
					//request den tu auction webapp.
					ClientConfig cofig = new DefaultClientConfig();
					Client client1 = Client.create(cofig);
					WebResource resource = client1
							.resource(Server.addressAuctionWS);
					Form form = new Form();
					String authenCode = request.getParameter("authcode");
					String username = request.getParameter("username");
					System.out.print(username);
					if(username == null){
						return "redirect:" + Server.web + "/login";
					}
					form.add("authencode", authenCode);
					form.add("username", username);
					String result = resource
							.path("user/access")
							.cookie(new NewCookie("JSESSIONID", session
									.getAttribute("sessionid").toString()))
							.post(String.class, form);
					System.out.println(result);
					if (result.equals("WrongAuthenCode")) {
						return "redirect:/" + Server.web + "/login";
					} else {
						// send accessToken xuong authen de lay Role nguoi dung.
						resource = client1.resource(Server.addressAuctionWS);
						String role = resource
								.path("user/getRoleUser")
								.cookie(new NewCookie("JSESSIONID", session
										.getAttribute("sessionid").toString()))
								.post(String.class);
						session.setAttribute("role", role);
						session.setAttribute("username", username);
						System.out.println(role);
					}
					String comeback = "redirect:" + Server.addressAuctionWA
							+ "/userpanel";
					return comeback;
				}
			} else {
				//ton tai JSESSIONID
				System.out.println(request.getPathInfo());
				if (request.getPathInfo() == null ) {
					ClientConfig cofig = new DefaultClientConfig();
					Client client1 = Client.create(cofig);
					WebResource resource = client1
							.resource(Server.addressAuctionWS);
					Form form = new Form();
					String authenCode = request.getParameter("authcode");
					String username = request.getParameter("username");
					form.add("authencode", authenCode);
					form.add("username", username);
					String result = resource
							.path("user/access")
							.cookie(new NewCookie("JSESSIONID", session
									.getAttribute("sessionid").toString()))
							.post(String.class, form);
					System.out.println(result);
					if (result.equals("WrongAuthenCode")) {
						// khong ton tai authencode. => vao trang login.
						String link = "redirect:" + Server.web + "login";
						return link;
					} else {
						// send accessToken xuong authen de lay Role nguoi dung.
						resource = client1.resource(Server.addressAuctionWS);
						String role = resource
								.path("user/getRoleUser")
								.cookie(new NewCookie("JSESSIONID", session
										.getAttribute("sessionid").toString()))
								.post(String.class);
						session.setAttribute("role", role);
						session.setAttribute("username", username);
						System.out.println(role);
					}
				}
				String comeback = "redirect:" + Server.addressAuctionWA
						+ "userpanel";
				return comeback;
			}
		}else{
			//da co username trong session.
			String username = request.getParameter("username");
			if(request.getSession().getAttribute("username") != null && username != null){
				System.out.println("Home controller :" + request.getSession().getAttribute("username").toString());
				System.out.println("Home controller :" + username);
				if(!username.equals(request.getSession().getAttribute("username").toString())){
					String authenCode = request.getParameter("authcode");
					ClientConfig cofig = new DefaultClientConfig();
					Client client1 = Client.create(cofig);
					WebResource resource = client1
							.resource(Server.addressAuctionWS);
					ClientResponse clresponse = null;
					// get session id
					clresponse = resource.path("user/getSessionID").post(
							ClientResponse.class);
					if (clresponse.getStatus() == 200) {
						session.setAttribute("sessionid",
								clresponse.getEntity(String.class));
					}
					
					Form form = new Form();
					form.add("authencode", authenCode);
					form.add("username", username);
					String result = resource
							.path("user/access")
							.cookie(new NewCookie("JSESSIONID", session
									.getAttribute("sessionid").toString()))
							.post(String.class, form);
					System.out.println(result);
					if (result.equals("WrongAuthenCode")) {
						// khong ton tai authencode. => vao trang login.
						String link = "redirect:" + Server.web + "login";
						return link;
					} else {
						// send accessToken xuong authen de lay Role nguoi dung.
						resource = client1.resource(Server.addressAuctionWS);
						String role = resource
								.path("user/getRoleUser")
								.cookie(new NewCookie("JSESSIONID", session
										.getAttribute("sessionid").toString()))
								.post(String.class);
						session.removeAttribute("role");
						session.setAttribute("role", role);
						session.setAttribute("username", username);
						System.out.println(role);
					}
					String comeback = "redirect:" + Server.addressAuctionWA
							+ "userpanel";
					return comeback;
				}
			}
			model.addAttribute("title", "LOGIN");
			try {
				String role = request.getSession().getAttribute("role").toString();
				String weblink = "redirect:/";
				switch (role) {
				case "Admin":
					weblink += "admin";
					return weblink;
				case "User":
					weblink += "user";
					return weblink;
				default:
					return "login";
				}
			} catch (Exception e) {
				// TODO: handle exception
				return "login";
			}
		}
		return null;

	}

}
