<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<div class="Column3">
	<h2 id="CategoryList" class="h2row">DANH MỤC</h2>
	<ul class="CategoriesList">
		<c:choose>
			<c:when test="${sessionScope.dsloaisp != null}">
				<c:forEach var="lsp" items="${sessionScope.dsloaisp}">
					<li class="CategoryList">${lsp.tenloaisp}</li>
				</c:forEach>
			</c:when>
			<c:otherwise>

			</c:otherwise>
		</c:choose>
	</ul>
	<h2 id="RegionList" class="h2row">DANH SÁCH ĐẤU GIÁ</h2>
	<ul class="CategoriesList">
		<li class="CategoryList">Đang đấu giá</li>
		<li class="CategoryList">Đã đấu giá</li>
		<li class="CategoryList">Sắp đấu giá</li>
	</ul>
</div>
<!-- InstanceBeginEditable name="MainRegion" -->
	<div class="Column9">
		<h2 id="HomepageFeaturedList" class="h2row" style="text-align: center">Home</h2>
		<div>
			<h2 style="margin-left:20px"> User </h2>
			<h3  style="margin-left:40px">
				<a href="${pageContext.request.contextPath}/example">Test</a>
			</h3>
			<h3  style="margin-left:40px">
				<a href="${pageContext.request.contextPath}/sanphamdangdau">Danh
					sách sản phẩm</a>
			</h3>
			<h3  style="margin-left:40px">
				Chi tiết sản phẩm			</h3>
			<h3  style="margin-left:40px">
				<a href="${pageContext.request.contextPath}/dangsanpham">Đăng
					sản phẩm</a>
			</h3>
			<h3  style="margin-left:40px">
				<a href="${pageContext.request.contextPath}/quanlyspuser">Quản lý sản phẩm</a>
			</h3>
			<h2  style="margin-left:20px"> Manager </h2>
			<h3  style="margin-left:40px">
				<a href="${pageContext.request.contextPath}/quanlyspad">Quản lý sản phẩm</a>
			</h3>
			
			
		</div>




	</div>
	<!-- InstanceEndEditable -->
	<div class="DIVclear"></div>


