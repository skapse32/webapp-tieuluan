<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="myDate" class="java.util.Date" />
<div class="Column3">
	<h2 id="RegionList" class="h2row">Quản lý</h2>
	<ul class="CategoriesList">
		<li class="CategoryList"><a
			href="${pageContext.request.contextPath}/admin/sanphamhuyadmin">Hủy
				đấu giá</a></li>
		<li class="CategoryList"><a
			href="${pageContext.request.contextPath}/admin/sanphamchophepdauadmin">Cho
				phép đấu</a></li>
	</ul>
</div>
<!-- InstanceBeginEditable name="MainRegion" -->
<div class="Column9">
	<h2 id="HomepageFeaturedList" class="h2row" style="text-align: center">${tieude}</h2>
	<h1 id="Listing_Details_Title">
		&nbsp;${sp.tensp}&nbsp;<i>(${sp.masp})</i> 
	</h1>
	<div>
		<table>
			<tr>
				<td align="center" valign="middle"><img
					src="${imageDirectory}${sp.hinhanh}" height="330" width="400">
				</td>


			</tr>
			</tbody>
		</table>
	</div>
	

	<h3 class="h3row">
		<a href="#">Thông tin đấu giá</a>
	</h3>
	<table style="font-size: 110%;">
		<tr>
			<td class="td_chitietsanpham"><b>Giá khởi điểm:</b>
			</td>
			<td class="td_chitietsanpham"><span
				class="Bidding_Current_Price">${cgiakhoidiem}&nbsp;đ </span>
			</td>
			<td></td>
		</tr>

		<tr>
			<td class="td_chitietsanpham"><b>Bước giá:</b>
			</td>
			<td class="td_chitietsanpham"><span
				class="Bidding_Current_Price">${cbuocgia}&nbsp;đ</span>
			</td>
			<td style="vertical-align: middle;">
			</td>
		</tr>
		<tr>
			<td class="td_chitietsanpham"><b>Thời gian bắt đầu:</b>
			</td>
			<td class="td_chitietsanpham"><span
				class="Bidding_Current_Price"> <c:set target="${myDate}"
						property="time" value="${sp.thoigianbatdau}" /> <fmt:formatDate
						pattern="HH:mm:ss dd-MM-yyyy" value="${myDate}" /> </span></td>
			<td></td>
		</tr>
		<tr>
			<td class="td_chitietsanpham"><b>Thời gian kết thúc:</b>
			</td>
			<td class="td_chitietsanpham"><span
				class="Bidding_Current_Price"> <c:set target="${myDate}"
						property="time" value="${sp.thoigianketthuc}" /> <fmt:formatDate
						pattern="HH:mm:ss dd-MM-yyyy" value="${myDate}" /> </span>
			</td>
			<td></td>
		</tr>
	</table>

	<h3 class="h3row">
		<a href="#">Thông tin sản phẩm</a>
	</h3>
	<table style="font-size: 110%;">
		<tr>
			<td class="td_chitietsanpham"><b>Loại sản phẩm:</b>
			</td>
			<td class="td_chitietsanpham"><span
				class="Bidding_Current_Price">${sp.loaisp}</span>
			</td>
			<td></td>
		</tr>
		<tr>
			<td class="td_chitietsanpham"><b>Xuất xứ:</b>
			</td>
			<td class="td_chitietsanpham"><span
				class="Bidding_Current_Price">${sp.xuatxu}</span>
			</td>
			<td></td>
		</tr>
		<tr>
			<td class="td_chitietsanpham"><b>Thương hiệu:</b>
			</td>
			<td class="td_chitietsanpham"><span
				class="Bidding_Current_Price">${sp.thuonghieu}</span>
			</td>
			<td></td>
		</tr>
		<tr>
			<td class="td_chitietsanpham"><b>Tình trạng:</b>
			</td>
			<td class="td_chitietsanpham"><span
				class="Bidding_Current_Price">${sp.tinhtrangsp}</span></td>
			<td></td>
		</tr>
		<tr>
			<td class="td_chitietsanpham"><b>Người đăng:</b>
			</td>
			<td class="td_chitietsanpham"><span
				class="Bidding_Current_Price">${sp.nguoidang}</span>
			</td>
			<td><br></td>
		</tr>
		
		<tr>
			<td class="td_chitietsanpham"><b>Hình thức thanh toán:</b>
			</td>
			<td class="td_chitietsanpham"><span
				class="Bidding_Current_Price">${sp.httt}</span></td>
			<td></td>
		</tr>


	</table>
	<h3 class="h3row">
		<a href="#">Mô tả sản phẩm</a>
	</h3>

	<table style="font-size: 110%">

		<tr>
			<td>${sp.mota}</td>

		</tr>
	</table>
<form action="${pageContext.request.contextPath}/admin/huydaugia" method="post" >
<input type="hidden"
			name="masp" value="${sp.masp}">
			<table style="font-size: 110%;">
			<tr>
							<td class="td_chitietsanpham"><b>Lý do hủy:</b>
							</td>
							<td class="td_chitietsanpham"><textarea
									name="txtlydo" cols="3" rows="3"
									style="margin: 2px; width: 300px; height: 100px;"></textarea></td>
							<td></td>
						</tr>
						</table>
						<table style="font-size: 110%;">
						<tr>
							<td style="padding-left: 150px;"><b><input type="submit"
									name="action" value="Hủy đấu giá" /> </b>
							</td>
							<td style="padding-left: 20px;">
							</td>

						</tr>
					</table>
</form>
</div>
<!-- InstanceEndEditable -->
<div class="DIVclear"></div>


