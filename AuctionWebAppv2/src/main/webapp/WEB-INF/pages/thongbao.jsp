<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<div class="Column3">
		<h2 id="CategoryList" class="h2row">DANH MỤC</h2>
		<ul class="CategoriesList">
			<c:choose>
				<c:when test="${sessionScope.dsloaisp != null}">
					<c:forEach var="lsp" items="${sessionScope.dsloaisp}">
						<c:choose>
							<c:when test="${lsp.maloaisp == maLoaiSP}">
								<li class="CategoryList" style="background-color: gainsboro;"><a
									href="${pageContext.request.contextPath}/sanphamdadau?maLoaiSP=${lsp.maloaisp}&trang=${trang}&soLuongSanPhamTrenTrang=${soLuongSanPhamTrenTrang}">+&nbsp;${lsp.tenloaisp}</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="CategoryList"><a
									href="${pageContext.request.contextPath}/sanphamdadau?maLoaiSP=${lsp.maloaisp}&trang=${trang}&soLuongSanPhamTrenTrang=${soLuongSanPhamTrenTrang}">+&nbsp;${lsp.tenloaisp}</a>
								</li>
							</c:otherwise>
						</c:choose>

					</c:forEach>
					<c:choose>
						<c:when test="${-1 == maLoaiSP}">
							<li class="CategoryList" style="background-color: gainsboro;"><a
								href="${pageContext.request.contextPath}/sanphamdadau?maLoaiSP=-1&trang=${trang}&soLuongSanPhamTrenTrang=${soLuongSanPhamTrenTrang}">+&nbsp;Tất
									cả</a></li>
						</c:when>
						<c:otherwise>
							<li class="CategoryList"><a
								href="${pageContext.request.contextPath}/sanphamdadau?maLoaiSP=-1&trang=${trang}&soLuongSanPhamTrenTrang=${soLuongSanPhamTrenTrang}">+&nbsp;Tất
									cả</a></li>
						</c:otherwise>
					</c:choose>

				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>

		</ul>
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
		<form action="${pageContext.request.contextPath}/trangdaugia"
			method="get">
			<!-- InstanceBeginEditable name="MainRegion" -->
			<div class="Column9">
				<h2 id="HomepageFeaturedList" class="h2row"
					style="text-align: center">${tieude}</h2>
				<div style="text-align:center;padding-top: 10px; ">
					<h3>${noidung}</h3>
				</div>


				

			</div>
			<!-- InstanceEndEditable -->
			<div class="DIVclear"></div>
		</form>
