package com.tieuluan.daugia.controller;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

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
import com.google.gson.reflect.TypeToken;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
import com.sun.jersey.api.representation.Form;
import com.tieuluan.daugia.function.Function;
import com.tieuluan.daugia.function.Server;
import com.tieuluan.daugia.model.Sanpham;

@Controller
public class TimKiemController {
	@RequestMapping(value = "/timkiem", method = RequestMethod.POST)
	public String timkiem(HttpServletRequest request,
			Model model ) {
		HttpSession session=request.getSession();
		String tensp=request.getParameter("tensp");
		int loaiphien= Integer.parseInt(request.getParameter("loaiphien"));
		session.setAttribute("tensp", tensp);
		session.setAttribute("loaiphien", loaiphien);
		if(loaiphien==1)
			return "redirect:/timkiemdangdau";
		else if(loaiphien==2)
			return "redirect:/timkiemsapdau";
		else 
			return "redirect:/timkiemdadau";
	}
	@RequestMapping(value = "/timkiemdangdau", method = RequestMethod.GET)
	public String timkiemdangdau(
			@RequestParam(value = "soLuongSanPhamTrenTrang", required = false, defaultValue = "8") int soLuongSanPhamTrenTrang,
			@RequestParam(value = "trang", required = false, defaultValue = "1") int trang,
			Model model, HttpSession session) {
		String tensp=session.getAttribute("tensp").toString();
		int loaiphien= Integer.parseInt(session.getAttribute("loaiphien").toString());
		String imageDirectory = Server.addressAuctionImage;
		String web = Server.web;
		ClientConfig config = new DefaultClientConfig();
		Client client = Client.create(config);
		WebResource webResource = client.resource(Server.addressAuctionWS);
		Form form = null;
		Gson gson = new Gson();
		String json = "";
		List<Sanpham> dssp = new ArrayList<Sanpham>();
		// lay danh sach san pham
		form = new Form();
		form.add("size", soLuongSanPhamTrenTrang);
		form.add("page", trang);
		form.add("tensp", tensp);
		form.add("loaiphien", loaiphien);
		json = webResource
				.path("sanpham/findByTenSP")
				.cookie(new NewCookie("JSESSIONID", session.getAttribute(
						"sessionid").toString())).post(String.class,form);
		Type typelist = new TypeToken<ArrayList<Sanpham>>() {
		}.getType();
		dssp = gson.fromJson(json, typelist);
		// lay so luong san pham
		form = new Form();
		form.add("tensp", tensp);
		form.add("loaiphien", loaiphien);
		json = webResource
				.path("sanpham/findSoSPByTenSP")
				.cookie(new NewCookie("JSESSIONID", session.getAttribute(
						"sessionid").toString())).post(String.class,form);
		int soTrang = Function.tinhSoTrangSanPham(soLuongSanPhamTrenTrang,
				Integer.parseInt(json));
		model.addAttribute("tieude", "Sản phẩm đang đấu");
		model.addAttribute("soLuongSanPhamTrenTrang", soLuongSanPhamTrenTrang);
		model.addAttribute("trang", trang);
		model.addAttribute("soTrang", soTrang);
		model.addAttribute("dssp", dssp);
		model.addAttribute("imageDirectory", imageDirectory);

		model.addAttribute("web", web);
		return "timkiemdangdau";
	}
	@RequestMapping(value = "/loaddstimkiemdangdau", method = RequestMethod.POST)
	public @ResponseBody
	String loaddssanphamcuatoidangdau(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String tensp=session.getAttribute("tensp").toString();
		int loaiphien= Integer.parseInt(session.getAttribute("loaiphien").toString());
		String size=request.getParameter("size");
		String page=request.getParameter("page");
		String json = "";
		ClientConfig config = new DefaultClientConfig();
		Client client = Client.create(config);
		WebResource webResource = client.resource(Server.addressAuctionWS);
		Form form = new Form();
		form.add("size", size);
		form.add("page", page);
		form.add("tensp", tensp);
		form.add("loaiphien", loaiphien);
		ClientResponse response = null;
		response = webResource
				.path("sanpham/findByTenSP")
				.cookie(new NewCookie("JSESSIONID", session.getAttribute("sessionid").toString()))
				.post(ClientResponse.class, form);
		json = response.getEntity(String.class);	
		return json;
	}
	@RequestMapping(value = "/timkiemsapdau", method = RequestMethod.GET)
	public String timkiemsapdau(
			@RequestParam(value = "soLuongSanPhamTrenTrang", required = false, defaultValue = "8") int soLuongSanPhamTrenTrang,
			@RequestParam(value = "trang", required = false, defaultValue = "1") int trang,
			Model model, HttpSession session) {
		String tensp=session.getAttribute("tensp").toString();
		int loaiphien= Integer.parseInt(session.getAttribute("loaiphien").toString());
		String imageDirectory = Server.addressAuctionImage;
		String web = Server.web;
		ClientConfig config = new DefaultClientConfig();
		Client client = Client.create(config);
		WebResource webResource = client.resource(Server.addressAuctionWS);
		Form form = null;
		Gson gson = new Gson();
		String json = "";
		List<Sanpham> dssp = new ArrayList<Sanpham>();
		// lay danh sach san pham
		form = new Form();
		form.add("size", soLuongSanPhamTrenTrang);
		form.add("page", trang);
		form.add("tensp", tensp);
		form.add("loaiphien", loaiphien);
		json = webResource
				.path("sanpham/findByTenSP")
				.cookie(new NewCookie("JSESSIONID", session.getAttribute(
						"sessionid").toString())).post(String.class,form);
		Type typelist = new TypeToken<ArrayList<Sanpham>>() {
		}.getType();
		dssp = gson.fromJson(json, typelist);
		// lay so luong san pham
		form = new Form();
		form.add("tensp", tensp);
		form.add("loaiphien", loaiphien);
		json = webResource
				.path("sanpham/findSoSPByTenSP")
				.cookie(new NewCookie("JSESSIONID", session.getAttribute(
						"sessionid").toString())).post(String.class,form);
		int soTrang = Function.tinhSoTrangSanPham(soLuongSanPhamTrenTrang,
				Integer.parseInt(json));
		model.addAttribute("tieude", "Sản phẩm đang đấu");
		model.addAttribute("soLuongSanPhamTrenTrang", soLuongSanPhamTrenTrang);
		model.addAttribute("trang", trang);
		model.addAttribute("soTrang", soTrang);
		model.addAttribute("dssp", dssp);
		model.addAttribute("imageDirectory", imageDirectory);

		model.addAttribute("web", web);
		return "timkiemsapdau";
	}
	@RequestMapping(value = "/timkiemdadau", method = RequestMethod.GET)
	public String timkiemdadau(
			@RequestParam(value = "soLuongSanPhamTrenTrang", required = false, defaultValue = "8") int soLuongSanPhamTrenTrang,
			@RequestParam(value = "trang", required = false, defaultValue = "1") int trang,
			Model model, HttpSession session) {
		String tensp=session.getAttribute("tensp").toString();
		int loaiphien= Integer.parseInt(session.getAttribute("loaiphien").toString());
		String imageDirectory = Server.addressAuctionImage;
		String web = Server.web;
		ClientConfig config = new DefaultClientConfig();
		Client client = Client.create(config);
		WebResource webResource = client.resource(Server.addressAuctionWS);
		Form form = null;
		Gson gson = new Gson();
		String json = "";
		List<Sanpham> dssp = new ArrayList<Sanpham>();
		// lay danh sach san pham
		form = new Form();
		form.add("size", soLuongSanPhamTrenTrang);
		form.add("page", trang);
		form.add("tensp", tensp);
		form.add("loaiphien", loaiphien);
		json = webResource
				.path("sanpham/findByTenSP")
				.cookie(new NewCookie("JSESSIONID", session.getAttribute(
						"sessionid").toString())).post(String.class,form);
		Type typelist = new TypeToken<ArrayList<Sanpham>>() {
		}.getType();
		dssp = gson.fromJson(json, typelist);
		// lay so luong san pham
		form = new Form();
		form.add("tensp", tensp);
		form.add("loaiphien", loaiphien);
		json = webResource
				.path("sanpham/findSoSPByTenSP")
				.cookie(new NewCookie("JSESSIONID", session.getAttribute(
						"sessionid").toString())).post(String.class,form);
		int soTrang = Function.tinhSoTrangSanPham(soLuongSanPhamTrenTrang,
				Integer.parseInt(json));
		model.addAttribute("tieude", "Sản phẩm đang đấu");
		model.addAttribute("soLuongSanPhamTrenTrang", soLuongSanPhamTrenTrang);
		model.addAttribute("trang", trang);
		model.addAttribute("soTrang", soTrang);
		model.addAttribute("dssp", dssp);
		model.addAttribute("imageDirectory", imageDirectory);

		model.addAttribute("web", web);
		return "timkiemdadau";
	}
}
