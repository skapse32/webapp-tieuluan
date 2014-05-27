package service;



import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;





@Path("hinhthucthanhtoan")
public class HinhThucThanhToanServices {
	@POST
	@Path("/findAll")
	@Produces("application/json; charset=utf-8")
	//@ResourceFilters({ FilterAuthorized.class })
	public List<model.Hinhthucthanhtoan> finfAll(@Context HttpServletRequest req) {
		List<model.Hinhthucthanhtoan> pojods = new ArrayList<model.Hinhthucthanhtoan>();
		dto.HinhthucthanhtoanDTO xdao=new dto.HinhthucthanhtoanDTO();
		List<domain.Hinhthucthanhtoan> daods=xdao.findAll();
		for (domain.Hinhthucthanhtoan daox : daods) {
			model.Hinhthucthanhtoan pojosp=new model.Hinhthucthanhtoan(daox.getMahttt(),daox.getTenhttt(),daox.getMota());
			pojods.add(pojosp);
		}
		return pojods;
	}

}