package service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.FormParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.core.Context;

import dao.EntityManagerHelper;
import domain.Sanpham;
import dto.SanphamDTO;

@Path("tinhtrangdg")
public class TinhTrangDauGiaService {
	@POST
	@Path("/ketthuc")
	public String updateKethuc(@FormParam("masp") long masp) {
		SanphamDTO spDao = new SanphamDTO();
		Sanpham sp = spDao.findById(masp);
		sp.setTinhtrangdaugia(1);
		EntityManagerHelper.beginTransaction();
		spDao.save(sp);
		EntityManagerHelper.commit();
		return "success";
	}
}
