package com.tieuluan.daugia.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;
import javax.ws.rs.core.NewCookie;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
import com.sun.jersey.api.representation.Form;
import com.tieuluan.daugia.function.Server;

@Controller
public class DangNhapController {

	@RequestMapping(value = "/userpanel")
	public String userpanel(){
		return "userpanel";
	}
	
	@RequestMapping(value = "/dangnhap")
	public String dangNhap(
			@RequestParam(value = "action", required = false) String action,
			@RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "password", required = false) String password,
			HttpSession session, Model model) throws IOException {
		String web = Server.web;
		model.addAttribute("web", web);
		model.addAttribute("tieude", "Ðang nh?p");
		ClientConfig config = new DefaultClientConfig();
		Client client = Client.create(config);
		WebResource webResource = client.resource(Server.addressAuthenWS);
		Form form = null;
		if (action != null) {
			if (action.equals("dangnhap")) {
				// get authencode form AuthenService
				webResource = client.resource(Server.addressAuthenWS);
				String authencode = "";
				form = new Form();
				form.add("username", username);
				form.add("password", password);
				authencode = webResource.path("login/loginpost").post(
						String.class, form);
				if (authencode.equals("")) {
					model.addAttribute("error",
							"Tài kho?n hoac mat khau khong dung!!");
					return "dangnhap";
				} else {
					// access to AuctionService
					webResource = client.resource(Server.addressAuctionWS);
					form = new Form();
					form.add("username", username);
					form.add("authencode", authencode);
					String result = webResource
							.path("user/access")
							.cookie(new NewCookie("JSESSIONID", session
									.getAttribute("sessionid").toString()))
							.post(String.class, form);
					if (result.equals("WrongAuthenCode")) {
						model.addAttribute("tieude", "L?i");
						model.addAttribute("noidung", "Wrong AuthenCode;"
								+ authencode);
						return "thongbao";
					} else {
						session.setAttribute("username", username);
						//get role
						String role=webResource
								.path("user/getRoleUser")
								.cookie(new NewCookie("JSESSIONID", session
										.getAttribute("sessionid").toString()))
								.post(String.class);
						session.setAttribute("role", role);
						return "userpanel";
					}
				}
			}
		}

		return "dangnhap";
	}
	@RequestMapping(value = "/dangnhap1")
	public String dangNhap1(
			@RequestParam(value = "action", required = false) String action,
			@RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "password", required = false) String password,
			HttpSession session, Model model) throws IOException {
		String web = Server.web;
		model.addAttribute("web", web);
		model.addAttribute("tieude", "Ä?Äƒng nháº­p");
		ClientConfig config = new DefaultClientConfig();
		Client client = Client.create(config);
		WebResource webResource = client.resource(Server.addressAuthenWS);
		Form form = null;
		if (action != null) {
			if (action.equals("dangnhap")) {
				// access to AuctionService
				webResource = client.resource(Server.addressAuctionWS);
				form = new Form();
				form.add("username", username);
				form.add("authencode", "123456");
				String result = webResource
						.path("user/access1")
						.cookie(new NewCookie("JSESSIONID", session
								.getAttribute("sessionid").toString()))
						.post(String.class, form);
				session.setAttribute("username", username);
				String role = "Admin";
				session.setAttribute("role", role);
				return "redirect:/sanphamdangdau";
	
			}
		}
		return "dangnhap";
	}

	@RequestMapping(value = "/dangxuat")
	public String dangXuat(HttpSession session, Model model) {
		String web = Server.web;
		model.addAttribute("web", web);
		session.removeAttribute("username");
		session.removeAttribute("role");
		model.addAttribute("tieude", "Goodbye");
		model.addAttribute("noidung", "See you again!");

		return "thongbao";
	}

}
