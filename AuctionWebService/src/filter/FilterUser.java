package filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.WebApplicationException;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.Response;

import com.sun.jersey.spi.container.ContainerRequest;
import com.sun.jersey.spi.container.ContainerRequestFilter;
import com.sun.jersey.spi.container.ContainerResponseFilter;
import com.sun.jersey.spi.container.ResourceFilter;

public class FilterUser implements ResourceFilter, ContainerRequestFilter {

	@Context
	HttpServletRequest request;
	@Context
	HttpServletResponse response;

	@Override
	public ContainerRequest filter(ContainerRequest arg0) {
		// Filter logic goes here.
		HttpSession session= request.getSession(true);
		if (session.getAttribute("username") == null) {
			if(request.getContextPath().equals("sanpham/findById")){
				
			}else{
				throw new WebApplicationException(Response.Status.UNAUTHORIZED);
			//throw new WebApplicationException(Response.status(Response.Status.FORBIDDEN)
    		//		.entity("404").build());
			}
		}
		return arg0;
	}
	@Override
	public ContainerRequestFilter getRequestFilter() {
		return this;
	}

	@Override
	public ContainerResponseFilter getResponseFilter() {
		return null;
	}

}
