<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page language="java" import="com.tieuluan.daugia.function.Server" %>

<!-- Content -->
<div id="content" class="wmain">
	<!-- Left side -->
	<div id="box-left" class="fl top10 bg_white wleft">
		<div id="products-group" class="fl bg-top-products wleft">
			<div id="browser-modules" class="fl browser fontTahoma">
				<a href="" class="fl url_home l8 right8"> <img class="fl w21-18"
					alt="" src="${pageContext.request.contextPath}/resources/v2/images/blank.gif" />
				</a> <img class="fl right8" src="${pageContext.request.contextPath}/resources/v2/images/arrow.gif" alt="" />
				<div class="fl top3 right8">
					<a class="fl link_blue bold" href="">${user.username}</a>
				</div>
				<img class="fl right8" src="${pageContext.request.contextPath}/resources/v2/images/arrow.gif" alt="" />
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
						<td rowspan="8" class="name"
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
							class="Apple-style-span">
							<c:choose>
								<c:when test="${user.gioiTinh == true}">Nam</c:when>
								<c:otherwise>Nữ</c:otherwise>
							</c:choose>
							
							</span>
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
					</tr>
					<c:if test="${sessionScope.role == 'Admin' }">
					
					<tr class="technical" style="font-family: Tahoma, Verdana;">
						<td class="name"
							style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 150px;">
							<span style="font-size: 10pt; font-family: Arial;"
							class="Apple-style-span"> Cấm người dùng sử dụng dịch vụ : </span>
						</td>
						<td class="value"
							style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
							<span style="font-size: 10pt; font-family: Arial;"
							class="Apple-style-span">
							<c:choose>
							<c:when test="${userrole == 'BannedUser'}">
							<form action="${pageContext.request.contextPath}/activeUser" method="post">
								<input type="hidden" name="useractive" value="${user.username}"/>
								<input type="submit" value="Kích hoạt lại"/>
							</form>
							</c:when>
							<c:otherwise>
							<form action="${pageContext.request.contextPath}/banUser" method="post">
								<input type="hidden" name="userban" value="${user.username}"/>
								<input type="submit" value="thực hiện cấm"/>
							</form>
							</c:otherwise>
							</c:choose>
							</span>
						</td>
					</tr>
					</c:if>
					<c:choose>
					<c:when test="${sessionScope.username == user.username}">
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
					</c:when>
					<c:otherwise>
						<tr class="technical" style="font-family: Tahoma, Verdana;">
						<td class="name"
							style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 150px;">
							<span style="font-size: 10pt; font-family: Arial;"
							class="Apple-style-span"> Xem đánh giá người này : </span>
						</td>
						<td class="value"
							style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
							<span style="font-size: 10pt; font-family: Arial;"
							class="Apple-style-span">
							<a href="<%= Server.addressDanhGiaWA %>/user/kqdanhgia/${user.username}">${user.username}</a>
							</span>
						</td>
					</tr>
					</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</span>
		<div class="divMain">
			<div class="divSubRight2"></div>
		</div>
	</div>
	<!-- End Left Side -->
</div>
<div class="DIVclear"></div>