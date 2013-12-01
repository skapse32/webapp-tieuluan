<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!-- Content -->
<div id="content" class="wmain">
	<!-- Left side -->
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
					<a class="fl link_blue bold" href="">${tieude}</a>
				</div>
			</div>
		</div>
		<span class="Apple-style-span"
			style="font-family: Tahoma, Verdana; font-size: 12px; line-height: 17px; background-color: rgb(255, 255, 255);">
			<table class="product_technical_table" cellpadding="0"
				cellspacing="0"
				style="font-family: Tahoma, Verdana; border-collapse: collapse; width: 730px">
				<tbody style="font-family: Tahoma, Verdana;">
					<tr class="title"
						style="background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: rgb(229, 229, 229); color: rgb(204, 0, 0); font-weight: bold; text-align: center;">
						<td colspan="3" lang="vi"
							style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
							<span style="font-size: 10pt; font-family: Arial;"
							class="Apple-style-span"> Thông tin tài khoản </span>
						</td>
					</tr>
					<tr class="technical" style="font-family: Tahoma, Verdana;">
						<td rowspan="7" class="name"
							style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 250px;">
							<span style="font-size: 10pt; font-family: Arial;"
							class="Apple-style-span"> <img
								src="${pageContext.request.contextPath}/resources/images/bg_userinfo.jpg">
						</span>
						</td>
						<td class="name"
							style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 150px">
							<span style="font-size: 10pt; font-family: Arial;"
							class="Apple-style-span"> Tên đăng nhập : </span>
						</td>
						<td class="value"
							style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
							<span style="font-size: 10pt; font-family: Arial;"
							class="Apple-style-span"> ${user.username }</span>
						</td>
						<td></td>
					</tr>
					<tr class="technical" style="font-family: Tahoma, Verdana;">
						<td class="name"
							style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 150px;">
							<span style="font-size: 10pt; font-family: Arial;"
							class="Apple-style-span"> Email : </span>
						</td>
						<td class="value"
							style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
							<span style="font-size: 10pt; font-family: Arial;"
							class="Apple-style-span"> ${user.email }</span>
						</td>
						<td></td>
					</tr>
					<tr class="technical" style="font-family: Tahoma, Verdana;">
						<td class="name"
							style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 150px;">
							<span style="font-size: 10pt; font-family: Arial;"
							class="Apple-style-span"> Họ tên : </span>
						</td>
						<td class="value"
							style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
							<span style="font-size: 10pt; font-family: Arial;"
							class="Apple-style-span"> ${user.hoTen }</span>
						</td>
						<td></td>
					</tr>
					<tr class="technical" style="font-family: Tahoma, Verdana;">
						<td class="name"
							style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 150px;">
							<span style="font-size: 10pt; font-family: Arial;"
							class="Apple-style-span"> Ngày sinh </span>
						</td>
						<td class="value"
							style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
							<span style="font-size: 10pt; font-family: Arial;"
							class="Apple-style-span"> ${user.ngaySinh}</span>
						</td>
						<td></td>
					</tr>
					<tr class="technical" style="font-family: Tahoma, Verdana;">
						<td class="name"
							style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 150px;">
							<span style="font-size: 10pt; font-family: Arial;"
							class="Apple-style-span"> Giới tính : </span>
						</td>
						<td class="value"
							style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
							<span style="font-size: 10pt; font-family: Arial;"
							class="Apple-style-span"> ${gioiTinh}</span>
						</td>
						<td></td>
					</tr>
					<tr class="technical" style="font-family: Tahoma, Verdana;">
						<td class="name"
							style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 150px;">
							<span style="font-size: 10pt; font-family: Arial;"
							class="Apple-style-span"> Địa chỉ : </span>
						</td>
						<td class="value"
							style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
							<span style="font-size: 10pt; font-family: Arial;"
							class="Apple-style-span"> ${user.diaChi}</span>
						</td>
						<td></td>
					</tr>
					<tr class="technical" style="font-family: Tahoma, Verdana;">
						<td class="name"
							style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 150px;">
							<span style="font-size: 10pt; font-family: Arial;"
							class="Apple-style-span"> Điện thoại : </span>
						</td>
						<td class="value"
							style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
							<span style="font-size: 10pt; font-family: Arial;"
							class="Apple-style-span"> ${user.dienThoai}</span>
						</td>
						<td></td>
					</tr>
					<tr class="title"
						style="background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: rgb(229, 229, 229); color: rgb(204, 0, 0); font-weight: bold; text-align: center;">
						<td colspan="3" lang="vi"
							style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
							<span style="font-size: 10pt; font-family: Arial;"
							class="Apple-style-span"> Chức năng </span>
						</td>
					</tr>
					<tr class="technical" style="font-family: Tahoma, Verdana;">
						<td rowspan="3" class="name"
							style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 250px;">
							<span style="font-size: 10pt; font-family: Arial;"
							class="Apple-style-span"> <img
								src="${pageContext.request.contextPath}/resources/images/bg_config.jpg">
						</span>
						</td>
						<td class="name"
							style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 150px;">
							<span style="font-size: 10pt; font-family: Arial;"
							class="Apple-style-span"> <img
								src="${pageContext.request.contextPath}/resources/images/bg_changepassword.jpg">
						</span>
						</td>
						<td class="value"
							style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
							<span style="font-size: 10pt; font-family: Arial;"
							class="Apple-style-span"> <a
							href="${pageContext.request.contextPath}/taikhoan/doimatkhau">Thay
								đổi mật khẩu</a></span>
						</td>
					</tr>
					<tr class="technical" style="font-family: Tahoma, Verdana;">
						<td class="name"
							style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 150px;">
							<span style="font-size: 10pt; font-family: Arial;"
							class="Apple-style-span"> <img
								src="${pageContext.request.contextPath}/resources/images/bg_auctionlist.jpg">
						</span>
						</td>
						<td class="value"
							style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
							<span style="font-size: 10pt; font-family: Arial;"
							class="Apple-style-span"> <a
							href="${pageContext.request.contextPath}/qlsanphamdangthamgia">Quản
								lý các phiên đấu giá</a></span>
						</td>
					</tr>
					<tr class="technical" style="font-family: Tahoma, Verdana;">
						<td colspan="2" class="name"
							style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 150px;">
							<span style="font-size: 10pt; font-family: Arial;"
							class="Apple-style-span"> 
						</span>
						</td>
					</tr>
				</tbody>
			</table>
		</span>
		<div class="divMain">
			<div class="divSubRight2"></div>
		</div>
	</div>
	<!-- End Left Side -->
	<!-- Right side -->
	<div id="box-right" class="fl l10 top10 bg_white wright cright">
		<div id="catalog-products" class="fl wright">
			<div id="catalog-products-titles"
				class="fl bg-titles top10 products-group-title-news color_white fontTahoma wright-26">
				<strong>Quản lý tài khoản</strong>
			</div>
			<ul id="catalog-products-list"
				class="fl fontTahoma wright list-none top5">
				<li class="fl pd5 w240 "><a class="fl  pdl20"
					href="thongtintaikhoan">Thông tin tài khoản</a></li>
				<li class="fl wright das_top h1"></li>
				<li class="fl pd5 w240 "><a class="fl  pdl20" href="doimatkhau">Đổi
						mật khẩu</a></li>
				<li class="fl wright das_top h1"></li>
			</ul>
		</div>
				<div id="catalog-products" class="fl wright">
			<div id="catalog-products-titles"
				class="fl bg-titles top10 products-group-title-news color_white fontTahoma wright-26">
				<strong>Danh sách đấu giá</strong>
			</div>
			<ul id="catalog-products-list"
				class="fl fontTahoma wright list-none top5">
				<li class="fl pd5 w240 "><a class="fl pd5 w240 "
					href="${pageContext.request.contextPath}/qlsanphamdangthamgia">Sản
						phẩm đang tham gia</a></li>
				<li class="fl wright das_top h1"></li>
				<li class="fl pd5 w240 "><a class="fl pd5 w240 "
					href="${pageContext.request.contextPath}/qlsanphamdaketthuc">Sản
						phẩm đã kết thúc</a></li>
				<li class="fl wright das_top h1"></li>
				<li class="fl pd5 w240 "><a class="fl pd5 w240 "
					href="${pageContext.request.contextPath}/qlsanphamchienthang">Sản
						phẩm chiến thắng</a></li>
				<li class="fl wright das_top h1"></li>
			</ul>
		</div>
		<div id="catalog-products" class="fl wright">
			<div id="catalog-products-titles"
				class="fl bg-titles top10 products-group-title-news color_white fontTahoma wright-26">
				<strong>Sản phẩm của tôi</strong>
			</div>
			<ul id="catalog-products-list"
				class="fl fontTahoma wright list-none top5">
				<li class="fl pd5 w240 "><a class="fl pd5 w240 "
					href="${pageContext.request.contextPath}/qlsanphamcuatoidangdau">Sản
						phẩm đang đấu</a></li>
				<li class="fl wright das_top h1"></li>
				<li class="fl pd5 w240 "><a class="fl pd5 w240 "
					href="${pageContext.request.contextPath}/qlsanphamcuatoisapdau">Sản
						phẩm sắp đấu</a></li>
				<li class="fl wright das_top h1"></li>
				<li class="fl pd5 w240 "><a class="fl pd5 w240 "
					href="${pageContext.request.contextPath}/qlsanphamcuatoidadauxong">Sản
						phẩm đã đấu xong</a></li>
				<li class="fl wright das_top h1"></li>
				<li class="fl pd5 w240 "><a class="fl pd5 w240 "
					href="${pageContext.request.contextPath}/qlsanphamcuatoibihuy">Sản
						phẩm bị hủy</a></li>
				<li class="fl wright das_top h1"></li>
				<li class="fl pd5 w240 "><a class="fl pd5 w240 "
					href="${pageContext.request.contextPath}/dangsanpham">Đăng sản
						phẩm</a></li>
				<li class="fl wright das_top h1"></li>
			</ul>
		</div>
	</div>
	<!-- Right side END -->
</div>
<div class="DIVclear"></div>