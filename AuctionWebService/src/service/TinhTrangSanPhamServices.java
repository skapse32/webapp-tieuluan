package service;

import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

@Path("tinhtrangsanpham")
public class TinhTrangSanPhamServices {
	@POST
	@Path("/findAll")
	@Produces("application/json; charset=utf-8")
	public List<model.Tinhtrangsp> findAll() {
		List<model.Tinhtrangsp> pojods = new ArrayList<model.Tinhtrangsp>();
		dto.TinhtrangspDTO xdao=new dto.TinhtrangspDTO();
		List<domain.Tinhtrangsp> daods=xdao.findAll();
		for (domain.Tinhtrangsp daox : daods) {
			model.Tinhtrangsp pojosp=new model.Tinhtrangsp(daox.getMatinhtrangsp(),daox.getTentinhtrangsp(),daox.getMota());
			pojods.add(pojosp);
		}
		return pojods;
	}
}