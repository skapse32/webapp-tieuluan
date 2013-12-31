<%@page
	import="org.apache.taglibs.standard.tag.common.core.ForEachSupport"%>
<%@page import="com.nvh.daugia.model.jpa.BangDanhGia"%>
<%@page import="org.springframework.ui.Model,java.util.List"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<div id="right-bar">
	<p>Khách Hàng</p>
	<hr />
	<div id="ketqua">

		<a href="${pageContext.request.contextPath}/user/dgsp">
			<div class="row">Đánh giá người đăng</div>
		</a>
		<a href="${pageContext.request.contextPath}/user/kqdanhgia/${username}">
			<div class="row">Xem kết quả đánh giá</div>
		</a>
		<a href="${pageContext.request.contextPath}/user/tracuunguoidang">
			<div class="row">D/sách khách hàng cung cấp sản phẩm</div>
		</a> <a href="${pageContext.request.contextPath}/user/timkiemnguoiban">
			<div class="row">Tìm khách hàng cung cấp sản phẩm</div>
		</a> 
		<a href="${pageContext.request.contextPath}/usser/info?id=${account.id}">
			<div class="row">Thông tin cá nhân</div>
		</a>
	</div>
	<br />
</div>