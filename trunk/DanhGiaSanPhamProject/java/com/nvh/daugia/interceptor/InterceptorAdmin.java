package com.nvh.daugia.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.tieuluan.daugia.function.Server;

public class InterceptorAdmin implements HandlerInterceptor {

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
		
		//filter
		if (session.getAttribute("username") == null) {
			response.sendRedirect("/" + Server.web + "/login");
			return false;
		}
		if(session.getAttribute("role")==null){
			response.sendRedirect("/" + Server.web + "/login");
			return false;
		}
		if(session.getAttribute("role").toString().equals("User")){
			response.sendRedirect("/" + Server.web + "/");
			return true;
		}
		if(session.getAttribute("role").toString().equals("BannedUser")){
			response.sendRedirect("/" + Server.web + "/denied");
			return false;
		}
		return true;
	}

}
