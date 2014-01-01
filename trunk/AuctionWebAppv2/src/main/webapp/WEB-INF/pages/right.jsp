<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!-- Right side -->
<div id="box-right" class="fl l10 top10 bg_white wright cright">
	<c:if test="${not empty username }">
	<div id="catalog-products" class="fl wright">
		<div id="catalog-products-titles"
			class="fl bg-titles top10 products-group-title-news color_white fontTahoma wright-26">
			<strong>Sản phẩm đã đấu</strong>
		</div>
		<ul id="catalog-products-list"
			class="fl fontTahoma wright list-none top5">
			<li class="fl pd5 w240 ">
				<a class="fl  pdl20" href="${pageContext.request.contextPath}/qlsanphamdangthamgia">Đã đấu ${soluongsptg} sản phẩm</a>
			</li>
			<li class="fl wright das_top h1"></li>
			<li id="spct" class="fl pd5 w240 isred">
				<a class="fl  pdl20" href="${pageContext.request.contextPath}/qlsanphamchienthang">Đã chiến thắng ${slspct} sản phẩm</a>
			</li>
			<li class="fl wright das_top h1"></li>
		</ul>
	</div>
	</c:if>
	
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
	<!-- sort -->
		<div id="catalog-products" class="fl wright">
			<div id="catalog-products-titles"
				class="fl bg-titles top10 products-group-title-news color_white fontTahoma wright-26">
				<strong>Sắp xếp</strong>
			</div>
			<ul id="catalog-products-list"
				class="fl fontTahoma wright list-none top5">
							<li class="fl pd5 w240"><a
								class="fl pdl20"
								href="${pageContext.request.contextPath}/?locsp=0&trang=${trang}&soLuongSanPhamTrenTrang=${soLuongSanPhamTrenTrang}">Mới Nhất</a>
							</li>
							<li class="fl wright das_top h1"></li>
							<li class="fl pd5 w240 "><a
								class="fl  pdl20"
								href="${pageContext.request.contextPath}/?locsp=1&trang=${trang}&soLuongSanPhamTrenTrang=${soLuongSanPhamTrenTrang}">Tăng dần</a>
							</li>
							<li class="fl wright das_top h1"></li>
							<li class="fl pd5 w240"><a
								class="fl pdl20"
								href="${pageContext.request.contextPath}/?locsp=-1&trang=${trang}&soLuongSanPhamTrenTrang=${soLuongSanPhamTrenTrang}">Giảm dần</a>
							</li>
							<li class="fl wright das_top h1"></li>
						
			</ul>
		</div>
	<!-- --- -->
	
	<c:if test="${sessionScope.dshangxe != null}">
		<div id="catalog-products" class="fl wright">
			<div id="catalog-products-titles"
				class="fl bg-titles top10 products-group-title-news color_white fontTahoma wright-26">
				<strong>Hãng xe</strong>
			</div>
			<ul id="catalog-products-list"
				class="fl fontTahoma wright list-none top5">

				<c:forEach var="xe" items="${sessionScope.dshangxe}">
					<c:choose>
						<c:when test="${xe.id == idxe}">
							<li class="fl pd5 w240 set-group-bg"><a
								class="fl set-group pdl20"
								href="${pageContext.request.contextPath}/?thuonghieu=${xe.tenhang}&trang=${trang}&soLuongSanPhamTrenTrang=${soLuongSanPhamTrenTrang}">${xe.tenhang}</a>
							</li>
							<li class="fl wright das_top h1"></li>
						</c:when>
						<c:otherwise>
							<li class="fl pd5 w240 "><a class="fl  pdl20"
								href="${pageContext.request.contextPath}/?thuonghieu=${xe.tenhang}&trang=${trang}&soLuongSanPhamTrenTrang=${soLuongSanPhamTrenTrang}">${xe.tenhang}</a>
							</li>
							<li class="fl wright das_top h1"></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</ul>
		</div>
	</c:if>
	<div id="catalog-products" class="fl top10 wright">
		<div id="catalog-products-titles"
			class="fl bg-titles products-group-title-news color_white fontTahoma wright-26">
			<strong>Hỗ trợ trực tuyến</strong>
		</div>
		<ul id="catalog-products-list" class="fl wright list-none top5">
			<li class="fl pd5 w240"><a class="fl pdl10"
				title="Chăm sóc khách hàng"
				href="ymsgr:SendIM?auction_supporter&amp;m=Hello !!"><img
					alt="" src="${pageContext.request.contextPath}/resources/v2/images/on.gif" /></a><span class="fl l5">
					- Chăm sóc khách hàng</span></li>
			<li class="fl wright das_top h1"></li>
			<li class="fl pd5 w240"><a class="fl pdl10"
				title="Phòng kinh doanh"
				href="ymsgr:SendIM?auction_supporter&amp;m=Hello !!"><img
					alt="" src="${pageContext.request.contextPath}/resources/v2/images/on.gif" /></a><span class="fl l5">
					- Phòng kinh doanh</span></li>
			<li class="fl wright das_top h1"></li>
		</ul>
	</div>
</div>
<!-- Right side END -->