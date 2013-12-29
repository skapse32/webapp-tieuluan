<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="myDate" class="java.util.Date" />

<div id="content" class="wmain">
	<div id="box-left" class="fl top10 bg_white wleft">
<!-- 	 -->
	
	<!-- left box -->
		<div id="yamaha-xe-ga" class="bor_gr fl top10 bg-top-products wleft">
			<div id="yamaha-xe-ga-title"
				class="fl bg-titles products-group-title-news color_white fontTahoma">
				<a class="link-white" href="#"><strong>${tieude}</strong></a>
			</div>	
			<img alt="" src="${pageContext.request.contextPath}/resources/v2/images/sub-titles.jpg" />
			<div style="float: right; padding-top: 6px">
			<form></form>
			</div>
			<div>
				<table class="bordered">
					<tr>
						<th>Mã hoá đơn</th>
						<th>Mã sản phẩm</th>
						<th>Đơn giá</th>
						<th>Người đăng</th>
						<th>Người mua</th>
						<th>Ngày lập</th>
					</tr>
					<c:forEach var="hd" items="${dshd}">
					<tr>
						<td>${hd.mahoadon}</td>
						<td>${hd.masp}</td>
						<td id="gia${hd.mahoadon}">${hd.dongia}</td>
						 <script>
						 var idd = "gia"+${hd.mahoadon};
							var x = numeral("${hd.dongia}").format('0,0');
							x = x.replace(/,/g, ".");
							document.getElementById(idd).innerHTML = x
									+ "&nbsp;đ";
						</script>
						<td>${hd.nguoidang}</td>
						<td>${hd.nguoimua}</td>
						<td>
						
							<c:set target="${myDate}" property="time" value="${hd.ngaylap}" /> 
							<fmt:formatDate pattern="dd-MM-yyyy" value="${myDate}" />
						</td>
					</tr>
					
					</c:forEach>
				</table>
			</div>
			<a href="${pageContext.request.contextPath}/downloadPDF">Download PDF Document</a>
		</div>	
	</div>
	<!-- right box -->
	<div id="box-right" class="fl l10 top10 bg_white wright cright">
		<div id="catalog-products" class="fl wright">
			<div id="catalog-products-titles"
				class="fl bg-titles top10 products-group-title-news color_white fontTahoma wright-26">
				<strong>Danh mục</strong>
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
										href="${pageContext.request.contextPath}/sanphamdadau?maLoaiSP=${lsp.maloaisp}&trang=${trang}&soLuongSanPhamTrenTrang=${soLuongSanPhamTrenTrang}">+&nbsp;${lsp.tenloaisp}</a>
									</li>
								</c:when>
								<c:otherwise>
									<li class="fl pd5 w240 "><a class="fl  pdl20"
										href="${pageContext.request.contextPath}/sanphamdadau?maLoaiSP=${lsp.maloaisp}&trang=${trang}&soLuongSanPhamTrenTrang=${soLuongSanPhamTrenTrang}">+&nbsp;${lsp.tenloaisp}</a></li>
									<li class="fl wright das_top h1"></li>
								</c:otherwise>
							</c:choose>

						</c:forEach>
						<c:choose>
							<c:when test="${-1 == maLoaiSP}">
								<li class="fl pd5 w240 set-group-bg"><a
										class="fl set-group pdl20"
									href="${pageContext.request.contextPath}/sanphamdadau?maLoaiSP=-1&trang=${trang}&soLuongSanPhamTrenTrang=${soLuongSanPhamTrenTrang}">+&nbsp;Tất
										cả</a></li>
							</c:when>
							<c:otherwise>
								<li class="fl pd5 w240 "><a class="fl  pdl20"
									href="${pageContext.request.contextPath}/sanphamdadau?maLoaiSP=-1&trang=${trang}&soLuongSanPhamTrenTrang=${soLuongSanPhamTrenTrang}">+&nbsp;Tất
										cả</a></li>
							</c:otherwise>
						</c:choose>

					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>

			</ul>
		</div>
		<input type="hidden" id="maLoaiSP" name="maLoaiSP" value="${maLoaiSP}">
		<input type="hidden" id="page" name="trang" value="${trang}">
		<input type="hidden" id="size" value="${soLuongSanPhamTrenTrang}">
		<div id="catalog-products" class="fl wright">
			<div id="catalog-products-titles"
				class="fl bg-titles top10 products-group-title-news color_white fontTahoma wright-26">
				<strong>SẢN PHẨM ĐẤU GIÁ</strong>
			</div>
			<ul id="catalog-products-list"
				class="fl fontTahoma wright list-none top5">
			<li class="fl pd5 w240 "><a class="fl  pdl20"
				href="${pageContext.request.contextPath}/sanphamdangdau.html">+&nbsp;
					Sản phẩm đang đấu giá</a></li>
			<li class="fl pd5 w240 "><a class="fl  pdl20"
				href="${pageContext.request.contextPath}/sanphamsapdau.html">+&nbsp;
					Sản phẩm sắp đấu giá</a></li>
			<li class="fl pd5 w240 "><a class="fl  pdl20"
				href="${pageContext.request.contextPath}/sanphamdadau.html">+&nbsp;
					Sản phẩm đã đấu giá</a></li>

		</ul>
	</div>
	<!-- End right box -->
	<!-- InstanceEndEditable -->
	<div class="DIVclear"></div>
</div>
</div>