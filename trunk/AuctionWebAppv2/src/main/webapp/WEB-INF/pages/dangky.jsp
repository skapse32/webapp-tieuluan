<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<script type="text/javascript">

function checkUserName(value)
{
	if(value) {
		$('#usercheck').html('<img src="${pageContext.request.contextPath}/resources/v2/images/ajax-loader.gif" />');
		$.post("${pageContext.request.contextPath}/checkUser", {
			username : value
		}, function(data) {
			if (data != '' || data != undefined || data != null) {
				if (data == "true") {
					data = '<span class="error">Tài khoản đã tồn tại</span>';
				} else {
					data = '<span class="success">Tên đăng nhập hợp lệ</span>';
				}
				$('#usercheck').html(data);				
			}
		});
	}
	else
	{
		$('#usercheck').html("");
	}
}

function checkEmail(value)
{
	if(isEmail(value)) {
		$('#emailcheck').html('<img src="${pageContext.request.contextPath}/resources/v2/images/ajax-loader.gif" />');
		$.post("${pageContext.request.contextPath}/checkEmail", {
			email : value
		}, function(data) {
			if (data != '' || data != undefined || data != null) {
				if (data == "true") {
					data = '<span class="error">Email này đã có người sử dụng.</span>';
				} else {
					data = '<span class="success">Email hợp lệ</span>';
				}
				$('#emailcheck').html(data);	
			}
		});
	}
	else
	{
		$('#emailcheck').html("");
	}
}

function isEmail(x)
{
	var atpos=x.indexOf("@");
	var dotpos=x.lastIndexOf(".");
	if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length)
	{
		return false;
	}
	else
	{
	return true;
	}
}
</script>


<div id="content" class="wmain">
	<!-- start left-box -->
	<div id="box-left" class="fl top10 bg_white wleft">
		<div id="products-group" class="fl bg-top-products wleft">
			<div id="browser-modules" class="fl browser fontTahoma">
				<a href="" class="fl url_home l8 right8"> <img class="fl w21-18"
					alt="" src="${pageContext.request.contextPath}/resources/v2/images/blank.gif" />
				</a>
				<div class="fl top3 right8">
					<a class="fl link_blue bold" href="">Đăng ký tài khoản</a>
				</div>
			</div>
		</div>
		<form id="Form_Registration" method="post"
			action="${pageContext.request.contextPath}/dangky?action=dangky"
			accept-charset="ISO-8859-1">
			<table width="730px">
				<tbody>
					<tr>
						<td colspan="2" class="title">Thông tin đăng nhập</td>
					</tr>
					<tr>
						<td><span>Tên đăng nhập :</span></td>
						<td><span class="Apple-style-span"
								id="stfTaiKhoan"> <input type="text" name="username"
									id="username" value="${tenDN}"
									onchange="checkUserName(this.value)" /> <span id="usercheck"></span>
									<span class="textfieldRequiredMsg">*</span>
							</span> <label style="display: none; color: #F00" id="lblErrorTaiKhoan">Tài
									khoản này đã có người sử dụng</label></span></td>
					</tr>
					<tr>
						<td><span>Mật khẩu(*) :</span></td>
						<td><span class="Apple-style-span"
								id="spMatKhau"> <input type="password" name="MatKhau"
									id="MatKhau" /> <span class="passwordRequiredMsg">*</span><span
									class="passwordMinCharsMsg">Mật khẩu phải có ít nhất 6
										ký tự</span>
							</span></td>
					</tr>
					<tr>
						<td><span>Nhập lại mật khẩu :</span></td>
						<td><span class="Apple-style-span"
								id="scNhapLai"> <input type="password" name="NhapLai"
									id="NhapLai" /> <span class="confirmRequiredMsg">*</span><span
									class="confirmInvalidMsg">Xác nhận mật khẩu chưa khớp</span>
							</span></td>
					</tr>
				</tbody>
				<tr>

					<td colspan="2" class="title">Thông tin tài khoản</span></td>
				</tr>
				<tr>
					<td><span>Họ tên (*) :</span></td>
					<td><span class="Apple-style-span" id="stfHoTen">
								<input type="text" name="HoTen" id="HoTen" /> <span
								class="textfieldRequiredMsg">*</span>
						</span></td>
				</tr>
				<tr>
					<td><span>Ngày sinh(*) :</span></td>
					<td><span class="Apple-style-span"
							id="stfNgaySinh"> <input type="date" name="NgaySinh"
								id="NgaySinh" /> <span
								class="textfieldRequiredMsg">*</span><span
								class="textfieldInvalidFormatMsg">*</span>
						</span></td>
				</tr>
				<tr>
					<td><span>Địa chỉ(*) :</span></td>
					<td><span class="Apple-style-span" id="stfDiaChi">
								<input type="text" name="DiaChi" id="DiaChi" size="50" /> <span
								class="textfieldRequiredMsg">*</span>
						</span></td>
				</tr>
				<tr>
					<td><span>Số điện thoại (*) :</span></td>
					<td><span class="Apple-style-span"
							id="stfSoDienThoai"> <input type="text" name="SoDienThoai"
								id="SoDienThoai" /> <span class="textfieldRequiredMsg">*</span><span
								class="textfieldInvalidFormatMsg">Bạn không được nhập chữ</span>
								<span class="textfieldMaxCharsMsg">*</span><span
								class="textfieldMinCharsMsg">*</span>
						</span></td>
				</tr>
				<tr>
					<td><span>Email (*) :</span></td>
					<td><span class="Apple-style-span" id="stfEmail">
								<input type="text" name="email" id="email" 
								onchange="checkEmail(this.value)" /> <span id="emailcheck"></span>
								<span class="textfieldInvalidFormatMsg">Chưa đúng địng
									dạng email</span><span class="textfieldRequiredMsg">*</span>
						</span></td>
				</tr>
				<tr>
					<td><span>Giới tính :</span></td>
					<td><span><input type="radio" name="GioiTinh"
							value="Nam" checked="checked" /> Nam <input type="radio"
							name="GioiTinh" value="Nu" /> Nữ</span></td>
				</tr>
				<tr>
					<td colspan="2" class="registerNode"><span> <font color="red">(*)</font> Xin hãy điền đầy đủ và chính
							xác các thông tin này.</span>
								
						<p style="color: Red">${error}</p></td>
				</tr>
				<tr>
					<td colspan="2" class="registerSubmit">
						<input name="btnDangKy" type="submit" value="Đăng ký"/>
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
				"custom", {
					validateOn : [ "blur" ]
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
		<div id="catalog-products" class="fl top10 wright">
			<div id="catalog-products-titles"
				class="fl bg-titles products-group-title-news color_white fontTahoma wright-26">
				<strong>Hỗ trợ trực tuyến</strong>
			</div>
			<ul id="catalog-products-list" class="fl wright list-none top5">
				<li class="fl pd5 w240"><a class="fl pdl10"
					title="Chăm sóc khách hàng"
					href="ymsgr:SendIM?auction_01&amp;m=Hello !!"><img
						alt="" src="${pageContext.request.contextPath}/resources/v2/images/on.gif" /></a><span class="fl l5">
						- Chăm sóc khách hàng</span></li>
				<li class="fl wright das_top h1"></li>
				<li class="fl pd5 w240"><a class="fl pdl10"
					title="Phòng kinh doanh"
					href="ymsgr:SendIM?auction_02&amp;m=Hello !!"><img
						alt="" src="${pageContext.request.contextPath}/resources/v2/images/on.gif" /></a><span class="fl l5">
						- Phòng kinh doanh</span></li>
				<li class="fl wright das_top h1"></li>
			</ul>
		</div>

		<!-- End right box -->
	</div>
</div>