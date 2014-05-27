package service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.GenericEntity;

import util.SanPhamComparator;
import model.Notice;
import model.Sanpham;

import com.sun.jersey.api.json.JSONWithPadding;
import com.sun.jersey.spi.container.ResourceFilters;

import dao.EntityManagerHelper;
import dto.LichsudaugiaDTO;
import dto.SanphamDTO;
import filter.FilterUser;

@Path("sencha")
public class MobileService {

	@Context
	HttpServletRequest request;
	
	@GET
	@Path("dangdau")
	@Produces({"application/javascript"})
	public JSONWithPadding getSanPhamDangDau(@QueryParam("callback") String callback){
		List<model.Sanpham> pojodssp = new ArrayList<model.Sanpham>();
		dto.SanphamDTO sanphamdao = new dto.SanphamDTO();
		List<domain.Sanpham> daodssp = sanphamdao.findSanPhamDangDauTheoLoai(sanphamdao.findSoSanPhamDangDau(-1), 1, -1);
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
		return new JSONWithPadding(new GenericEntity<List<model.Sanpham>>(pojodssp){ },callback);
	}
	
	@GET
	@Path("top")
	@Produces({"application/javascript"})
	public JSONWithPadding findSanPhamDangDauTop(@QueryParam("callback") String callback) {
		List<model.Sanpham> pojodssp = new ArrayList<model.Sanpham>();
		dto.SanphamDTO sanphamdao = new dto.SanphamDTO();
		int soluong  = sanphamdao.findSoSanPhamDangDau(-1);
		List<domain.Sanpham> daodssp = sanphamdao.findSanPhamDangDauAll().subList(0, soluong > 10 ? 10 : soluong);
		Collections.sort(daodssp, new SanPhamComparator());

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
		return new JSONWithPadding(new GenericEntity<List<model.Sanpham>>(pojodssp){ },callback);
	}
	
	@GET
	@Path("sapdau")
	@Produces({"application/javascript"})
	public JSONWithPadding getSanPhamSapDau(@QueryParam("callback") String callback) {
		List<model.Sanpham> pojodssp = new ArrayList<model.Sanpham>();
		dto.SanphamDTO sanphamdao = new dto.SanphamDTO();
		List<domain.Sanpham> daodssp = sanphamdao.findSanPhamSapDauTheoLoai(sanphamdao.findSoSanPhamSapDau(-1),
				1, -1);
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
		return new JSONWithPadding(new GenericEntity<List<model.Sanpham>>(pojodssp){ },callback);
	}
	
	@GET
	@Path("dadau")
	@Produces({"application/javascript"})
	public JSONWithPadding getSanPhamDaDau(@QueryParam("callback") String callback) {
		List<model.Sanpham> pojodssp = new ArrayList<model.Sanpham>();
		dto.SanphamDTO sanphamdao = new dto.SanphamDTO();
		List<domain.Sanpham> daodssp = sanphamdao.findSanPhamDaDauTheoLoai(sanphamdao.findSoSanPhamDaDau(-1),
				1, -1);
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
		return new JSONWithPadding(new GenericEntity<List<model.Sanpham>>(pojodssp){ },callback);
	}
	
	@GET
	@Path("/thuonghieu")
	@Produces({"application/javascript"})
	public JSONWithPadding findByThuongHieu(@QueryParam("callback") String callback,
			@QueryParam("thuonghieu") String thuonghieu) {
		List<model.Sanpham> pojodssp = new ArrayList<model.Sanpham>();
		dto.SanphamDTO sanphamdao = new dto.SanphamDTO();
		List<domain.Sanpham> daodssp = sanphamdao.findByThuonghieu(thuonghieu);
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
		return new JSONWithPadding(new GenericEntity<List<model.Sanpham>>(pojodssp){ },callback);
	}
	
	@GET
	@Path("/lichsudaugia")
	@Produces({"application/javascript"})
	public JSONWithPadding findLichsudaugia(@QueryParam("callback") String callback, @QueryParam("masp") String masp) {
		System.out.println(masp);
		LichsudaugiaDTO lsdgdao=new LichsudaugiaDTO();
		SanphamDTO spdao = new SanphamDTO();
		domain.Sanpham daosp=spdao.findById(Long.parseLong(masp));
		
		List<model.Lichsudaugia> modeldslsdg = new ArrayList<model.Lichsudaugia>();
		
		List<domain.Lichsudaugia> daodslsdg = lsdgdao.findByProperty("sanpham", daosp);
		for (domain.Lichsudaugia daolsdg : daodslsdg) {
			model.Lichsudaugia modelsp = new model.Lichsudaugia(daolsdg.getId(),daolsdg.getSanpham().getMasp(),daolsdg.getSanpham().getTensp(),daolsdg.getNguoidat(),daolsdg.getThoigian().getTime(),daolsdg.getGiadat());
			modeldslsdg.add(modelsp);
		}
		return new JSONWithPadding(new GenericEntity<List<model.Lichsudaugia>>(modeldslsdg){ },callback);
	}
	
	@GET
	@Path("/datGia")
	@Produces({"application/javascript"})
	public JSONWithPadding datgia(
			@QueryParam("callback") String callback,
			@QueryParam("masp") Long masp,
			@QueryParam("nguoidat") String nguoidat,
			@QueryParam("buocgia") int buocgia) {
		SanphamDTO spdao = new SanphamDTO();
		LichsudaugiaDTO lsdgdao=new LichsudaugiaDTO();
		domain.Sanpham daosp=spdao.findById(masp);

		if(daosp.getTinhtrangdaugia()!=0){
			return null;
		}
		double giadat = daosp.getGiahientai() + daosp.getBuocgia() * buocgia;
		Timestamp tg=new Timestamp(new Date().getTime());
		domain.Lichsudaugia daolsdgnew=new domain.Lichsudaugia(daosp,nguoidat,tg,giadat);
		EntityManagerHelper.beginTransaction();
		lsdgdao.save(daolsdgnew);
		EntityManagerHelper.commit();
		//luu san pham
		daosp.setNguoidat(nguoidat);
		daosp.setGiahientai(giadat);
		EntityManagerHelper.beginTransaction();
		spdao.update(daosp);
		EntityManagerHelper.commit();
		
		//bid success
		Notice notice = new Notice();
		notice.setNotice("success");
		List<Notice> notices = new ArrayList<Notice>();
		notices.add(notice);
		return new JSONWithPadding(new GenericEntity<List<Notice>>(notices){ },callback);
		
	}
}
