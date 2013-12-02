<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div id="content" class="wmain">
	<!-- start left-box -->
	<div id="box-left" class="fl top10 bg_white wleft">
		<div id="products-group" class="fl bg-top-products wleft">
			<div id="browser-modules" class="fl browser fontTahoma">
				<a href="" class="fl url_home l8 right8"> <img class="fl w21-18"
					alt="" src="resources/v2/images/blank.gif" />
				</a>
				<div class="fl top3 right8">
					<a class="fl link_blue bold" href="">Đăng ký tài khoản</a>
				</div>
			</div>
		</div>
		<form id="Form_Registration" method="post"
			action="${pageContext.request.contextPath}/dangky?action=dangky"
			accept-charset="ISO-8859-1">
			<h2 class="h2row" align="center">Đăng ký tài khoản</h2>
			<div style="height: 20px; text-align: center; margin-top: 7px;">(*)
				Xin bạn điền đầy đủ và chính xác các thông tin này</div>
			<table class="product_technical_table" cellpadding="0"
				cellspacing="0"
				style="font-family: Tahoma, Verdana; border-collapse: collapse; width: 730px">
				<tbody style="font-family: Tahoma, Verdana;">
					<tr class="title"
						style="background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: rgb(229, 229, 229); color: rgb(204, 0, 0); font-weight: bold; text-align: center;">
						<td colspan="2" lang="vi"
							style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
							<span style="font-size: 10pt; font-family: Arial;"
							class="Apple-style-span"> Thông tin tài khoản </span>
						</td>
					</tr>
					<tr class="technical" style="font-family: Tahoma, Verdana;">
						<td class="name"
							style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;">
							<span style="font-size: 10pt; font-family: Arial;"
							class="Apple-style-span"> Tên đăng nhập :</span>
						</td>
						<td class="value"
							style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
							<span style="font-size: 10pt; font-family: Arial;"
							class="Apple-style-span" id="stfTaiKhoan"> <input
								type="text" name="TaiKhoan" id="TaiKhoan" value="${tenDN}" /> <span
								class="textfieldRequiredMsg">*</span>
						</span> <label style="display: none; color: #F00" id="lblErrorTaiKhoan">Tài
								khoản này đã có người sử dụng</label>
						</td>
					</tr>
					<tr>
						<td></td>
						<td>&nbsp;Bạn chỉ được nhập các ký tự a-z, A-Z và số 0-9</td>
						<td></td>
					</tr>
					<tr>
						<td class="name"
							style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;">
							<span style="font-size: 10pt; font-family: Arial;"
							class="Apple-style-span"> Mật khẩu(*) :</span>
						</td>
						<td class="value"
							style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
							<span style="font-size: 10pt; font-family: Arial;"
							class="Apple-style-span" id="spMatKhau"> <input
								type="password" name="MatKhau" id="MatKhau" /> <span
								class="passwordRequiredMsg">*</span><span
								class="passwordMinCharsMsg">Mật khẩu ít nhất phải có 6 ký
									tự</span>
						</span>
						</td>
					</tr>
					<tr>
						<td class="name"
							style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;">
							<span style="font-size: 10pt; font-family: Arial;"
							class="Apple-style-span"> Nhập lại mật khẩu :</span>
						</td>
						<td class="value"
							style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
							<span style="font-size: 10pt; font-family: Arial;"
							class="Apple-style-span" id="scNhapLai"> <input
								type="password" name="NhapLai" id="NhapLai" /> <span
								class="confirmRequiredMsg">*</span><span
								class="confirmInvalidMsg">Xác nhận mật khẩu chưa đúng</span>
							</span>
						</td>
					</tr>
				</tbody>
				<tr class="title"
					style="background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: rgb(229, 229, 229); color: rgb(204, 0, 0); font-weight: bold; text-align: center;">
					<td colspan="2" lang="vi"
						style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
						<span style="font-size: 10pt; font-family: Arial;"
						class="Apple-style-span"> Thông tin tài khoản </span>
					</td>
				</tr>
				<tr>
					<td class="name"
						style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;">
						<span style="font-size: 10pt; font-family: Arial;"
						class="Apple-style-span"> Họ tên (*) :</span>
					</td>
					<td class="value"
							style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
							<span style="font-size: 10pt; font-family: Arial;"
							class="Apple-style-span" id="stfHoTen"> <input type="text"
							name="HoTen" id="HoTen" /> <span class="textfieldRequiredMsg">*</span>
					</span></td>
				</tr>
				<tr>
					<td class="name"
						style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;">
						<span style="font-size: 10pt; font-family: Arial;"
						class="Apple-style-span"> Ngày sinh(*) :</span>
					</td>
					<td class="value"
							style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
							<span style="font-size: 10pt; font-family: Arial;"
							class="Apple-style-span" id="stfNgaySinh"> <input type="text"
							name="NgaySinh" id="NgaySinh" /> <span
							class="textfieldRequiredMsg">*</span><span
							class="textfieldInvalidFormatMsg">Kh&ocirc;ng đ&uacute;ng
								định dạng ng&agrave;y</span>
							<br />
							&nbsp;Ví dụ: 30-12-1992
					</span></td>
				</tr>
				<tr>
					<td class="name"
						style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;">
						<span style="font-size: 10pt; font-family: Arial;"
						class="Apple-style-span"> Địa chỉ(*) :</span>
					</td>
					<td class="value"
							style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
							<span style="font-size: 10pt; font-family: Arial;"
							class="Apple-style-span" id="stfDiaChi"> <input type="text"
							name="DiaChi" id="DiaChi" size="50" /> <span
							class="textfieldRequiredMsg">*</span>
					</span></td>
				</tr>
				<tr>
					<td class="name"
						style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;">
						<span style="font-size: 10pt; font-family: Arial;"
						class="Apple-style-span"> Số điện thoại (*) :</span>
					</td>
					<td class="value"
							style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
							<span style="font-size: 10pt; font-family: Arial;"
							class="Apple-style-span" id="stfSoDienThoai"> <input type="text"
							name="SoDienThoai" id="SoDienThoai" /> <span
							class="textfieldRequiredMsg">*</span><span
							class="textfieldInvalidFormatMsg">Bạn không được nhập chữ</span>
							<span class="textfieldMaxCharsMsg">*</span><span
							class="textfieldMinCharsMsg">*</span>
					</span></td>
				</tr>
				<tr>
					<td class="name"
						style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;">
						<span style="font-size: 10pt; font-family: Arial;"
						class="Apple-style-span"> Email (*) :</span>
					</td>
					<td class="value"
							style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
							<span style="font-size: 10pt; font-family: Arial;"
							class="Apple-style-span" id="stfEmail"> <input type="text"
							name="Email" id="Email" size="40" onblur="kiemTraEmail()" /> <span
							class="textfieldInvalidFormatMsg">Chưa đúng địng dạng
								email</span><span class="textfieldRequiredMsg">*</span>
					</span>
					</td>
				</tr>
				<tr>
					<td class="name"
						style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;">
						<span style="font-size: 10pt; font-family: Arial;"
						class="Apple-style-span"> Giới tính :</span>
					</td>
					<td class="value"
							style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
							<span style="font-size: 10pt; font-family: Arial;"
							class="Apple-style-span" ><input
						type="radio" name="GioiTinh" value="Nam" checked="checked" /> Nam
						<input type="radio" name="GioiTinh" value="Nu" /> Nữ
						</span>
					</td>
				</tr>
				<tr class="title"
					style="background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: rgb(229, 229, 229); color: rgb(204, 0, 0); font-weight: bold; text-align: center;">
					<td colspan="2" lang="vi"
						style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
						<span style="font-size: 10pt; font-family: Arial;"
						class="Apple-style-span"> <p style="color: Red">${error}</p>
				<input name="btnDangKy" type="submit" value="Đăng ký" onclick="" /> </span>
					</td>
				</tr>
			</table>
		</form>
	</div>
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
					validateOn : [ "blur" ],
					format : "dd-mm-yyyy"
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
					validateOn : [ "blur" ],
					maxChars : 11,
					minChars : 10
				});
	</script>

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
</div>