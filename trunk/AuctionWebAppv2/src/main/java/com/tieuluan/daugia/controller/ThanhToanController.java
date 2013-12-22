package com.tieuluan.daugia.controller;


import java.io.IOException;
import java.net.UnknownHostException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
import com.sun.jersey.api.representation.Form;
import com.tieuluan.daugia.function.Function;
import com.tieuluan.daugia.function.Server;
import com.tieuluan.daugia.model.Sanpham;
import com.tieuluan.daugia.model.User;

@Controller
public class ThanhToanController {
	@RequestMapping(value = "/thanhtoan", method = RequestMethod.GET)
	public String example(@RequestParam(value = "masp", required = false, defaultValue = "-1") Long masp, HttpSession session,Model model) throws UnknownHostException {
		if(masp==-1)
			return "redirect:/sanphamdangdau";
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

				model.addAttribute("noidung","Bận cần phải đăng nhập mới thanh toán được sản phẩm này!");
			} else {
				model.addAttribute("noidung", response.getStatus());
			}
			model.addAttribute("web", web);
			return "thongbao";
		}
		gson = new Gson();
		Sanpham sp = new Sanpham();
		sp = gson.fromJson(json, Sanpham.class);
		if(sp.getTinhtrangdaugia()==2){
			model.addAttribute("tieude", "Lỗi");
			model.addAttribute("noidung",
					"Sản phẩm này đã bán hết");
			model.addAttribute("web", web);
			return "thongbao";
		}else if(sp.getTinhtrangdaugia()==3){
			model.addAttribute("tieude", "Lỗi");
			model.addAttribute("noidung",
					"Sản phẩm này đã được thanh toán");
			model.addAttribute("web", web);
			return "thongbao";
		}else if(sp.getTinhtrangdaugia()==0){
			model.addAttribute("tieude", "Lỗi");
			model.addAttribute("noidung",
					"Sản phẩm này chưa kết thúc đấu giá");
			model.addAttribute("web", web);
			return "thongbao";
		}else if(sp.getTinhtrangdaugia()==1){
			String username=session.getAttribute("username").toString();
			if(!username.equals(sp.getNguoidat())){
				model.addAttribute("tieude", "Lỗi");
				model.addAttribute("noidung","Bạn không có quyền thanh toán sản phẩm này");
				model.addAttribute("web", web);
				return "thongbao";
			}
			//get thong tin nguoi ban
			form = new Form();
			form.add("username", sp.getNguoidang());
			json=webResource.path("user/getUserInfoNguoiBan")
					.cookie(new NewCookie("JSESSIONID", session.getAttribute("sessionid").toString()))
					.post(String.class, form);
			User nguoiban = gson.fromJson(json, User.class);
			//get thong tin nguoi mua
			form = new Form();
			form.add("username", username);
			json=webResource.path("user/getUserInfo").cookie(new NewCookie("JSESSIONID", session.getAttribute("sessionid").toString()))
					.post(String.class, form);
			User nguoimua = gson.fromJson(json, User.class);
			//
			model.addAttribute("sp", sp);
			model.addAttribute("imageDirectory", imageDirectory);
			session.setAttribute("nguoimua", nguoimua);
			session.setAttribute("nguoiban", nguoiban);
			model.addAttribute("tieude", "Thanh Toán");
			model.addAttribute("web", web);
			return "thanhtoan";
		}
		else{
			return "redirect:/sanphamdangdau";
		}
	}
	
	@RequestMapping(value = "/thanhtoanngay", method = RequestMethod.GET)
	public String thanhtoanngay(@RequestParam(value = "masp", required = false, defaultValue = "-1") Long masp, HttpSession session,Model model){
		if(masp==-1)
			return "redirect:/sanphamdangdau";
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
						"Bận cần phải đăng nhập mới thanh toán được sản phẩm này!");

			} else {
				model.addAttribute("noidung", response.getStatus());
			}
			model.addAttribute("web", web);
			return "thongbao";
		}
		gson = new Gson();
		Sanpham sp = new Sanpham();
		sp = gson.fromJson(json, Sanpham.class);
		User nguoiban=new User();
		nguoiban.setHoTen("Pham Quy Anh");
		nguoiban.setDienThoai("123456789");
		nguoiban.setDiaChi("987654321");
		User nguoimua=new User();
		nguoimua.setHoTen("Pham Quy Anh");
		nguoimua.setDienThoai("123456789");
		nguoimua.setDiaChi("987654321");
		//
		sp.setGiahientai(sp.getGiamuangay());
		model.addAttribute("sp", sp);
		model.addAttribute("imageDirectory", imageDirectory);
		session.setAttribute("nguoimua", nguoimua);
		session.setAttribute("nguoiban", nguoiban);
		model.addAttribute("tieude", "Thanh Toán");
		model.addAttribute("web", web);
		return "thanhtoan";
	}
	
	@RequestMapping(value="/thanhcong",method = RequestMethod.GET)
	public String thanhtoan(HttpServletRequest request,
			 Model model)
			 {
		HttpSession session=request.getSession();
		String masp=request.getParameter("masp");
		String sotaikhoan=request.getParameter("sotaikhoan");
		String web = Server.web;
		String json = "";
		Gson gson = null;
		ClientConfig config = new DefaultClientConfig();
		Client client = Client.create(config);
		WebResource webResource = client.resource(Server.addressAuctionWS);
		Form form = new Form();
		form.add("masp", masp);
		json=webResource
				.path("hoadon/save")
				.cookie(new NewCookie("JSESSIONID", session.getAttribute("sessionid").toString()))
				.post(String.class, form);
		if(json.equals("ok")){
			model.addAttribute("tieude", "Thông báo");
			model.addAttribute("noidung",
					"Bạn đã thanh toán thành công");
			model.addAttribute("web", web);
			return "thongbao";
		}
		else{
			model.addAttribute("tieude", "Lỗi");
			model.addAttribute("noidung",
					json);
			model.addAttribute("web", web);
			return "thongbao";
		}
	}
	@RequestMapping(value = "/updateTinhTrangDG" , method = RequestMethod.POST)
	public @ResponseBody String updateTinhTrangDaugia(HttpServletRequest request , Model model){
		String masp=request.getParameter("maSP");
		String nguoidatagia = request.getParameter("nguoidat");
		HttpSession session = request.getSession();
		String json = "";
		ClientConfig config = new DefaultClientConfig();
		Client client = Client.create(config);
		WebResource webResource = client.resource(Server.addressAuctionWS);
		Gson gson = new Gson();
		//lay thong tin user
		json = webResource
				.path("user/getUserInfo")
				.cookie(new NewCookie("JSESSIONID", session.getAttribute(
						"sessionid").toString())).post(String.class);
		User user = gson.fromJson(json, User.class);
		//lay thong tin sanpham
		ClientResponse response = null;
		Form form = new Form();
		form.add("masp", masp);
		response = webResource
				.path("sanpham/findById")
				.cookie(new NewCookie("JSESSIONID", session.getAttribute("sessionid").toString()))
				.post(ClientResponse.class, form);
		json = response.getEntity(String.class);
		Sanpham sp = gson.fromJson(json, Sanpham.class);
		
		Function.sendmail(user, sp);
		
		System.out.println(masp);
		form = new Form();
		form.add("masp", masp);
		json = webResource.path("tinhtrangdg/ketthuc").cookie(new NewCookie("JSESSIONID", session.getAttribute("sessionid").toString())).post(String.class,form);
		if(json.equals("success")){
			return "success";
		}else{
			return "fail";
		}
	}

}
