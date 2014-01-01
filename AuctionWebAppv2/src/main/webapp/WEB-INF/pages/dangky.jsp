<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!-- Text Editor -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/v2/js/NicEdit/nicEdit.js"></script>
<script type="text/javascript">
        bkLib.onDomLoaded(function() { nicEditors.allTextAreas(); });
</script>
<!-- Text Editor END -->

<!-- Validation -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/v2/js/SpryValidation/SpryValidationCheckbox.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/v2/js/SpryValidation/SpryValidationPassword.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/v2/js/SpryValidation/SpryValidationConfirm.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/v2/js/SpryValidation/SpryValidationTextField.js"></script>

<link href="${pageContext.request.contextPath}/resources/v2/js/SpryValidation/SpryValidationCheckbox.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/v2/js/SpryValidation/SpryValidationPassword.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/v2/js/SpryValidation/SpryValidationConfirm.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/v2/js/SpryValidation/SpryValidationTextField.css" rel="stylesheet" type="text/css" />


<link href="${pageContext.request.contextPath}/resources/v2/css/validation.css" rel="stylesheet" type="text/css" />
<!-- Validation END -->

<!-- jQuery Validation -->
<script type="text/javascript">
function checkUserName(value)
{
	if(value) {
		document.getElementById("btnDangKy").disabled = true;
		$('#usercheck').html('<img src="${pageContext.request.contextPath}/resources/v2/images/ajax-loader.gif" />');
		$.post("${pageContext.request.contextPath}/checkUser", {
			username : value
		}, function(data) {
			if (data != '' || data != undefined || data != null) {
				if (data == "true") {
					data = '<span class="error">Tài khoản đã tồn tại</span>';
				} else if (data == "false"){
					data = '<span class="success">Tên đăng nhập hợp lệ</span>';
					document.getElementById("btnDangKy").disabled = false;
				}
				else
				{
					data = '<span class="error">Không tìm thấy Authentication server</span>';
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
		document.getElementById("btnDangKy").disabled = true;
		$('#emailcheck').html('<img src="${pageContext.request.contextPath}/resources/v2/images/ajax-loader.gif" />');
		$.post("${pageContext.request.contextPath}/checkEmail", {
			email : value
		}, function(data) {
			if (data != '' || data != undefined || data != null) {
				if (data == "true") {
					data = '<span class="error">Email này đã có người sử dụng.</span>';
				} else if(data == "false"){
					data = '<span class="success">Email hợp lệ</span>';
					document.getElementById("btnDangKy").disabled = false;
				}
				else
				{
					data = '<span class="error">Không tìm thấy Authentication server</span>';
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
    var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    if (!filter.test(x))
    {
		return true;
    }
	else
	{
    	return false;
	}
 }
function isEmail(x)
{
	var rx = /^[\w\.-]+@[\w\.-]+\.\w+$/i;
	return rx.test(x);
}
</script>
<!-- jQuery Validation END -->

<div id="content" class="wmain">
	<!-- start left-box -->
	<div id="box-left" class="fl top10 bg_white wleft">
		<div id="products-group" class="fl bg-top-products wleft">
			<div id="browser-modules" class="fl browser fontTahoma">
				<a href="${pageContext.request.contextPath}" class="fl url_home l8 right8"> <img class="fl w21-18"
					alt="" src="${pageContext.request.contextPath}/resources/v2/images/blank.gif" />
				</a>
				<div class="fl top3 right8">
					<a class="fl link_blue bold" href="">Đăng ký tài khoản</a>
				</div>
			</div>
		</div>
		<div id="DangKy">
			<form id="Form_Registration" method="post"
				action="${pageContext.request.contextPath}/dangky?action=dangky">
				<div id="error">${error}</div>
				<table width="100%">
	  <tr>
	    <td class="title">Thông tin đăng nhập</td>
	  </tr>
	  <tr>
	    <td id="stfTaiKhoan"><label for="username">Tên đăng nhập :</label>
	    <input type="text" name="username" id="username" value="${tenDN}" onChange="checkUserName(this.value)">
	    <span id="usercheck"></span>
		<span class="textfieldRequiredMsg">*</span>
		<label style="display: none; color: #F00" id="lblErrorTaiKhoan">Tài khoản này đã có người sử dụng</label>
		</td>
	  </tr>
	  <tr>
	    <td><span id="spMatKhau" class="Apple-style-span"><label for="MatKhau">Mật khẩu :</label>
	    <input name="MatKhau" type="password" id="MatKhau">
	    <span class="passwordRequiredMsg">*</span>
	    <span class="passwordMinCharsMsg">Mật khẩu phải có ít nhất 6 ký tự</span>
	    </span>
		</td>
	  </tr>
	  <tr>
	    <td><span id="scNhapLai" class="Apple-style-span"><label for="NhapLai">Nhập lại mật khẩu :</label>
	    <input type="text" name="NhapLai" id="NhapLai">
	    <span class="confirmRequiredMsg">*</span>
	    <span class="confirmInvalidMsg">Xác nhận mật khẩu chưa khớp</span>
	    </span>
	    </td>
	  </tr>
	  <tr>
	    <td class="title">Thông tin tài khoản</td>
	  </tr>
	  <tr>
	    <td id="stfHoTen"><label for="HoTen">Họ &amp; Tên :</label>
	    <input type="text" name="HoTen" id="HoTen">
	    <span class="textfieldRequiredMsg">*</span>
	    </td>
	  </tr>
	  <tr>
	    <td id="stfNgaySinh"><label for="NgaySinh">Ngày sinh :</label>
	    <input type="text" name="NgaySinh" id="NgaySinh">
	     <span class="textfieldRequiredMsg">*</span>
	     <span class="textfieldInvalidFormatMsg">Ngày sinh không đúng định dạng</span>
	     dd-mm-yyyy
	     </td>
	  </tr>  
	  <tr>
	    <td id="stfDiaChi"><label for="DiaChi">Địa chỉ :</label>
	    <input type="text" name="DiaChi" id="DiaChi">
	    <span class="textfieldRequiredMsg">*</span>
	    </td>
	  </tr>
	  <tr>
	    <td id="stfSoDienThoai"><label for="SoDienThoai">Số điện thoại :</label>
	    <input type="text" name="SoDienThoai" id="SoDienThoai">
	    <span class="textfieldRequiredMsg">*</span>
	    <span class="textfieldInvalidFormatMsg">Bạn không được nhập chữ</span>
		<span class="textfieldMaxCharsMsg">SĐT không được vượt quá 11 chữ số</span>
		<span class="textfieldMinCharsMsg">SĐT phải từ 10 đến 11 chữ số</span>
		</td>
	  </tr>
	  <tr>
	    <td id="stfEmail"><label for="email">Email :</label>
	    <input type="text" name="email" id="email" onchange="checkEmail(this.value)">
	    <span id="emailcheck"></span>
		<span class="textfieldInvalidFormatMsg">Email chưa đúng định dạng</span>
		<span class="textfieldRequiredMsg">*</span>
		</td>
	  </tr>
	  <tr>
	    <td><label>Giới tính :</label><input name="GioiTinh" type="radio" id="GioiTinh" value="1" checked> Nam
	      <input type="radio" name="GioiTinh" id="GioiTinh" value="0"> Nữ</td>
	  </tr>
	  <tr>
	    <td><label for="file">Ảnh đại diện :</label>
	    <input type="file" name="file" id="file"></td>
	  </tr>
	  <tr>
	    <td class="title">Thông tin thanh toán</td>
	  </tr>
	  <tr>
	    <td><textarea name="txtthongtinthanhtoan" rows="8" id="txtthongtinthanhtoan"></textarea></td>
	  </tr>
	  <tr>
	    <td id="acceptContainer"><input type="checkbox" name="acceptRules" id="acceptRules">
	    <label for="acceptRules">Tôi đã đọc và đồng ý với những <a href="quydinh">quy định</a> của sàn.</label>
	    <span class="checkboxRequiredMsg"><br>Bạn chưa đồng ý !</span>
	    </td>
	  </tr>
	  <tr>
	    <td class="btnDangKy"><div align="center">
	      <input type="submit" name="btnDangKy" id="btnDangKy" value="Đăng ký">
	    </div></td>
	  </tr>			
	  <tr>
	    <td class="note"><span style="color:red">(*)</span> - Xin hãy điền đầy đủ và chính xác các thông tin này.
	    </td>
	  </tr>
	</table>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		var sprytextfield = new Spry.Widget.ValidationTextField("stfHoTen",
				"none", {
					validateOn : [ "change" ]
				});
		var sprytextfield = new Spry.Widget.ValidationTextField("stfEmail",
				"email", {
					validateOn : [ "change" ]
				});
		var sprytextfield = new Spry.Widget.ValidationTextField("stfTaiKhoan",
				"none", {
					validateOn : [ "change" ]
				});
		var sprypassword = new Spry.Widget.ValidationPassword("spMatKhau", {
					minChars : 6,
					validateOn : [ "change" ]
		});
		var spryconfirm = new Spry.Widget.ValidationConfirm("scNhapLai",
				"MatKhau", {
					minChars : 6,
					validateOn : [ "change" ]
				});
		var sprytextfield = new Spry.Widget.ValidationTextField("stfNgaySinh",
				"date", {
					validateOn : [ "blur" ],
					format : "dd-mm-yyyy"
				});
		var sprytextfield = new Spry.Widget.ValidationTextField("stfDiaChi",
				"none", {
					validateOn : [ "change" ]
				});
		var sprytextfield = new Spry.Widget.ValidationTextField("stfSoDienThoai", "integer", {
					validateOn : [ "change" ],
					maxChars : 11,
					minChars : 10
				});
		var acceptContainer = new Spry.Widget.ValidationCheckbox("acceptContainer");
		
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

		<!-- End right box -->
	</div>
</div>