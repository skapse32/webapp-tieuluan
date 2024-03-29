<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!-- Content -->
<div id="content" class="wmain">
	<!-- Left side -->
	<div id="box-left" class="fl top10 bg_white wleft">
		<form action="${pageContext.request.contextPath}/thanhtoan"
			method="post">
			<!-- InstanceBeginEditable name="MainRegion" -->
			<div class="Column9">
				<h2 id="HomepageFeaturedList" class="h2row"
					style="text-align: center">${tieude}</h2>
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
							<td><div
									style="color: #007fdd; padding-top: 3px; width: 250px">${sp.tensp}</div>
								<input type="hidden" name="masp" value="${sp.masp}"></td>
							<td rowspan="6"><a
								href="${pageContext.request.contextPath}/chitietsanpham?masp=${sp.masp}"><img
									src="${imageDirectory}${sp.hinhanh}" height="150" width="150">
							</a></td>
						</tr>
						<tr>
							<td style="width: 150px; vertical-align: middle; height: 26px;">Xuất
								xứ</td>
							<td><div style="color: #666; padding-top: 3px; width: 250px">${sp.xuatxu}</div></td>
						</tr>
						<tr>
							<td style="width: 150px; vertical-align: middle; height: 26px;">Thương
								hiệu</td>
							<td><div style="color: #666; padding-top: 3px; width: 250px">${sp.thuonghieu}</div></td>
						</tr>
						<tr>
							<td style="width: 150px; vertical-align: middle; height: 26px;">Giá
								khởi điểm</td>
							<td><div style="color: #666; padding-top: 3px; width: 250px">
									<fmt:formatNumber type="currency" currencyCode="VND"
										value="${sp.giakhoidiem}" />
								</div></td>
						</tr>
						<tr>
							<td style="width: 150px; vertical-align: middle; height: 26px;">Giá
								thắng</td>
							<td><div
									style="color: #2DAB00; padding-top: 3px; width: 250px">
									<fmt:formatNumber type="currency" currencyCode="VND"
										value="${sp.giahientai}" />
								</div></td>
						</tr>
						<tr>
							<td style="width: 150px; vertical-align: middle; height: 26px;">Thời
								gian thắng</td>
							<td><div style="color: #666; padding-top: 3px; width: 250px">
									<jsp:useBean id="myDate" class="java.util.Date" />
									<c:set target="${myDate}" property="time"
										value="${sp.thoigianketthuc}" />
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
							<td style="width: 150px; vertical-align: middle; height: 26px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;+&nbsp;Họ
								tên</td>
							<td><div style="color: #666; padding-top: 3px;">${nguoiban.hoTen}</div>
							</td>
						</tr>
						<tr>
							<td style="width: 150px; vertical-align: middle; height: 26px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;+&nbsp;Điện
								thoại</td>
							<td><div style="color: #666; padding-top: 3px;">${nguoiban.dienThoai}</div>
							</td>
						</tr>
						<tr>
							<td style="width: 150px; vertical-align: middle; height: 26px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;+&nbsp;Địa
								chỉ</td>
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
							<td style="width: 150px; vertical-align: middle; height: 26px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;+&nbsp;Họ
								tên</td>
							<td><div style="color: #666; padding-top: 3px;">${nguoimua.hoTen}</div>
							</td>
						</tr>
						<tr>
							<td style="width: 150px; vertical-align: middle; height: 26px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;+&nbsp;Điện
								thoại</td>
							<td><div style="color: #666; padding-top: 3px;">${nguoimua.dienThoai}</div>
							</td>
						</tr>
						<tr>
							<td style="width: 150px; vertical-align: middle; height: 26px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;+&nbsp;Địa
								chỉ</td>
							<td><div style="color: #666; padding-top: 3px;">${nguoimua.diaChi}</div>
							</td>
						</tr>
						<tr>
							<td style="width: 150px; vertical-align: middle;">Số tài
								khoản</td>
							<td><span id="stfSoTaiKhoan"> <input type="text"
									name="sotaikhoan" id="TaiKhoan" /> <span
									class="textfieldRequiredMsg">*</span>
							</span></td>
						</tr>
					</table>
				</div>
				<br>
				<div style="padding-left: 110px;">
					<p style="color: Red">${error}</p>
					<input style="height: 28px;" name="btnDangKy" type="submit"
						value="Thanh toán" /> <a target="_blank"
						href="https://www.nganluong.vn/button_payment.php?receiver=${nguoiban.email}&product_name=${sp.tensp}&price=${sp.giahientai}&return_url=thanhtoan/thanhcong?masp=${sp.masp}&comments=hangtot"><img
						src="https://www.nganluong.vn/data/images/buttons/11.gif"
						border="0" /></a>
				</div>
			</div>
			<!-- InstanceEndEditable -->
			<div class="DIVclear"></div>
			<script type="text/javascript">
				var sprytextfield1 = new Spry.Widget.ValidationTextField(
						"stfSoTaiKhoan", "custom", {
							validateOn : [ "change" ]
						});
			</script>
		</form>
	</div>
	<!-- Left side END -->
</div>
