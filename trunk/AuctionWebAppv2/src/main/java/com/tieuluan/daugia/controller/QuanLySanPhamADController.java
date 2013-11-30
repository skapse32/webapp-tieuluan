package com.tieuluan.daugia.controller;

import java.io.IOException;
import java.lang.reflect.Type;
import java.text.DecimalFormat;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.core.NewCookie;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
import com.sun.jersey.api.representation.Form;
import com.tieuluan.daugia.function.Server;
import com.tieuluan.daugia.model.Sanpham;

@Controller
@RequestMapping(value = "/admin")
public class QuanLySanPhamADController {
	@RequestMapping(value = "/sanphamhuyadmin", method = RequestMethod.GET)
	public String sanphamhuyadmin(
			@RequestParam(value = "tinhtrang", required = false, defaultValue = "-1") int tinhtrang,
			Model model, HttpServletRequest request) throws IOException {
		HttpSession session = request.getSession();
		String web = Server.web;
		String imageDirectory = Server.addressAuctionImage;
		String json = "";
		Gson gson = new Gson();
		ClientConfig config = new DefaultClientConfig();
		Client client = Client.create(config);
		WebResource webResource = client.resource(Server.addressAuctionWS);
		Form form = new Form();
		form.add("tinhtrang", tinhtrang);
		json = webResource
				.path("sanpham/findBySanPhamHuyAdmin")
				.cookie(new NewCookie("JSESSIONID", session.getAttribute(
						"sessionid").toString())).post(String.class, form);
		Type typelist = new TypeToken<ArrayList<Sanpham>>() {
		}.getType();
		List<Sanpham> dssp = new ArrayList<Sanpham>();
		dssp = gson.fromJson(json, typelist);
		model.addAttribute("dssp", dssp);
		model.addAttribute("tinhtrang", tinhtrang);
		model.addAttribute("tieude", "Hủy sản phẩm");
		model.addAttribute("imageDirectory", imageDirectory);
		model.addAttribute("web", web);
		return "sanphamhuyadmin";
	}

	@RequestMapping(value = "/sanphamchophepdauadmin", method = RequestMethod.GET)
	public String sanphamchophepdauadmin(Model model, HttpServletRequest request)
			throws IOException {
		HttpSession session = request.getSession();
		String web = Server.web;
		String imageDirectory = Server.addressAuctionImage;
		String json = "";
		Gson gson = new Gson();
		ClientConfig config = new DefaultClientConfig();
		Client client = Client.create(config);
		WebResource webResource = client.resource(Server.addressAuctionWS);
		json = webResource
				.path("sanpham/findBySanPhamChoPhepDauAdmin")
				.cookie(new NewCookie("JSESSIONID", session.getAttribute(
						"sessionid").toString())).post(String.class);
		Type typelist = new TypeToken<ArrayList<Sanpham>>() {
		}.getType();
		List<Sanpham> dssp = new ArrayList<Sanpham>();
		dssp = gson.fromJson(json, typelist);
		model.addAttribute("dssp", dssp);
		model.addAttribute("tieude", "Cho phÃ©p Ä‘áº¥u");
		model.addAttribute("imageDirectory", imageDirectory);
		model.addAttribute("web", web);
		return "sanphamchophepdauadmin";
	}

	@RequestMapping(value = "/chophepdaugia", method = RequestMethod.GET)
	public String chophepdaugia(Model model, HttpServletRequest request)
			throws IOException {
		HttpSession session = request.getSession();
		String web = Server.web;
		if (request.getParameter("masp") == null) {
			return "redirect:/admin/sanphamchophepdauadmin";
		}
		String masp = request.getParameter("masp");
		String json = "";

		ClientConfig config = new DefaultClientConfig();
		Client client = Client.create(config);
		WebResource webResource = client.resource(Server.addressAuctionWS);
		Form form = new Form();
		form.add("masp", masp);

		json = webResource
				.path("sanpham/choPhepDauGia")
				.cookie(new NewCookie("JSESSIONID", session.getAttribute(
						"sessionid").toString())).post(String.class, form);

		if (!"ok".equals(json)) {
			model.addAttribute("web", web);
			model.addAttribute("tieude", "Lá»—i");
			model.addAttribute("noidung", json);
			return "thongbaoqlsanphamadmin";
		} else {
			return "redirect:/admin/sanphamchophepdauadmin";
		}
	}

	@RequestMapping(value = "/huysanpham", method = RequestMethod.GET)
	public String capnhatsanphamget(Model model, HttpServletRequest request)
			throws IOException {
		HttpSession session = request.getSession();
		String web = Server.web;
		String imageDirectory = Server.addressAuctionImage;
		if (request.getParameter("masp") == null) {
			return "redirect:/admin/sanphamhuyadmin";
		}
		String masp = request.getParameter("masp");
		String json = "";
		Gson gson = null;
		ClientConfig config = new DefaultClientConfig();
		Client client = Client.create(config);
		WebResource webResource = client.resource(Server.addressAuctionWS);
		Form form = new Form();
		form.add("masp", masp);
		json = webResource
				.path("sanpham/findById")
				.cookie(new NewCookie("JSESSIONID", session.getAttribute(
						"sessionid").toString())).post(String.class, form);
		gson = new Gson();
		Sanpham sp = new Sanpham();
		sp = gson.fromJson(json, Sanpham.class);
		if (new Date(sp.getThoigianbatdau()).getTime() < (new Date()).getTime()
				|| sp.getTinhtrangdaugia() != 0) {
			return "redirect:/admin/sanphamhuyadmin";
		}
		DecimalFormat formatter = new DecimalFormat("#,###");
		String buocgia = formatter.format(sp.getBuocgia());
		model.addAttribute("cbuocgia", buocgia);
		String giakhoidiem = formatter.format(sp.getGiakhoidiem());
		model.addAttribute("cgiakhoidiem", giakhoidiem);

		model.addAttribute("sp", sp);
		model.addAttribute("imageDirectory", imageDirectory);
		model.addAttribute("tieude", "Há»§y sáº£n pháº©m");
		model.addAttribute("web", web);
		return "huysanpham";
	}

	@RequestMapping(value = "/huydaugia", method = RequestMethod.POST)
	public String dangsanphampost(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String web = Server.web;
		if (request.getParameter("masp") == null) {
			return "redirect:/admin/sanphamhuyadmin?tinhtrang=0";
		}String masp = request.getParameter("masp");
		System.out.println(masp);
		if (request.getParameter("txtlydo") == null) {
			return "redirect:/admin/sanphamhuyadmin?tinhtrang=0";
		}
		String ghichu = request.getParameter("txtlydo");
		
	
		String json = "";

		ClientConfig config = new DefaultClientConfig();
		Client client = Client.create(config);
		WebResource webResource = client.resource(Server.addressAuctionWS);
		Form form = new Form();
		form.add("masp", masp);
		form.add("ghichu", ghichu);
		json = webResource
				.path("sanpham/huyDauGia")
				.cookie(new NewCookie("JSESSIONID", session.getAttribute(
						"sessionid").toString())).post(String.class, form);

		if (!"ok".equals(json)) {
			model.addAttribute("web", web);
			model.addAttribute("tieude", "Lá»—i");
			model.addAttribute("noidung", json);
			return "thongbaoqlsanphamadmin";
		} else {
			return "redirect:/admin/sanphamhuyadmin?tinhtrang=0";
		}

	}
}
