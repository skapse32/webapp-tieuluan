<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">
	var timer;
	$(function() {
		timer = setInterval(vartimertick, 1000);
	});
	var varCounter = 0;
	function vartimertick() {
		$
				.ajax({
					type : "${method}",
					url : "${link}",
					success : function(data) {
						// we have the response
						var dsspList = jQuery.parseJSON(data);
						$
								.each(
										dsspList,
										function(index, element) {
											document.getElementById("nguoidat"
													+ element.masp).innerHTML = element.nguoidat;
											var x = numeral(element.giahientai)
													.format('0,0');
											x = x.replace(/,/g, ".");

											document
													.getElementById("giahientai"
															+ element.masp).innerHTML = x
													+ "&nbsp;đ";
										});

					},
					error : function(e) {
						alert('Error: ' + e);
					}
				});
	};
</script>
<script type="text/javascript">
	function pad(d) {
		return (d < 10) ? '0' + d.toString() : d.toString();
	}
</script>

<!-- Content -->
<div id="content" class="wmain">
	<!-- Left side -->
	<div id="box-left" class="fl top10 bg_white wleft">
		<div id="error" style="color: red;"></div>
		<div id="gio-hang-cua-ban" class="fl top10 bg_white wleft">
			<div class="fl top10 bg_white wleft">
				<div class="fl wmain h27 bg_sep_bottom">
					<div class="fl h27 isep1 lf21"></div>
					<div class="fr h27 isep1 rg21"></div>
				</div>

				<div class="fl bor-top-lr wleft bg-top-product miniHeight"
					style="width: 730px">
					<div
						class="fl wleft bor-top-lr bg_browser bor_bottom_white pdtop-bottom-6">
						<a href="#" class="fl url_home left10 right8"> <img
							class="fl w21-18" alt="" src="resources/v2/images/blank.gif" />
						</a> <img class="fl right8" src="resources/v2/images/arrow.gif" alt="" />
						<div class="fl top3 right8">
							<a class="fl link_blue bold" href="#">Giỏ hàng</a>
						</div>
						<img class="fl right8" src="resources/v2/images/arrow.gif" alt="" />
					</div>
					<div class="fl clb">
						<div class="fl wleft">
							<div class="fl wleft bg_group top10">
								<div
									class="fl pdleft10 pdright15 bg_num pdtop5 pdbottom10 bold color_white fontTahoma font16">1</div>
								<div class="fl pdtop7 pdleft10 fontTahoma font13 color3d">
									<strong>${tieude}</strong>
								</div>
							</div>
							<c:choose>
								<c:when test="${not empty dssp}">
									<ul class="fl wleft top10 list_style">
										<li class="fl wleft line24 bor-top bold color3d"><span
											class="fl l35 w70 txc">STT</span> <span class="fl w350">Sản
												phẩm</span> <span class="fl w126 txc">Giá khởi điểm(VNĐ)</span> <span
											class="fl w126 txc">Giá hiện tại(VNĐ)</span> <span
											class="fl w80 txc">Số lượng</span></li>
										<c:forEach var="sp" items="${dssp}">
											<li class="fl wleft line24 bor-top color3d pdtop5 pdb5">
												<span class="fl l35 w70 txc">${sp.masp}</span> <span
												class="fl w350 "> <a class="fl"
													href="chitietsanpham.html?masp=${sp.masp}" title=""> <img
														alt="" class="img_small"
														src="${imageDirectory}${sp.hinhanh}" />
												</a>
													<div class="fl l5">
														<a class="fl bold" href="#chitietsanpham"
															title="NOZZA Limited Edition MÀU ĐEN">${sp.tensp}</a> <span
															class="fl clb color_gray">Mã: ${sp.masp}</span> <input
															type="hidden" id="time${sp.masp}"
															value="${sp.thoigianketthuc}"> <br /> <br />
														<div id="Countdown${sp.masp}"></div>
														<script type="text/javascript">
															$(function() {
																var stringday = $(
																		'#time${sp.masp}')
																		.val()
																		.toString();
																var longday = Number(stringday);
																var BigDay = new Date(
																		longday);
																var msPerDay = 24 * 60 * 60 * 1000;
																window
																		.setInterval(
																				function() {
																					var today = new Date();
																					var timeLeft = (BigDay
																							.getTime() - today
																							.getTime());
																					if (Math
																							.floor(timeLeft) > 0) {
																						var e_daysLeft = timeLeft
																								/ msPerDay;
																						var daysLeft = pad(Math
																								.floor(e_daysLeft));
																						var e_hrsLeft = (e_daysLeft - daysLeft) * 24;
																						var hrsLeft = pad(Math
																								.floor(e_hrsLeft));
																						var e_minsLeft = (e_hrsLeft - hrsLeft) * 60;
																						var minsLeft = pad(Math
																								.floor(e_minsLeft));
																						var e_secsLeft = (e_minsLeft - minsLeft) * 60;
																						var secsLeft = pad(Math
																								.floor(e_secsLeft));
																						var timeString = daysLeft
																								+ " ngày "
																								+ hrsLeft
																								+ ":"
																								+ minsLeft
																								+ ":"
																								+ secsLeft;
																						$(
																								'#Countdown${sp.masp}')
																								.html(
																										timeString);
																					} else {
																						//var timeString = "00 ngày " + "00:" +  "00:00";
																						var timeString = "kết thúc";
																						$(
																								'#Countdown${sp.masp}')
																								.html(
																										timeString);
																						document
																								.getElementById('Countdown${sp.masp}').style.color = 'red'; //'none';

																					}
																				},
																				1000);
															});
														</script>
													</div>
											</span> <span class="fl w126 txc"> <fmt:formatNumber
														type="currency" currencyCode="VND"
														value="${sp.giakhoidiem}" />
											</span> <span class="fl w126 txc" id="giahientai${sp.masp}">1200</span>
												<span class="fl w80 txc"> ${sp.soluong} </span>
											</li>
											<c:if test="${not empty sapdau }">
												<div id="divcapnhatxoa"
													style="width: 17%; color: #7E7C7C; font-size: 12px; font-weight: bold; padding-top: 10px; margin-left: 560px">
													<a style="text-decoration: none;"
														href="${pageContext.request.contextPath}/capnhatsanpham?masp=${sp.masp}">Cập
														nhật</a> &nbsp;&nbsp; <a
														style="text-decoration: none; color: red"
														href="${pageContext.request.contextPath}/xoasanpham?masp=${sp.masp}">Xóa</a>
												</div>
											</c:if>
											<c:if test="${not empty capnhatsanphamhuy }">
												<a
													style="font-size: 12px; text-decoration: none; font-weight: bold;"
													href="${pageContext.request.contextPath}/capnhatsanphambihuy?masp=${sp.masp}">Xem</a>
											</c:if>
											<c:choose>
												<c:when test="${sessionScope.role != null}">
													<c:choose>
														<c:when test="${sessionScope.role == 'Admin'}">
															<div
																style="width: 14%; color: #7E7C7C; font-size: 12px; font-weight: bold; text-align: center; padding-top: 10px;">
																<c:choose>
																	<c:when test="${sp.tinhtrangdaugia == 0}">
																		<a
																			style="font-size: 12px; text-decoration: none; font-weight: bold;"
																			href="${pageContext.request.contextPath}/huysanpham?masp=${sp.masp}">Hủy</a>
																	</c:when>
																	<c:when test="${not empty chophepdau }">
																		<a
																			style="font-size: 12px; text-decoration: none; font-weight: bold;"
																			href="${pageContext.request.contextPath}/chophepdaugia?masp=${sp.masp}">
																			Cho phép đấu </a>
																	</c:when>
																	<c:otherwise>Đã hủy</c:otherwise>
																</c:choose>
															</div>
														</c:when>
													</c:choose>
												</c:when>
											</c:choose>
										</c:forEach>
										<c:if test="${sessionScope.role != 'Admin'}">
											<li class="fl wleft line24 bor-top bold color3d pdt10 pdb5">
												<span class="fl l35 w70 txc"></span> <a class="fr right8"
												href="/daugia/" title="Xem tiếp"> >>Tiếp tục chọn sản
													phẩm</a>
											</li>
										</c:if>
									</ul>
								</c:when>
								<c:otherwise>
									Không có sản phẩm trong mục này.
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Left side -->

	<!-- Right side -->
	<div id="box-right" class="fl l10 top10 bg_white wright cright">
		<c:choose>
			<c:when test="${sessionScope.role != null}">
				<c:choose>
					<c:when test="${sessionScope.role == 'Admin'}">
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
					</c:when>
					<c:otherwise>
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
	<div class="DIVclear"></div>
</div>