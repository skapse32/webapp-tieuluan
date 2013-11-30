package dto;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;

@Path("hangxe")
public class HangXeService {

	@POST
	@Path("/findAll")
	@Produces("application/json; charset=utf-8")
	//@ResourceFilters({ FilterAuthorized.class })
	public List<model.Hangxe> finfAll(@Context HttpServletRequest req) {
		List<model.Hangxe> pojods = new ArrayList<model.Hangxe>();
		dao.HangxeDAO xdao=new dao.HangxeDAO();
		List<dao.Hangxe> daods=xdao.findAll();
		for (dao.Hangxe daox : daods) {
			model.Hangxe pojosp=new model.Hangxe(daox.getId(),daox.getTenhang());
			pojods.add(pojosp);
		}
		return pojods;
	}
	
}
