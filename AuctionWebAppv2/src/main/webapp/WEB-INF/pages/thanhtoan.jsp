<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<form action="${pageContext.request.contextPath}/thanhtoan"
	method="post">
	<div class="Column3">
		<h2 id="RegionList" class="h2row">DANH SÁCH ĐẤU GIÁ</h2>
		<ul class="CategoriesList">
			<li class="CategoryList"><a
				href="${pageContext.request.contextPath}/qlsanphamdangthamgia">Sản
					phẩm đang tham gia</a></li>
			<li class="CategoryList"><a
				href="${pageContext.request.contextPath}/qlsanphamdaketthuc">Sản
					phẩm đã kết thúc</a></li>
			<li class="CategoryList"><a
				href="${pageContext.request.contextPath}/qlsanphamchienthang">Sản
					phẩm chiến thắng</a></li>
		</ul>
		<h2 id="RegionList" class="h2row">SẢN PHẨM CỦA TÔI</h2>
		<ul class="CategoriesList">
			<li class="CategoryList"><a
				href="${pageContext.request.contextPath}/qlsanphamcuatoidangdau">Sản
					phẩm đang đấu</a></li>
			<li class="CategoryList"><a
				href="${pageContext.request.contextPath}/qlsanphamcuatoisapdau">Sản
					phẩm sắp đấu</a></li>
			<li class="CategoryList"><a
				href="${pageContext.request.contextPath}/qlsanphamcuatoidadauxong">Sản
					phẩm đã đấu xong</a></li>
			<li class="CategoryList"><a
				href="${pageContext.request.contextPath}/qlsanphamcuatoibihuy">Sản
					phẩm bị hủy</a></li>
			<li class="CategoryList"><a
				href="${pageContext.request.contextPath}/dangsanpham">Đăng sản
					phẩm</a></li>
		</ul>
	</div>
	<!-- InstanceBeginEditable name="MainRegion" -->
	<div class="Column9">
		<h2 id="HomepageFeaturedList" class="h2row" style="text-align: center">${tieude}</h2>
<div style="height: 20px; text-align: center; margin-top: 7px;">(*)
			Xin bạn điền đầy đủ và chính xác các thông tin này</div>
		<h3 class="h3row" style="font-weight: bold;">
			<span style="margin-left: 20px;">Thông tin sản phẩm</span>
		</h3>
		<div align="center" style="margin-left: 20px;">
			<table style="width: 98%; font-size: 11pt">
				<tr>
					<td style="width: 150px; vertical-align: middle; height: 26px;">Tên
						sản phẩm</td>
					<td><div style="color: #007fdd;padding-top: 3px;width: 250px">${sp.tensp}</div>
					<input type="hidden"  name="masp" value="${sp.masp}">
					</td>
					<td rowspan="6"><a
					href="${pageContext.request.contextPath}/chitietsanpham?masp=${sp.masp}"><img
					src="${imageDirectory}${sp.hinhanh}" height="150" width="150">
				</a></td>
				</tr>
				<tr>
					<td style="width: 150px; vertical-align: middle; height: 26px;">Xuất
						xứ</td>
					<td><div style="color: #666;padding-top: 3px;width: 250px">${sp.xuatxu}</div></td>
				</tr>
				<tr>
					<td style="width: 150px; vertical-align: middle; height: 26px;">Thương
						hiệu</td>
					<td><div style="color: #666;padding-top: 3px;width: 250px">${sp.thuonghieu}</div></td>
				</tr>
				<tr>
					<td style="width: 150px; vertical-align: middle;height: 26px;">Giá
						khởi điểm</td>
					<td><div style="color: #666;padding-top: 3px;width: 250px"><fmt:formatNumber type="currency" currencyCode="VND"
							value="${sp.giakhoidiem}" /></div></td>
				</tr>
				<tr>
					<td style="width: 150px; vertical-align: middle;height: 26px;">Giá
						thắng</td>
					<td><div style="color: #2DAB00;padding-top: 3px;width: 250px"><fmt:formatNumber type="currency" currencyCode="VND"
							value="${sp.giahientai}" /></div>
					</td>
				</tr>
				<tr>
					<td style="width: 150px; vertical-align: middle;height: 26px;">Thời
						gian thắng</td>
					<td><div style="color: #666;padding-top: 3px;width: 250px">
					<jsp:useBean id="myDate" class="java.util.Date"/>  
				<c:set target="${myDate}" property="time" value="${sp.thoigianketthuc}"/>  
				<fmt:formatDate pattern="HH:mm:ss dd-MM-yyyy" value="${myDate}" />
					</div></td>
				</tr>
			</table>
		</div>

		<h3 class="h3row" align="left">
			<span style="margin-left: 20px;">Thông tin thanh toán</span>
		</h3>
		
		<div align="center" style="margin-left: 20px;">
			<table style="width: 98%; font-size: 11pt">
				<tr>
					<td style="width: 150px; vertical-align: middle; height: 26px;">Người
						bán</td>			
					<td><div style="color: #007fdd; padding-top: 3px;">${sp.nguoidang}</div> 
					</td>
				</tr>
				<tr>
					<td style="width: 150px; vertical-align: middle; height: 26px;ma">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;+&nbsp;Họ tên</td>					
					<td><div style="color: #666; padding-top: 3px;">${nguoiban.hoTen}</div>
					</td>
				</tr>
				<tr>
					<td style="width: 150px; vertical-align: middle; height: 26px;ma">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;+&nbsp;Điện thoại</td>					
					<td><div style="color: #666; padding-top: 3px;">${nguoiban.dienThoai}</div>
					</td>
				</tr>
				<tr>
					<td style="width: 150px; vertical-align: middle; height: 26px;ma">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;+&nbsp;Địa chỉ</td>					
					<td><div style="color: #666; padding-top: 3px;">${nguoiban.diaChi}</div>
					</td>
				</tr>
				<tr>
					<td style="width: 150px; vertical-align: middle; height: 26px;">Người
						mua</td>			
					<td><div style="color: #007fdd; padding-top: 3px;">${sp.nguoidat}</div>
					</td>
				</tr>
				<tr>
					<td style="width: 150px; vertical-align: middle; height: 26px;ma">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;+&nbsp;Họ tên</td>					
					<td><div style="color: #666; padding-top: 3px;">${nguoimua.hoTen}</div>
					</td>
				</tr>
				<tr>
					<td style="width: 150px; vertical-align: middle; height: 26px;ma">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;+&nbsp;Điện thoại</td>					
					<td><div style="color: #666; padding-top: 3px;">${nguoimua.dienThoai}</div>
					</td>
				</tr>
				<tr>
					<td style="width: 150px; vertical-align: middle; height: 26px;ma">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;+&nbsp;Địa chỉ</td>					
					<td><div style="color: #666; padding-top: 3px;">${nguoimua.diaChi}</div>
					</td>
				</tr>
			<tr>
					<td style="width: 150px; vertical-align: middle;">Số tài khoản</td>
					<td><span id="stfSoTaiKhoan"> <input type="text"
							name="sotaikhoan" id="TaiKhoan" /> <span class="textfieldRequiredMsg">*</span>
					</span></td>
				</tr>
			</table>
		</div>
		<br>
		<div style="padding-left: 110px;">
			<p style="color: Red">${error}</p>
			<input style="height: 28px;" name="btnDangKy" type="submit" value="Thanh toán"  />
		</div>





	</div>
	<!-- InstanceEndEditable -->
	<div class="DIVclear"></div>
	<script type="text/javascript">
		var sprytextfield1 = new Spry.Widget.ValidationTextField("stfSoTaiKhoan",
				"custom", {
					validateOn : [ "change" ]
				});
		
	</script>
</form>

