package dto;

import java.util.ArrayList;
import java.util.List;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

@Path("loaisanpham")
public class LoaiSanPhamServices {
	@POST
	@Path("/findAll")
	@Produces("application/json; charset=utf-8")
	public List<model.Loaisp> findAll() {
		List<model.Loaisp> pojods = new ArrayList<model.Loaisp>();
		dao.LoaispDAO xdao=new dao.LoaispDAO();
		List<dao.Loaisp> daods=xdao.findAll();
		for (dao.Loaisp daox : daods) {
			model.Loaisp pojosp=new model.Loaisp(daox.getMaloaisp(),daox.getTenloaisp(),daox.getMota());
			pojods.add(pojosp);
		}
		return pojods;
	}

}