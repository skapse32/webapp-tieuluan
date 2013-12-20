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

<div id="content" class="wmain">
	<!-- start left-box -->

	<div id="box-left" class="fl top10 bg_white wleft">
		<div id="products-group" class="fl bg-top-products wleft">
			<div id="browser-modules" class="fl browser fontTahoma">
				<a href="" class="fl url_home l8 right8"> <img class="fl w21-18"
					alt="" src="resources/v2/images/blank.gif" />
				</a> <img class="fl right8" src="resources/v2/images/arrow.gif" alt="" />
				<div class="fl top3 right8">
					<a class="fl link_blue bold" href="">${username}</a>
				</div>
				<img class="fl right8" src="resources/v2/images/arrow.gif" alt="" />
				<div class="fl top3 right8">
					<a class="fl link_blue bold" href="">Đăng sản phẩm</a>
				</div>
			</div>
		</div>
		<form action="${pageContext.request.contextPath}/dangsanpham"
			name="formdangsanpham" id="fdangsanpham" method="post"
			enctype="multipart/form-data">
			<!-- InstanceBeginEditable name="MainRegion" -->
			<div class="Required_Notice" style="color: red; margin-top: 50px">
				Bạn phải chọn các thông tin này "<b class="Required">*</b>"
			</div>

			<span class="Apple-style-span"
				style="font-family: Tahoma, Verdana; font-size: 12px; line-height: 17px; background-color: rgb(255, 255, 255);">
				<table class="product_technical_table" cellpadding="0"
					cellspacing="0"
					style="font-family: Tahoma, Verdana; border-collapse: collapse; width: 730px">
					<tbody style="font-family: Tahoma, Verdana;">
						<tr class="title"
							style="background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: rgb(229, 229, 229); color: rgb(204, 0, 0); font-weight: bold; text-align: center;">
							<td colspan="2" lang="vi"
								style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
								<span style="font-size: 10pt; font-family: Arial;"
								class="Apple-style-span"> Thông tin sản phẩm </span>
							</td>
						</tr>
						<tr class="technical" style="font-family: Tahoma, Verdana;">
							<td class="name"
								style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;">
								<span style="font-size: 10pt; font-family: Arial;"
								class="Apple-style-span"> Tên sản phẩm</span>
							</td>
							<td class="value"
								style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
								<span style="font-size: 10pt; font-family: Arial;"
								class="Apple-style-span"> <input name="txttensp"
									maxlength="80" size="50" type="text" value=""><b
									class="Required">*</b></span>
							</td>
							
						</tr>

						<tr class="technical" style="font-family: Tahoma, Verdana;">
							<td class="name"
								style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;">
								<span style="font-size: 10pt; font-family: Arial;"
								class="Apple-style-span"> Loại Xe </span>
							</td>
							<td class="value"
								style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
								<span style="font-size: 10pt; font-family: Arial;"
								class="Apple-style-span"> <select name="selectloaisp"
									style="width: 150px;">
										<c:forEach var="loaisp" items="${sessionScope.dsloaisp}">
											<option value="${loaisp.maloaisp}">${loaisp.tenloaisp}</option>
										</c:forEach>
								</select>
							</span>
							</td>
							<td></td>
						</tr>
						<tr>
							<td class="name"
								style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;">
								<span style="font-size: 10pt; font-family: Arial;"
								class="Apple-style-span"> Tình Trạng Sản Phẩm </span>
							</td>
							<td class="value"
								style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
								<span style="font-size: 10pt; font-family: Arial;"
								class="Apple-style-span"> <select name="selectttsp"
									style="width: 150px;">

										<c:forEach var="tinhtrangsp"
											items="${sessionScope.dstinhtrangsp}">
											<option value="${tinhtrangsp.matinhtrangsp}">${tinhtrangsp.tentinhtrangsp}</option>
										</c:forEach>
								</select>
							</span>
							</td>
							<td></td>
						</tr>
						<tr>
							<td class="name"
								style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;">
								<span style="font-size: 10pt; font-family: Arial;"
								class="Apple-style-span"> Số Lượng </span>
							</td>
							<td class="value"
								style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
								<span style="font-size: 10pt; font-family: Arial;"
								class="Apple-style-span"> <input name="txtsoluong"
									maxlength="80" size="50" type="text" value=""><b
									class="Required">*</b>
							</span>
							</td>
							<td></td>
						</tr>
						<tr>
							<td class="name"
								style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;">
								<span style="font-size: 10pt; font-family: Arial;"
								class="Apple-style-span"> Xuất xứ </span>
							</td>
							<td class="value"
								style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
								<span style="font-size: 10pt; font-family: Arial;"
								class="Apple-style-span"> <input name="txtxuatxu"
									maxlength="80" size="50" type="text" value=""><b
									class="Required">*</b>
							</span>
							</td>
							<td></td>
						</tr>
						<tr>
							<td class="name"
								style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;">
								<span style="font-size: 10pt; font-family: Arial;"
								class="Apple-style-span"> Thương Hiệu </span>
							</td>
							<td class="value"
								style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
								<span style="font-size: 10pt; font-family: Arial;"
								class="Apple-style-span">
								<select name="thuonghieu" style="width: 150px;">
										<c:forEach var="hangxe" items="${sessionScope.dshangxe}">
											<option value="${hangxe.tenhang}">${hangxe.tenhang}</option>
										</c:forEach>
								</select>
								<b class="Required">*</b>
							</span>
							</td>
							<td></td>
						</tr>
						<tr>
							<td class="name"
								style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;">
								<span style="font-size: 10pt; font-family: Arial;"
								class="Apple-style-span"> Mô Tả </span>
							</td>
							<td class="value"
								style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
								<span style="font-size: 10pt; font-family: Arial;"
								class="Apple-style-span"> <textarea name="txtmota"
										cols="3" rows="3"
										style="margin: 2px; width: 580px; height: 100px;">
										</textarea>
							</span>
							</td>
							<td></td>
						</tr>
						<tr class="title"
							style="background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: rgb(229, 229, 229); color: rgb(204, 0, 0); font-weight: bold; text-align: center;">
							<td colspan="2" lang="vi"
								style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
								<span style="font-size: 10pt; font-family: Arial;"
								class="Apple-style-span"> Hình Ảnh </span>
							</td>
						</tr>

						<tr>
							<td class="name"
								style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;">
								<span style="font-size: 10pt; font-family: Arial;"
								class="Apple-style-span"> Hình </span>
							</td>
							<td class="value"
								style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
								<span style="font-size: 10pt; font-family: Arial;"
								class="Apple-style-span"> <input type="file" name="file"
									value="" />
							</span>
							</td>
							<td></td>
						</tr>

						<tr class="title"
							style="background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: rgb(229, 229, 229); color: rgb(204, 0, 0); font-weight: bold; text-align: center;">
							<td colspan="2" lang="vi"
								style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
								<span style="font-size: 10pt; font-family: Arial;"
								class="Apple-style-span"> Thông tin đấu giá </span>
							</td>
						</tr>

						<tr>
							<td class="name"
								style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;">
								<span style="font-size: 10pt; font-family: Arial;"
								class="Apple-style-span"> Giá khởi điểm </span>
							</td>
							<td class="value"
								style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
								<span style="font-size: 10pt; font-family: Arial;"
								class="Apple-style-span"> <input name="txtgiakhoidiem"
									maxlength="50" size="30" type="text" value="">VND<b
									class="Required">*</b>
							</span>
							</td>
							<td></td>
						</tr>

						<tr>
							<td class="name"
								style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;">
								<span style="font-size: 10pt; font-family: Arial;"
								class="Apple-style-span"> Bước Giá </span>
							</td>
							<td class="value"
								style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
								<span style="font-size: 10pt; font-family: Arial;"
								class="Apple-style-span"> <input name="txtbuocgia"
									maxlength="50" size="30" type="text" value="">VND<b
									class="Required">*</b>
							</span>
							</td>
						</tr>
						<tr>
							<td class="name"
								style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;">
								<span style="font-size: 10pt; font-family: Arial;"
								class="Apple-style-span"> Giá mua ngay </span>
							</td>
							<td class="value"
								style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
								<span style="font-size: 10pt; font-family: Arial;"
								class="Apple-style-span"> <input name="txtmuangay"
									maxlength="50" size="30" type="text" value="">VND<b
									class="Required">*</b>
							</span>
							</td>
						</tr>
						<tr>
							<td class="name"
								style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;">
								<span style="font-size: 10pt; font-family: Arial;"
								class="Apple-style-span"> Thời Gian Bắt Đầu </span>
							</td>
							<td class="value"
								style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
								<span style="font-size: 10pt; font-family: Arial;"
								class="Apple-style-span"> <input name="txttgbt" id="txttgbt"
									maxlength="50" size="30" type="text" value=""><b
									class="Required">*</b>
							</span>
							</td>
							<td></td>
						</tr>
						<tr>
							<td class="name"
								style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;">
								<span style="font-size: 10pt; font-family: Arial;"
								class="Apple-style-span"> Thời Gian Kết Thúc </span>
							</td>
							<td class="value"
								style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
								<span style="font-size: 10pt; font-family: Arial;"
								class="Apple-style-span"> <input name="txttgkt" id="txttgkt"
									maxlength="50" size="30" type="text" value=""><b
									class="Required">*</b>
							</span>
							</td>
							<td></td>
						</tr>
						<tr>
							<td class="name"
								style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;">
								<span style="font-size: 10pt; font-family: Arial;"
								class="Apple-style-span"> Hình thức thanh toán </span>
							</td>
							<td class="value"
								style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
								<span style="font-size: 10pt; font-family: Arial;"
								class="Apple-style-span"> <select name="selecthttt"
									style="width: 150px;">
										<c:forEach var="httt" items="${sessionScope.dshttt}">
											<option value="${httt.mahttt}">${httt.tenhttt}</option>
										</c:forEach>
								</select>
							</span>
							</td>
							<td></td>
						</tr>
						<tr>
							<td class="name"
								style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;">
								<span style="font-size: 10pt; font-family: Arial;"
								class="Apple-style-span"> Thông tin liên hệ </span>
							</td>
							<td class="value"
								style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
								<span style="font-size: 10pt; font-family: Arial;"
								class="Apple-style-span"> <textarea
										name="txtthongtinlienhe" cols="3" rows="3"
										style="margin: 2px; width: 300px; height: 100px;"></textarea><b
									class="Required">*</b>
							</span>
							</td>
							<td></td>
						</tr>
						<tr class="title"
							style="background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: rgb(229, 229, 229); color: rgb(204, 0, 0); font-weight: bold; text-align: center;">
							<td colspan="2" lang="vi"
								style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
								<span style="font-size: 10pt; font-family: Arial;"
								class="Apple-style-span"> <input type="submit"
									name="action" value="Đăng sản phẩm" />
							</span>
							</td>
						</tr>
					</tbody>
				</table>
			</span>
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
<script src="resources/v2/js/datetimepicker/jquery.datetimepicker.js"></script>
<script>
//2013-11-29 00:00:00
$('#txttgbt').datetimepicker({
	format:'Y-m-d H:i:00'
});
$('#txttgkt').datetimepicker({
	format:'Y-m-d H:i:00'
});
</script>