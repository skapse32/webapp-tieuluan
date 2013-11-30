package com.tieuluan.daugia.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpSession;

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
public class DangKyController {
	@RequestMapping(value = "/dangky")
	public String dangKy(
			@RequestParam(value = "action", required = false) String action,
			@RequestParam(value = "TaiKhoan", required = false) String username,
			@RequestParam(value = "MatKhau", required = false) String password,
			@RequestParam(value = "HoTen", required = false) String hoTen,
			@RequestParam(value = "NgaySinh", required = false) String ngaySinh,
			@RequestParam(value = "DiaChi", required = false) String diaChi,
			@RequestParam(value = "SoDienThoai", required = false) String soDT,
			@RequestParam(value = "Email", required = false) String email,
			@RequestParam(value = "GioiTinh", required = false) String gioiTinh,
			HttpSession session, Model model)
			throws UnsupportedEncodingException {
		String web = Server.web;

		if (action != null) {
			if ("dangky".equals(action)) {
				try {
					model.addAttribute("tenDN", username);
					if (!username.matches("[a-zA-Z0-9 ]*")) {
						model.addAttribute("error",
								"Tên đăng nhập không đúng");
						model.addAttribute("web", web);
						model.addAttribute("tieude", "Trang chủ");
						return "dangky";
					}
					String resutl = "";
					ClientConfig config = new DefaultClientConfig();
					Client client = Client.create(config);
					WebResource webResource = client
							.resource(Server.addressAuthenWS);
					Form form = new Form();
					form.add("username", username);
					form.add("password", password);
					form.add("fullname", URLEncoder.encode(hoTen, "UTF-8"));
					form.add("address", URLEncoder.encode(diaChi, "UTF-8"));
					form.add("telephoneNumber", soDT);
					boolean gt = false;
					if ("Nam".equals(gioiTinh))
						gt = true;
					form.add("sex", gt);
					form.add("birthday", ngaySinh);
					form.add("mail", email);
					resutl = webResource.path("usermanager/addUser").post(
							String.class, form);
					if ("success".equals(resutl)) {
						model.addAttribute("web", web);
						model.addAttribute("tieude", "Trang chủ");
						return "home";
					} else {
						model.addAttribute("error",
								"Tài khoản đã có ngư�?i sử dụng");
						model.addAttribute("web", web);
						model.addAttribute("tieude", "Trang chủ");
						return "dangky";
					}
				} catch (Exception e) {
					model.addAttribute("error",
							"�?ăng ký không thành công. M�?i bạn kiểm tra lại.");
					model.addAttribute("web", web);
					model.addAttribute("tieude", "Trang chủ");
					return "dangky";
				}
			}
		}
		model.addAttribute("web", web);
		model.addAttribute("tieude", "�?ăng ký");
		return "dangky";
	}
}
