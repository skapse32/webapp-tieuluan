package dto;

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
		dao.TinhtrangspDAO xdao=new dao.TinhtrangspDAO();
		List<dao.Tinhtrangsp> daods=xdao.findAll();
		for (dao.Tinhtrangsp daox : daods) {
			model.Tinhtrangsp pojosp=new model.Tinhtrangsp(daox.getMatinhtrangsp(),daox.getTentinhtrangsp(),daox.getMota());
			pojods.add(pojosp);
		}
		return pojods;
	}
}