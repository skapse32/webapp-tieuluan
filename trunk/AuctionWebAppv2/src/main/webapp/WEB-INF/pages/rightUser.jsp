<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!-- Right side -->
<div id="box-right" class="fl l10 top10 bg_white wright cright">
	<c:choose>
		<c:when test="${sessionScope.role != null}">
			<c:choose>
				<c:when test="${sessionScope.role == 'Admin'}">
					<div id="catalog-products-titles"
						class="fl bg-titles top10 products-group-title-news color_white fontTahoma wright-26">
						<strong>Quản lý Sản phẩm(Admin)</strong>
					</div>
					<ul id="catalog-products-list"
						class="fl fontTahoma wright list-none top5">
						<li class="fl pd5 w240 "><a class="fl  pdl20"
							href="${pageContext.request.contextPath}/sanphamhuyadmin">Quản
								lý sản phẩm (admin)</a></li>
						<li class="fl wright das_top h1"></li>
						<li class="fl pd5 w240 "><a class="fl  pdl20"
							href="${pageContext.request.contextPath}/qlyuser">Quản lý
								User</a></li>
						<li class="fl wright das_top h1"></li>
						<li class="fl pd5 w240 "><a class="fl  pdl20"
							href="${pageContext.request.contextPath}/hoadon">Hoá đơn</a></li>
						<li class="fl wright das_top h1"></li>
					</ul>
				</c:when>
				<c:otherwise>
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
							<li class="fl pd5 w240 "><a class="fl  pdl20"
								href="doimatkhau">Đổi mật khẩu</a></li>
							<li class="fl wright das_top h1"></li>
							<li class="fl pd5 w240 "><a class="fl  pdl20"
								href="dangxuat">Đăng xuất</a></li>
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
								href="${pageContext.request.contextPath}/qlsanphamchienthang?trangthai=1">Sản
									phẩm chiến thắng chưa thanh toán</a></li>
							<li class="fl wright das_top h1"></li>
							<li class="fl pd5 w240 "><a class="fl pd5 w240 "
								href="${pageContext.request.contextPath}/qlsanphamchienthang?trangthai=3">Sản
									phẩm chiến thắng đã thanh toán</a></li>
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
								href="${pageContext.request.contextPath}/dangsanpham">Đăng
									sản phẩm</a></li>
							<li class="fl wright das_top h1"></li>
						</ul>
					</div>
				</c:otherwise>
			</c:choose>
			</c:when>
	</c:choose>
</div>
<!-- Right side END -->