<%@page
	import="org.apache.taglibs.standard.tag.common.core.ForEachSupport"%>
<%@page import="com.nvh.daugia.model.jpa.BangDanhGia"%>
<%@page import="org.springframework.ui.Model,java.util.List"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<div id="right-bar">
	<p>Giảng Viên</p>
	<hr />
	<div id="ketqua">

		<a href="${pageContext.request.contextPath}/gvien/kqdanhgia">
			<div class="row">Xem kết quả đánh giá</div>
		</a>
		<a href="${pageContext.request.contextPath}/gvien/info?id=${account.id}">
			<div class="row">Thông tin cá nhân</div>
		</a>
		<a href="${pageContext.request.contextPath}/gvien/changepwd">
			<div class="row">Đổi mật khẩu</div>
		</a>
	</div>
	<br />
</div>