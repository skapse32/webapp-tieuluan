package filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.ws.rs.WebApplicationException;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.Response;

import com.sun.jersey.spi.container.ContainerRequest;
import com.sun.jersey.spi.container.ContainerRequestFilter;
import com.sun.jersey.spi.container.ContainerResponseFilter;
import com.sun.jersey.spi.container.ResourceFilter;

public class FilterAdmin implements ResourceFilter, ContainerRequestFilter {

	@Context
	HttpServletRequest request;
	@Context
	HttpServletResponse response;

	@Override
	public ContainerRequest filter(ContainerRequest arg0) {
		// Filter logic goes here.
		if (request.getSession().getAttribute("role") != null) {
			if (request.getSession().getAttribute("role").toString()
					.equals("Admin")) {
				return arg0;
			} else {
				throw new WebApplicationException(
						Response.status(Response.Status.FORBIDDEN)
								.entity("You do not have permission to use this service")
								.build());
			}
		} else {
			throw new WebApplicationException(Response.Status.UNAUTHORIZED);

		}
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
