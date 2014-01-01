<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav>
	<div class="inside nav">
		<ul id="topnav">
			<li><c:choose>
					<c:when test="${role == 'User'}">
						<a href="${pageContext.request.contextPath}/sinhvien"> <img
							src="${pageContext.request.contextPath}/resources/images/home.png"
							border="0px" />
					</c:when>
					<c:when test="${role == 'Admin'}">
						<a href="${pageContext.request.contextPath}/admin"> <img
							src="${pageContext.request.contextPath}/resources/images/home.png"
							border="0px" />
					</c:when>
				</c:choose>
				<p>Trang Chủ</p> </a></li>
			<li><a href="${pageContext.request.contextPath}/logout"> <br />
					Thoát <br /> <span>(Chào: ${username})<br /></span></a></li>
			</li>
			<li><a href="Http://192.168.1.5:8080/daugia/"> <br />
					Auction <span><br />Đấu giá</span>
			</a></li>
		</ul>
	</div>
</nav>
