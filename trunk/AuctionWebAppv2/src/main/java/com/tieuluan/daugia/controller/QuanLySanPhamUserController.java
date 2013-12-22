package com.tieuluan.daugia.controller;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Type;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.NewCookie;

import org.apache.commons.logging.Log;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
import com.sun.jersey.api.representation.Form;
import com.sun.jersey.multipart.FormDataMultiPart;
import com.sun.jersey.multipart.file.FileDataBodyPart;
import com.tieuluan.daugia.function.Server;
import com.tieuluan.daugia.model.Sanpham;

@Controller
public class QuanLySanPhamUserController {
	
	
	@RequestMapping(value = "/qlsanphamdangthamgia", method = RequestMethod.GET)
	public String qlsanphamdangthamgia(

	Model model, HttpSession session) throws IOException {
		String imageDirectory = Server.addressAuctionImage;
		String web = Server.web;
		String json = "";
		Gson gson = new Gson();
		ClientConfig config = new DefaultClientConfig();
		Client client = Client.create(config);
		WebResource webResource = client.resource(Server.addressAuctionWS);

		json = webResource
				.path("sanpham/findBySanPhamThamGiaDangDau")
				.cookie(new NewCookie("JSESSIONID", session.getAttribute(
						"sessionid").toString())).post(String.class);

		Type typelist = new TypeToken<ArrayList<Sanpham>>() {
		}.getType();
		List<Sanpham> dssp = new ArrayList<Sanpham>();
		dssp = gson.fromJson(json, typelist);
		model.addAttribute("tieude", "Sản phẩm đang tham gia");
		model.addAttribute("dssp", dssp);
		model.addAttribute("method", "POST");
		model.addAttribute("link", "/daugia/loaddssanphamdangthamgia");
		model.addAttribute("imageDirectory", imageDirectory);
		model.addAttribute("web", web);
		return "qlsanpham";
	}

	@RequestMapping(value = "/loaddssanphamdangthamgia", method = RequestMethod.POST)
	public @ResponseBody
	String loaddssanphamdangthamgia(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String json = "";
		ClientConfig config = new DefaultClientConfig();
		Client client = Client.create(config);
		WebResource webResource = client.resource(Server.addressAuctionWS);
		ClientResponse response = null;
		response = webResource
				.path("sanpham/findBySanPhamThamGiaDangDau")
				.cookie(new NewCookie("JSESSIONID", session.getAttribute(
						"sessionid").toString())).post(ClientResponse.class);
		json = response.getEntity(String.class);
		return json;
	}

	@RequestMapping(value = "/qlsanphamdaketthuc", method = RequestMethod.GET)
	public String qlsanphamdaketthuc(

	Model model, HttpSession session) throws IOException {
		String imageDirectory = Server.addressAuctionImage;
		String web = Server.web;
		String json = "";
		Gson gson = new Gson();
		ClientConfig config = new DefaultClientConfig();
		Client client = Client.create(config);
		WebResource webResource = client.resource(Server.addressAuctionWS);

		json = webResource
				.path("sanpham/findBySanPhamThamGiaKetThuc")
				.cookie(new NewCookie("JSESSIONID", session.getAttribute(
						"sessionid").toString())).post(String.class);

		Type typelist = new TypeToken<ArrayList<Sanpham>>() {
		}.getType();
		List<Sanpham> dssp = new ArrayList<Sanpham>();
		dssp = gson.fromJson(json, typelist);

		model.addAttribute("tieude", "Sản phẩm đã kết thúc");
		model.addAttribute("dssp", dssp);
		model.addAttribute("imageDirectory", imageDirectory);
		model.addAttribute("web", web);
		model.addAttribute("method", "GET");
		model.addAttribute("link", "/daugia/qlsanphamdaketthuc");
		return "qlsanpham";
	}

	@RequestMapping(value = "/qlsanphamchienthang", method = RequestMethod.GET)
	public String qlsanphamchienthang(@RequestParam(value = "trangthai", required = false, defaultValue = "-1") int trangthai,

	Model model, HttpSession session) throws IOException {
		String imageDirectory = Server.addressAuctionImage;
		String web = Server.web;
		String json = "";

		Gson gson = new Gson();
		ClientConfig config = new DefaultClientConfig();
		Client client = Client.create(config);
		WebResource webResource = client.resource(Server.addressAuctionWS);
		String path="";
		if(trangthai==-1){
			path="sanpham/findBySanPhamChienThangAll";
		}
		else if(trangthai==3){
			path="sanpham/findBySanPhamChienThangDaThanhToan";
		}
		else if(trangthai==1){
			path="sanpham/findBySanPhamChienThangChuaThanhToan";
		}
		json = webResource
				.path(path)
				.cookie(new NewCookie("JSESSIONID", session.getAttribute(
						"sessionid").toString())).post(String.class);

		Type typelist = new TypeToken<ArrayList<Sanpham>>() {
		}.getType();
		List<Sanpham> dssp = new ArrayList<Sanpham>();
		dssp = gson.fromJson(json, typelist);
		model.addAttribute("tieude", "Sản phẩm chiến thắng");
		model.addAttribute("dssp", dssp);
		model.addAttribute("imageDirectory", imageDirectory);
		model.addAttribute("trangthai", trangthai);
		model.addAttribute("web", web);

		model.addAttribute("method", "GET");
		model.addAttribute("link", "/daugia/qlsanphamchienthang");
		return "qlsanpham";
	}

	@RequestMapping(value = "/qlsanphamcuatoidangdau", method = RequestMethod.GET)
	public String qlsanphamcuatoidangdau(
	Model model, HttpSession session) throws IOException {
		String imageDirectory = Server.addressAuctionImage;
		String web = Server.web;
		String json = "";
		Gson gson = new Gson();
		ClientConfig config = new DefaultClientConfig();
		Client client = Client.create(config);
		WebResource webResource = client.resource(Server.addressAuctionWS);

		json = webResource
				.path("sanpham/findBySanPhamCuaToiDangDau")
				.cookie(new NewCookie("JSESSIONID", session.getAttribute(
						"sessionid").toString())).post(String.class);

		Type typelist = new TypeToken<ArrayList<Sanpham>>() {
		}.getType();
		List<Sanpham> dssp = new ArrayList<Sanpham>();
		dssp = gson.fromJson(json, typelist);
		model.addAttribute("tieude", "Sản phẩm của tôi đang đấu");
		model.addAttribute("dssp", dssp);
		model.addAttribute("imageDirectory", imageDirectory);
		model.addAttribute("web", web);
		model.addAttribute("link", "POST");
		model.addAttribute("method", "/daugia/loaddssanphamcuatoidangdau");
		return "qlsanpham";
	}
	@RequestMapping(value = "/loaddssanphamcuatoidangdau", method = RequestMethod.POST)
	public @ResponseBody
	String loaddssanphamcuatoidangdau(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String json = "";
		ClientConfig config = new DefaultClientConfig();
		Client client = Client.create(config);
		WebResource webResource = client.resource(Server.addressAuctionWS);
		ClientResponse response = null;
		response = webResource
				.path("sanpham/findBySanPhamCuaToiDangDau")
				.cookie(new NewCookie("JSESSIONID", session.getAttribute(
						"sessionid").toString())).post(ClientResponse.class);
		json = response.getEntity(String.class);
		return json;
	}
	@RequestMapping(value = "/qlsanphamcuatoibihuy", method = RequestMethod.GET)
	public String qlsanphamcuatoibihuy(
	Model model, HttpSession session) throws IOException {
		String imageDirectory = Server.addressAuctionImage;
		String web = Server.web;
		String json = "";
		Gson gson = new Gson();
		ClientConfig config = new DefaultClientConfig();
		Client client = Client.create(config);
		WebResource webResource = client.resource(Server.addressAuctionWS);

		json = webResource
				.path("sanpham/findBySanPhamCuaToiBiHuy")
				.cookie(new NewCookie("JSESSIONID", session.getAttribute(
						"sessionid").toString())).post(String.class);

		Type typelist = new TypeToken<ArrayList<Sanpham>>() {
		}.getType();
		List<Sanpham> dssp = new ArrayList<Sanpham>();
		dssp = gson.fromJson(json, typelist);
		model.addAttribute("tieude", "Sản phẩm của tôi bị hủy");
		model.addAttribute("dssp", dssp);
		model.addAttribute("imageDirectory", imageDirectory);
		model.addAttribute("web", web);
		model.addAttribute("capnhatsanphamhuy", "OK");
		model.addAttribute("link", "GET");
		model.addAttribute("method", "/daugia/qlsanphamcuatoibihuy");
		return "qlsanpham";
	}
	@RequestMapping(value = "/qlsanphamcuatoisapdau", method = RequestMethod.GET)
	public String qlsanphamcuatoisapdau(
	Model model, HttpSession session) throws IOException {
		String imageDirectory = Server.addressAuctionImage;
		String web = Server.web;
		String json = "";
		Gson gson = new Gson();
		ClientConfig config = new DefaultClientConfig();
		Client client = Client.create(config);
		WebResource webResource = client.resource(Server.addressAuctionWS);
		json = webResource
				.path("sanpham/findBySanPhamCuaToiSapDau")
				.cookie(new NewCookie("JSESSIONID", session.getAttribute(
						"sessionid").toString())).post(String.class);

		Type typelist = new TypeToken<ArrayList<Sanpham>>() {
		}.getType();
		List<Sanpham> dssp = new ArrayList<Sanpham>();
		dssp = gson.fromJson(json, typelist);
		model.addAttribute("tieude", "Sản phẩm của tôi sắp đấu");
		model.addAttribute("dssp", dssp);
		model.addAttribute("imageDirectory", imageDirectory);
		model.addAttribute("web", web);
		model.addAttribute("link", "GET");
		model.addAttribute("sapdau", "ok");
		model.addAttribute("method", "/daugia/qlsanphamcuatoisapdau");
		return "qlsanpham";
	}
	@RequestMapping(value = "/qlsanphamcuatoidadauxong", method = RequestMethod.GET)
	public String qlsanphamcuatoidadauxong(
	Model model, HttpSession session) throws IOException {
		String imageDirectory = Server.addressAuctionImage;
		String web = Server.web;
		String json = "";
		Gson gson = new Gson();
		ClientConfig config = new DefaultClientConfig();
		Client client = Client.create(config);
		WebResource webResource = client.resource(Server.addressAuctionWS);
		json = webResource
				.path("sanpham/findBySanPhamCuaToiDaDauXong")
				.cookie(new NewCookie("JSESSIONID", session.getAttribute(
						"sessionid").toString())).post(String.class);

		Type typelist = new TypeToken<ArrayList<Sanpham>>() {
		}.getType();
		List<Sanpham> dssp = new ArrayList<Sanpham>();
		dssp = gson.fromJson(json, typelist);
		model.addAttribute("tieude", "Sản phẩm của tôi đã đấu xong");
		model.addAttribute("dssp", dssp);
		model.addAttribute("imageDirectory", imageDirectory);
		model.addAttribute("web", web);
		model.addAttribute("link", "GET");
		model.addAttribute("method", "/daugia/qlsanphamcuatoidadauxong");
		return "qlsanpham";
	}
	@RequestMapping(value = "/capnhatsanpham", method = RequestMethod.GET)
	public String capnhatsanphamget(Model model, HttpServletRequest request)
			throws IOException {
		HttpSession session = request.getSession();
		String web = Server.web;
		String imageDirectory = Server.addressAuctionImage;
		if (request.getParameter("masp") == null) {
			return "redirect:/qlsanphamcuatoisapdau";
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
		if(new Date(sp.getThoigianbatdau()).getTime()<(new Date()).getTime() ||  sp.getTinhtrangdaugia()!=0){
			return "redirect:/qlsanphamcuatoisapdau";
		}
		String thoigianbatdau = "";
		String thoigianketthuc = "";
		Format formatter;
		formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		thoigianbatdau = formatter.format(new Date(sp.getThoigianbatdau()));
		thoigianketthuc = formatter.format(new Date(sp.getThoigianketthuc()));
		model.addAttribute("thoigianbatdau", thoigianbatdau);
		model.addAttribute("thoigianketthuc", thoigianketthuc);
		model.addAttribute("sp", sp);
		model.addAttribute("imageDirectory", imageDirectory);
		model.addAttribute("tieude", "Cập nhật sản phẩm");
		model.addAttribute("web", web);
		return "capnhatsanpham";
	}
	@RequestMapping(value = "/xoasanpham", method = RequestMethod.GET)
	public String xoasanpham(Model model, HttpServletRequest request)
			throws IOException {
		HttpSession session = request.getSession();
		String web = Server.web;
		if (request.getParameter("masp") == null) {
			return "redirect:/qlsanphamcuatoisapdau";
		}
		String masp = request.getParameter("masp");
		String json = "";
		
		ClientConfig config = new DefaultClientConfig();
		Client client = Client.create(config);
		WebResource webResource = client.resource(Server.addressAuctionWS);
		Form form = new Form();
		form.add("masp", masp);

		json = webResource
				.path("sanpham/xoaSanPham")
				.cookie(new NewCookie("JSESSIONID", session.getAttribute(
						"sessionid").toString())).post(String.class, form);
		
		if(!"ok".equals(json)){
			model.addAttribute("web", web);
			model.addAttribute("tieude", "Lỗi");
			model.addAttribute("noidung", json);
			return "thongbaoqlsanphamuser";
		}else{
			return "redirect:/qlsanphamcuatoisapdau";
		}
	}
	@RequestMapping(value = "/capnhatsanpham", method = RequestMethod.POST, produces="application/json; charset=utf-8")
	public String capnhatsanphampost(HttpServletRequest request,
			@RequestParam CommonsMultipartFile file, Model model)
			throws IllegalStateException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String web = Server.web;
		model.addAttribute("web", web);
		String masp = "", tensp = "0000", maloaisp = "2", matinhtrangsp = "1", soluong = "1000", xuatxu = "QuyAnh", thuonghieu = "QuyAnh", mota = "MoTa", giakhoidiem = "1000000.0", giahientai = "0.0", buocgia = "200000.0", thoigianbatdau = "2013-05-10 22:35:29.589", thoigianketthuc = "2013-05-30 22:35:29.589", mahttt = "1", thongtinlienhe = "QuyAnh";
		String nguoidang = session.getAttribute("username").toString();
		String filename = "null", pathname = "", error = "", resultsaveimage = "", resultsavesanpham = "";
		String noidung="";
		ClientConfig config = new DefaultClientConfig();
		Client client = Client.create(config);
		WebResource webResource = client
				.resource(Server.addressAuctionWS);
		if (!file.getOriginalFilename().equals("")) {
			filename = file.getOriginalFilename();
			pathname = Server.saveDirectory + file.getOriginalFilename();
			file.transferTo(new File(pathname));
			try {
				
				File fileupload = new File(pathname);
				FileDataBodyPart fdp = new FileDataBodyPart("file", fileupload,
						MediaType.APPLICATION_OCTET_STREAM_TYPE);
				FormDataMultiPart formDataMultiPart = new FormDataMultiPart();
				formDataMultiPart.bodyPart(fdp);
				resultsaveimage = webResource
						.path("image/save")
						.cookie(new NewCookie("JSESSIONID", session
								.getAttribute("sessionid").toString()))
						.type(MediaType.MULTIPART_FORM_DATA)
						.accept(MediaType.TEXT_PLAIN)
						.post(String.class, formDataMultiPart);
				
				if (resultsaveimage.equals("OK")) {
					noidung="Cập nhật thành công";
				} else {
					noidung="Cập nhật thất bại("+resultsaveimage+")";
					filename="null";
				}
			} catch (Exception e) {
				e.printStackTrace();
				error = e.getMessage();
				model.addAttribute("tieude", "Lỗi");
				model.addAttribute("noidung", error);
				return "thongbaoqlsanphamuser";
			}
		}
		else{
			noidung="Không chứa hình ảnh";
		}
		log.info(request.getParameter("txtxuatxu"));
		masp = request.getParameter("masp");
		tensp = request.getParameter("txttensp");
		matinhtrangsp = request.getParameter("selectttsp");
		maloaisp = request.getParameter("selectloaisp");
		soluong = request.getParameter("txtsoluong");
		xuatxu = request.getParameter("txtxuatxu");
		thuonghieu = request.getParameter("txtthuonghieu");
		mota = request.getParameter("txtmota");
		giakhoidiem = request.getParameter("txtgiakhoidiem");
		buocgia = request.getParameter("txtbuocgia");
		thoigianbatdau = request.getParameter("txttgbt");
		thoigianketthuc = request.getParameter("txttgkt");
		mahttt = request.getParameter("selecthttt");
		thongtinlienhe = request.getParameter("txtthongtinlienhe");
		
		Form form = new Form();
		form.add("masp", masp);
		form.add("tensp", tensp);
		form.add("matinhtrangsp", matinhtrangsp);
		form.add("maloaisp", maloaisp);
		form.add("soluong", soluong);
		form.add("xuatxu", xuatxu);
		form.add("thuonghieu", thuonghieu);
		form.add("mota", mota);
		form.add("giakhoidiem", giakhoidiem);
		form.add("giahientai", giahientai);
		form.add("buocgia", buocgia);
		form.add("thoigianbatdau", thoigianbatdau);
		form.add("thoigianketthuc", thoigianketthuc);
		form.add("mahttt", mahttt);
		form.add("nguoidang", nguoidang);
		form.add("hinhanh", filename);
		form.add("thongtinlienhe", thongtinlienhe);
		resultsavesanpham = webResource
				.path("sanpham/update")
				.cookie(new NewCookie("JSESSIONID", session
						.getAttribute("sessionid").toString()))
				.type(MediaType.APPLICATION_FORM_URLENCODED)
				.accept(MediaType.APPLICATION_JSON)
				.post(String.class, form);
		model.addAttribute("tieude", "Kết quả cập nhật sản phẩm");
		model.addAttribute("noidung", resultsavesanpham+"<br>"+noidung);
		return "thongbaoqlsanphamuser";
	}
	@RequestMapping(value = "/capnhatsanphambihuy", method = RequestMethod.GET , produces="application/json; charset=utf-8")
	public String capnhatsanphambihuyget(Model model, HttpServletRequest request)
			throws IOException {
		HttpSession session = request.getSession();
		String web = Server.web;
		String imageDirectory = Server.addressAuctionImage;
		if (request.getParameter("masp") == null) {
			return "redirect:/qlsanphamcuatoibihuy";
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
		if(sp.getTinhtrangdaugia()!=2){
			return "redirect:/qlsanphamcuatoibihuy";
		}
		String thoigianbatdau = "";
		String thoigianketthuc = "";
		Format formatter;
		formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		thoigianbatdau = formatter.format(new Date(sp.getThoigianbatdau()));
		thoigianketthuc = formatter.format(new Date(sp.getThoigianketthuc()));
		model.addAttribute("thoigianbatdau", thoigianbatdau);
		model.addAttribute("thoigianketthuc", thoigianketthuc);
		model.addAttribute("sp", sp);
		model.addAttribute("imageDirectory", imageDirectory);
		model.addAttribute("tieude", "Cập nhận sản phẩm bị hủy");
		model.addAttribute("web", web);
		return "capnhatsanphambihuy";
	}
	@RequestMapping(value = "/dangsanpham",method = RequestMethod.GET)
	public String dangsanphamget(Model model, HttpSession session)
			throws IOException {
		String web = Server.web;

		model.addAttribute("tieude", "Đăng sản phẩm");
		model.addAttribute("web", web);
		return "dangsanpham";
	}

	private Logger log = LoggerFactory.getLogger(QuanLySanPhamUserController.class);
	
	@RequestMapping(value = "/dangsanpham",method = RequestMethod.POST ,produces="application/json; charset=utf-8")
	public String dangsanphampost(HttpServletRequest request,
			@RequestParam CommonsMultipartFile file, Model model)
			throws IllegalStateException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String web = Server.web;
		model.addAttribute("web", web);
		String  tensp = "0000", maloaisp = "2", matinhtrangsp = "1", soluong = "1000", xuatxu = "QuyAnh", thuonghieu = "QuyAnh", mota = "MoTa", giakhoidiem = "1000000.0", giahientai = "0.0", buocgia = "200000.0", thoigianbatdau = "2013-05-10 22:35:29.589", thoigianketthuc = "2013-05-30 22:35:29.589", mahttt = "1", thongtinlienhe = "QuyAnh";
		String giamuangay ="";
		String nguoidang = session.getAttribute("username").toString();
		String filename = "null", pathname = "", error = "", resultsaveimage = "", resultsavesanpham = "";
		String noidung="";
		ClientConfig config = new DefaultClientConfig();
		Client client = Client.create(config);
		WebResource webResource = client.resource(Server.addressAuctionWS);
		if (!file.getOriginalFilename().equals("")) {
			filename = file.getOriginalFilename();
			pathname = Server.saveDirectory + file.getOriginalFilename();
			file.transferTo(new File(pathname));
			try {
				File fileupload = new File(pathname);
				FileDataBodyPart fdp = new FileDataBodyPart("file", fileupload,
						MediaType.APPLICATION_OCTET_STREAM_TYPE);
				FormDataMultiPart formDataMultiPart = new FormDataMultiPart();
				formDataMultiPart.bodyPart(fdp);
				resultsaveimage = webResource
						.path("image/save")
						.cookie(new NewCookie("JSESSIONID", session
								.getAttribute("sessionid").toString()))
						.type(MediaType.MULTIPART_FORM_DATA)
						.accept(MediaType.TEXT_PLAIN)
						.post(String.class, formDataMultiPart);
				
				if (resultsaveimage.equals("OK")) {
					noidung="Lưu hình ảnh thành công";
				} else {
					noidung="lưu hình ảnh thất bại("+resultsaveimage+")";
					filename="null";
				}
			} catch (Exception e) {
				e.printStackTrace();
				error = e.getMessage();
				model.addAttribute("tieude", "Lỗi");
				model.addAttribute("noidung", error);
				return "thongbaoqlsanphamuser";
			}
		}
		else{
			noidung="Không chứa hình ảnh";
		}
		log.info(request.getParameter("txtxuatxu"));
		tensp = request.getParameter("txttensp");
		model.addAttribute("tensp", tensp);
		matinhtrangsp = request.getParameter("selectttsp");
		maloaisp = request.getParameter("selectloaisp");
		soluong = request.getParameter("txtsoluong");
		xuatxu = request.getParameter("txtxuatxu");
		thuonghieu = request.getParameter("thuonghieu");
		model.addAttribute("thuonghieu", thuonghieu);
		mota = request.getParameter("txtmota");
		giakhoidiem = request.getParameter("txtgiakhoidiem");
		model.addAttribute("giakhoidiem", giakhoidiem);
		buocgia = request.getParameter("txtbuocgia");
		thoigianbatdau = request.getParameter("txttgbt");
		thoigianketthuc = request.getParameter("txttgkt");
		mahttt = request.getParameter("selecthttt");
		thongtinlienhe = request.getParameter("txtthongtinlienhe");
		giamuangay = request.getParameter("txtmuangay");
		model.addAttribute("giamuangay", giamuangay);
		Form form = new Form();
		form.add("tensp", tensp);
		form.add("matinhtrangsp", matinhtrangsp);
		form.add("maloaisp", maloaisp);
		form.add("soluong", soluong);
		form.add("xuatxu", xuatxu);
		form.add("thuonghieu", thuonghieu);
		form.add("mota", mota);
		form.add("giakhoidiem", giakhoidiem);
		form.add("giahientai", giahientai);
		form.add("buocgia", buocgia);
		form.add("giamuangay", giamuangay);
		form.add("thoigianbatdau", thoigianbatdau);
		form.add("thoigianketthuc", thoigianketthuc);
		form.add("mahttt", mahttt);
		form.add("nguoidang", nguoidang);
		form.add("hinhanh", filename);
		form.add("thongtinlienhe", thongtinlienhe);
		resultsavesanpham = webResource
				.path("sanpham/save")
				.cookie(new NewCookie("JSESSIONID", session
						.getAttribute("sessionid").toString()))
				.type(MediaType.APPLICATION_FORM_URLENCODED)
				.accept(MediaType.APPLICATION_JSON)
				.post(String.class, form);
		log.info(resultsavesanpham);
		String[] args = resultsavesanpham.split(",");
		request.setAttribute("masp", args[1]);
		request.setAttribute("tieude", "Kết quả thuộc sản phẩm");
		request.setAttribute("noidung", args[0] + "<br>"+noidung);
		request.setAttribute("thanhcong", "true");
		return "thongbaoqlsanphamuser";		
	}
}
