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

		<a href="${pageContext.request.contextPath}/sinhvien/dggv">
			<div class="row">Đánh giá sản phẩm đã tham gia</div>
		</a>
		<a href="${pageContext.request.contextPath}/sinhvien/dsspkethuc">
			<div class="row">Xem kết quả đánh giá sản phẩm</div>
		</a>
		<a href="${pageContext.request.contextPath}/manager/tracuugv">
			<div class="row">D/sách khách hàng cung cấp sản phẩm</div>
		</a> <a href="${pageContext.request.contextPath}/manager/timkiemGV">
			<div class="row">Tìm khách hàng cung cấp sản phẩm</div>
		</a> 
		<a href="${pageContext.request.contextPath}/sinhvien/info?id=${account.id}">
			<div class="row">Thông tin cá nhân</div>
		</a>
	</div>
	<br />
</div>