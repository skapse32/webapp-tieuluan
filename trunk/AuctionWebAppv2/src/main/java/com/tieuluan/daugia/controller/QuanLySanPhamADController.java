package com.tieuluan.daugia.controller;

import java.io.IOException;
import java.lang.reflect.Type;
import java.text.DecimalFormat;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.core.Cookie;
import javax.ws.rs.core.NewCookie;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
import com.sun.jersey.api.representation.Form;
import com.tieuluan.daugia.function.Server;
import com.tieuluan.daugia.model.Hoadon;
import com.tieuluan.daugia.model.Sanpham;
import com.tieuluan.daugia.model.User;
import com.tieuluan.daugia.util.JqGridData;

@Controller
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
		model.addAttribute("tieude", "Cho Phép Đấu");
		model.addAttribute("chophepdau", "OK");
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
			return "redirect:/sanphamchophepdauadmin";
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
		model.addAttribute("chophepdau","OK");
		if (!"ok".equals(json)) {
			model.addAttribute("web", web);
			model.addAttribute("tieude", "Lỗi");
			model.addAttribute("noidung", json);
			return "thongbaoqlsanphamadmin";
		} else {
			return "redirect:/sanphamchophepdauadmin";
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
			return "redirect:/sanphamhuyadmin";
		}
		DecimalFormat formatter = new DecimalFormat("#,###");
		String buocgia = formatter.format(sp.getBuocgia());
		model.addAttribute("cbuocgia", buocgia);
		String giakhoidiem = formatter.format(sp.getGiakhoidiem());
		model.addAttribute("cgiakhoidiem", giakhoidiem);

		model.addAttribute("sp", sp);
		model.addAttribute("imageDirectory", imageDirectory);
		model.addAttribute("tieude", "Hủy Sản Phẩm");
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
			return "redirect:/sanphamhuyadmin?tinhtrang=0";
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
			model.addAttribute("tieude", "Lỗi");
			model.addAttribute("noidung", json);
			return "thongbaoqlsanphamadmin";
		} else {
			return "redirect:/sanphamhuyadmin?tinhtrang=0";
		}

	}
	
	//quan ly user
	@RequestMapping(value="/qlyuser" , method = RequestMethod.GET)
	public String quanlyUser(){
		return "quanlyuser";
	}
	
	//fill user len grid.
	@RequestMapping(value ="/grid" , method = RequestMethod.GET , produces="application/json; charset=utf-8")
	public @ResponseBody String getUserForGrid(@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "rows", required = false) Integer rows,
			@RequestParam(value = "sidx", required = false) String sortBy,
			@RequestParam(value = "sord", required = false) String order,
			@RequestParam(value = "_search", required = false) boolean isSearch,
			@RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "email", required = false) String email,HttpServletRequest request){
		HttpSession session =  request.getSession();
		String json = "";
		Gson gson = new Gson();
		ClientConfig config = new DefaultClientConfig();
		Client client = Client.create(config);
		WebResource resource = client.resource(Server.addressAuthenWS);
		//get all user's infor.
		Form form = new Form();
		form.add("username", username);
		form.add("email",email);
		System.out.println(username);
		System.out.println(email);
		json = resource.path("userinfo/findAll").cookie(new NewCookie("JSESSIONID", session.getAttribute("sessionid").toString())).post(String.class, form);
		List<User> users = new ArrayList<User>();
		Type type = new TypeToken<ArrayList<User>>() {
		}.getType();
		
		users = gson.fromJson(json, type);
		int totalNumberOfPages = 1;
	    int currentPageNumber = 1;
	    int totalNumberOfRecords = 8;
		JqGridData<User> jqgrid = new JqGridData<User>(totalNumberOfPages, currentPageNumber , totalNumberOfRecords , users);
		return new Gson().toJson(jqgrid);
	}
	
	@RequestMapping(value = "/banUser", method = RequestMethod.POST)
	public String banUser(HttpServletRequest request, Model model){
		String userban =  request.getParameter("userban");
		//ban user thong qua authen.
		String json = "";
		ClientConfig config = new DefaultClientConfig();
		Client client = Client.create(config);
		WebResource resource = client.resource(Server.addressAuthenWS);
		Form form = new Form();
		form.add("username", userban);
		model.addAttribute("tieude", "Cấm User");
		json = resource.path("usermanager/banUser").post(String.class,form);
		System.out.print(json);
		if(json.equals("success")){
			model.addAttribute("noidung", "Lệnh cấm User thành công");
		}else{
			model.addAttribute("noidung", "Lệnh cấm User thất bại!");
		}
		return "thongbao";
	}
	
	@RequestMapping(value = "/activeUser", method = RequestMethod.POST)
	public String activeUser(HttpServletRequest request, Model model){
		String userban =  request.getParameter("useractive");
		//ban user thong qua authen.
		String json = "";
		ClientConfig config = new DefaultClientConfig();
		Client client = Client.create(config);
		WebResource resource = client.resource(Server.addressAuthenWS);
		Form form = new Form();
		form.add("username", userban);
		model.addAttribute("tieude", "Kích Hoạt User");
		json = resource.path("usermanager/activeBannedUser").post(String.class,form);
		System.out.print(json);
		if(json.equals("success")){
			model.addAttribute("noidung", "Kích hoạt User thành công");
		}else{
			model.addAttribute("noidung", "Kích hoạt User thất bại!");
		}
		return "thongbao";
	}
	
	@RequestMapping(value = "/hoadon", method = RequestMethod.GET)
	public String hoadon(Model model, HttpSession session) throws IOException {
		String web = Server.web;
		String json = "";
		Gson gson = new Gson();
		ClientConfig config = new DefaultClientConfig();
		Client client = Client.create(config);
		WebResource webResource = client.resource(Server.addressAuctionWS);
		json = webResource
				.path("hoadon/findAll")
				.cookie(new NewCookie("JSESSIONID", session.getAttribute(
						"sessionid").toString())).post(String.class);

		Type typelist = new TypeToken<ArrayList<Hoadon>>() {
		}.getType();
		List<Hoadon> dshd = new ArrayList<Hoadon>();
		dshd = gson.fromJson(json, typelist);
		model.addAttribute("tieude", "Hoá đơn");
		model.addAttribute("dshd", dshd);
		model.addAttribute("web", web);
		model.addAttribute("link", "GET");
		model.addAttribute("method", "/daugia/hoadon");
		return "hoadon";
	}
}
