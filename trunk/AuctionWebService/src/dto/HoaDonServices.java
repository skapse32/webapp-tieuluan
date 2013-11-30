package dto;

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
import dao.HoadonDAO;
import dao.SanphamDAO;
import filter.FilterUser;



@Path("hoadon")
public class HoaDonServices {
	@POST
	@Path("/findAll")
	@Produces("application/json; charset=utf-8")
	public List<model.Hoadon> findAll() {
		List<model.Hoadon> pojods = new ArrayList<model.Hoadon>();
		dao.HoadonDAO xdao=new dao.HoadonDAO();
		List<dao.Hoadon> daods=xdao.findAll();
		for (dao.Hoadon daox : daods) {
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
		SanphamDAO spdao = new SanphamDAO();
		HoadonDAO hddao=new HoadonDAO();
		//tim san pham
		dao.Sanpham sp=spdao.findById(masp);
		//creat hoa don
		dao.Hoadon hd = new dao.Hoadon(sp,sp.getGiahientai(),sp.getNguoidang(),sp.getNguoidat(),new Date());
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
	
}