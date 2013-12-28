<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="myDate" class="java.util.Date" />

<!-- Content -->
<div id="content" class="wmain">
	<!-- Left side -->
	<div id="box-left" class="fl top10 bg_white wleft">
		<div
			class="fl wleft bor-top-lr bg_browser bor_bottom_white pdtop-bottom-6">
			<a href="#" class="fl url_home left10 right8"> <img
				class="fl w21-18" alt="" src="${pageContext.request.contextPath}/resources/v2/images/blank.gif" />
			</a> <img class="fl right8" src="${pageContext.request.contextPath}/resources/v2/images/arrow.gif" alt="" />
			<div class="fl top3 right8">
				<a class="fl link_blue bold" href="#">Admin</a>
			</div>
			<img class="fl right8" src="${pageContext.request.contextPath}/resources/v2/images/arrow.gif" alt="" />
			<div class="fl top3 right8">
				<a class="fl link_blue bold" href="#">${tieude}</a>
			</div>
			<img class="fl right8" src="${pageContext.request.contextPath}/resources/v2/images/arrow.gif" alt="" />
		</div>
		<div class="fl wleft top15 line24">
			<span class="Apple-style-span"
				style="font-family: Tahoma, Verdana; font-size: 12px; line-height: 17px; background-color: rgb(255, 255, 255);">
				<table class="product_technical_table"
					style="font-family: Tahoma, Verdana; border-collapse: collapse; width: 730px">
					<tbody style="font-family: Tahoma, Verdana;">
						<tr class="title"
							style="background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: rgb(229, 229, 229); color: rgb(204, 0, 0); font-weight: bold; text-align: center;">
							<td colspan="2" lang="vi"
								style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
								<span style="font-size: 10pt; font-family: Arial;"
								class="Apple-style-span"> &nbsp;${sp.tensp}&nbsp;<i>(${sp.masp})</i>
							</span>
							</td>
						</tr>
						<tr class="title"
							style="background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: rgb(204, 0, 0); font-weight: bold; text-align: center;">
							<td colspan="2" lang="vi"
								style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
								<span style="font-size: 10pt; font-family: Arial;"
								class="Apple-style-span"> <img
									src="${imageDirectory}${sp.hinhanh}" height="330" width="400">
							</span>
							</td>
						</tr>

						<tr class="title"
							style="background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: rgb(229, 229, 229); color: rgb(204, 0, 0); font-weight: bold; text-align: center;">
							<td colspan="2" lang="vi"
								style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
								<span style="font-size: 10pt; font-family: Arial;"
								class="Apple-style-span"> Thông tin đấu giá </span>
							</td>
						</tr>
						<tr class="technical" style="font-family: Tahoma, Verdana;">
							<td class="name"
								style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;"><span
								style="font-size: 10pt; font-family: Arial;"
								class="Apple-style-span"><span lang="vi"
									style="font-size: 10pt;" class="Apple-style-span">Giá
										khởi điểm:</span></span></td>
							<td class="value"
								style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;"><span
								style="font-size: 10pt; font-family: Arial;"
								class="Apple-style-span">${cgiakhoidiem}&nbsp;đ<input
									type="hidden" id="giakhoidiem" value="${giakhoidiem}"></span>
							</td>
						</tr>

						<tr class="technical" style="font-family: Tahoma, Verdana;">
							<td class="name"
								style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;"><span
								style="font-size: 10pt; font-family: Arial;"
								class="Apple-style-span"><span lang="vi"
									style="font-size: 10pt;" class="Apple-style-span">Bước
										giá:</span></span></td>
							<td class="value"
								style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
								<span style="font-size: 10pt; font-family: Arial;"
								class="Apple-style-span">${cbuocgia}&nbsp;đ </span>
							</td>
						</tr>
						<tr class="technical" style="font-family: Tahoma, Verdana;">
							<td class="name"
								style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;"><span
								style="font-size: 10pt; font-family: Arial;"
								class="Apple-style-span"><span lang="vi"
									style="font-size: 10pt;" class="Apple-style-span">Thời
										gian bắt đầu:</span></span></td>
							<td class="value"
								style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
								<span style="font-size: 10pt; font-family: Arial;"
								class="Apple-style-span"><c:set target="${myDate}"
										property="time" value="${sp.thoigianbatdau}" /> <fmt:formatDate
										pattern="HH:mm:ss dd-MM-yyyy" value="${myDate}" /> </span>
							</td>
						</tr>

						<tr class="technical" style="font-family: Tahoma, Verdana;">
							<td class="name"
								style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;"><span
								style="font-size: 10pt; font-family: Arial;"
								class="Apple-style-span"><span lang="vi"
									style="font-size: 10pt;" class="Apple-style-span">Thời
										gian kết thúc:</span></span></td>
							<td class="value"
								style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
								<span style="font-size: 10pt; font-family: Arial;"
								class="Apple-style-span"> <c:set target="${myDate}"
										property="time" value="${sp.thoigianketthuc}" /> <fmt:formatDate
										pattern="HH:mm:ss dd-MM-yyyy" value="${myDate}" />
							</span>
							</td>
						</tr>

						<tr class="title"
							style="background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: rgb(229, 229, 229); color: rgb(204, 0, 0); font-weight: bold; text-align: center;">
							<td colspan="2" lang="vi"
								style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
								<span style="font-size: 10pt; font-family: Arial;"
								class="Apple-style-span"> Thông tin Sản phẩm </span>
							</td>
						</tr>

						<tr class="technical" style="font-family: Tahoma, Verdana;">
							<td class="name"
								style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;"><span
								style="font-size: 10pt; font-family: Arial;"
								class="Apple-style-span"><span lang="vi"
									style="font-size: 10pt;" class="Apple-style-span">TLoại
										sản phẩm:</span></span></td>
							<td class="value"
								style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
								<span style="font-size: 10pt; font-family: Arial;"
								class="Apple-style-span"> ${sp.loaisp} </span>
							</td>
						</tr>

						<tr class="technical" style="font-family: Tahoma, Verdana;">
							<td class="name"
								style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;"><span
								style="font-size: 10pt; font-family: Arial;"
								class="Apple-style-span"><span lang="vi"
									style="font-size: 10pt;" class="Apple-style-span">Xuất
										xứ:</span></span></td>
							<td class="value"
								style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
								<span style="font-size: 10pt; font-family: Arial;"
								class="Apple-style-span">${sp.xuatxu} </span>
							</td>
						</tr>

						<tr class="technical" style="font-family: Tahoma, Verdana;">
							<td class="name"
								style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;"><span
								style="font-size: 10pt; font-family: Arial;"
								class="Apple-style-span"><span lang="vi"
									style="font-size: 10pt;" class="Apple-style-span">Thương
										hiệu:</span></span></td>
							<td class="value"
								style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
								<span style="font-size: 10pt; font-family: Arial;"
								class="Apple-style-span">${sp.thuonghieu} </span>
							</td>
						</tr>

						<tr class="technical" style="font-family: Tahoma, Verdana;">
							<td class="name"
								style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;"><span
								style="font-size: 10pt; font-family: Arial;"
								class="Apple-style-span"><span lang="vi"
									style="font-size: 10pt;" class="Apple-style-span">Tình
										trạng:</span></span></td>
							<td class="value"
								style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
								<span style="font-size: 10pt; font-family: Arial;"
								class="Apple-style-span">${sp.tinhtrangsp} </span>
							</td>
						</tr>

						<tr class="technical" style="font-family: Tahoma, Verdana;">
							<td class="name"
								style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;"><span
								style="font-size: 10pt; font-family: Arial;"
								class="Apple-style-span"><span lang="vi"
									style="font-size: 10pt;" class="Apple-style-span">Người
										đăng:</span></span></td>
							<td class="value"
								style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
								<span style="font-size: 10pt; font-family: Arial;"
								class="Apple-style-span">${sp.nguoidang} </span>
							</td>
						</tr>

						<tr class="technical" style="font-family: Tahoma, Verdana;">
							<td class="name"
								style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;"><span
								style="font-size: 10pt; font-family: Arial;"
								class="Apple-style-span"><span lang="vi"
									style="font-size: 10pt;" class="Apple-style-span">Hình
										thức thanh toán:</span></span></td>
							<td class="value"
								style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
								<span style="font-size: 10pt; font-family: Arial;"
								class="Apple-style-span">${sp.httt}</span>
							</td>
						</tr>

						<tr class="title"
							style="background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: rgb(229, 229, 229); color: rgb(204, 0, 0); font-weight: bold; text-align: center;">
							<td colspan="2" lang="vi"
								style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
								<span style="font-size: 10pt; font-family: Arial;"
								class="Apple-style-span"> Mô tả sản phẩm</span>
							</td>
						</tr>
						<tr class="technical" style="font-family: Tahoma, Verdana;">
							<td class="name"
								style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: left; width: 327px;"
								colspan="2"><span
								style="font-size: 10pt; font-family: Arial;"
								class="Apple-style-span"><span lang="vi"
									style="font-size: 10pt;" class="Apple-style-span">${sp.mota}</span></span>
							</td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<form action="${pageContext.request.contextPath}/huydaugia"
							method="post">
							<input type="hidden" name="masp" value="${sp.masp}">
							<tr class="technical" style="font-family: Tahoma, Verdana;">
								<td class="name"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span"><span lang="vi"
										style="font-size: 10pt;" class="Apple-style-span">Lý do
											hủy:</span></span></td>
								<td class="value"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
									<span style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span"><textarea name="txtlydo"
											cols="3" rows="3"
											style="margin: 2px; width: 300px; height: 100px;"></textarea></span>
								</td>
							</tr>
							<tr class="title"
								style="background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: rgb(229, 229, 229); color: rgb(204, 0, 0); font-weight: bold; text-align: center;">
								<td colspan="2" lang="vi"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
									<span style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span"> <input type="submit"
										name="action" value="Hủy đấu giá" />
								</span>
								</td>
							</tr>
						</form>
					</tbody>
				</table>
			</span>
		</div>
	</div>
	<!-- Right side -->
	<div id="box-right" class="fl l10 top10 bg_white wright cright">
		<div id="catalog-products" class="fl wright">
			<div id="catalog-products-titles"
				class="fl bg-titles top10 products-group-title-news color_white fontTahoma wright-26">
				<strong>Quản lý</strong>
			</div>
			<ul id="catalog-products-list"
				class="fl fontTahoma wright list-none top5">
				<li class="fl pd5 w240 "><a class="fl  pdl20"
					href="${pageContext.request.contextPath}/sanphamhuyadmin">Hủy
						đấu giá</a></li>
				<li class="fl wright das_top h1"></li>
				<li class="fl pd5 w240 "><a class="fl  pdl20"
					href="${pageContext.request.contextPath}/sanphamchophepdauadmin">Cho
						phép đấu</a></li>
				<li class="fl wright das_top h1"></li>
			</ul>
		</div>
	</div>
</div>


