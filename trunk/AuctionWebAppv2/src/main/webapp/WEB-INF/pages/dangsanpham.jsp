<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<!-- Validation END -->

<!-- Content -->
<div id="content" class="wmain">
	<!-- Left side -->
	<c:if test="${not empty error}">
	<script type="text/javascript">
		TINY.box.show({html:'${error}',animate:false,close:false,boxid:'error',top:5});
	</script>
	</c:if>
	<div id="box-left" class="fl top10 bg_white wleft">
		<div id="products-group" class="fl bg-top-products wleft">
			<div id="browser-modules" class="fl browser fontTahoma">
				<a href="" class="fl url_home l8 right8"> <img class="fl w21-18"
					alt="" src="${pageContext.request.contextPath}/resources/v2/images/blank.gif" />
				</a> <img class="fl right8" src="${pageContext.request.contextPath}/resources/v2/images/arrow.gif" alt="" />
				<div class="fl top3 right8">
					<a class="fl link_blue bold" href="">${username}</a>
				</div>
				<img class="fl right8" src="${pageContext.request.contextPath}/resources/v2/images/arrow.gif" alt="" />
				<div class="fl top3 right8">
					<a class="fl link_blue bold" href="">Đăng sản phẩm</a>
				</div>
			</div>
		</div>
		<form action="${pageContext.request.contextPath}/dangsanpham"
			name="formdangsanpham" id="fdangsanpham" method="post"
			enctype="multipart/form-data" >
			<table id="DangSanPham">
  <tr>
    <td class="title">Thông tin sản phẩm</td>
  </tr>
  <tr>
    <td width="544"><label for="txttensp">Tên sản phẩm :</label>
    <input type="text" name="txttensp" id="txttensp"></td>
  </tr>
  <tr>
    <td><label for="selectloaisp">Loại xe :</label>
      <select name="selectloaisp" id="selectloaisp">
      <c:forEach var="loaisp" items="${sessionScope.dsloaisp}">
      <option value="${loaisp.maloaisp}">${loaisp.tenloaisp}</option>
      </c:forEach>
    </select></td>
  </tr>
  <tr>
    <td><label for="thuonghieu">Hãng xe :</label>
      <select name="thuonghieu" id="thuonghieu">
      <c:forEach var="hangxe" items="${sessionScope.dshangxe}">
      <option value="${hangxe.tenhang}">${hangxe.tenhang}</option>
      </c:forEach>
    </select></td>
  </tr>
  <tr>
    <td><label for="selectttsp">Tình trạng :</label>
      <select name="selectttsp" id="selectttsp">
      <c:forEach var="tinhtrangsp" items="${sessionScope.dstinhtrangsp}">
      <option value="${tinhtrangsp.matinhtrangsp}">${tinhtrangsp.tentinhtrangsp}</option>
      </c:forEach>
    </select></td>
  </tr>
  <tr>
    <td><label for="txtsoluong">Số lượng :</label>
    <input name="txtsoluong" type="number" id="txtsoluong" min="1" value="1"></td>
  </tr>
  <tr>
    <td><label for="txtxuatxu">Xuất xứ :</label>
    <input type="text" name="txtxuatxu" id="txtxuatxu"></td>
  </tr>
  <tr>
    <td><label for="file">Ảnh đại diện :</label>
    <input type="file" name="file" id="file"></td>
  </tr>
  <tr>
    <td class="title">Mô tả sản phẩm</td>
  </tr>
  <tr>
    <td><textarea name="txtmota" id="txtmota" rows="8"></textarea></td>
  </tr>
  <tr>
    <td class="title">Thông tin đấu giá</td>
  </tr>
  <tr>
    <td><label for="txtgiakhoidiem">Giá khởi điểm :</label>
    <input type="text" name="txtgiakhoidiem" id="txtgiakhoidiem"> 
    VNĐ <span class="textfieldInvalidFormatMsg"><br>Chưa đúng định dạng mệnh giá</span><span class="textfieldRequiredMsg">*</span></td>
  </tr>
  <tr>
    <td><label for="txtbuocgia">Bước giá :</label>
    <input type="text" name="txtbuocgia" id="txtbuocgia"> 
    VNĐ <span class="textfieldInvalidFormatMsg"><br>Chưa đúng định dạng mệnh giá</span><span class="textfieldRequiredMsg">*</span></td>
  </tr>
  <tr>
    <td><label for="txtmuangay">Giá mua ngay :</label>
    <input type="text" name="txtmuangay" id="txtmuangay"> 
    VNĐ <span class="textfieldInvalidFormatMsg"><br>Chưa đúng định dạng mệnh giá</span><span class="textfieldRequiredMsg">*</span></td>
  </tr>
  <tr>
    <td><label for="txttgbt">Thời gian bắt đầu :</label>
    <input type="text" name="txttgbt" id="txttgbt" readonly="readonly"></td>
  </tr>
  <tr>
    <td><label for="txttgkt">Thời gian kết thúc :</label>
    <input type="text" name="txttgkt" id="txttgkt" readonly="readonly"></td>
  </tr>
  <tr>
    <td><label for="selecthttt">Hình thức thanh toán :</label>
      <select name="selecthttt" id="selecthttt">
      <c:forEach var="httt" items="${sessionScope.dshttt}">
      <option value="${httt.mahttt}">${httt.tenhttt}</option>
      </c:forEach>
    </select></td>
  </tr>
  <tr>
    <td class="title">Thông tin liên hệ</td>
  </tr>
  <tr>
    <td class="white"><textarea name="txtthongtinlienhe" rows="8" id="txtthongtinlienhe"></textarea></td>
  </tr>
  <tr>
    <td class="btnDangSanPham"><div align="center">
      <input type="submit" name="submit" id="submit" value="Đăng sản phẩm">
    </div></td>
  </tr>
</table>
		</form>
	</div>
</div>
</div>
<script src="${pageContext.request.contextPath}/resources/v2/js/datetimepicker/jquery.datetimepicker.js"></script>
<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath}/resources/v2/js/datetimepicker/jquery.datetimepicker.css" />
<script>
//2013-11-29 00:00:00
$('#txttgbt').datetimepicker({
	format:'Y-m-d H:00:00'
});
$('#txttgkt').datetimepicker({
	format:'Y-m-d H:00:00'
});
var sprytextfield = new Spry.Widget.ValidationTextField("stfNgaySinh",
		"date", {
			validateOn : [ "blur" ],
			format : "dd-mm-yyyy"
		});
var validation = new Spry.Widget.ValidationTextField("txtgiakhoidiem", "integer" , { validateOn : [ "change" ]});
var validation = new Spry.Widget.ValidationTextField("txtbuocgia", "integer" , { validateOn : [ "change" ]});
var validation = new Spry.Widget.ValidationTextField("txtmuangay", "integer" , { validateOn : [ "change" ]});
</script>