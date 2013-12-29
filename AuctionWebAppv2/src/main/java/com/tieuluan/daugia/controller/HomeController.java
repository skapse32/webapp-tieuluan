package com.tieuluan.daugia.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

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

import java.lang.reflect.Type;
import java.text.DateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.core.NewCookie;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String sanphamhome(
			@RequestParam(value = "locsp", required = false, defaultValue = "0") int sort,
			@RequestParam(value = "thuonghieu", required = false, defaultValue = "0") String thuonghieu,
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
		
		//lay danh sach san pham da tham gia
		Type typelist = new TypeToken<ArrayList<Sanpham>>() {
		}.getType();
		try {
			json = webResource
					.path("sanpham/findBySanPhamThamGiaDangDau")
					.cookie(new NewCookie("JSESSIONID", session.getAttribute(
							"sessionid").toString())).post(String.class);

			
			List<Sanpham> dssptg = new ArrayList<Sanpham>();
			dssptg = gson.fromJson(json, typelist);
			model.addAttribute("dssptg", dssptg);
			model.addAttribute("soluongsptg", dssptg.size());	
		} catch (Exception e) {
			// TODO: handle exception
		}
		try {
			json = webResource
					.path("sanpham/findBySanPhamChienThangAll")
					.cookie(new NewCookie("JSESSIONID", session.getAttribute(
							"sessionid").toString())).post(String.class);

			
			List<Sanpham> dsspct = new ArrayList<Sanpham>();
			dsspct = gson.fromJson(json, typelist);
			model.addAttribute("dsspct", dsspct);
			model.addAttribute("slspct", dsspct.size());	
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		// lay danh sach san pham
		if (thuonghieu.length() > 2) {
			form = new Form();
			form.add("size", soLuongSanPhamTrenTrang);
			form.add("page", trang);
			form.add("thuonghieu", thuonghieu);
			json = webResource
					.path("sanpham/findByThuongHieu")
					.cookie(new NewCookie("JSESSIONID", session.getAttribute(
							"sessionid").toString())).post(String.class, form);
			model.addAttribute("check", "thuonghieu");
			model.addAttribute("thuonghieu", thuonghieu);
		}  else {
			form = new Form();
			form.add("size", soLuongSanPhamTrenTrang);
			form.add("page", trang);
			form.add("maloaisp", maLoaiSP);
			json = webResource
					.path("sanpham/findSanPhamDangDauTheoLoai")
					.cookie(new NewCookie("JSESSIONID", session.getAttribute(
							"sessionid").toString())).post(String.class, form);
			model.addAttribute("check", "masp");
		}
		// sort san pham
		if(sort != 0) {
			form = new Form();
			form.add("loaisp", -1); // đang đấu 
			form.add("sort", sort);
			form.add("size", soLuongSanPhamTrenTrang);
			form.add("page", trang);
			json = webResource
					.path("sanpham/findSanPhamTheoGiaLoc")
					.cookie(new NewCookie("JSESSIONID", session.getAttribute(
							"sessionid").toString())).post(String.class, form);
		}
	
		//------
		typelist = new TypeToken<ArrayList<Sanpham>>() {
		}.getType();
		dssp = gson.fromJson(json, typelist);
		
		//lay top 10 san pham
		gson = new Gson();
		List<Sanpham> dstop = new ArrayList<Sanpham>();
		form = new Form();
		form.add("top", 10);
		json = webResource
				.path("sanpham/findSanPhamDangDauTop")
				.cookie(new NewCookie("JSESSIONID", session.getAttribute(
						"sessionid").toString())).post(String.class, form);
		typelist = new TypeToken<ArrayList<Sanpham>>(){}.getType();
		dstop = gson.fromJson(json, typelist);
		model.addAttribute("dstop", dstop);
		// lay so luong san pham
		form = new Form();
		form.add("maloaisp", maLoaiSP);
		json = webResource
				.path("sanpham/findSoSanPhamDangDau")
				.cookie(new NewCookie("JSESSIONID", session.getAttribute(
						"sessionid").toString())).post(String.class, form);
		int soTrang = Function.tinhSoTrangSanPham(soLuongSanPhamTrenTrang,
				Integer.parseInt(json));
		model.addAttribute("tieude", "Sản phẩm đang đấu");
		model.addAttribute("soLuongSanPhamTrenTrang", soLuongSanPhamTrenTrang);
		model.addAttribute("trang", trang);
		model.addAttribute("locsp", sort);
		model.addAttribute("maLoaiSP", maLoaiSP);
		model.addAttribute("soTrang", soTrang);
		model.addAttribute("dssp", dssp);
		model.addAttribute("imageDirectory", imageDirectory);

		model.addAttribute("web", web);
		return "home";
	}

	@RequestMapping(value = "/loaddssanphamhome", method = RequestMethod.POST)
	public @ResponseBody
	String loaddssanphamcuatoidangdau(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String maloaisp = request.getParameter("maLoaiSP");
		String size = request.getParameter("size");
		String page = request.getParameter("page");
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
				.cookie(new NewCookie("JSESSIONID", session.getAttribute(
						"sessionid").toString()))
				.post(ClientResponse.class, form);
		json = response.getEntity(String.class);
		return json;
	}
}
