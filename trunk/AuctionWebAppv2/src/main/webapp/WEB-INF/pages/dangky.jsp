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
	<form id="Form_Registration" method="post"
		action="${pageContext.request.contextPath}/dangky?action=dangky" accept-charset="ISO-8859-1">
		<h2 class="h2row" align="center">Đăng ký tài khoản</h2>
		<div style="height: 20px; text-align: center; margin-top: 7px;">(*) Xin bạn điền đầy đủ và chính xác các thông tin này</div>
		<h3 class="h3row">Thông tin tài khoản</h3>
		<div align="center">
			<table style="width: 98%; font-size: 10pt">
				<tr>
					<td style="width: 150px; vertical-align: middle;">Tên đăng
						nhập (*)</td>
					<td><span id="stfTaiKhoan"> <input type="text"
							name="TaiKhoan" id="TaiKhoan" value="${tenDN}" /> <span
							class="textfieldRequiredMsg">*</span> </span> <label
						style="display:none; color:#F00" id="lblErrorTaiKhoan">Tài
							khoản này đã có người sử dụng</label></td>
				</tr>
					<tr>
					<td></td>
					<td>&nbsp;Bạn chỉ được nhập các ký tự a-z, A-Z và số 0-9</td>
					<td></td>
				</tr>
				<tr>
					<td style="width: 150px; vertical-align: middle;">Mật khẩu (*)</td>
					<td><span id="spMatKhau"> <input type="password"
							name="MatKhau" id="MatKhau" /> <span class="passwordRequiredMsg">*</span><span
							class="passwordMinCharsMsg">Mật khẩu ít nhất phải có 6 ký
								tự</span> </span>
					</td>
				</tr>
				<tr>
					<td style="width: 150px; vertical-align: middle;">Nhập lại mật
						khẩu</td>
					<td><span id="scNhapLai"> <input type="password"
							name="NhapLai" id="NhapLai" /> <span class="confirmRequiredMsg">*</span><span
							class="confirmInvalidMsg">Xác nhận mật khẩu chưa đúng</span> </span>
					</td>
				</tr>

			</table>
			<h3 class="h3row" align="left">Thông tin người dùng</h3>
			<table style="width: 98%; font-size: 10pt">
				<tr>
					<td style="width: 150px; vertical-align: middle;">Họ tên (*)</td>
					<td><span id="stfHoTen"> <input type="text"
							name="HoTen" id="HoTen" /> <span class="textfieldRequiredMsg">*</span>
					</span></td>
				</tr>
				<tr>
					<td style="width: 150px; vertical-align: middle;">Ngày sinh (*)</td>
					<td><span id="stfNgaySinh"> <input type="text"
							name="NgaySinh" id="NgaySinh" /> <span
							class="textfieldRequiredMsg">*</span><span
							class="textfieldInvalidFormatMsg">Kh&ocirc;ng đ&uacute;ng
								định dạng ng&agrave;y</span> </span></td>
				</tr>
				<tr>
					<td></td>
					<td>&nbsp;Ví dụ: 30-12-1991</td>
					<td></td>
				</tr>
				<tr>
					<td style="width: 150px; vertical-align: middle;">Địa chỉ (*)</td>
					<td><span id="stfDiaChi"> <input type="text"
							name="DiaChi" id="DiaChi" size="50" /> <span
							class="textfieldRequiredMsg">*</span> </span></td>
				</tr>
				<tr>
					<td style="width: 150px; vertical-align: middle;">Số điện
						thoại (*)</td>
					<td><span id="stfSoDienThoai"> <input type="text"
							name="SoDienThoai" id="SoDienThoai" /> <span
							class="textfieldRequiredMsg">*</span><span
							class="textfieldInvalidFormatMsg">Bạn không được nhập chữ</span>
							<span class="textfieldMaxCharsMsg">*</span><span class="textfieldMinCharsMsg">*</span>
					</span>
					</td>
				</tr>
				<tr>
					<td style="width: 150px; vertical-align: middle;">Email (*)</td>
					<td><span id="stfEmail"> <input type="text"
							name="Email" id="Email" size="40" onblur="kiemTraEmail()" /> <span
							class="textfieldInvalidFormatMsg">Chưa đúng địng dạng
								email</span><span class="textfieldRequiredMsg">*</span> </span>
					</td>
				</tr>
				<tr>
					<td style="width: 150px; height: 25px; vertical-align: middle;">Giới
						tính</td>
					<td style="height: 25px; vertical-align: middle;"><input
						type="radio" name="GioiTinh" value="Nam" checked="checked" /> Nam
						<input type="radio" name="GioiTinh" value="Nu" /> Nữ</td>
				</tr>
			</table>
		</div>
		<div align="center">
			<p style="color: Red">${error}</p>
			<input name="btnDangKy"
				type="submit" value="Đăng ký" onclick="" /> 
		</div>

	</form>
	<script type="text/javascript">
		var sprytextfield1 = new Spry.Widget.ValidationTextField("stfHoTen",
				"custom", {
					validateOn : [ "change" ]
				});
		var sprytextfield3 = new Spry.Widget.ValidationTextField("stfEmail",
				"email", {
					validateOn : [ "change" ]
				});
		var sprytextfield6 = new Spry.Widget.ValidationTextField("stfTaiKhoan",
				"none", {
					validateOn : [ "change" ]
				});
		var sprypassword2 = new Spry.Widget.ValidationPassword("spMatKhau", {
			minChars : 6,
			validateOn : [ "change" ]
		});
		var sprytextfield8 = new Spry.Widget.ValidationTextField("stfNgaySinh",
				"date", {
					validateOn : [ "blur" ], format:"dd-mm-yyyy"
				});
		var sprytextfield9 = new Spry.Widget.ValidationTextField("stfDiaChi",
				"none", {
					validateOn : [ "change" ]
				});
		var spryconfirm1 = new Spry.Widget.ValidationConfirm("scNhapLai",
				"MatKhau", {
					validateOn : [ "change" ]
				});
		var sprytextfield2 = new Spry.Widget.ValidationTextField(
				"stfSoDienThoai", "integer", {
					validateOn : [ "blur" ], maxChars:11, minChars:10
				});
	</script>
</div>