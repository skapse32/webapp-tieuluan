package com.tieuluan.daugia.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.core.NewCookie;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
import com.sun.jersey.api.representation.Form;
import com.tieuluan.daugia.function.Server;
import com.tieuluan.daugia.model.Sanpham;

@Controller
public class ChiTietSanPhamController {
	@RequestMapping(value = "/chitietsanpham.html", method = RequestMethod.GET)
	public String chitietsanpham(
			@RequestParam(value = "masp", required = false, defaultValue = "1") String masp,
			Model model, HttpSession session) throws IOException {
		String imageDirectory = Server.addressAuctionImage;
		String web = Server.web;
		String json = "";
		Gson gson = null;
		ClientConfig config = new DefaultClientConfig();
		Client client = Client.create(config);
		WebResource webResource = client.resource(Server.addressAuctionWS);
		Form form = new Form();
		form.add("masp", masp);
		ClientResponse response = null;
		
		response = webResource
				.path("sanpham/findById")
				.cookie(new NewCookie("JSESSIONID", session.getAttribute("sessionid").toString()))
				.post(ClientResponse.class, form);

		json = response.getEntity(String.class);
		if (response.getStatus() != 200) {
			model.addAttribute("tieude", "Lỗi");
			if (response.getStatus() == 401) {

				model.addAttribute("noidung",
						"Bạn cần phải đăng nhập mới thấy được nội dung sản phẩm");

			} else {
				model.addAttribute("noidung", response.getStatus());
			}
			model.addAttribute("web", web);
			return "notice";
		}
		gson = new Gson();
		Sanpham sp = new Sanpham();
		sp = gson.fromJson(json, Sanpham.class);
		model.addAttribute("tieude", "Chi tiết sản phẩm");
		
		DecimalFormat formatter = new DecimalFormat("#,###");
		
		String buocgia = formatter.format(sp.getBuocgia());
		model.addAttribute("cbuocgia", buocgia);
		
		String giahientai = formatter.format(sp.getGiahientai());
		model.addAttribute("cgiahientai", giahientai);
		

		
		String giakhoidiem = formatter.format( sp.getGiakhoidiem());
		model.addAttribute("cgiakhoidiem", giakhoidiem);

		model.addAttribute("buocgia", sp.getBuocgia());
		model.addAttribute("giahientai", sp.getGiahientai());
		model.addAttribute("giakhoidiem",  sp.getGiakhoidiem());
		
		model.addAttribute("sp", sp);
		model.addAttribute("imageDirectory", imageDirectory);
		model.addAttribute("web", web);
		return "chitietsanpham.html";
	}
	@RequestMapping(value = "/datgia", method = RequestMethod.POST)
	public @ResponseBody
	String datgia(HttpServletRequest request) {
		HttpSession session=request.getSession();
		String masp=request.getParameter("masp");
		double giahientai = Double.parseDouble(request.getParameter("giahientai"));
		double buocgia = Double.parseDouble(request.getParameter("buocgia"));
		int numberbuocgia = Integer.parseInt(request.getParameter("numberbuocgia"));
		double giadat=giahientai+(buocgia*numberbuocgia);
		Date dtnow = new Date();
		
		String json = "";
		ClientConfig config = new DefaultClientConfig();
		Client client = Client.create(config);
		WebResource webResource = client.resource(Server.addressAuctionWS);
		Form form = new Form();
		form.add("masp", masp);
		form.add("nguoidat", session.getAttribute("username").toString());
		form.add("thoigian", dtnow.getTime());
		form.add("giadat", giadat);
		ClientResponse response = null;
		response = webResource
				.path("lichsudaugia/datGia")
				.cookie(new NewCookie("JSESSIONID", session.getAttribute("sessionid").toString()))
				.post(ClientResponse.class, form);
		json = response.getEntity(String.class);	
		return json;
	}
	@RequestMapping(value = "/loaddsdatgia", method = RequestMethod.POST)
	public @ResponseBody
	String loaddsdatgia(HttpServletRequest request) {
		HttpSession session=request.getSession();
		String masp=request.getParameter("masp");
		String json = "";
		ClientConfig config = new DefaultClientConfig();
		Client client = Client.create(config);
		WebResource webResource = client.resource(Server.addressAuctionWS);
		Form form = new Form();
		form.add("masp", masp);
		ClientResponse response = null;
		response = webResource
				.path("lichsudaugia/findById")
				.cookie(new NewCookie("JSESSIONID", session.getAttribute("sessionid").toString()))
				.post(ClientResponse.class, form);
		json = response.getEntity(String.class);	
		return json;
	}
	@RequestMapping(value = "/kiemtranguoidatgia", method = RequestMethod.POST)
	public @ResponseBody
	String kiemtranguoidatgia(HttpServletRequest request) {
		HttpSession session=request.getSession();
		String nguoidatgia=request.getParameter("nguoidatgia");
		String result="";
		if (session.getAttribute("username") != null) {
			result+=session.getAttribute("username").toString();
		}
		if(result.equals(nguoidatgia))
			return "true";
		return "false";
	}
}
