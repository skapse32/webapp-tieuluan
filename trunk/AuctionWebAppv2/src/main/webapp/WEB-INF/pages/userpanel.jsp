<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!-- Content -->
<div id="content" class="wmain">
	<!-- Left side -->
	<div id="box-left" class="fl top10 bg_white wleft">
			<h2 id="HomepageFeaturedList" class="h2row"
				style="text-align: center">Home</h2>
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
				<strong>Danh Sách Đấu Giá</strong>
			</div>
			<ul id="catalog-products-list"
				class="fl fontTahoma wright list-none top5">
				<li class="fl pd5 w240 ">
					<a class="fl  pdl20" href="sanphamdangdau.html">Sản phẩm đang đấu</a>
				</li>
				<li class="fl wright das_top h1"></li>
				<li class="fl pd5 w240 ">
					<a class="fl  pdl20" href="sanphamdadau.html">Sản phẩm đã đấu giá</a>
				</li>
				<li class="fl wright das_top h1"></li>
				<li class="fl pd5 w240 ">
					<a class="fl  pdl20" href="sanphamsapdau.html">Sản phẩm sắp đấu giá</a>
				</li>
				<li class="fl wright das_top h1"></li>
			</ul>
		</div>
		<div id="catalog-products" class="fl wright">
			<div id="catalog-products-titles"
				class="fl bg-titles top10 products-group-title-news color_white fontTahoma wright-26">
				<strong>Loại xe</strong>
			</div>
			<ul id="catalog-products-list"
				class="fl fontTahoma wright list-none top5">
				<c:choose>
					<c:when test="${sessionScope.dsloaisp != null}">
						<c:forEach var="lsp" items="${sessionScope.dsloaisp}">
							<c:choose>
								<c:when test="${lsp.maloaisp == maLoaiSP}">
									<li class="fl pd5 w240 set-group-bg"><a
										class="fl set-group pdl20"
										href="${pageContext.request.contextPath}/?maLoaiSP=${lsp.maloaisp}&trang=${trang}&soLuongSanPhamTrenTrang=${soLuongSanPhamTrenTrang}">${lsp.tenloaisp}</a>
									</li>
									<li class="fl wright das_top h1"></li>
								</c:when>
								<c:otherwise>
									<li class="fl pd5 w240 "><a class="fl  pdl20"
										href="${pageContext.request.contextPath}/?maLoaiSP=${lsp.maloaisp}&trang=${trang}&soLuongSanPhamTrenTrang=${soLuongSanPhamTrenTrang}">${lsp.tenloaisp}</a>
									</li>
									<li class="fl wright das_top h1"></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>

						<c:choose>
							<c:when test="${-1 == maLoaiSP}">
								<li class="fl pd5 w240 set-group-bg"><a
									class="fl set-group pdl20"
									href="${pageContext.request.contextPath}/?maLoaiSP=-1&trang=${trang}&soLuongSanPhamTrenTrang=${soLuongSanPhamTrenTrang}">+&nbsp;Tất
										cả</a></li>
								<li class="fl wright das_top h1"></li>
							</c:when>
							<c:otherwise>
								<li class="fl pd5 w240 "><a class="fl  pdl20"
									href="${pageContext.request.contextPath}/?maLoaiSP=-1&trang=${trang}&soLuongSanPhamTrenTrang=${soLuongSanPhamTrenTrang}">+&nbsp;Tất
										cả</a></li>
								<li class="fl wright das_top h1"></li>
							</c:otherwise>
						</c:choose>
					</c:when>
				</c:choose>
			</ul>
		</div>
	</div>
	<!-- Right side END -->
</div>

<div class="DIVclear"></div>


