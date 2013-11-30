<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">
	function pad(d) {
		return (d < 10) ? '0' + d.toString() : d.toString();
	}
</script>
<form action="${pageContext.request.contextPath}/timkiemdadau">
	<div class="Column3">
		
		<input type="hidden" id="maLoaiSP" name="maLoaiSP" value="${maLoaiSP}">
		<input type="hidden"  id="page" name="trang" value="${trang}"> <input
			type="hidden" id="size" value="${soLuongSanPhamTrenTrang}">
		<h2 id="RegionList" class="h2row">SẢN PHẨM ĐẤU GIÁ</h2>
		<ul class="CategoriesList">
			<li class="CategoryList"><a
				href="${pageContext.request.contextPath}/sanphamdangdau">+&nbsp;
					Sản phẩm đang đấu giá</a></li>
			<li class="CategoryList"><a
				href="${pageContext.request.contextPath}/sanphamsapdau">+&nbsp;
					Sản phẩm sắp đấu giá</a></li>
			<li class="CategoryList" style="background-color: gainsboro;"><a
				href="${pageContext.request.contextPath}/sanphamdadau">+&nbsp;
					Sản phẩm đã đấu giá</a></li>

		</ul>
	</div>
	<!-- InstanceBeginEditable name="MainRegion" -->
	<div class="Column9">
		<h2 id="HomepageFeaturedList" class="h2row" style="text-align: center">${tieude}</h2>
		<br>
		<div style="font-size: 16px;margin-left: 25px;">Tên sản phẩm:&nbsp;"
		<span style="color: blue;">${sessionScope.tensp}
		</span>
		"
		</div>
		<br>
		<div>
			<table width="100%">
				<tr>
					<td width="70%" align="center"><label style="">Trang
							&nbsp;</label> <c:forEach var="i" begin="1" end="${soTrang}" step="1">
							<a style="color:#00C"
								href="${pageContext.request.contextPath}/timkiemdadau?trang=${i}&soLuongSanPhamTrenTrang=${soLuongSanPhamTrenTrang}">

								<c:choose>
									<c:when test="${i==trang}">
										<input type="button" value="${i}"
											style="width: 25px;background-color: inactivecaption" />
									</c:when>
									<c:otherwise>
										<input type="button" value="${i}" style="width: 25px" />
									</c:otherwise>
								</c:choose> </a>
						</c:forEach></td>
					<td width="30%" align="right"><label
						for="soLuongSanPhamTrenTrang">Số lượng</label> <select
						name="soLuongSanPhamTrenTrang" onchange="submit()">
							<c:forEach var="i" begin="1" end="5">
								<option
									<c:if test="${i*8 == soLuongSanPhamTrenTrang}" >
		                                selected="selected"
		                            </c:if>
									value="${i*8}">${i*8}</option>
							</c:forEach>
							<option
								<c:if test="${soLuongSanPhamTrenTrang==-1}" >
		                            selected="selected"
		                        </c:if>
								value="-1">Tất cả</option>
					</select></td>
				</tr>
			</table>
		</div>


		<c:forEach var="sp" items="${dssp}">

			<div class="HomePageFeaturedItem">
				<div style="width: 148px;height: 45px;position: relative;">
					<h1>${sp.tensp}</h1>
				</div>
				<a
					href="${pageContext.request.contextPath}/chitietsanpham?masp=${sp.masp}"><img
					src="${imageDirectory}${sp.hinhanh}" height="150" width="150">
				</a>

				<div style="color: #2DAB00;font-size: 16px;font-weight: bold;">
					<fmt:formatNumber type="currency" currencyCode="VND"
						value="${sp.giahientai}" />
				</div>
				<div style="color: #7E7C7C;font-size: 16px;font-weight: bold;">
					${sp.nguoidat}</div>
				<div align="center" class="HomePageFeaturedItem_time">
					<div style="color: blue;font-size: 14px;font-weight: bold;">
						<jsp:useBean id="myDate" class="java.util.Date" />
						<c:set target="${myDate}" property="time"
							value="${sp.thoigianketthuc}" />
						<fmt:formatDate pattern="HH:mm:ss dd-MM-yyyy" value="${myDate}" />
					</div>
				</div>

			</div>

		</c:forEach>

	</div>
	<!-- InstanceEndEditable -->
</form>
<div class="DIVclear"></div>



