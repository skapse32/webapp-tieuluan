<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div class="content">
	<div class="site-map-path">
		<a href="${pageContext.request.contextPath}/manager"><img
			src="${pageContext.request.contextPath}/resources/images/home.png"
			height="18" width="18" border="0px" /></a> <label class="focus">
			Trang Chủ </label>>Tra cứu giảng viên
		<hr class="line-header-padding" />
	</div>
	<div id="private">
		<u>Danh sách người đã đăng sản phẩm :</u>
		<c:forEach items="${dsuser}" var="nguoidang">
			<a href="${pageContext.request.contextPath}/user/kqdanhgia/${nguoidang.username}">
				<div id="public" style="width: 570px">
					<div style="width: 570px ; color: white; background-color: #3B5998;">${nguoidang.username}</div>
					<div style="width: 570px ; ">${nguoidang.hoTen}</div>
				</div>
			</a>
		</c:forEach>
	</div>
	
</div>