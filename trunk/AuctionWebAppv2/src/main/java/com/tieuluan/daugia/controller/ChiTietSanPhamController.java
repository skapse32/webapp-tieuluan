package com.tieuluan.daugia.controller;

import java.io.Console;
import java.io.IOException;
import java.lang.reflect.Type;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
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
import com.tieuluan.daugia.model.Lichsudaugia;
import com.tieuluan.daugia.model.Sanpham;

@Controller
public class ChiTietSanPhamController {
	
	private Logger log = LoggerFactory.getLogger(ChiTietSanPhamController.class);
	
	@RequestMapping(value = "/chitietsanpham", method = RequestMethod.GET)
	public String chitietsanpham(
			@RequestParam(value = "trang", required = false, defaultValue = "1") int trang,
			@RequestParam(value = "soLuongSanPhamTrenTrang", required = false, defaultValue = "8") int soLuongSanPhamTrenTrang,
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
			model.addAttribute("error", "Lỗi : bạn cần phải đăng nhập");
			if (response.getStatus() == 401) {

				model.addAttribute("errorcontent",
						"Bạn cần phải đăng nhập mới thấy được nội dung sản phẩm");

			} else {
				model.addAttribute("errorcontent", response.getStatus());
			}
			model.addAttribute("web", web);
			return "dangnhap";
		}
		gson = new Gson();
		Sanpham sp = new Sanpham();
		log.info(json);
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
		model.addAttribute("giamuangay",  sp.getGiamuangay());
		model.addAttribute("sp", sp);
		model.addAttribute("imageDirectory", imageDirectory);
		model.addAttribute("web", web);
		
		
		//find san pham lien quan
		List<Sanpham> dssp = new ArrayList<Sanpham>();
		// lay danh sach san pham
		form = new Form();
		form.add("size", soLuongSanPhamTrenTrang);
		form.add("page", trang);
		int maloaisp = -1;
		if("Xe Số".equals(sp.getLoaisp())){
			log.info("Xe số");
			maloaisp = 1;
		}else if("Xe Ga".equals(sp.getLoaisp())){
			log.info("Xe Ga");
			maloaisp = 2;
		}else if("Xe Tay Côn".equals(sp.getLoaisp())){
			log.info("Xe Tay Côn");
			maloaisp = 3;
		}
		log.info(maloaisp + "");
		form.add("maloaisp", maloaisp);
		json = webResource
				.path("sanpham/findSanPhamDangDauTheoLoai")
				.cookie(new NewCookie("JSESSIONID", session.getAttribute(
						"sessionid").toString())).post(String.class,form);
		Type typelist = new TypeToken<ArrayList<Sanpham>>() {}.getType();
		dssp = gson.fromJson(json, typelist);
		log.info(dssp.toString());
		// lay so luong san pham
		form = new Form();
		form.add("maloaisp", maloaisp);
		json = webResource
				.path("sanpham/findSoSanPhamDangDau")
				.cookie(new NewCookie("JSESSIONID", session.getAttribute(
						"sessionid").toString())).post(String.class,form);
		int soTrang = Function.tinhSoTrangSanPham(soLuongSanPhamTrenTrang,
				Integer.parseInt(json));
		model.addAttribute("soLuongSanPhamTrenTrang", soLuongSanPhamTrenTrang);
		model.addAttribute("trang", trang);
		model.addAttribute("maLoaiSP", maloaisp);
		model.addAttribute("soTrang", soTrang);
		model.addAttribute("dssp", dssp);
		
		//get tinh trang san pham.
		if(sp.getTinhtrangdaugia() == 1){
			//ket huc
			model.addAttribute("dadau", "da xong");
		}
		if(sp.getTinhtrangdaugia() == 3){
			//ket huc
			model.addAttribute("dathanhtoan", "da xong");
		}
		return "chitietsanpham";
	}
	
	@RequestMapping(value = "/luotdattrensp", method = RequestMethod.GET)
	public String luotdattrensp(Model model,HttpServletRequest request, HttpSession session) throws IOException {
		String masp = request.getParameter("masp");
		String web = Server.web;
		String json = "";
		Gson gson = new Gson();
		ClientConfig config = new DefaultClientConfig();
		Client client = Client.create(config);
		WebResource webResource = client.resource(Server.addressAuctionWS);
		Form form = new Form();
		form.add("masp", masp);
		form.add("nguoidat", session.getAttribute("username").toString());
		ClientResponse response = null;
		ArrayList<Lichsudaugia> lss = new ArrayList<Lichsudaugia>();
		json = webResource
				.path("lichsudaugia/findByNguoidat")
				.cookie(new NewCookie("JSESSIONID", session.getAttribute(
						"sessionid").toString())).post(String.class,form);
		Type typelist = new TypeToken<ArrayList<Lichsudaugia>>() {}.getType();
		lss = gson.fromJson(json, typelist);
		log.info(lss.toString());
		model.addAttribute("lss", lss);
		model.addAttribute("tieude", "Lượt đặt trên sản phẩm");
		return "luotdattrensp";
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
		System.out.println("kiem tra nguoi dat");
		String nguoidatgia=request.getParameter("nguoidatgia");
		String result="";
		if (session.getAttribute("username") != null) {
			result+=session.getAttribute("username").toString();
		}
		if(result.equals(nguoidatgia)){
			System.out.println("trung");
			return "true";
		}
		return "false";
	}
}
