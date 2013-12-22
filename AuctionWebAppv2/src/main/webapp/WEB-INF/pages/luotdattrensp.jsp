<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="myDate" class="java.util.Date" />


<div id="content" class="wmain">
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
					<a class="fl link_blue bold" href="">Danh sách đặt giá bạn đã đặt</a>
				</div>
			</div>
		</div>
		<table class="product_technical_table"
			style="font-family: Tahoma, Verdana; border-collapse: collapse; width: 340px; margin: auto">
			<tbody style="font-family: Tahoma, Verdana;">
				<tr class="title"
					style="background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: rgb(229, 229, 229); color: rgb(204, 0, 0); font-weight: bold; text-align: center;">
					<td lang="vi"
						style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
						<span style="font-size: 10pt; font-family: Arial;"
						class="Apple-style-span"> STT </span>
					</td>
					<td lang="vi"
						style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
						<span style="font-size: 10pt; font-family: Arial;"
						class="Apple-style-span"> Thời gian </span>
					</td>
					<td lang="vi"
						style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
						<span style="font-size: 10pt; font-family: Arial;"
						class="Apple-style-span"> Giá </span>
					</td>
				</tr>
				<%
					int i = 0;
				%>
				<c:forEach var="ls" items="${lss}">
					<%
						i++;
					%>
					<tr class="technical" style="font-family: Tahoma, Verdana;">
						<td class="name"
							style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: center;">
							<span style="font-size: 10pt; font-family: Arial;"
							class="Apple-style-span"><span lang="vi"
								style="font-size: 10pt;" class="Apple-style-span"><%=i%></span>
						</span>
						</td>
						<td class="name"
							style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: center;">
							<span style="font-size: 10pt; font-family: Arial;"
							class="Apple-style-span"><c:set target="${myDate}"
											property="time" value="${ls.getThoigian()}" /> <fmt:formatDate
											pattern="HH:mm:ss dd-MM-yyyy" value="${myDate}" /></span>
						</td>
						<td class="name"
							style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: center;">
							<span style="font-size: 10pt; font-family: Arial;"
							class="Apple-style-span"><span lang="vi"
								style="font-size: 10pt;" class="Apple-style-span" id="gia"> ${ls.getGiadat()}&nbsp;</span>
						</span> <script>
							var x = numeral("${ls.getGiadat()}").format('0,0');
							x = x.replace(/,/g, ".");
							document.getElementById("gia").innerHTML = x
									+ "&nbsp;đ";
						</script>
						</td>
					</tr>
				</c:forEach>
				
			</tbody>
		</table>
	</div>

	<!-- right side -->
	<div id="box-right" class="fl l10 top10 bg_white wright cright">
		<div id="catalog-products" class="fl wright">
			<div id="catalog-products-titles"
				class="fl bg-titles top10 products-group-title-news color_white fontTahoma wright-26">
				<strong>Người đăng : ${sp.nguoidang }</strong>
			</div>
			<ul id="catalog-products-list"
				class="fl fontTahoma wright list-none top5">
				<li class="fl pd5 w240 "><a class="fl pdl20" href="#">
						Thông tin người đăng</a></li>
				<li class="fl wright das_top h1"></li>
				<li class="fl pd5 w240 "><a class="fl pdl20" href="#"> Độ
						tin cậy : 50%</a></li>
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
					href="ymsgr:SendIM?phamhoaquan&amp;m=Hello Yamaha Motor"><img
						alt="" src="resources/v2/images/on.gif" /></a><span class="fl l5">
						- Chăm sóc khách hàng</span></li>
				<li class="fl wright das_top h1"></li>
				<li class="fl pd5 w240"><a class="fl pdl10"
					title="Phòng kinh doanh"
					href="ymsgr:SendIM?phamhoaquan&amp;m=Hello Yamaha Motor"><img
						alt="" src="resources/v2/images/on.gif" /></a><span class="fl l5">
						- Phòng kinh doanh</span></li>
				<li class="fl wright das_top h1"></li>
			</ul>
		</div>
	</div>
</div>
