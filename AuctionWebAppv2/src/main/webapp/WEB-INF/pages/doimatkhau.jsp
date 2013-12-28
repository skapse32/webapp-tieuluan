<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


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
					<a class="fl link_blue bold" href="">${username}</a>
				</div>
				<img class="fl right8" src="${pageContext.request.contextPath}/resources/v2/images/arrow.gif" alt="" />
				<div class="fl top3 right8">
					<a class="fl link_blue bold" href="">Đổi mật khẩu người dùng</a>
				</div>
			</div>
		</div>
		<form id="Form_Registration" method="post"
			action="${pageContext.request.contextPath}/taikhoan/doimatkhau?action=thaydoi">
			<h2 class="h2row" align="center">Thay đổi mật khảu</h2>
			<br />
			<table style="width: 98%; font-size: 10pt">
				<tr>
					<td style="width: 290px; vertical-align: middle;" align="right">Mật
						khẩu hiện tại&nbsp;</td>
					<td><span id="spMKHienTai"> <input type="password"
							name="MKHienTai" id="MKHienTai" /> <span
							class="passwordRequiredMsg">*</span></span></td>
				</tr>
				<tr>
					<td style="width: 290px; vertical-align: middle;" align="right">Mật
						khẩu mới&nbsp;</td>
					<td><span id="spMatKhau"> <input type="password"
							name="MatKhau" id="MatKhau" /> <span class="passwordRequiredMsg">*</span><span
							class="passwordMinCharsMsg">Mật khẩu ít nhất phải có 6 ký
								tự</span>
					</span></td>
				</tr>
				<tr>
					<td style="width: 290px; vertical-align: middle;" align="right">Nhập
						lại mật khẩu&nbsp;</td>
					<td><span id="scNhapLai"> <input type="password"
							name="NhapLai" id="NhapLai" /> <span class="confirmRequiredMsg">*</span>
							<span class="confirmInvalidMsg">Xác nhận mật khẩu chưa
								đúng</span>
					</span></td>
				</tr>
			</table>
			<div align="center">
				<p style="color: Red">${error}</p>
				<input name="btnDangKy" type="submit" value="Đổi mật khẩu"
					onclick="" />
			</div>
		</form>
		<br />
		<script type="text/javascript">
			var sprypassword1 = new Spry.Widget.ValidationPassword(
					"spMKHienTai", {
						minChars : 6,
						validateOn : [ "change" ]
					});
			var sprypassword2 = new Spry.Widget.ValidationPassword("spMatKhau",
					{
						minChars : 6,
						validateOn : [ "change" ]
					});
			var spryconfirm1 = new Spry.Widget.ValidationConfirm("scNhapLai",
					"MatKhau", {
						validateOn : [ "change" ]
					});
		</script>
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
</div>
