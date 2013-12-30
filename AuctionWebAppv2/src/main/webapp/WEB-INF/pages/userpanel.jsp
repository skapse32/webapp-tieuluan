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

			<!-- Right side -->
			<div id="box-right" class="fl l10 top10 bg_white wright cright">
				<c:choose>
					<c:when test="${sessionScope.role != null}">
						<c:choose>
							<c:when test="${sessionScope.role == 'Admin'}">
								<div id="catalog-products-titles"
									class="fl bg-titles top10 products-group-title-news color_white fontTahoma wright-26">
									<strong>Quản lý Sản phẩm(Admin)</strong>
								</div>
								<ul id="catalog-products-list"
									class="fl fontTahoma wright list-none top5">
									<li class="fl pd5 w240 "><a class="fl  pdl20"
										href="${pageContext.request.contextPath}/sanphamhuyadmin">Quản
											lý sản phẩm (admin)</a></li>
									<li class="fl wright das_top h1"></li>
									<li class="fl pd5 w240 "><a class="fl  pdl20"
										href="${pageContext.request.contextPath}/qlyuser">Quản lý
											User</a></li>
									<li class="fl wright das_top h1"></li>
									<li class="fl pd5 w240 "><a class="fl  pdl20"
										href="${pageContext.request.contextPath}/hoadon">Hoá đơn</a></li>
									<li class="fl wright das_top h1"></li>
								</ul>
							</c:when>
							<c:otherwise>
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
										<li class="fl pd5 w240 "><a class="fl  pdl20"
											href="doimatkhau">Đổi mật khẩu</a></li>
										<li class="fl wright das_top h1"></li>
										<li class="fl pd5 w240 "><a class="fl  pdl20"
											href="qlsanphamdangthamgia">Quản lý sản phẩm</a></li>
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
											href="${pageContext.request.contextPath}/qlsanphamchienthang?trangthai=1">Sản
												phẩm chiến thắng chưa thanh toán</a></li>
										<li class="fl wright das_top h1"></li>
										<li class="fl pd5 w240 "><a class="fl pd5 w240 "
											href="${pageContext.request.contextPath}/qlsanphamchienthang?trangthai=3">Sản
												phẩm chiến thắng đã thanh toán</a></li>
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
											href="${pageContext.request.contextPath}/dangsanpham">Đăng
												sản phẩm</a></li>
										<li class="fl wright das_top h1"></li>
									</ul>
								</div>
							</c:otherwise>
						</c:choose>
						</c:when>
				</c:choose>
			</div>
			<!-- Right side END -->
		</c:otherwise>
	</c:choose>
</div>

<div class="DIVclear"></div>


