<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!-- Content -->
<div id="content" class="wmain">

	<!-- Left side -->
	<c:choose>
		<c:when test="${sessionScope.role == 'BannedUser'}">
			<center>
				<h2 style="padding-top: 50px">
					Tài khoản của bạn đã bị cấm hoạt động<br /> Vì bạn đã vi phạm một
					số điều khoản của Website!.
				</h2>
			</center>
			<div class="userpanel bor_gr">
				<table>
					<tr>
						<td><a href="${pageContext.request.contextPath}/dangxuat"><img
								src="${pageContext.request.contextPath}/resources/images/logout.png" /><label>Đăng
									xuất</label></a></td>
					</tr>
				</table>

			</div>
		</c:when>
		<c:otherwise>
			<div id="box-left" class="fl top10 bg_white wleft">
				<div id="products-group" class="fl bg-top-products wleft">
					<div id="browser-modules" class="fl browser fontTahoma">
						<a href="" class="fl url_home l8 right8"> <img
							class="fl w21-18" alt="" src="${pageContext.request.contextPath}/resources/v2/images/blank.gif" />
						</a> <img class="fl right8" src="${pageContext.request.contextPath}/resources/v2/images/arrow.gif" alt="" />
						<div class="fl top3 right8">
							<a class="fl link_blue bold" href="">${username}</a>
						</div>
						<img class="fl right8" src="${pageContext.request.contextPath}/resources/v2/images/arrow.gif" alt="" />
						<div class="fl top3 right8">
							<a class="fl link_blue bold" href="">Quản lý thông tin User</a>
						</div>
					</div>
				</div>

				<div class="userpanel bor_gr">
					<table>
						<c:if test="${sessionScope.role != 'Admin'}">
							<tr>
								<td><a
									href="${pageContext.request.contextPath}/sanphamdangdau.html"><img
										src="${pageContext.request.contextPath}/resources/images/view_list.png" /><label>Danh
											sách sản phẩm</label></a></td>
							</tr>
							<tr>
								<td><a
									href="${pageContext.request.contextPath}/dangsanpham"><img
										src="${pageContext.request.contextPath}/resources/images/add.png" /><label>Đăng
											sản phẩm</label></a></td>
							</tr>
						</c:if>
						<tr>
							<td><a href="${pageContext.request.contextPath}/dangxuat"><img
									src="${pageContext.request.contextPath}/resources/images/logout.png" /><label>Đăng
										xuất</label></a></td>
						</tr>
					</table>

				</div>
			</div>
		</c:otherwise>
	</c:choose>
</div>

<div class="DIVclear"></div>