package com.tieuluan.daugia.interceptor;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.core.NewCookie;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
import com.tieuluan.daugia.function.Server;
import com.tieuluan.daugia.model.Hinhthucthanhtoan;
import com.tieuluan.daugia.model.Loaisp;
import com.tieuluan.daugia.model.Tinhtrangsp;

public class InterceptorInit implements HandlerInterceptor {

	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {

	}

	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {

	}

	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object arg2) throws Exception {
		HttpSession session = request.getSession();
		
		if (session.getAttribute("sessionid") == null) {
			Gson gson = new Gson();
			ClientConfig config = new DefaultClientConfig();
			Client client = Client.create(config);
			WebResource webResource = client.resource(Server.addressAuctionWS);
			ClientResponse clresponse = null;
			String json = "";
			Type typelist = null;
			// get session id
			clresponse = webResource.path("user/getSessionID").post(
					ClientResponse.class);
			if (clresponse.getStatus() == 200) {
				session.setAttribute("sessionid",
						clresponse.getEntity(String.class));
			} else {
				response.sendRedirect("/" + Server.web + "/denied");
				return false;
			}
			// get loaisp
			json = webResource
					.path("loaisanpham/findAll")
					.cookie(new NewCookie("JSESSIONID", session.getAttribute(
							"sessionid").toString())).post(String.class);
			List<Loaisp> dsloaisp = new ArrayList<Loaisp>();
			typelist = new TypeToken<ArrayList<Loaisp>>() {
			}.getType();
			dsloaisp = gson.fromJson(json, typelist);
			session.setAttribute("dsloaisp", dsloaisp);
			// get tinhtrangsp
			json = webResource
					.path("tinhtrangsanpham/findAll")
					.cookie(new NewCookie("JSESSIONID", session.getAttribute(
							"sessionid").toString())).post(String.class);
			List<Tinhtrangsp> dstinhtrangsp = new ArrayList<Tinhtrangsp>();
			typelist = new TypeToken<ArrayList<Tinhtrangsp>>() {
			}.getType();
			dstinhtrangsp = gson.fromJson(json, typelist);
			session.setAttribute("dstinhtrangsp", dstinhtrangsp);
			// get hinhthucthanhtoan
			json = webResource
					.path("hinhthucthanhtoan/findAll")
					.cookie(new NewCookie("JSESSIONID", session.getAttribute(
							"sessionid").toString())).post(String.class);
			List<Hinhthucthanhtoan> dshttt = new ArrayList<Hinhthucthanhtoan>();
			typelist = new TypeToken<ArrayList<Hinhthucthanhtoan>>() {
			}.getType();
			dshttt = gson.fromJson(json, typelist);
			session.setAttribute("dshttt", dshttt);
			session.setAttribute("loaiphien", 1);
			session.setAttribute("tukhoa", "");
			//gia su
//			String username="QuyAnh";
//			session.setAttribute("username",username);
//			String role="User";
//			session.setAttribute("role",role);
			
			
		}
		return true;
	}

}
