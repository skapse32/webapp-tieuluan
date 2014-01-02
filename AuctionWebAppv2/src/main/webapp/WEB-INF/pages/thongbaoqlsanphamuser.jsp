<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!-- Content -->
<div id="content" class="wmain">
	<!-- Left side -->
	<c:if test="${not empty thanhcong}">
		<script type="text/javascript">
			var message ="<div id='titler'>Thông báo</div>"
		+"<div id='noidung'>"
		+"<table><tr><td>Sản phẩm mới: </td><td id='ct'><a href='${pageContext.request.contextPath}/chitietsanpham?masp=${masp}'>${tensp}</a></td></tr>"
		+"<tr><td>Thương hiệu: </td><td id='ct'><label>${thuonghieu}</label></td></tr>"
		+"<tr><td>Giá khởi điểm: </td><td id='ct'><label>${giakhoidiem}</label></td></tr>"
		+"<tr><td>Giá mua ngay: </td><td id='ct'><label>${giamuangay}</label></td></tr></table></div>"
			/* var message = "<a href='${pageContext.request.contextPath}/chitietsanpham?masp=${masp}'>Sản phẩm mới : ${tensp} <br /> Thương Hiệu : ${thuonghieu} <br/> Giá khởi điểm : ${giakhoidiem} <br/> Giá mua ngay : ${giamuangay}</a>"; */
			var timeout = setTimeout(function() {
			        $('#send').trigger('click');
			 }, 500);
		</script>
	</c:if>
	<div id="box-left" class="fl top10 bg_white wleft">
	
		<h2 id="HomepageFeaturedList" class="h2row" style="text-align: center">${tieude}</h2>
		<div style="text-align: center; padding-top: 10px;">
			<h3>${noidung}</h3>
			<input id="send" type="button" onclick="sendToServerDangSP(message)" hidden="true"/>
		</div>
	</div>
	<!-- End left side -->
	<div id="box-right" class="fl l10 top10 bg_white wright cright">
		<div id="catalog-products" class="fl wright">
			<div id="catalog-products-titles"
				class="fl bg-titles top10 products-group-title-news color_white fontTahoma wright-26">
				<strong>Quản lý tài khoản</strong>
			</div>
			<ul id="catalog-products-list"
				class="fl fontTahoma wright list-none top5">
				<li class="fl pd5 w240 "><a class="fl  pdl20"
					href="thongtintaikhoan">Thông tin tài khoản</a></li>
				<li class="fl wright das_top h1"></li>
				<li class="fl pd5 w240 "><a class="fl  pdl20" href="doimatkhau">Đổi
						mật khẩu</a></li>
				<li class="fl wright das_top h1"></li>
			</ul>
		</div>
		<div id="catalog-products" class="fl wright">
			<div id="catalog-products-titles"
				class="fl bg-titles top10 products-group-title-news color_white fontTahoma wright-26">
				<strong>Danh sách đấu giá</strong>
			</div>
			<ul id="catalog-products-list"
				class="fl fontTahoma wright list-none top5">
				<li class="fl pd5 w240 "><a class="fl pd5 w240 "
					href="${pageContext.request.contextPath}/qlsanphamdangthamgia">Sản
						phẩm đang tham gia</a></li>
				<li class="fl wright das_top h1"></li>
				<li class="fl pd5 w240 "><a class="fl pd5 w240 "
					href="${pageContext.request.contextPath}/qlsanphamdaketthuc">Sản
						phẩm đã kết thúc</a></li>
				<li class="fl wright das_top h1"></li>
				<li class="fl pd5 w240 "><a class="fl pd5 w240 "
					href="${pageContext.request.contextPath}/qlsanphamchienthang">Sản
						phẩm chiến thắng</a></li>
				<li class="fl wright das_top h1"></li>
			</ul>
		</div>
		<div id="catalog-products" class="fl wright">
			<div id="catalog-products-titles"
				class="fl bg-titles top10 products-group-title-news color_white fontTahoma wright-26">
				<strong>Sản phẩm của tôi</strong>
			</div>
			<ul id="catalog-products-list"
				class="fl fontTahoma wright list-none top5">
				<li class="fl pd5 w240 "><a class="fl pd5 w240 "
					href="${pageContext.request.contextPath}/qlsanphamcuatoidangdau">Sản
						phẩm đang đấu</a></li>
				<li class="fl wright das_top h1"></li>
				<li class="fl pd5 w240 "><a class="fl pd5 w240 "
					href="${pageContext.request.contextPath}/qlsanphamcuatoisapdau">Sản
						phẩm sắp đấu</a></li>
				<li class="fl wright das_top h1"></li>
				<li class="fl pd5 w240 "><a class="fl pd5 w240 "
					href="${pageContext.request.contextPath}/qlsanphamcuatoidadauxong">Sản
						phẩm đã đấu xong</a></li>
				<li class="fl wright das_top h1"></li>
				<li class="fl pd5 w240 "><a class="fl pd5 w240 "
					href="${pageContext.request.contextPath}/qlsanphamcuatoibihuy">Sản
						phẩm bị hủy</a></li>
				<li class="fl wright das_top h1"></li>
				<li class="fl pd5 w240 "><a class="fl pd5 w240 "
					href="${pageContext.request.contextPath}/dangsanpham">Đăng sản
						phẩm</a></li>
				<li class="fl wright das_top h1"></li>
			</ul>
		</div>
	</div>

	<!-- Right side END -->

</div>
