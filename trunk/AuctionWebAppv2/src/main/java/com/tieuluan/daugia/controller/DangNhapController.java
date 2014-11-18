package com.tieuluan.daugia.controller;

import java.io.IOException;
import javax.servlet.http.HttpServletResponse;
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

	@RequestMapping(value = "userpanel")
	public String userpanel(HttpSession session, Model model) {
		if(session.getAttribute("username") == null)
		{
			model.addAttribute("noidung","Bạn chưa đăng nhập.");
			return "thongbao";
		}
		return "userpanel";
	}

	@RequestMapping(value = "dangnhap")
	public String dangNhap(
			@RequestParam(value = "action", required = false) String action,
			@RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "password", required = false) String password,
			HttpSession session, Model model, HttpServletResponse response)
			throws IOException {
		if(session.getAttribute("username") != null)
		{
			model.addAttribute("noidung", "Bạn đã đăng nhập");
			return "thongbao";
		}
		String web = Server.web;
		model.addAttribute("web", web);
		model.addAttribute("userName", username);
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
				authencode = webResource.path("login/loginpost")
						.cookie(new NewCookie("authenCode", authencode))
						.post(String.class, form);
				if (authencode.equals("")) {
					model.addAttribute("error",
							"Tài khoản hoặc mật khẩu không đúng !!");
					return "dangnhap";
				} else {
					// login cho trang danh gia.
					/*response.sendRedirect(Server.addressDanhGiaWA
							+ "?authcode=" + authencode + "&username="
							+ username);*/

					session.setAttribute("authCode", authencode);
					// access to AuctionService
					System.out.print("Auction Authencode : " + authencode);
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
						model.addAttribute("tieude", "Lỗi");
						model.addAttribute("noidung", "Wrong AuthenCode;"
								+ authencode);
						return "thongbao";
					} else {
						session.setAttribute("username", username);
						// get role
						String role = webResource
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

	@RequestMapping(value = "dangxuat")
	public String dangXuat(HttpSession session, Model model)
	{
		session.removeAttribute("username");
		session.removeAttribute("role");
		model.addAttribute("noidung", "Đăng xuất thành công.");
		return "thongbao";
	}

}
