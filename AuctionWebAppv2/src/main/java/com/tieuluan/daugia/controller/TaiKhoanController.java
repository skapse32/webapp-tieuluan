package com.tieuluan.daugia.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.UnknownHostException;
import java.security.GeneralSecurityException;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.PBEParameterSpec;
import javax.servlet.http.HttpSession;
import javax.ws.rs.core.NewCookie;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import sun.misc.BASE64Encoder;

import com.google.gson.Gson;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
import com.sun.jersey.api.representation.Form;
import com.tieuluan.daugia.function.Server;
import com.tieuluan.daugia.model.User;


@Controller
public class TaiKhoanController {
	
	private static final char[] KEY = "enfldsgbnlsngdlksdsgm".toCharArray();
	private static final byte[] SALT = { (byte) 0xde, (byte) 0x33, (byte) 0x10,
			(byte) 0x12, (byte) 0xde, (byte) 0x33, (byte) 0x10, (byte) 0x12, };
	
	@RequestMapping(value = "/thongtintaikhoan", method = RequestMethod.GET)
	public String getUserInfo(HttpSession session, Model model)
			throws UnknownHostException {
		String web = Server.web;
		Gson gson = new Gson();
		ClientConfig config = new DefaultClientConfig();
		Client client = Client.create(config);
		WebResource webResource = client.resource(Server.addressAuctionWS);
		String json = "";
		json = webResource
				.path("user/getUserInfo")
				.cookie(new NewCookie("JSESSIONID", session.getAttribute(
						"sessionid").toString())).post(String.class);
		User user = gson.fromJson(json, User.class);
		session.setAttribute("tieude", "Thông tin tài khoản");
		session.setAttribute("user", user);
		model.addAttribute("web", web);
		return "taikhoan";
	}
	
	@RequestMapping(value = "/doimatkhau")
	public String doiMatKhau(
			@RequestParam(value = "action", required = false) String action,
			@RequestParam(value = "MKHienTai", required = false) String mkHienTai,
			@RequestParam(value = "MatKhau", required = false) String mkMoi,
			HttpSession session, Model model) throws GeneralSecurityException, IOException {
		String web = Server.web;
		model.addAttribute("web", web);
		if (action != null) {
			if ("thaydoi".equals(action)) {
				try {
					String mkHienTaiEncrypt = encrypt(mkHienTai);
					String mkMoiEncrypt = encrypt(mkMoi);

					ClientConfig config = new DefaultClientConfig();
					Client client = Client.create(config);
					WebResource webResource = client
							.resource(Server.addressAuthenWS);
					Form form = new Form();
					form.add("username", session.getAttribute("username"));
					form.add("password", mkHienTaiEncrypt);		
					form.add("newPassword", mkMoiEncrypt);
					String resutl = webResource.path("userinfo/password").post(
							String.class, form);
					if ("success".equals(resutl)) {
						return "redirect:thongtin";
					} else {
						model.addAttribute("error", "Mật khẩu hiện tại không đúng");
						return "doimatkhau";
					}
				} catch (Exception e) {
					model.addAttribute("error", "Thay đổi mật khẩu thành công. Mời bạn thử đăng nhập lại");
					return "doimatkhau";
				}
			}
		}	
		return "doimatkhau";
	}

	private static String encrypt(String password)
			throws GeneralSecurityException, UnsupportedEncodingException {
		SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("PBEWithMD5AndDES");
		SecretKey key = keyFactory.generateSecret(new PBEKeySpec(KEY));
		Cipher pbeCipher = Cipher.getInstance("PBEWithMD5AndDES");
		pbeCipher.init(Cipher.ENCRYPT_MODE, key, new PBEParameterSpec(SALT, 20));
		return base64Encode(pbeCipher.doFinal(password.getBytes("UTF-8")));
	}

	private static String base64Encode(byte[] bytes) {
		return new BASE64Encoder().encode(bytes);
	}
}
