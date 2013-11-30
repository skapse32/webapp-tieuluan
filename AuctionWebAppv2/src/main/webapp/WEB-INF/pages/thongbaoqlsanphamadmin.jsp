<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<div class="Column3">
	<h2 id="RegionList" class="h2row">Quản lý</h2>
	<ul class="CategoriesList">
		<li class="CategoryList"><a
			href="${pageContext.request.contextPath}/admin/sanphamhuyadmin">Hủy đấu giá</a></li>
		<li class="CategoryList"><a
			href="${pageContext.request.contextPath}/admin/sanphamchophepdauadmin">Cho phép đấu</a></li>
	</ul>
</div>
<!-- InstanceBeginEditable name="MainRegion" -->
<div class="Column9">
	<h2 id="HomepageFeaturedList" class="h2row" style="text-align: center">${tieude}</h2>
	<div style="text-align:center;padding-top: 10px; ">
		<h3>${noidung}</h3>
	</div>




</div>
<!-- InstanceEndEditable -->
<div class="DIVclear"></div>
