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
<div class="Column9">
	<h2 id="HomepageFeaturedList" class="h2row" style="text-align: center">
		${tieude}<br>
	</h2>
	<h3 class="h3row">Thông tin tài khoản</h3>
	<div class="divMain">
		<div class="divSubLeft">
			<img
				src="${pageContext.request.contextPath}/resources/images/bg_userinfo.jpg">
		</div>
		<div class="divSubRight">
			<table style="width: 100%">
				<tr>
					<td width="100px" class="rowCustom">Tên đăng nhập</td>
					<td class="rowCustom1">${user.username}</td>
				</tr>
				<tr>
					<td class="rowCustom">Email</td>
					<td class="rowCustom1">${user.email}</td>
				</tr>
				<tr>
					<td class="rowCustom">Họ tên</td>
					<td class="rowCustom1">${user.hoTen}</td>
				</tr>
				<tr>
					<td class="rowCustom">Ngày sinh</td>
					<td class="rowCustom1">${user.ngaySinh}</td>
				</tr>
				<tr>
					<td class="rowCustom">Giới tính</td>
					<td class="rowCustom1">${gioiTinh}</td>
				</tr>
				<tr>
					<td class="rowCustom">Địa chỉ</td>
					<td class="rowCustom1">${user.diaChi}</td>
				</tr>
				<tr>
					<td class="rowCustom">Điện thoại</td>
					<td class="rowCustom1">${user.dienThoai}</td>
				</tr>
			</table>
		</div>
	</div>
	<div class="DIVclear0"></div>
	<h3 class="h3row">Chức năng</h3>
	<div class="divMain">
		<div class="divSubLeft2">
		<table style="width: 100%">
			<tr>
				<td style="width: 50px">
					<img src="${pageContext.request.contextPath}/resources/images/bg_changepassword.jpg">
				</td>
				<td style="vertical-align: middle;">
					<a href="${pageContext.request.contextPath}/taikhoan/doimatkhau">Thay đổi mật khẩu</a>
				</td>			
			</tr>
				<tr>
				<td style="width: 50px">
					<img src="${pageContext.request.contextPath}/resources/images/bg_auctionlist.jpg">
				</td>
				<td style="vertical-align: middle;">
					<a href="${pageContext.request.contextPath}/qlsanphamdangthamgia">Quản lý các phiên đấu giá</a>
				</td>			
			</tr>
		</table>
		</div>
		<div class="divSubRight2">
			<img
				src="${pageContext.request.contextPath}/resources/images/bg_config.jpg">
		</div>
	</div>
</div>
	<div class="DIVclear"></div>


