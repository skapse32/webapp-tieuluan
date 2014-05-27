package service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import util.SanPhamComparator;
import util.SanphamComparatorNew;
import util.SanphamComparatorPriceDown;
import util.SanphamComparatorPriceUp;
import model.Sanpham;

import com.sun.jersey.spi.container.ResourceFilters;

import dao.EntityManagerHelper;
import domain.Hinhthucthanhtoan;
import domain.Loaisp;
import domain.Tinhtrangsp;
import dto.HinhthucthanhtoanDTO;
import dto.LoaispDTO;
import dto.SanphamDTO;
import dto.TinhtrangspDTO;
import filter.FilterAdmin;
import filter.FilterUser;

@Path("sanpham")
public class SanPhamServices {
	@Context
	HttpServletRequest request;

	@POST
	@Path("/findAll")
	@Produces("application/json; charset=utf-8")
	public List<model.Sanpham> findAll() {
		List<model.Sanpham> pojodssp = new ArrayList<model.Sanpham>();
		dto.SanphamDTO sanphamdao = new dto.SanphamDTO();
		// EntityManagerHelper.beginTransaction();
		List<domain.Sanpham> daodssp = sanphamdao.findAll();
		// EntityManagerHelper.commit();
		for (domain.Sanpham daosp : daodssp) {
			model.Sanpham pojosp = new Sanpham(daosp.getMasp(),
					daosp.getTensp(), daosp.getTinhtrangsp()
							.getTentinhtrangsp(), daosp.getSoluong(),
					daosp.getXuatxu(), daosp.getThuonghieu(), daosp.getLoaisp()
							.getTenloaisp(), daosp.getNguoidang(),
					daosp.getGiakhoidiem(), daosp.getGiahientai(),
					daosp.getGiamuangay(), daosp.getNguoidat(),
					daosp.getBuocgia(), daosp.getThoigianbatdau().getTime(),
					daosp.getThoigianketthuc().getTime(),
					daosp.getThongtinlienhe(), daosp.getHinhthucthanhtoan()
							.getTenhttt(), daosp.getHinhanh(), daosp.getMota(),
					daosp.getTinhtrangdaugia(), daosp.getGhichu());
			pojodssp.add(pojosp);
		}
		return pojodssp;
	}

	@POST
	@Path("/findByTinhTrang")
	@Produces("application/json; charset=utf-8")
	public List<model.Sanpham> findByTinhTrang(
			@FormParam("tinhtrangdaugia") int tinhtrangdaugia) {
		List<model.Sanpham> pojodssp = new ArrayList<model.Sanpham>();
		dto.SanphamDTO sanphamdao = new dto.SanphamDTO();
		List<domain.Sanpham> daodssp = sanphamdao.findByProperty(
				"tinhtrangdaugia", tinhtrangdaugia);
		for (domain.Sanpham daosp : daodssp) {
			model.Sanpham pojosp = new Sanpham(daosp.getMasp(),
					daosp.getTensp(), daosp.getTinhtrangsp()
							.getTentinhtrangsp(), daosp.getSoluong(),
					daosp.getXuatxu(), daosp.getThuonghieu(), daosp.getLoaisp()
							.getTenloaisp(), daosp.getNguoidang(),
					daosp.getGiakhoidiem(), daosp.getGiahientai(),
					daosp.getGiamuangay(), daosp.getNguoidat(),
					daosp.getBuocgia(), daosp.getThoigianbatdau().getTime(),
					daosp.getThoigianketthuc().getTime(),
					daosp.getThongtinlienhe(), daosp.getHinhthucthanhtoan()
							.getTenhttt(), daosp.getHinhanh(), daosp.getMota(),
					daosp.getTinhtrangdaugia(), daosp.getGhichu());
			pojodssp.add(pojosp);
		}
		return pojodssp;
	}

	@POST
	@Path("/ketThucDauGia")
	@Produces("application/json; charset=utf-8")
	public String findByKetThucDauGia() {
		dto.SanphamDTO sanphamdao = new dto.SanphamDTO();
		return String.valueOf(sanphamdao.ketThucDauGia1());
	}

	@POST
	@Path("/findSoSanPhamDangDau")
	@Produces("application/json; charset=utf-8")
	public String findSoSanPhamDangDau(@FormParam("maloaisp") long maloaisp) {
		dto.SanphamDTO sanphamdao = new dto.SanphamDTO();
		int x = sanphamdao.findSoSanPhamDangDau(maloaisp);
		return String.valueOf(x);
	}

	@POST
	@Path("/findSanPhamDangDauTheoLoai")
	@Produces("application/json; charset=utf-8")
	public List<model.Sanpham> findSanPhamDangDauTheoLoai(
			@FormParam("size") int size, @FormParam("page") int page,
			@FormParam("maloaisp") long maloaisp) {
		List<model.Sanpham> pojodssp = new ArrayList<model.Sanpham>();
		dto.SanphamDTO sanphamdao = new dto.SanphamDTO();
		List<domain.Sanpham> daodssp = sanphamdao.findSanPhamDangDauTheoLoai(size,
				page, maloaisp);

		for (domain.Sanpham daosp : daodssp) {
			model.Sanpham pojosp = new Sanpham(daosp.getMasp(),
					daosp.getTensp(), daosp.getTinhtrangsp()
							.getTentinhtrangsp(), daosp.getSoluong(),
					daosp.getXuatxu(), daosp.getThuonghieu(), daosp.getLoaisp()
							.getTenloaisp(), daosp.getNguoidang(),
					daosp.getGiakhoidiem(), daosp.getGiahientai(),
					daosp.getGiamuangay(), daosp.getNguoidat(),
					daosp.getBuocgia(), daosp.getThoigianbatdau().getTime(),
					daosp.getThoigianketthuc().getTime(),
					daosp.getThongtinlienhe(), daosp.getHinhthucthanhtoan()
							.getTenhttt(), daosp.getHinhanh(), daosp.getMota(),
					daosp.getTinhtrangdaugia(), daosp.getGhichu());
			pojodssp.add(pojosp);
		}
		return pojodssp;
	}

	@POST
	@Path("/findSanPhamDangDauTop")
	@Produces("application/json; charset=utf-8")
	public List<model.Sanpham> findSanPhamDangDauTop(@FormParam("top") int top) {
		List<model.Sanpham> pojodssp = new ArrayList<model.Sanpham>();
		dto.SanphamDTO sanphamdao = new dto.SanphamDTO();
		List<domain.Sanpham> daodssp = sanphamdao.findSanPhamDangDauAll();
		Collections.sort(daodssp, new SanPhamComparator());
		int i = 1;

		for (domain.Sanpham daosp : daodssp) {
			model.Sanpham pojosp = new model.Sanpham(daosp.getMasp(),
					daosp.getTensp(), daosp.getTinhtrangsp()
							.getTentinhtrangsp(), daosp.getSoluong(),
					daosp.getXuatxu(), daosp.getThuonghieu(), daosp.getLoaisp()
							.getTenloaisp(), daosp.getNguoidang(),
					daosp.getGiakhoidiem(), daosp.getGiahientai(),
					daosp.getGiamuangay(), daosp.getNguoidat(),
					daosp.getBuocgia(), daosp.getThoigianbatdau().getTime(),
					daosp.getThoigianketthuc().getTime(),
					daosp.getThongtinlienhe(), daosp.getHinhthucthanhtoan()
							.getTenhttt(), daosp.getHinhanh(), daosp.getMota(),
					daosp.getTinhtrangdaugia(), daosp.getGhichu());
			pojodssp.add(pojosp);
			i++;
			if (i > top) {
				break;
			}

		}
		return pojodssp;
	}

	@POST
	@Path("/findSanPhamTheoGiaLoc")
	@Produces("application/json; charset=utf-8")
	public List<model.Sanpham> findSanPhamTheoGiaLoc(
			@FormParam("loaisp") int loaisp, @FormParam("sort") int sort,@FormParam("size") int size, @FormParam("page") int page) {
		List<model.Sanpham> pojodssp = new ArrayList<model.Sanpham>();
		dto.SanphamDTO sanphamdao = new dto.SanphamDTO();
		List<domain.Sanpham> daodssp = null;
		if (loaisp == -1) {
			// san pham dang dau
			daodssp = sanphamdao.findSanPhamDangDau(size,page);
		} else if (loaisp == 1) {
			// san pham da dau
			daodssp = sanphamdao.findSanPhamDaDau(size,page);
		} else {
			// san pham sap dau
			daodssp = sanphamdao.findSanPhamSapDau(size,page);
		}

		if (sort == 1) {
			// sap xep tang dan
			Collections.sort(daodssp, new SanphamComparatorPriceUp());

		} else if (sort == -1){
			// sap xep giam dan
			Collections.sort(daodssp, new SanphamComparatorPriceDown());
		} else{
			// sap xep theo thoi gian
			Collections.sort(daodssp, new SanphamComparatorNew());
		}
		for (domain.Sanpham daosp : daodssp) {
			model.Sanpham pojosp = new model.Sanpham(daosp.getMasp(),
					daosp.getTensp(), daosp.getTinhtrangsp()
							.getTentinhtrangsp(), daosp.getSoluong(),
					daosp.getXuatxu(), daosp.getThuonghieu(), daosp.getLoaisp()
							.getTenloaisp(), daosp.getNguoidang(),
					daosp.getGiakhoidiem(), daosp.getGiahientai(),
					daosp.getGiamuangay(), daosp.getNguoidat(),
					daosp.getBuocgia(), daosp.getThoigianbatdau().getTime(),
					daosp.getThoigianketthuc().getTime(),
					daosp.getThongtinlienhe(), daosp.getHinhthucthanhtoan()
							.getTenhttt(), daosp.getHinhanh(), daosp.getMota(),
					daosp.getTinhtrangdaugia(), daosp.getGhichu());
			pojodssp.add(pojosp);

		}
	
		return pojodssp;
	}

	@POST
	@Path("/findSoSanPhamSapDau")
	@Produces("application/json; charset=utf-8")
	public String findSoSanPhamSapDau(@FormParam("maloaisp") long maloaisp) {
		dto.SanphamDTO sanphamdao = new dto.SanphamDTO();
		int x = sanphamdao.findSoSanPhamSapDau(maloaisp);
		return String.valueOf(x);
	}

	@POST
	@Path("/findSanPhamSapDauTheoLoai")
	@Produces("application/json; charset=utf-8")
	public List<model.Sanpham> findSanPhamSapDauTheoLoai(
			@FormParam("size") int size, @FormParam("page") int page,
			@FormParam("maloaisp") long maloaisp) {
		List<model.Sanpham> pojodssp = new ArrayList<model.Sanpham>();
		dto.SanphamDTO sanphamdao = new dto.SanphamDTO();
		List<domain.Sanpham> daodssp = sanphamdao.findSanPhamSapDauTheoLoai(size,
				page, maloaisp);
		for (domain.Sanpham daosp : daodssp) {
			model.Sanpham pojosp = new Sanpham(daosp.getMasp(),
					daosp.getTensp(), daosp.getTinhtrangsp()
							.getTentinhtrangsp(), daosp.getSoluong(),
					daosp.getXuatxu(), daosp.getThuonghieu(), daosp.getLoaisp()
							.getTenloaisp(), daosp.getNguoidang(),
					daosp.getGiakhoidiem(), daosp.getGiahientai(),
					daosp.getGiamuangay(), daosp.getNguoidat(),
					daosp.getBuocgia(), daosp.getThoigianbatdau().getTime(),
					daosp.getThoigianketthuc().getTime(),
					daosp.getThongtinlienhe(), daosp.getHinhthucthanhtoan()
							.getTenhttt(), daosp.getHinhanh(), daosp.getMota(),
					daosp.getTinhtrangdaugia(), daosp.getGhichu());
			pojodssp.add(pojosp);
		}
		return pojodssp;
	}

	@POST
	@Path("/findSoSanPhamDaDau")
	@Produces("application/json; charset=utf-8")
	public String findSoSanPhamDaDau(@FormParam("maloaisp") long maloaisp) {
		dto.SanphamDTO sanphamdao = new dto.SanphamDTO();
		int x = sanphamdao.findSoSanPhamDaDau(maloaisp);
		return String.valueOf(x);
	}

	@POST
	@Path("/findSanPhamDaDauTheoLoai")
	@Produces("application/json; charset=utf-8")
	public List<model.Sanpham> findSanPhamDaDauTheoLoai(
			@FormParam("size") int size, @FormParam("page") int page,
			@FormParam("maloaisp") long maloaisp) {
		List<model.Sanpham> pojodssp = new ArrayList<model.Sanpham>();
		dto.SanphamDTO sanphamdao = new dto.SanphamDTO();
		List<domain.Sanpham> daodssp = sanphamdao.findSanPhamDaDauTheoLoai(size,
				page, maloaisp);
		for (domain.Sanpham daosp : daodssp) {
			model.Sanpham pojosp = new Sanpham(daosp.getMasp(),
					daosp.getTensp(), daosp.getTinhtrangsp()
							.getTentinhtrangsp(), daosp.getSoluong(),
					daosp.getXuatxu(), daosp.getThuonghieu(), daosp.getLoaisp()
							.getTenloaisp(), daosp.getNguoidang(),
					daosp.getGiakhoidiem(), daosp.getGiahientai(),
					daosp.getGiamuangay(), daosp.getNguoidat(),
					daosp.getBuocgia(), daosp.getThoigianbatdau().getTime(),
					daosp.getThoigianketthuc().getTime(),
					daosp.getThongtinlienhe(), daosp.getHinhthucthanhtoan()
							.getTenhttt(), daosp.getHinhanh(), daosp.getMota(),
					daosp.getTinhtrangdaugia(), daosp.getGhichu());
			pojodssp.add(pojosp);
		}
		return pojodssp;
	}

	// findSoSPByTenSP
	@POST
	@Path("/findSoSPByTenSP")
	@Produces("application/json; charset=utf-8")
	public String findSoSPByTenSP(@FormParam("tensp") String tensp,
			@FormParam("loaiphien") int loaiphien) {
		dto.SanphamDTO sanphamdao = new dto.SanphamDTO();
		int x = sanphamdao.findSoSPByTenSP(tensp, loaiphien);
		return String.valueOf(x);
	}

	@POST
	@Path("/findByTenSP")
	@Produces("application/json; charset=utf-8")
	public List<model.Sanpham> findByTenSP(@FormParam("tensp") String tensp,
			@FormParam("loaiphien") int loaiphien, @FormParam("size") int size,
			@FormParam("page") int page) {
		List<model.Sanpham> pojodssp = new ArrayList<model.Sanpham>();
		dto.SanphamDTO sanphamdao = new dto.SanphamDTO();
		List<domain.Sanpham> daodssp = sanphamdao.findByTenSP(tensp, loaiphien,
				size, page);
		for (domain.Sanpham daosp : daodssp) {
			model.Sanpham pojosp = new Sanpham(daosp.getMasp(),
					daosp.getTensp(), daosp.getTinhtrangsp()
							.getTentinhtrangsp(), daosp.getSoluong(),
					daosp.getXuatxu(), daosp.getThuonghieu(), daosp.getLoaisp()
							.getTenloaisp(), daosp.getNguoidang(),
					daosp.getGiakhoidiem(), daosp.getGiahientai(),
					daosp.getGiamuangay(), daosp.getNguoidat(),
					daosp.getBuocgia(), daosp.getThoigianbatdau().getTime(),
					daosp.getThoigianketthuc().getTime(),
					daosp.getThongtinlienhe(), daosp.getHinhthucthanhtoan()
							.getTenhttt(), daosp.getHinhanh(), daosp.getMota(),
					daosp.getTinhtrangdaugia(), daosp.getGhichu());
			pojodssp.add(pojosp);
		}
		return pojodssp;
	}

	@POST
	@Path("/findByThuongHieu")
	@Produces("application/json; charset=utf-8")
	public List<model.Sanpham> findByThuongHieu(
			@FormParam("thuonghieu") String thuonghieu,
			@FormParam("loaiphien") int loaiphien, @FormParam("size") int size,
			@FormParam("page") int page) {
		List<model.Sanpham> pojodssp = new ArrayList<model.Sanpham>();
		dto.SanphamDTO sanphamdao = new dto.SanphamDTO();
		List<domain.Sanpham> daodssp = sanphamdao.findByThuonghieu(size, page,
				thuonghieu);
		for (domain.Sanpham daosp : daodssp) {
			model.Sanpham pojosp = new Sanpham(daosp.getMasp(),
					daosp.getTensp(), daosp.getTinhtrangsp()
							.getTentinhtrangsp(), daosp.getSoluong(),
					daosp.getXuatxu(), daosp.getThuonghieu(), daosp.getLoaisp()
							.getTenloaisp(), daosp.getNguoidang(),
					daosp.getGiakhoidiem(), daosp.getGiahientai(),
					daosp.getGiamuangay(), daosp.getNguoidat(),
					daosp.getBuocgia(), daosp.getThoigianbatdau().getTime(),
					daosp.getThoigianketthuc().getTime(),
					daosp.getThongtinlienhe(), daosp.getHinhthucthanhtoan()
							.getTenhttt(), daosp.getHinhanh(), daosp.getMota(),
					daosp.getTinhtrangdaugia(), daosp.getGhichu());
			pojodssp.add(pojosp);
		}
		return pojodssp;
	}

	@POST
	@Path("/findById")
	@Produces("application/json; charset=utf-8")
	// @ResourceFilters({ FilterUser.class })
	public model.Sanpham findById(@FormParam("masp") long masp) {
		dto.SanphamDTO sanphamdao = new dto.SanphamDTO();
		domain.Sanpham daosp = sanphamdao.findById(masp);
		model.Sanpham pojosp = new Sanpham(daosp.getMasp(), daosp.getTensp(),
				daosp.getTinhtrangsp().getTentinhtrangsp(), daosp.getSoluong(),
				daosp.getXuatxu(), daosp.getThuonghieu(), daosp.getLoaisp()
						.getTenloaisp(), daosp.getNguoidang(),
				daosp.getGiakhoidiem(), daosp.getGiahientai(),
				daosp.getGiamuangay(), daosp.getNguoidat(), daosp.getBuocgia(),
				daosp.getThoigianbatdau().getTime(), daosp.getThoigianketthuc()
						.getTime(), daosp.getThongtinlienhe(), daosp
						.getHinhthucthanhtoan().getTenhttt(),
				daosp.getHinhanh(), daosp.getMota(),
				daosp.getTinhtrangdaugia(), daosp.getGhichu());
		return pojosp;
	}

	private Logger log = LoggerFactory.getLogger(SanPhamServices.class);

	@POST
	@Path("/save")
	@Produces("application/json; charset=utf-8")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	@ResourceFilters({ FilterUser.class })
	public String save(@FormParam("tensp") String tensp,
			@FormParam("matinhtrangsp") Long matinhtrangsp,
			@FormParam("maloaisp") Long maloaisp,
			@FormParam("mahttt") Long mahttt,
			@FormParam("soluong") Integer soluong,
			@FormParam("xuatxu") String xuatxu,
			@FormParam("thuonghieu") String thuonghieu,
			@FormParam("nguoidang") String nguoidang,
			@FormParam("giakhoidiem") Double giakhoidiem,
			@FormParam("giahientai") Double giahientai,
			@FormParam("giamuangay") Double giamuangay,
			@FormParam("buocgia") Double buocgia,
			@FormParam("thoigianbatdau") Timestamp thoigianbatdau,
			@FormParam("thoigianketthuc") Timestamp thoigianketthuc,
			@FormParam("thongtinlienhe") String thongtinlienhe,
			@FormParam("hinhanh") String hinhanh, @FormParam("mota") String mota) {
		SanphamDTO spdao = new SanphamDTO();
		LoaispDTO loaispdao = new LoaispDTO();
		TinhtrangspDTO ttspdao = new TinhtrangspDTO();
		HinhthucthanhtoanDTO htttdao = new HinhthucthanhtoanDTO();
		EntityManagerHelper.beginTransaction();
		Tinhtrangsp ttsp = ttspdao.findById(matinhtrangsp);
		Loaisp loaisp = loaispdao.findById(maloaisp);
		Hinhthucthanhtoan httt = htttdao.findById(mahttt);
		EntityManagerHelper.commit();
		domain.Sanpham sp = new domain.Sanpham(loaisp, ttsp, httt, tensp, soluong,
				xuatxu, thuonghieu, nguoidang, giakhoidiem, giakhoidiem, "",
				buocgia, giamuangay, thoigianbatdau, thoigianketthuc,
				thongtinlienhe, hinhanh, mota, 0, "");
		EntityManagerHelper.beginTransaction();
		spdao.save(sp);
		List<domain.Sanpham> sps = spdao.findAll();
		EntityManagerHelper.commit();

		String result = "Thêm thành công," + sps.get(sps.size() - 1).getMasp();
		log.info(result);
		return result;
	}

	@POST
	@Path("/update")
	@Produces("application/json; charset=utf-8")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	@ResourceFilters({ FilterUser.class })
	public String update(@FormParam("masp") Long masp,
			@FormParam("tensp") String tensp,
			@FormParam("matinhtrangsp") Long matinhtrangsp,
			@FormParam("maloaisp") Long maloaisp,
			@FormParam("mahttt") Long mahttt,
			@FormParam("soluong") Integer soluong,
			@FormParam("xuatxu") String xuatxu,
			@FormParam("thuonghieu") String thuonghieu,
			@FormParam("nguoidang") String nguoidang,
			@FormParam("giakhoidiem") Double giakhoidiem,
			@FormParam("buocgia") Double buocgia,
			@FormParam("thoigianbatdau") Timestamp thoigianbatdau,
			@FormParam("thoigianketthuc") Timestamp thoigianketthuc,
			@FormParam("thongtinlienhe") String thongtinlienhe,
			@FormParam("hinhanh") String hinhanh, @FormParam("mota") String mota) {
		SanphamDTO spdao = new SanphamDTO();
		LoaispDTO loaispdao = new LoaispDTO();
		TinhtrangspDTO ttspdao = new TinhtrangspDTO();
		HinhthucthanhtoanDTO htttdao = new HinhthucthanhtoanDTO();
		EntityManagerHelper.beginTransaction();
		Tinhtrangsp ttsp = ttspdao.findById(matinhtrangsp);
		Loaisp loaisp = loaispdao.findById(maloaisp);
		Hinhthucthanhtoan httt = htttdao.findById(mahttt);
		EntityManagerHelper.commit();
		domain.Sanpham sp = spdao.findById(masp);
		sp.setLoaisp(loaisp);
		sp.setTinhtrangsp(ttsp);
		sp.setHinhthucthanhtoan(httt);
		sp.setTensp(tensp);
		sp.setSoluong(soluong);
		sp.setXuatxu(xuatxu);
		sp.setThuonghieu(thuonghieu);
		sp.setGiakhoidiem(giakhoidiem);
		sp.setGiahientai(0.0);
		sp.setBuocgia(buocgia);
		sp.setNguoidat("");
		sp.setThoigianbatdau(thoigianbatdau);
		sp.setThoigianketthuc(thoigianketthuc);
		sp.setThongtinlienhe(thongtinlienhe);
		if (!hinhanh.equals("null")) {
			sp.setHinhanh(hinhanh);
		}
		sp.setMota(mota);
		if (sp.getTinhtrangdaugia() == 2)
			sp.setTinhtrangdaugia(4);
		EntityManagerHelper.beginTransaction();
		spdao.update(sp);
		EntityManagerHelper.commit();
		return "Cập nhật thành công";
	}

	@POST
	@Path("/findBySanPhamThamGiaKetThuc")
	@Produces("application/json; charset=utf-8")
	@ResourceFilters({ FilterUser.class })
	public List<model.Sanpham> findBySanPhamThamGiaKetThuc() {
		HttpSession session = request.getSession(true);
		String username = session.getAttribute("username").toString();
		List<model.Sanpham> pojodssp = new ArrayList<model.Sanpham>();
		dto.SanphamDTO sanphamdao = new dto.SanphamDTO();
		List<domain.Sanpham> daodssp = sanphamdao
				.findBySanPhamThamGiaKetThuc(username);
		for (domain.Sanpham daosp : daodssp) {
			model.Sanpham pojosp = new Sanpham(daosp.getMasp(),
					daosp.getTensp(), daosp.getTinhtrangsp()
							.getTentinhtrangsp(), daosp.getSoluong(),
					daosp.getXuatxu(), daosp.getThuonghieu(), daosp.getLoaisp()
							.getTenloaisp(), daosp.getNguoidang(),
					daosp.getGiakhoidiem(), daosp.getGiahientai(),
					daosp.getGiamuangay(), daosp.getNguoidat(),
					daosp.getBuocgia(), daosp.getThoigianbatdau().getTime(),
					daosp.getThoigianketthuc().getTime(),
					daosp.getThongtinlienhe(), daosp.getHinhthucthanhtoan()
							.getTenhttt(), daosp.getHinhanh(), daosp.getMota(),
					daosp.getTinhtrangdaugia(), daosp.getGhichu());
			pojodssp.add(pojosp);
		}
		return pojodssp;
	}

	@POST
	@Path("/findBySanPhamThamGiaDangDau")
	@Produces("application/json; charset=utf-8")
	@ResourceFilters({ FilterUser.class })
	public List<model.Sanpham> findBySanPhamThamGiaDangDau() {
		HttpSession session = request.getSession(true);
		String username = session.getAttribute("username").toString();
		List<model.Sanpham> pojodssp = new ArrayList<model.Sanpham>();
		dto.SanphamDTO sanphamdao = new dto.SanphamDTO();
		List<domain.Sanpham> daodssp = sanphamdao
				.findBySanPhamThamGiaDangDau(username);
		for (domain.Sanpham daosp : daodssp) {
			model.Sanpham pojosp = new Sanpham(daosp.getMasp(),
					daosp.getTensp(), daosp.getTinhtrangsp()
							.getTentinhtrangsp(), daosp.getSoluong(),
					daosp.getXuatxu(), daosp.getThuonghieu(), daosp.getLoaisp()
							.getTenloaisp(), daosp.getNguoidang(),
					daosp.getGiakhoidiem(), daosp.getGiahientai(),
					daosp.getGiamuangay(), daosp.getNguoidat(),
					daosp.getBuocgia(), daosp.getThoigianbatdau().getTime(),
					daosp.getThoigianketthuc().getTime(),
					daosp.getThongtinlienhe(), daosp.getHinhthucthanhtoan()
							.getTenhttt(), daosp.getHinhanh(), daosp.getMota(),
					daosp.getTinhtrangdaugia(), daosp.getGhichu());
			pojodssp.add(pojosp);
		}
		return pojodssp;
	}

	@POST
	@Path("/findBySanPhamChienThangAll")
	@Produces("application/json; charset=utf-8")
	@ResourceFilters({ FilterUser.class })
	public List<model.Sanpham> findBySanPhamChienThangAll() {
		HttpSession session = request.getSession(true);
		String username = session.getAttribute("username").toString();
		List<model.Sanpham> pojodssp = new ArrayList<model.Sanpham>();
		dto.SanphamDTO sanphamdao = new dto.SanphamDTO();
		List<domain.Sanpham> daodssp = sanphamdao
				.findBySanPhamChienThangAll(username);
		for (domain.Sanpham daosp : daodssp) {
			model.Sanpham pojosp = new Sanpham(daosp.getMasp(),
					daosp.getTensp(), daosp.getTinhtrangsp()
							.getTentinhtrangsp(), daosp.getSoluong(),
					daosp.getXuatxu(), daosp.getThuonghieu(), daosp.getLoaisp()
							.getTenloaisp(), daosp.getNguoidang(),
					daosp.getGiakhoidiem(), daosp.getGiahientai(),
					daosp.getGiamuangay(), daosp.getNguoidat(),
					daosp.getBuocgia(), daosp.getThoigianbatdau().getTime(),
					daosp.getThoigianketthuc().getTime(),
					daosp.getThongtinlienhe(), daosp.getHinhthucthanhtoan()
							.getTenhttt(), daosp.getHinhanh(), daosp.getMota(),
					daosp.getTinhtrangdaugia(), daosp.getGhichu());
			pojodssp.add(pojosp);
		}
		return pojodssp;
	}

	@POST
	@Path("/findBySanPhamChienThangChuaThanhToan")
	@Produces("application/json; charset=utf-8")
	@ResourceFilters({ FilterUser.class })
	public List<model.Sanpham> findBySanPhamChienThangChuaThanhToan() {
		HttpSession session = request.getSession(true);
		String username = session.getAttribute("username").toString();
		List<model.Sanpham> pojodssp = new ArrayList<model.Sanpham>();
		dto.SanphamDTO sanphamdao = new dto.SanphamDTO();
		List<domain.Sanpham> daodssp = sanphamdao
				.findBySanPhamChienThangChuaThanhToan(username);
		for (domain.Sanpham daosp : daodssp) {
			model.Sanpham pojosp = new Sanpham(daosp.getMasp(),
					daosp.getTensp(), daosp.getTinhtrangsp()
							.getTentinhtrangsp(), daosp.getSoluong(),
					daosp.getXuatxu(), daosp.getThuonghieu(), daosp.getLoaisp()
							.getTenloaisp(), daosp.getNguoidang(),
					daosp.getGiakhoidiem(), daosp.getGiahientai(),
					daosp.getGiamuangay(), daosp.getNguoidat(),
					daosp.getBuocgia(), daosp.getThoigianbatdau().getTime(),
					daosp.getThoigianketthuc().getTime(),
					daosp.getThongtinlienhe(), daosp.getHinhthucthanhtoan()
							.getTenhttt(), daosp.getHinhanh(), daosp.getMota(),
					daosp.getTinhtrangdaugia(), daosp.getGhichu());
			pojodssp.add(pojosp);
		}
		return pojodssp;
	}

	@POST
	@Path("/findBySanPhamChienThangDaThanhToan")
	@Produces("application/json; charset=utf-8")
	@ResourceFilters({ FilterUser.class })
	public List<model.Sanpham> findBySanPhamChienThangDaThanhToan() {
		HttpSession session = request.getSession(true);
		String username = session.getAttribute("username").toString();
		List<model.Sanpham> pojodssp = new ArrayList<model.Sanpham>();
		dto.SanphamDTO sanphamdao = new dto.SanphamDTO();
		List<domain.Sanpham> daodssp = sanphamdao
				.findBySanPhamChienThangDaThanhToan(username);
		for (domain.Sanpham daosp : daodssp) {
			model.Sanpham pojosp = new Sanpham(daosp.getMasp(),
					daosp.getTensp(), daosp.getTinhtrangsp()
							.getTentinhtrangsp(), daosp.getSoluong(),
					daosp.getXuatxu(), daosp.getThuonghieu(), daosp.getLoaisp()
							.getTenloaisp(), daosp.getNguoidang(),
					daosp.getGiakhoidiem(), daosp.getGiahientai(),
					daosp.getGiamuangay(), daosp.getNguoidat(),
					daosp.getBuocgia(), daosp.getThoigianbatdau().getTime(),
					daosp.getThoigianketthuc().getTime(),
					daosp.getThongtinlienhe(), daosp.getHinhthucthanhtoan()
							.getTenhttt(), daosp.getHinhanh(), daosp.getMota(),
					daosp.getTinhtrangdaugia(), daosp.getGhichu());
			pojodssp.add(pojosp);
		}
		return pojodssp;
	}

	@POST
	@Path("/findBySanPhamCuaToiDangDau")
	@Produces("application/json; charset=utf-8")
	@ResourceFilters({ FilterUser.class })
	public List<model.Sanpham> findBySanPhamCuaToiDangDau() {
		HttpSession session = request.getSession(true);
		String username = session.getAttribute("username").toString();
		List<model.Sanpham> pojodssp = new ArrayList<model.Sanpham>();
		dto.SanphamDTO sanphamdao = new dto.SanphamDTO();
		List<domain.Sanpham> daodssp = sanphamdao
				.findBySanPhamCuaToiDangDau(username);
		for (domain.Sanpham daosp : daodssp) {
			model.Sanpham pojosp = new Sanpham(daosp.getMasp(),
					daosp.getTensp(), daosp.getTinhtrangsp()
							.getTentinhtrangsp(), daosp.getSoluong(),
					daosp.getXuatxu(), daosp.getThuonghieu(), daosp.getLoaisp()
							.getTenloaisp(), daosp.getNguoidang(),
					daosp.getGiakhoidiem(), daosp.getGiahientai(),
					daosp.getGiamuangay(), daosp.getNguoidat(),
					daosp.getBuocgia(), daosp.getThoigianbatdau().getTime(),
					daosp.getThoigianketthuc().getTime(),
					daosp.getThongtinlienhe(), daosp.getHinhthucthanhtoan()
							.getTenhttt(), daosp.getHinhanh(), daosp.getMota(),
					daosp.getTinhtrangdaugia(), daosp.getGhichu());
			pojodssp.add(pojosp);
		}
		return pojodssp;
	}

	@POST
	@Path("/findBySanPhamCuaToiBiHuy")
	@Produces("application/json; charset=utf-8")
	@ResourceFilters({ FilterUser.class })
	public List<model.Sanpham> findBySanPhamCuaToiBiHuy() {
		HttpSession session = request.getSession(true);
		String username = session.getAttribute("username").toString();
		List<model.Sanpham> pojodssp = new ArrayList<model.Sanpham>();
		dto.SanphamDTO sanphamdao = new dto.SanphamDTO();
		List<domain.Sanpham> daodssp = sanphamdao
				.findBySanPhamCuaToiBiHuy(username);
		for (domain.Sanpham daosp : daodssp) {
			model.Sanpham pojosp = new Sanpham(daosp.getMasp(),
					daosp.getTensp(), daosp.getTinhtrangsp()
							.getTentinhtrangsp(), daosp.getSoluong(),
					daosp.getXuatxu(), daosp.getThuonghieu(), daosp.getLoaisp()
							.getTenloaisp(), daosp.getNguoidang(),
					daosp.getGiakhoidiem(), daosp.getGiahientai(),
					daosp.getGiamuangay(), daosp.getNguoidat(),
					daosp.getBuocgia(), daosp.getThoigianbatdau().getTime(),
					daosp.getThoigianketthuc().getTime(),
					daosp.getThongtinlienhe(), daosp.getHinhthucthanhtoan()
							.getTenhttt(), daosp.getHinhanh(), daosp.getMota(),
					daosp.getTinhtrangdaugia(), daosp.getGhichu());
			pojodssp.add(pojosp);
		}
		return pojodssp;
	}

	@POST
	@Path("/findBySanPhamCuaToiSapDau")
	@Produces("application/json; charset=utf-8")
	@ResourceFilters({ FilterUser.class })
	public List<model.Sanpham> findBySanPhamCuaToiSapDau() {
		HttpSession session = request.getSession(true);
		String username = session.getAttribute("username").toString();
		List<model.Sanpham> pojodssp = new ArrayList<model.Sanpham>();
		dto.SanphamDTO sanphamdao = new dto.SanphamDTO();
		List<domain.Sanpham> daodssp = sanphamdao
				.findBySanPhamCuaToiSapDau(username);
		for (domain.Sanpham daosp : daodssp) {
			model.Sanpham pojosp = new Sanpham(daosp.getMasp(),
					daosp.getTensp(), daosp.getTinhtrangsp()
							.getTentinhtrangsp(), daosp.getSoluong(),
					daosp.getXuatxu(), daosp.getThuonghieu(), daosp.getLoaisp()
							.getTenloaisp(), daosp.getNguoidang(),
					daosp.getGiakhoidiem(), daosp.getGiahientai(),
					daosp.getGiamuangay(), daosp.getNguoidat(),
					daosp.getBuocgia(), daosp.getThoigianbatdau().getTime(),
					daosp.getThoigianketthuc().getTime(),
					daosp.getThongtinlienhe(), daosp.getHinhthucthanhtoan()
							.getTenhttt(), daosp.getHinhanh(), daosp.getMota(),
					daosp.getTinhtrangdaugia(), daosp.getGhichu());
			pojodssp.add(pojosp);
		}
		return pojodssp;
	}

	@POST
	@Path("/findBySanPhamCuaToiDaDauXong")
	@Produces("application/json; charset=utf-8")
	@ResourceFilters({ FilterUser.class })
	public List<model.Sanpham> findBySanPhamCuaToiDaDauXong() {
		HttpSession session = request.getSession(true);
		String username = session.getAttribute("username").toString();
		List<model.Sanpham> pojodssp = new ArrayList<model.Sanpham>();
		dto.SanphamDTO sanphamdao = new dto.SanphamDTO();
		List<domain.Sanpham> daodssp = sanphamdao
				.findBySanPhamCuaToiDaDauXong(username);
		for (domain.Sanpham daosp : daodssp) {
			model.Sanpham pojosp = new Sanpham(daosp.getMasp(),
					daosp.getTensp(), daosp.getTinhtrangsp()
							.getTentinhtrangsp(), daosp.getSoluong(),
					daosp.getXuatxu(), daosp.getThuonghieu(), daosp.getLoaisp()
							.getTenloaisp(), daosp.getNguoidang(),
					daosp.getGiakhoidiem(), daosp.getGiahientai(),
					daosp.getGiamuangay(), daosp.getNguoidat(),
					daosp.getBuocgia(), daosp.getThoigianbatdau().getTime(),
					daosp.getThoigianketthuc().getTime(),
					daosp.getThongtinlienhe(), daosp.getHinhthucthanhtoan()
							.getTenhttt(), daosp.getHinhanh(), daosp.getMota(),
					daosp.getTinhtrangdaugia(), daosp.getGhichu());
			pojodssp.add(pojosp);
		}
		return pojodssp;
	}

	@POST
	@Path("/xoaSanPham")
	@Produces("application/json; charset=utf-8")
	@ResourceFilters({ FilterUser.class })
	public String xoaSanPham(@FormParam("masp") Long masp) {
		SanphamDTO spdao = new SanphamDTO();
		domain.Sanpham daosp = spdao.findById(masp);
		if (daosp.getThoigianbatdau().getTime() < (new Date()).getTime()
				|| daosp.getTinhtrangdaugia() != 0) {
			return "Sản phẩm này không thể xóa";
		}
		EntityManagerHelper.beginTransaction();
		spdao.delete(daosp);
		EntityManagerHelper.commit();
		return "ok";
	}

	@POST
	@Path("/huyDauGia")
	@Produces("application/json; charset=utf-8")
	@ResourceFilters({ FilterAdmin.class })
	public String huyDauGia(@FormParam("masp") Long masp,
			@FormParam("ghichu") String ghichu) {
		SanphamDTO spdao = new SanphamDTO();
		domain.Sanpham daosp = spdao.findById(masp);
		if (daosp.getTinhtrangdaugia() != 0)
			return "Không thể hủy đấu giá sản phẩm này";// dieu kien
		daosp.setTinhtrangdaugia(2);
		daosp.setGhichu(ghichu);
		EntityManagerHelper.beginTransaction();
		spdao.update(daosp);
		EntityManagerHelper.commit();
		return "ok";
	}

	@POST
	@Path("/choPhepDauGia")
	@Produces("application/json; charset=utf-8")
	@ResourceFilters({ FilterAdmin.class })
	public String choPhepDauGia(@FormParam("masp") Long masp) {
		SanphamDTO spdao = new SanphamDTO();
		domain.Sanpham daosp = spdao.findById(masp);
		if (daosp.getTinhtrangdaugia() != 4)
			return "Sản phẩm không đúng";
		daosp.setTinhtrangdaugia(0);
		daosp.setGhichu("");
		EntityManagerHelper.beginTransaction();
		spdao.update(daosp);
		EntityManagerHelper.commit();
		return "ok";
	}

	@POST
	@Path("/findBySanPhamHuyAdmin")
	@Produces("application/json; charset=utf-8")
	@ResourceFilters({ FilterAdmin.class })
	public List<model.Sanpham> findBySanPhamHuyAdmin(
			@FormParam("tinhtrang") int tinhtrang) {
		List<model.Sanpham> pojodssp = new ArrayList<model.Sanpham>();
		dto.SanphamDTO sanphamdao = new dto.SanphamDTO();
		List<domain.Sanpham> daodssp = sanphamdao.findBySanPhamHuyAdmin(tinhtrang);
		for (domain.Sanpham daosp : daodssp) {
			model.Sanpham pojosp = new Sanpham(daosp.getMasp(),
					daosp.getTensp(), daosp.getTinhtrangsp()
							.getTentinhtrangsp(), daosp.getSoluong(),
					daosp.getXuatxu(), daosp.getThuonghieu(), daosp.getLoaisp()
							.getTenloaisp(), daosp.getNguoidang(),
					daosp.getGiakhoidiem(), daosp.getGiahientai(),
					daosp.getGiamuangay(), daosp.getNguoidat(),
					daosp.getBuocgia(), daosp.getThoigianbatdau().getTime(),
					daosp.getThoigianketthuc().getTime(),
					daosp.getThongtinlienhe(), daosp.getHinhthucthanhtoan()
							.getTenhttt(), daosp.getHinhanh(), daosp.getMota(),
					daosp.getTinhtrangdaugia(), daosp.getGhichu());
			pojodssp.add(pojosp);
		}
		return pojodssp;
	}

	@POST
	@Path("/findBySanPhamChoPhepDauAdmin")
	@Produces("application/json; charset=utf-8")
	@ResourceFilters({ FilterAdmin.class })
	public List<model.Sanpham> findBySanPhamChoPhepDauAdmin() {
		List<model.Sanpham> pojodssp = new ArrayList<model.Sanpham>();
		dto.SanphamDTO sanphamdao = new dto.SanphamDTO();
		List<domain.Sanpham> daodssp = sanphamdao.findBySanPhamChoPhepDauAdmin();
		for (domain.Sanpham daosp : daodssp) {
			model.Sanpham pojosp = new Sanpham(daosp.getMasp(),
					daosp.getTensp(), daosp.getTinhtrangsp()
							.getTentinhtrangsp(), daosp.getSoluong(),
					daosp.getXuatxu(), daosp.getThuonghieu(), daosp.getLoaisp()
							.getTenloaisp(), daosp.getNguoidang(),
					daosp.getGiakhoidiem(), daosp.getGiahientai(),
					daosp.getGiamuangay(), daosp.getNguoidat(),
					daosp.getBuocgia(), daosp.getThoigianbatdau().getTime(),
					daosp.getThoigianketthuc().getTime(),
					daosp.getThongtinlienhe(), daosp.getHinhthucthanhtoan()
							.getTenhttt(), daosp.getHinhanh(), daosp.getMota(),
					daosp.getTinhtrangdaugia(), daosp.getGhichu());
			pojodssp.add(pojosp);
		}
		return pojodssp;
	}

}