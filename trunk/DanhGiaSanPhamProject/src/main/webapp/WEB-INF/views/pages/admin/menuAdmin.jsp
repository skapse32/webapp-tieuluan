<%@page
	import="org.apache.taglibs.standard.tag.common.core.ForEachSupport"%>
<%@page import="com.nvh.daugia.model.jpa.BangDanhGia"%>
<%@page import="org.springframework.ui.Model,java.util.List"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<div id="right-bar">
	<p>Admin</p>
	<hr />
	<div id="ketqua">

		<a href="${pageContext.request.contextPath}/admin?qldg">
			<div class="row">Quản lý Bảng Đánh Giá</div>
		</a> <a href="${pageContext.request.contextPath}/admin/qluserlist">
			<div class="row">Quản lý User</div>
		</a> <a href="${pageContext.request.contextPath}/admin/setdanhgia">
			<div class="row">Cài Đặt Đánh Giá</div>
		</a><a href="${pageContext.request.contextPath}/admin/qlthongbao">
			<div class="row">Quản lý và đăng thông báo</div>
		</a>

	</div>
	<br />
</div>