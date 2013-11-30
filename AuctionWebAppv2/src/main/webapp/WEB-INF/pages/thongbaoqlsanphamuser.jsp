<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<div class="Column3">
	<h2 id="RegionList" class="h2row">DANH SÁCH ĐẤU GIÁ</h2>
	<ul class="CategoriesList">
		<li class="CategoryList"><a
			href="${pageContext.request.contextPath}/qlsanphamdangthamgia">Sản
				phẩm đang tham gia</a>
		</li>
		<li class="CategoryList"><a
			href="${pageContext.request.contextPath}/qlsanphamdaketthuc">Sản
				phẩm đã kết thúc</a>
		</li>
		<li class="CategoryList"><a
			href="${pageContext.request.contextPath}/qlsanphamchienthang">Sản
				phẩm chiến thắng</a>
		</li>
	</ul>
	<h2 id="RegionList" class="h2row">SẢN PHẨM CỦA TÔI</h2>
	<ul class="CategoriesList">
		<li class="CategoryList"><a
			href="${pageContext.request.contextPath}/qlsanphamcuatoidangdau">Sản
				phẩm đang đấu</a>
		</li>
		<li class="CategoryList"><a
			href="${pageContext.request.contextPath}/qlsanphamcuatoisapdau">Sản
				phẩm sắp đấu</a>
		</li>
		<li class="CategoryList"><a
			href="${pageContext.request.contextPath}/qlsanphamcuatoidadauxong">Sản
				phẩm đã đấu xong</a>
		</li>
		<li class="CategoryList"><a
			href="${pageContext.request.contextPath}/qlsanphamcuatoibihuy">Sản
				phẩm bị hủy</a>
		</li>
		<li class="CategoryList"><a
			href="${pageContext.request.contextPath}/dangsanpham">Đăng sản
				phẩm</a>
		</li>
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
