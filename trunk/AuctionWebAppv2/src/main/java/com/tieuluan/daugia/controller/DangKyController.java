package com.tieuluan.daugia.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.Path;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
import com.sun.jersey.api.representation.Form;
import com.tieuluan.daugia.function.Server;

@Controller
public class DangKyController {

	@RequestMapping(value = "dangky", method = RequestMethod.GET)
	public String dangKy(Model model) {
		return "dangky";
	}

	@RequestMapping(value = "dangky", method = RequestMethod.POST)
	public String dangKy(
			@RequestParam(value = "action", required = false) String action,
			@RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "MatKhau", required = false) String password,
			@RequestParam(value = "HoTen", required = false) String hoTen,
			@RequestParam(value = "NgaySinh", required = false) String ngaySinh,
			@RequestParam(value = "DiaChi", required = false) String diaChi,
			@RequestParam(value = "SoDienThoai", required = false) String soDT,
			@RequestParam(value = "email", required = false) String email,
			@RequestParam(value = "GioiTinh", required = false) String gioiTinh,
			HttpSession session, Model model)
			throws UnsupportedEncodingException {
		if (session.getAttribute("username") != null) {
			model.addAttribute("noidung", "Bạn đã đăng nhập.");
			return "thongbao";
		}
		model.addAttribute("tenDN", username);
		model.addAttribute("ngaysinh", ngaySinh);
		model.addAttribute("email", email);
		model.addAttribute("hoten", hoTen);
		model.addAttribute("sdt", soDT);
		model.addAttribute("diachi", diaChi);
		if(checkEmail(email, null).equals("true"))
		{
			model.addAttribute("error", email + " : Email này đã có người sử dụng.");
			return "dangky";
		}
		try {
			if (!username.matches("[a-zA-Z0-9 ]*")) {
				model.addAttribute("error", "Tên đăng nhập không được chứa các ký tự đặc biệt");
				return "dangky";
			}
			String resutl = "";
			ClientConfig config = new DefaultClientConfig();
			Client client = Client.create(config);
			WebResource webResource = client.resource(Server.addressAuthenWS);
			Form form = new Form();
			form.add("username", username);
			form.add("password", password);
			form.add("fullname", hoTen);
			form.add("address", diaChi);
			form.add("telephoneNumber", soDT);
			form.add("sex", gioiTinh);
			form.add("birthday", ngaySinh);
			form.add("mail", email);
			resutl = webResource.path("usermanager/addUser").post(String.class,
					form);
			if ("success".equals(resutl)) {
				model.addAttribute("noidung",
						"Đăng ký thành công<br>Click vào <a href='dangnhap'>đây</a> để đăng nhập.");
				return "thongbao";
			} else {
				model.addAttribute("error", "Tài khoản đã có người sử dụng");
				return "dangky";
			}
		} catch (Exception e) {
			model.addAttribute("error",
					"Đăng ký không thành công, mời bạn đăng ký lại");
			return "dangky";
		}
	}

	@RequestMapping("checkUser")
	@ResponseBody
	public String checkUser(@RequestParam(value = "username") String username,
			Model model) {
		try {
			Client client = Client.create(new DefaultClientConfig());
			WebResource webResource = client.resource(Server.addressAuthenWS);
			Form form = new Form();
			form.add("username", username);
			String result = webResource.path("usermanager/checkUser").post(
					String.class, form);
			if (result.equals("true")) {
				return "true";
			} else {
				return "false";
			}
		} catch (Exception ex) {
			return "error";
		}
	}

	@RequestMapping("checkEmail")
	@ResponseBody
	public String checkEmail(@RequestParam(value = "email") String email,
			Model model) {
		try {
			Client client = Client.create(new DefaultClientConfig());
			WebResource webResource = client.resource(Server.addressAuthenWS);
			Form form = new Form();
			form.add("email", email);
			String result = webResource.path("usermanager/checkEmail").post(
					String.class, form);
			if (result.equals("true")) {
				return "true";
			} else {
				return "false";
			}
		} catch (Exception ex) {
			return "error";
		}
	}

	@RequestMapping(value = "/active")
	public String active(
			@RequestParam(value = "phoneNumber", required = false) String phoneNumber,
			HttpSession session, Model model)
			throws UnsupportedEncodingException {
		String msg;
		if (phoneNumber != null) {
			try {
				String resutl;
				ClientConfig config = new DefaultClientConfig();
				Client client = Client.create(config);
				WebResource webResource = client
						.resource(Server.addressAuthenWS);
				Form form = new Form();
				form.add("phoneNumber", phoneNumber);
				resutl = webResource.path("usermanager/activeUser").post(
						String.class, form);
				if ("success".equals(resutl)) {
					msg = "Kích hoạt thành công.";
				} else {
					msg = "Kích hoạt thất bại.";
				}
				model.addAttribute("msg", msg);
				return "active";
			} catch (Exception e) {
				msg = "Server error !!";
				return "active";
			}
		}
		msg = "No phoneNumber";
		return "active";
	}
}