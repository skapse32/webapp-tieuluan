package com.nvh.daugia.controller;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.core.NewCookie;

import net.tanesha.recaptcha.ReCaptchaImpl;
import net.tanesha.recaptcha.ReCaptchaResponse;

import org.joda.time.DateTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.nvh.applicationscope.BangDanhGiaChoose;
import com.nvh.daugia.model.Sanpham;
import com.nvh.daugia.model.jpa.BangDanhGia;
import com.nvh.daugia.model.jpa.BangDanhGiaKq;
import com.nvh.daugia.model.jpa.CauHoi;
import com.nvh.daugia.model.jpa.CauHoiKq;
import com.nvh.daugia.model.jpa.LichSuDauGia;
import com.nvh.daugia.model.jpa.LoaiCauHoi;
import com.nvh.daugia.model.jpa.ThongBao;
import com.nvh.daugia.model.jpa.TimeBean;
import com.nvh.daugia.model.jpa.User;
import com.nvh.daugia.service.BangDanhGiaKqService;
import com.nvh.daugia.service.BangDanhGiaService;
import com.nvh.daugia.service.CauHoiKqService;
import com.nvh.daugia.service.CauHoiService;
import com.nvh.daugia.service.LoaiCauHoiService;
import com.nvh.daugia.service.ThoiKhoaBieuService;
import com.nvh.daugia.service.ThongBaoService;
import com.nvh.daugia.service.UserService;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
import com.tieuluan.daugia.function.Server;

@Controller
@RequestMapping("/sinhvien")
public class UserCotroller {

	private Logger log = LoggerFactory.getLogger(UserCotroller.class);

	@Autowired
	private TimeBean time;

	@Autowired
	private ThoiKhoaBieuService tkbService;

	@Autowired
	private CauHoiService chService;

	@Autowired
	private CauHoiKqService chkqService;

	@Autowired
	private LoaiCauHoiService lchService;

	@Autowired
	private BangDanhGiaChoose choose;

	@Autowired
	private BangDanhGiaService bdgService;

	@Autowired
	private BangDanhGiaKqService bdgkqService;

	@Autowired
	private UserService userService;

	@Autowired
	private ThongBaoService tbService;

	@Autowired
	ReCaptchaImpl reCaptcha;

	@RequestMapping(method = RequestMethod.GET)
	public String logined(Model model) {
		// load tkb theo sinh vien do
		List<ThongBao> tkbs = tbService.findAll();
		model.addAttribute("tblist", tkbs);
		return "indexsv";
	}
	
	@RequestMapping(value="dsspkethuc" ,method = RequestMethod.GET)
	public String sanphamdadang(Model model, HttpSession session){
		ClientConfig config = new DefaultClientConfig();
		Client client = Client.create(config);
		Gson gson = new Gson();
		WebResource resource = client.resource(Server.addressAuctionWS);
		String json = "";
		json = resource
				.path("sanpham/findBySanPhamCuaToiDaDauXong")
				.cookie(new NewCookie("JSESSIONID", session.getAttribute(
						"sessionid").toString())).post(String.class);

		Type typelist = new TypeToken<ArrayList<Sanpham>>() {
		}.getType();
		List<Sanpham> dssp = new ArrayList<Sanpham>();
		dssp = gson.fromJson(json, typelist);
		model.addAttribute("dssp", dssp);
		model.addAttribute("imageDirectory", Server.addressAuctionImage);
		model.addAttribute("tentrang", "Quản lý sản phẩm của tôi đã đấu");
		return "sanphamduocdanhgia";
	}
	
	
	@RequestMapping(value = "dggv", method = RequestMethod.GET)
	public String sanphamchienthang(HttpServletRequest request, Model model, HttpSession session) {
		//get danh sach san pham da tham gia va ket thuc.
		ClientConfig config = new DefaultClientConfig();
		Client client = Client.create(config);
		Gson gson = new Gson();
		WebResource resource = client.resource(Server.addressAuctionWS);
		String json = "";
		json = resource
				.path("sanpham/findBySanPhamChienThangAll")
				.cookie(new NewCookie("JSESSIONID", session.getAttribute(
						"sessionid").toString())).post(String.class);

		Type typelist = new TypeToken<ArrayList<Sanpham>>() {
		}.getType();
		List<Sanpham> dssp = new ArrayList<Sanpham>();
		dssp = gson.fromJson(json, typelist);
		model.addAttribute("dssp", dssp);
		model.addAttribute("imageDirectory", Server.addressAuctionImage);
		model.addAttribute("tentrang", "Quản lý sản phẩm của tôi đã thắng phiên");
		return "sinhvien";
	}

	@RequestMapping(value = "/danhgia/{id}", method = RequestMethod.GET)
	public String danhgia(@PathVariable("id") int id, Model model,
			HttpServletRequest request) {
		log.info("Start Danh Gia" + id);
		DateTime timeNow = new DateTime();
		if (time.getTimeBD() == null || time.getTimeKT() == null) {
			model.addAttribute("error",
					"Chưa có thông báo về? việc đánh giá!. Vui lòng chờ?");
			return "sinhviendgia";
		}
		int result = timeNow.compareTo(time.getTimeBD());
		log.info("Time BD : " + time.getTimeBD().toString() + " | Time KT : "
				+ time.getTimeKT().toString());
		// lay bang danh gia hien tai
		if (choose.getId() == 0) {
			model.addAttribute("error", "Chưa có bảng đánh giá.");
			return "sinhviendgia";
		}
		if (result <= 0) {
			model.addAttribute("error", "Chưa đến th�?i gian cho phép đánh giá");
			return "sinhviendgia";
		} else {
			// sau khi thoi gian bd.
			int resultKT = timeNow.compareTo(time.getTimeKT());
			if (resultKT == 1) {
				// qua' han
				model.addAttribute("error",
						"�?ã quá hạn để đánh giá!. Vui lòng quay lại sau!");
				return "sinhviendgia";
			}
		}
		LichSuDauGia tkb = tkbService.findById(id);
		BangDanhGiaKq dgkq = bdgkqService.findByMonhocdg(tkb);
		if (dgkq == null) {
			BangDanhGia bdg = choose.getBgd();
			List<LoaiCauHoi> lchs = new ArrayList<LoaiCauHoi>(bdg.getLchs());
			Collections.sort(lchs);
			model.addAttribute("lchs", lchs);
			// gom nhom
			model.addAttribute("thoikhoabieu", tkb);
			model.addAttribute("bangdanhgia", bdg);
			return "sinhviendgia";
		} else {
			// da danh gia mon hoc nay roi
			BangDanhGia bdg = choose.getBgd();
			List<LoaiCauHoi> lchs = new ArrayList<LoaiCauHoi>(bdg.getLchs());
			Collections.sort(lchs);
			model.addAttribute("lchs", lchs);
			// gom nhom
			model.addAttribute("thoikhoabieu", tkb);
			model.addAttribute("bangdanhgia", bdg);
			model.addAttribute("bangdanhgiakq", dgkq);
			log.info(dgkq.toString());
			return "sinhviendgia";
		}
	}

	@RequestMapping(value = "/checkCapcha", method = RequestMethod.GET)
	public @ResponseBody
	String checkCapcha(
			@RequestParam("recaptcha_challenge_field") String challangeField,
			@RequestParam("recaptcha_response_field") String responseField,
			HttpServletRequest request) {
		String remoteAddress = request.getRemoteAddr();
		ReCaptchaResponse reCaptchaResponse = this.reCaptcha.checkAnswer(
				remoteAddress, challangeField, responseField);
		if (!reCaptchaResponse.isValid()) {
			// model.addAttribute("invalidRecaptcha", "true");
			return "false";
		}
		return "true";
	}

	@RequestMapping(value = "/danhgia/{id}", method = RequestMethod.POST)
	public String luudanhgia(@PathVariable("id") int idBang,
			HttpServletRequest request, Model model) {
		try {

			int id = Integer.parseInt(request.getParameter("idtkb"));
			BangDanhGiaKq dgkq = new BangDanhGiaKq();
			// tim loai bang dung de danh gia
			dgkq.setLoaiBang(bdgService.findById(idBang));
			dgkq.setMonhocdg(tkbService.findById(id));

			dgkq.setNgaytao(new Date());
			// luu ket qua bang danh gia

			// luu cau hoi

			BangDanhGia lch = bdgService.findById(idBang);
			List<CauHoi> chs = chService.findByBangDanhGia(lch);
			for (CauHoi cauHoi : chs) {
				String kq = request.getParameter(cauHoi.getId());
				CauHoiKq chkq = new CauHoiKq();
				chkq.setBangkq(dgkq);
				chkq.setCauhoi(cauHoi);
				chkq.setKetqua(kq.charAt(0));
				dgkq.getCauhoikqs().add(chkq);
			}
			bdgkqService.save(dgkq);
			model.addAttribute("success", "�?ánh giá lưu thành công!");
			User use = (User) request.getSession().getAttribute("account");
			List<LichSuDauGia> tkb = tkbService.findBySV(use);
			model.addAttribute("tkblist", tkb);
			return "sinhvien";
		} catch (Exception e) {
			// TODO: handle exception
			User use = (User) request.getSession().getAttribute("account");
			List<LichSuDauGia> tkb = tkbService.findBySV(use);
			model.addAttribute("tkblist", tkb);
			model.addAttribute("fail", "�?ánh giá lưu không thành công!");
			return "sinhvien";
		}

	}

	@RequestMapping(value = "/danhgia/{id}", params = "update", method = RequestMethod.POST)
	public String updatedanhgia(@PathVariable("id") int idBang,
			HttpServletRequest request, Model model) {
		int id = Integer.parseInt(request.getParameter("idtkb"));
		BangDanhGiaKq dgkq = bdgkqService.findByMonhocdg(tkbService
				.findById(id));
		// tim loai bang dung de danh gia

		// luu cau hoi
		for (CauHoiKq chkq : dgkq.getCauhoikqs()) {
			// dgkq.getCauhoikqs().remove(chkq);
			String kq = request.getParameter(String.valueOf(chkq.getId()));
			chkq.setKetqua(kq.charAt(0));
			chkqService.save(chkq);
		}
		dgkq.setNgaytao(new Date());
		model.addAttribute("success", "�?ánh giá lưu thành công!");
		bdgkqService.save(dgkq);
		User use = (User) request.getSession().getAttribute("account");
		List<LichSuDauGia> tkb = tkbService.findBySV(use);
		model.addAttribute("tkblist", tkb);
		return "sinhvien";
	}

	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public String getInfo(Model model, HttpServletRequest request) {
		User user = userService.findById(request.getParameter("id"));
		model.addAttribute("user", user);
		return "infosinhvien";
	}
}