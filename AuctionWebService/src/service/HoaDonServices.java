package service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.sun.jersey.spi.container.ResourceFilters;

import dao.EntityManagerHelper;
import dto.HoadonDTO;
import dto.SanphamDTO;
import filter.FilterUser;



@Path("hoadon")
public class HoaDonServices {
	@POST
	@Path("/findAll")
	@Produces("application/json; charset=utf-8")
	public List<model.Hoadon> findAll() {
		List<model.Hoadon> pojods = new ArrayList<model.Hoadon>();
		dto.HoadonDTO xdao=new dto.HoadonDTO();
		List<domain.Hoadon> daods=xdao.findAll();
		for (domain.Hoadon daox : daods) {
			model.Hoadon pojosp=new model.Hoadon(daox.getMahoadon(),daox.getSanpham().getMasp(),daox.getSanpham().getTensp(),daox.getDongia(),daox.getNguoidang(),daox.getNguoimua(),daox.getNgaylap().getTime());
			pojods.add(pojosp);
		}
		return pojods;
	}
	@POST
	@Path("/save")
	@Produces("application/json; charset=utf-8")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	@ResourceFilters({ FilterUser.class })
	public String save(@FormParam("masp") Long masp) {
		SanphamDTO spdao = new SanphamDTO();
		HoadonDTO hddao=new HoadonDTO();
		//tim san pham
		domain.Sanpham sp=spdao.findById(masp);
		//creat hoa don
		domain.Hoadon hd = new domain.Hoadon(sp,sp.getGiahientai(),sp.getNguoidang(),sp.getNguoidat(),new Date());
		//luu hoa don
		EntityManagerHelper.beginTransaction();
		hddao.save(hd);
		EntityManagerHelper.commit();
		//luu tinh trang san pham
		sp.setTinhtrangdaugia(3);
		EntityManagerHelper.beginTransaction();
		spdao.update(sp);
		EntityManagerHelper.commit();
		return "ok";
	}
	
	@POST
	@Path("/findByNguoimua")
	@Produces("application/json; charset=utf-8")
	public List<model.Hoadon> findByNguoimua(@FormParam("nguoimua") String nguoimua) {
		HoadonDTO hddao = new HoadonDTO();	
		List<model.Hoadon> modelhd = new ArrayList<model.Hoadon>();	
		List<domain.Hoadon> daohd = hddao.findByNguoimua(nguoimua);
		for (domain.Hoadon hd : daohd) {
			model.Hoadon modelhdon = new model.Hoadon(hd.getMahoadon(),hd.getSanpham().getMasp(), hd.getSanpham().getTensp(), hd.getDongia(), hd.getNguoidang(), hd.getNguoimua(), hd.getNgaylap().getTime());
			modelhd.add(modelhdon);
		}
		System.out.println(modelhd.toString());
		return modelhd;
	}
	
}