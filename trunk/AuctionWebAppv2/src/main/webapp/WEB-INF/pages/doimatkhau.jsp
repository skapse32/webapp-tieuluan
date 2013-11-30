<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
	<form id="Form_Registration" method="post"
		action="${pageContext.request.contextPath}/taikhoan/doimatkhau?action=thaydoi">
		<h2 class="h2row" align="center">Thay đổi mật khảu</h2>
		<br />
		<table style="width: 98%; font-size: 10pt">
			<tr>
				<td style="width: 290px; vertical-align: middle;" align="right">Mật
					khẩu hiện tại&nbsp;</td>
				<td><span id="spMKHienTai"> <input type="password"
						name="MKHienTai" id="MKHienTai" /> <span
						class="passwordRequiredMsg">*</span></span></td>
			</tr>
			<tr>
				<td style="width: 290px; vertical-align: middle;" align="right">Mật
					khẩu mới&nbsp;</td>
				<td><span id="spMatKhau"> <input type="password"
						name="MatKhau" id="MatKhau" /> <span class="passwordRequiredMsg">*</span><span
						class="passwordMinCharsMsg">Mật khẩu ít nhất phải có 6 ký
							tự</span> </span></td>
			</tr>
			<tr>
				<td style="width: 290px; vertical-align: middle;" align="right">Nhập
					lại mật khẩu&nbsp;</td>
				<td><span id="scNhapLai"> <input type="password"
						name="NhapLai" id="NhapLai" /> <span class="confirmRequiredMsg">*</span>
						<span class="confirmInvalidMsg">Xác nhận mật khẩu chưa đúng</span>
				</span>
				</td>
			</tr>
		</table>
		<div align="center">
			<p style="color: Red">${error}</p>
			<input name="btnDangKy" type="submit" value="Đổi mật khẩu" onclick="" />
		</div>
	</form><br />
	<script type="text/javascript">
		var sprypassword1 = new Spry.Widget.ValidationPassword("spMKHienTai", {
			minChars : 6,
			validateOn : [ "change" ]
		});
		var sprypassword2 = new Spry.Widget.ValidationPassword("spMatKhau", {
			minChars : 6,
			validateOn : [ "change" ]
		});
		var spryconfirm1 = new Spry.Widget.ValidationConfirm("scNhapLai",
				"MatKhau", {
					validateOn : [ "change" ]
				});
	</script>
</div>
