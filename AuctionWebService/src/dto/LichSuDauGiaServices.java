package dto;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;

import javax.ws.rs.FormParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

import com.sun.jersey.spi.container.ResourceFilters;

import dao.EntityManagerHelper;
import dao.LichsudaugiaDAO;
import dao.SanphamDAO;
import filter.FilterUser;




@Path("lichsudaugia")
public class LichSuDauGiaServices {
	@POST
	@Path("/datGia")
	@Produces("application/json; charset=utf-8")
	@ResourceFilters({ FilterUser.class })
	public List<model.Lichsudaugia> datgia(
			@FormParam("masp") Long masp,
			@FormParam("nguoidat") String nguoidat,
			@FormParam("thoigian") Long thoigian,
			@FormParam("giadat") Double giadat) {
		SanphamDAO spdao = new SanphamDAO();
		LichsudaugiaDAO lsdgdao=new LichsudaugiaDAO();
		dao.Sanpham daosp=spdao.findById(masp);
		// kiem tra san pham co phai dag dau
		//		if(daosp.getThoigianketthuc().before(dtnow)){
		//			return null;
		//		}
		if(daosp.getTinhtrangdaugia()!=0){
			return null;
		}
		// luu dat gia
		Timestamp tg=new Timestamp(thoigian);
		dao.Lichsudaugia daolsdgnew=new dao.Lichsudaugia(daosp,nguoidat,tg,giadat);
		EntityManagerHelper.beginTransaction();
		lsdgdao.save(daolsdgnew);
		EntityManagerHelper.commit();
		//luu san pham
		daosp.setNguoidat(nguoidat);
		daosp.setGiahientai(giadat);
		EntityManagerHelper.beginTransaction();
		spdao.update(daosp);
		EntityManagerHelper.commit();
		
		//load danh sach dat gia 
		List<model.Lichsudaugia> modeldslsdg = new ArrayList<model.Lichsudaugia>();
		
		List<dao.Lichsudaugia> daodslsdg = lsdgdao.findByProperty("sanpham", daosp);
		for (dao.Lichsudaugia daolsdg : daodslsdg) {
			model.Lichsudaugia modelsp = new model.Lichsudaugia(daolsdg.getId(),daolsdg.getSanpham().getMasp(),daolsdg.getSanpham().getTensp(),daolsdg.getNguoidat(),daolsdg.getThoigian().getTime(),daolsdg.getGiadat());
			modeldslsdg.add(modelsp);
		}

		return modeldslsdg;
		
	}
	@POST
	@Path("/android/datGia")
	@Produces("application/json; charset=utf-8")
	@ResourceFilters({ FilterUser.class })
	public String datGiaAndroid(
			@FormParam("masp") Long masp,
			@FormParam("nguoidat") String nguoidat,
			@FormParam("thoigian") Long thoigian,
			@FormParam("giadat") Double giadat) {
		SanphamDAO spdao = new SanphamDAO();
		LichsudaugiaDAO lsdgdao=new LichsudaugiaDAO();
		try {
			dao.Sanpham daosp=spdao.findById(masp);
			if(daosp == null){
				return "error";
			}
			// Kiem tra gia hien tai
			Double giaHienTai = daosp.getGiahientai(); 
			EntityManagerHelper.log("KTgia dat - gia hien tai: " + giadat + "-" + giaHienTai, Level.INFO, null);

			if (giadat <= giaHienTai) {
				return String.valueOf(giaHienTai);
			}
			// luu dat gia
			Timestamp tg=new Timestamp(thoigian);
			dao.Lichsudaugia daolsdgnew=new dao.Lichsudaugia(daosp,nguoidat,tg,giadat);
			EntityManagerHelper.beginTransaction();
			lsdgdao.save(daolsdgnew);
			EntityManagerHelper.commit();
			//luu san pham
			daosp.setNguoidat(nguoidat);
			daosp.setGiahientai(giadat);
			EntityManagerHelper.beginTransaction();
			spdao.update(daosp);
			EntityManagerHelper.commit();
		} catch (Exception ex) {
			return "error";
		}
		return "success";
		
	}
	@POST
	@Path("/android/ktGia")
	@Produces("application/json; charset=utf-8")
	@ResourceFilters({ FilterUser.class })
	public String ktGiaAndroid(@FormParam("masp") Long masp, @FormParam("giadat") Double giadat) {
		SanphamDAO spdao = new SanphamDAO();
		try {
			dao.Sanpham daosp=spdao.findById(masp);
			if(daosp == null){
				return "kterror";
			}
			// Kiem tra gia hien tai
			Double giaHienTai = daosp.getGiahientai(); 
			EntityManagerHelper.log("KTgia dat - gia hien tai: " + giadat + "-" + giaHienTai, Level.INFO, null);
			if (giadat <= giaHienTai) {
				return String.valueOf(giaHienTai);
			}
		} catch (Exception ex) {
			return "kterror";
		}
		return "ktsuccess";		
	}
	
	@POST
	@Path("/findById")
	@Produces("application/json; charset=utf-8")
	public List<model.Lichsudaugia> findAll(@FormParam("masp") Long masp) {
		LichsudaugiaDAO lsdgdao=new LichsudaugiaDAO();
		SanphamDAO spdao = new SanphamDAO();
		dao.Sanpham daosp=spdao.findById(masp);
		// kiem tra san pham co phai dag dau
		//		if(daosp.getThoigianketthuc().before(dtnow)){
		//			return null;
		//		}
		//load danh sach dat gia 
		List<model.Lichsudaugia> modeldslsdg = new ArrayList<model.Lichsudaugia>();
		
		List<dao.Lichsudaugia> daodslsdg = lsdgdao.findByProperty("sanpham", daosp);
		for (dao.Lichsudaugia daolsdg : daodslsdg) {
			model.Lichsudaugia modelsp = new model.Lichsudaugia(daolsdg.getId(),daolsdg.getSanpham().getMasp(),daolsdg.getSanpham().getTensp(),daolsdg.getNguoidat(),daolsdg.getThoigian().getTime(),daolsdg.getGiadat());
			modeldslsdg.add(modelsp);
		}
		return modeldslsdg;
		
	}
}