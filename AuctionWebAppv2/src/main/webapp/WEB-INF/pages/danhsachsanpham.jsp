<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">
	function pad(d) {
		return (d < 10) ? '0' + d.toString() : d.toString();
	}
</script>

<c:if test = "${link == 'sanphamdangdau'}">
<script type="text/javascript">
	//
	var timer;
	$(function() {
		timer = setInterval(vartimertick, 1000);
	});
	function vartimertick() {
		// get the form values
		var maLoaiSP = $('#maLoaiSP').val();
		var size = $('#size').val();
		var page = $('#page').val();
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/loaddssanphamdangdau",
			data : "maLoaiSP=" + maLoaiSP + "&size=" + size + "&page=" + page,
			success : function(data) {
				// we have the response
				var dsspList = jQuery.parseJSON(data);
				$.each(dsspList,function(index, element) {
					var x = numeral(element.giahientai).format(
							'0,0');
					x = x.replace(/,/g, ".");

					document.getElementById("giahientai"
							+ element.masp).innerHTML = x
							+ "&nbsp;đ";
				});

			}
		});
	};
</script>
</c:if>

<!-- Content -->
<div id="content" class="wmain">
	<!-- Left side -->
	<div id="box-left" class="fl top10 bg_white wleft">
		

		<!-- Sản phẩm đang đấu -->
		<div id="yamaha-xe-ga" class="fl top10 bg-top-products wleft">
			<div id="yamaha-xe-ga-title"
				class="fl bg-titles products-group-title-news color_white fontTahoma">
				<a class="link-white" href="#"><strong>${tieude}</strong></a>
			</div>
			<img alt="" src="${pageContext.request.contextPath}/resources/v2/images/sub-titles.jpg" />
			<div style="float: right; padding-top: 6px">
				<form action="">
					<input type="hidden" id="maLoaiSP" name="maLoaiSP"
						value="${maLoaiSP}"> <input type="hidden" id="page"
						name="trang" value="${trang}"> <input type="hidden"
						id="size" value="${soLuongSanPhamTrenTrang}"><label
						style="color:#AB2D2A">Trang &nbsp;</label>
					<c:forEach var="i" begin="1" end="${soTrang}" step="1">
						<c:choose>
							<c:when test="${check == 'thuonghieu'}">
								<a style="color: #00C"
							href="${pageContext.request.contextPath}/${link}?thuonghieu=${thuonghieu}&trang=${i}&soLuongSanPhamTrenTrang=${soLuongSanPhamTrenTrang}">
							</c:when>
							<c:when test="${check == 'maloaiSP'}">
								<a style="color: #00C"
									href="${pageContext.request.contextPath}/${link}?maLoaiSP=${maLoaiSP}&trang=${i}&soLuongSanPhamTrenTrang=${soLuongSanPhamTrenTrang}">
							</c:when>
							<c:otherwise>
								<a style="color: #00C"
									href="${pageContext.request.contextPath}/${link}?locsp=${locsp}&trang=${i}&soLuongSanPhamTrenTrang=${soLuongSanPhamTrenTrang}">
							</c:otherwise>
						</c:choose>

							<c:choose>
								<c:when test="${i==trang}">
									<input type="button" value="${i}"
										class="bu-a" />
								</c:when>
								<c:otherwise>
									<input type="button" value="${i}" class="bu" />
								</c:otherwise>
							</c:choose>
						</a>
					</c:forEach>

					<label for="soLuongSanPhamTrenTrang" style="color:#AB2D2A">Số lượng</label> <select class="s-page"
						name="soLuongSanPhamTrenTrang" onchange="submit()">
						<c:forEach var="i" begin="1" end="5">
							<option
								<c:if test="${i*8 == soLuongSanPhamTrenTrang}" >
		                                selected="selected"
		                            </c:if>
								value="${i*8}">${i*8}</option>
						</c:forEach>
						<option
							<c:if test="${soLuongSanPhamTrenTrang==-1}" >
		                            selected="selected"
		                        </c:if>
							value="-1">Tất cả</option>
					</select>
				</form>
			</div>
			<ul id="yamaha-xe-ga-list"
				class="fl clb top10 list-none wleft-2 bor_group">

				<!-- San Pham -->
				<c:forEach var="sp" items="${dssp}">
					<div align="center" class="fl pd05 w170 hpros sep_pros">
						<div class="HinhSP">
							<a
								href="chitietsanpham?masp=${sp.masp}"><img
								class="HinhSP_Resize" src="${imageDirectory}${sp.hinhanh}" /></a>
						</div>
						<div class="TenSP"><c:out value="${sp.tensp}" /></div>
						<div class="Gia" id="giahientai${sp.masp}"></div>
						<input type="hidden" id="time${sp.masp}"
							value="${sp.thoigianketthuc}">
						<div class="Countdown" id="Countdown${sp.masp}"></div>
						
						<c:if test="${link != 'sanphamdadau' }">
						<script type="text/javascript">
							$(function() {
								var stringday = $('#time${sp.masp}').val()
										.toString();
								var longday = Number(stringday);
								var BigDay = new Date(longday);
								var msPerDay = 24 * 60 * 60 * 1000;
								window
										.setInterval(
												function() {
													var today = new Date();
													var timeLeft = (BigDay
															.getTime() - today
															.getTime());
													if (Math.floor(timeLeft) > 0) {
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
														$('#Countdown${sp.masp}').html(timeString);
													} else {
														//var timeString = "00 ngày " + "00:" +  "00:00";
														var timeString = "Kết thúc";
														$('#Countdown${sp.masp}')
																.html(
																		timeString);
														document
																.getElementById('Countdown${sp.masp}').style.color = 'red'; //'none';
														document
																.getElementById('bid${sp.masp}').style.visibility = 'hidden';
													}
												}, 1000);
							});
						</script>
						</c:if>

						<p class="top10" align="center">
							<a
								href="${pageContext.request.contextPath}/chitietsanpham?masp=${sp.masp}"
								class="fl l35 bg-hit detail_products">Đặt giá</a>
						</p>
					</div>
				</c:forEach>
				<!-- San Pham END-->
			</ul>
		</div>
		<!-- Sản phẩm đang đấu end -->

	</div>
	<!-- Left side END -->
</div>
<!-- Content END -->