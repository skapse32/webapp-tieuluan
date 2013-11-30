package dto;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.core.Context;

import model.User;

import com.google.gson.Gson;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
import com.sun.jersey.api.representation.Form;
import com.sun.jersey.spi.container.ResourceFilters;

import dao.EntityManagerHelper;

import filter.FilterUser;
import function.Function;
import function.Server;

@Path("user")
public class UserServices {
	@Context
	HttpServletRequest request;

	@POST
	@Path("/access")
	public String access(@FormParam("username") String username,
			@FormParam("authencode") String authencode) {
		String result = "";
		ClientConfig config = new DefaultClientConfig();
		Client client = Client.create(config);
		WebResource webResource = client.resource(Server.addressAuthenWS);
		Form form = new Form();
		form.add("authenCode", authencode);
		result = webResource.path("login/accessToken").post(String.class, form);
		if ("".endsWith(result)) {
			return "WrongAuthenCode";
		} else {
			request.getSession().setAttribute("accesstoken", result);
			request.getSession().setAttribute("username", username);
			String role=getrole(result);
			request.getSession().setAttribute("role", role);
			return "AccessSuccessfully";
		}
	}

	@POST
	@Path("getSessionID")
	public String getsessionid() {
		HttpSession session = request.getSession(true);
		//gia su
//		String accesstoken="1234567890";
//		session.setAttribute("accesstoken",accesstoken);
//		String username="QuyAnh";
//		session.setAttribute("username",username);
//		String role="Admin";
//		session.setAttribute("role",role);
		return session.getId();
	}
	
	private String getrole(String accessToken) {
		ClientConfig config = new DefaultClientConfig();
		Client client = Client.create(config);
		WebResource webResource = client.resource(Server.addressAuthenWS);
		Form form = new Form();
		form.add("accessToken", accessToken);
		String result = webResource.path("role/getRoleUser").post(String.class,
				form);
		return result;
	}
	@POST
	@Path("/getRoleUser")
	@ResourceFilters({ FilterUser.class })
	public String getrole() {
		HttpSession session = request.getSession(true);
		String role=session.getAttribute("role").toString();
		return role;
	}
	@POST
	@Path("/getUserInfo")
	@ResourceFilters({ FilterUser.class })
	public String getUserInfo() {
		HttpSession session = request.getSession(true);
		String username=session.getAttribute("username").toString();
		ClientConfig config = new DefaultClientConfig();
		Client client = Client.create(config);
		WebResource webResource = client.resource(Server.addressAuthenWS);
		Form form = new Form();
		form.add("username", username);
		String result = webResource.path("userinfo/username").post(String.class,
				form);
		return result;
	}
	@POST
	@Path("/getUserInfoNguoiBan")
	@ResourceFilters({ FilterUser.class })
	public String getUserInfoThanhToan(@FormParam("username") String username) {
		ClientConfig config = new DefaultClientConfig();
		Client client = Client.create(config);
		WebResource webResource = client.resource(Server.addressAuthenWS);
		Form form = new Form();
		form.add("username", username);
		String result = webResource.path("userinfo/username").post(String.class,
				form);
		return result;
	}
	@POST
	@Path("/access1")
	public String access1(@FormParam("username") String username) {
		//gia su
		HttpSession session = request.getSession(true);
		String accesstoken="1234567890";
		session.setAttribute("accesstoken",accesstoken);
		session.setAttribute("username",username);
		String role="User";
		session.setAttribute("role",role);
		return "AccessSuccessfully";
		
	}
static boolean flag = true;
	
	//run server nen
		@POST
		@Path("/run")
		public String run() {
			try {
				dao.SanphamDAO sanphamdao = new dao.SanphamDAO();
				while (flag) {
					Thread.sleep(10000);
					
					List<dao.Sanpham> daodssp=sanphamdao.findByKetThucDauGia();
					
					ClientConfig config = new DefaultClientConfig();
					Client client = Client.create(config);
					WebResource webResource = client.resource(Server.addressAuthenWS);
					Gson gson = new Gson();
					Form form = new Form();
					String result = "";
					for (dao.Sanpham daosp : daodssp) {
						form = new Form();
						result = webResource.path("userinfo/username").post(String.class,
								form);
						User user = gson.fromJson(result, User.class);
						Function.sendmail( user, daosp);
						daosp.setTinhtrangdaugia(1);
						EntityManagerHelper.beginTransaction();
						sanphamdao.update(daosp);
						EntityManagerHelper.commit();
					}
				}
			} catch (InterruptedException e) {
				return "error";
			}
			return "stoped";
		}
		
		@POST
		@Path("/run1")
		public String run1() {
			try {
				dao.SanphamDAO sanphamdao = new dao.SanphamDAO();
				while (flag) {
					Thread.sleep(10000);
					
					List<dao.Sanpham> daodssp=sanphamdao.findByKetThucDauGia();
					
					
					for (dao.Sanpham daosp : daodssp) {
						
						Function.sendmail1( "pqanh09@gmail.com", daosp);
						daosp.setTinhtrangdaugia(1);
						EntityManagerHelper.beginTransaction();
						sanphamdao.update(daosp);
						EntityManagerHelper.commit();
					}
				}
			} catch (InterruptedException e) {
				return "error";
			}
			return "stoped";
		}
		//stop server nen
		@GET
		@Path("/stop")
		public String stop() {
			flag = false;
			return " set stoped";
		}
		
		// get status
		@GET
		@Path("/getstatus")
		public String getstatus() {
			if (flag)
				return "starting......";
			return "no starting";
		}
	
	
	
}