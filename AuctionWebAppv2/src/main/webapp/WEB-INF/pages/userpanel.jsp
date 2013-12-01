<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!-- Content -->
<div id="content" class="wmain">
	<!-- Left side -->
	<div id="box-left" class="fl top10 bg_white wleft">
		<div id="products-group" class="fl bg-top-products wleft">
			<div id="browser-modules" class="fl browser fontTahoma">
				<a href="" class="fl url_home l8 right8"> <img class="fl w21-18"
					alt="" src="resources/v2/images/blank.gif" />
				</a> <img class="fl right8" src="resources/v2/images/arrow.gif" alt="" />
				<div class="fl top3 right8">
					<a class="fl link_blue bold" href="">${username}</a>
				</div>
				<img class="fl right8" src="resources/v2/images/arrow.gif" alt="" />
				<div class="fl top3 right8">
					<a class="fl link_blue bold" href="">Quản lý thông tin User</a>
				</div>
			</div>
		</div>
		<h2 id="HomepageFeaturedList" class="h2row" style="text-align: center">Home</h2>
		<div>
			<h2 style="margin-left: 20px">User</h2>
			<h3 style="margin-left: 40px">
				<a href="${pageContext.request.contextPath}/sanphamdangdau.html">Danh
					sách sản phẩm</a>
			</h3>
			<h3 style="margin-left: 40px">
				<a href="${pageContext.request.contextPath}/dangsanpham">Đăng
					sản phẩm</a>
			</h3>
			<h3 style="margin-left: 40px">
				<a href="${pageContext.request.contextPath}/quanlyspuser">Quản
					lý sản phẩm</a>
			</h3>
			<h3 style="margin-left: 40px">
				<a href="${pageContext.request.contextPath}/dangxuat">Đăng xuất</a>
			</h3>
			<h2 style="margin-left: 20px">Manager</h2>
			<h3 style="margin-left: 40px">
				<a href="${pageContext.request.contextPath}/quanlyspad">Quản lý
					sản phẩm</a>
			</h3>
		</div>
	</div>

	<!-- Right side -->
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

<div class="DIVclear"></div>


