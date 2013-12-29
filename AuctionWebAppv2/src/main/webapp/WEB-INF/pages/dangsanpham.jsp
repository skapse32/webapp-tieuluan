<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!-- Content -->
<style>
.Required {
	color: red
}
</style>
<!-- Editor -->
<div id="sample">
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/v2/js/NicEdit/nicEdit.js"></script> <script type="text/javascript">
//<![CDATA[
        bkLib.onDomLoaded(function() { nicEditors.allTextAreas() });
  //]]>
  </script>
</div>
<!-- Editor END -->
<div id="content" class="wmain">
	<!-- start left-box -->
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
			<table class="DangSanPham">
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
    <input type="text" name="txttgbt" id="txttgbt"></td>
  </tr>
  <tr>
    <td><label for="txttgkt">Thời gian kết thúc :</label>
    <input type="text" name="txttgkt" id="txttgkt"></td>
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
<div class="DIVclear"></div>
<!-- end left box -->
<!-- right box -->
<div id="box-right" class="fl l10 top10 bg_white wright cright">
	<div id="catalog-products" class="fl wright">
		<div id="catalog-products-titles"
			class="fl bg-titles top10 products-group-title-news color_white fontTahoma wright-26">
			<strong>DANH SÁCH ĐẤU GIÁ</strong>
		</div>
		<ul id="catalog-products-list"
			class="fl fontTahoma wright list-none top5">
			<li class="fl pd5 w240 "><a class="fl  pdl20"
				href="${pageContext.request.contextPath}/qlsanphamdangthamgia">Sản
					phẩm đang tham gia</a></li>
			<li class="fl wright das_top h1"></li>
			<li class="fl pd5 w240 "><a class="fl  pdl20"
				href="${pageContext.request.contextPath}/qlsanphamdaketthuc">Sản
					phẩm đã kết thúc</a></li>
			<li class="fl wright das_top h1"></li>
			<li class="fl pd5 w240 "><a class="fl  pdl20"
				href="${pageContext.request.contextPath}/qlsanphamchienthang">Sản
					phẩm chiến thắng</a></li>
			<li class="fl wright das_top h1"></li>
		</ul>
	</div>
	<div id="catalog-products" class="fl wright">
		<div id="catalog-products-titles"
			class="fl bg-titles top10 products-group-title-news color_white fontTahoma wright-26">
			<strong>SẢN PHẨM CỦA TÔI</strong>
		</div>
		<ul id="catalog-products-list"
			class="fl fontTahoma wright list-none top5">
			<li class="fl pd5 w240 "><a class="fl  pdl20"
				href="${pageContext.request.contextPath}/qlsanphamcuatoidangdau">Sản
					phẩm đang đấu</a></li>
			<li class="fl wright das_top h1"></li>
			<li class="fl pd5 w240 "><a class="fl  pdl20"
				href="${pageContext.request.contextPath}/qlsanphamcuatoisapdau">Sản
					phẩm sắp đấu</a></li>
			<li class="fl wright das_top h1"></li>
			<li class="fl pd5 w240 "><a class="fl  pdl20"
				href="${pageContext.request.contextPath}/qlsanphamcuatoidadauxong">Sản
					phẩm đã đấu xong</a></li>
			<li class="fl wright das_top h1"></li>
			<li class="fl pd5 w240 "><a class="fl  pdl20"
				href="${pageContext.request.contextPath}/qlsanphamcuatoibihuy">Sản
					phẩm bị hủy</a></li>
			<li class="fl wright das_top h1"></li>
			<li class="fl pd5 w240 "><a class="fl  pdl20"
				href="${pageContext.request.contextPath}/dangsanpham">Đăng sản
					phẩm</a></li>
			<li class="fl wright das_top h1"></li>
		</ul>
	</div>
</div>
<script src="${pageContext.request.contextPath}/resources/v2/js/datetimepicker/jquery.datetimepicker.js"></script>
<script>
//2013-11-29 00:00:00
$('#txttgbt').datetimepicker({
	format:'Y-m-d H:i:00'
});
$('#txttgkt').datetimepicker({
	format:'Y-m-d H:i:00'
});
var textfieldwidget1 = new Spry.Widget.ValidationTextField("txtgiakhoidiem", "currency" , { validateOn : [ "change" ]});
var textfieldwidget1 = new Spry.Widget.ValidationTextField("txtbuocgia", "currency" , { validateOn : [ "change" ]});
var textfieldwidget1 = new Spry.Widget.ValidationTextField("txtmuangay", "currency" , { validateOn : [ "change" ]});
</script>