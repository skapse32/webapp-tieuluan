package com.tieuluan.daugia.controller;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.core.NewCookie;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
public class SanPhamController {
	private Logger log = LoggerFactory.getLogger(SanPhamController.class);
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(){
		return "home";
	}
	
	@RequestMapping(value = "/sanphamdangdau.html", method = RequestMethod.GET)
	public String sanphamdangdau(
			@RequestParam(value = "maLoaiSP", required = false, defaultValue = "-1") int maLoaiSP,
			@RequestParam(value = "soLuongSanPhamTrenTrang", required = false, defaultValue = "8") int soLuongSanPhamTrenTrang,
			@RequestParam(value = "trang", required = false, defaultValue = "1") int trang,
			Model model, HttpSession session) {
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
		form.add("maloaisp", maLoaiSP);
		json = webResource
				.path("sanpham/findSanPhamDangDauTheoLoai")
				.cookie(new NewCookie("JSESSIONID", session.getAttribute(
						"sessionid").toString())).post(String.class,form);
		Type typelist = new TypeToken<ArrayList<Sanpham>>() {}.getType();
		dssp = gson.fromJson(json, typelist);
		// lay so luong san pham
		form = new Form();
		form.add("maloaisp", maLoaiSP);
		json = webResource
				.path("sanpham/findSoSanPhamDangDau")
				.cookie(new NewCookie("JSESSIONID", session.getAttribute(
						"sessionid").toString())).post(String.class,form);
		int soTrang = Function.tinhSoTrangSanPham(soLuongSanPhamTrenTrang,
				Integer.parseInt(json));
		model.addAttribute("tieude", "Sản phẩm đang đấu");
		model.addAttribute("soLuongSanPhamTrenTrang", soLuongSanPhamTrenTrang);
		model.addAttribute("trang", trang);
		model.addAttribute("maLoaiSP", maLoaiSP);
		model.addAttribute("soTrang", soTrang);
		model.addAttribute("dssp", dssp);
		model.addAttribute("imageDirectory", imageDirectory);

		model.addAttribute("method", "POST");
		model.addAttribute("link", "/daugia/loaddssanphamdangdau");
		model.addAttribute("web", web);
		return "sanphamdangdau.html";
	}
	@RequestMapping(value = "/loaddssanphamdangdau", method = RequestMethod.POST)
	public @ResponseBody
	String loaddssanphamcuatoidangdau(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String maloaisp=request.getParameter("maLoaiSP");
		String size=request.getParameter("size");
		String page=request.getParameter("page");
		String json = "";
		ClientConfig config = new DefaultClientConfig();
		Client client = Client.create(config);
		WebResource webResource = client.resource(Server.addressAuctionWS);
		Form form = new Form();
		form.add("size", size);
		form.add("page", page);
		form.add("maloaisp", maloaisp);
		ClientResponse response = null;
		response = webResource
				.path("sanpham/findSanPhamDangDauTheoLoai")
				.cookie(new NewCookie("JSESSIONID", session.getAttribute("sessionid").toString()))
				.post(ClientResponse.class, form);
		json = response.getEntity(String.class);	
		return json;
	}
	@RequestMapping(value = "/sanphamsapdau.html", method = RequestMethod.GET)
	public String sanphamsapdau(
			@RequestParam(value = "maLoaiSP", required = false, defaultValue = "-1") int maLoaiSP,
			@RequestParam(value = "soLuongSanPhamTrenTrang", required = false, defaultValue = "8") int soLuongSanPhamTrenTrang,
			@RequestParam(value = "trang", required = false, defaultValue = "1") int trang,
			Model model, HttpSession session) {
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
		form.add("maloaisp", maLoaiSP);
		json = webResource
				.path("sanpham/findSanPhamSapDauTheoLoai")
				.cookie(new NewCookie("JSESSIONID", session.getAttribute(
						"sessionid").toString())).post(String.class,form);
		Type typelist = new TypeToken<ArrayList<Sanpham>>() {
		}.getType();
		dssp = gson.fromJson(json, typelist);
		// lay so luong san pham
		form = new Form();
		form.add("maloaisp", maLoaiSP);
		json = webResource
				.path("sanpham/findSoSanPhamSapDau")
				.cookie(new NewCookie("JSESSIONID", session.getAttribute(
						"sessionid").toString())).post(String.class,form);
		int soTrang = Function.tinhSoTrangSanPham(soLuongSanPhamTrenTrang,
				Integer.parseInt(json));
		model.addAttribute("tieude", "Sản phẩm sắp đấu");
		model.addAttribute("soLuongSanPhamTrenTrang", soLuongSanPhamTrenTrang);
		model.addAttribute("trang", trang);
		model.addAttribute("maLoaiSP", maLoaiSP);
		model.addAttribute("soTrang", soTrang);
		model.addAttribute("dssp", dssp);
		model.addAttribute("imageDirectory", imageDirectory);
		model.addAttribute("web", web);

		model.addAttribute("method", "GET");
		model.addAttribute("link", "/daugia/sanphamsapdau.html");
		return "sanphamsapdau.html";
	}
	@RequestMapping(value = "/sanphamdadau.html", method = RequestMethod.GET)
	public String sanphamdadau(
			@RequestParam(value = "maLoaiSP", required = false, defaultValue = "-1") int maLoaiSP,
			@RequestParam(value = "soLuongSanPhamTrenTrang", required = false, defaultValue = "8") int soLuongSanPhamTrenTrang,
			@RequestParam(value = "trang", required = false, defaultValue = "1") int trang,
			Model model, HttpSession session) {
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
		form.add("maloaisp", maLoaiSP);
		json = webResource
				.path("sanpham/findSanPhamDaDauTheoLoai")
				.cookie(new NewCookie("JSESSIONID", session.getAttribute(
						"sessionid").toString())).post(String.class,form);
		Type typelist = new TypeToken<ArrayList<Sanpham>>() {
		}.getType();
		dssp = gson.fromJson(json, typelist);
		// lay so luong san pham
		form = new Form();
		form.add("maloaisp", maLoaiSP);
		json = webResource
				.path("sanpham/findSoSanPhamDaDau")
				.cookie(new NewCookie("JSESSIONID", session.getAttribute(
						"sessionid").toString())).post(String.class,form);
		int soTrang = Function.tinhSoTrangSanPham(soLuongSanPhamTrenTrang,
				Integer.parseInt(json));
		model.addAttribute("tieude", "Sản Phẩm Đã Đấu");
		model.addAttribute("soLuongSanPhamTrenTrang", soLuongSanPhamTrenTrang);
		model.addAttribute("trang", trang);
		model.addAttribute("maLoaiSP", maLoaiSP);
		model.addAttribute("soTrang", soTrang);
		model.addAttribute("dssp", dssp);
		model.addAttribute("imageDirectory", imageDirectory);
		model.addAttribute("web", web);
		model.addAttribute("method", "GET");
		model.addAttribute("link", "/daugia/sanphamdadau.html");
		return "sanphamdadau.html";
	}
}
