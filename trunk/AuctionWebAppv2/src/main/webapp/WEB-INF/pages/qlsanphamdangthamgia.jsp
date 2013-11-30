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
					type : "POST",
					url : "/daugia/loaddssanphamdangthamgia",
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
<div class="Column3">
	<h2 id="RegionList" class="h2row">DANH SÁCH ĐẤU GIÁ</h2>
	<ul class="CategoriesList">
		<li class="CategoryList"><a
			href="${pageContext.request.contextPath}/qlsanphamdangthamgia">Sản
				phẩm đang tham gia</a>
		</li>
		<li class="CategoryList"><a
			href="${pageContext.request.contextPath}/qlsanphamdaketthuc">Sản
				phẩm đã kết thúc</a>
		</li>
		<li class="CategoryList"><a
			href="${pageContext.request.contextPath}/qlsanphamchienthang">Sản
				phẩm chiến thắng</a>
		</li>
	</ul>
	<h2 id="RegionList" class="h2row">SẢN PHẨM CỦA TÔI</h2>
	<ul class="CategoriesList">
		<li class="CategoryList"><a
			href="${pageContext.request.contextPath}/qlsanphamcuatoidangdau">Sản
				phẩm đang đấu</a>
		</li>
		<li class="CategoryList"><a
			href="${pageContext.request.contextPath}/qlsanphamcuatoisapdau">Sản
				phẩm sắp đấu</a>
		</li>
		<li class="CategoryList"><a
			href="${pageContext.request.contextPath}/qlsanphamcuatoidadauxong">Sản
				phẩm đã đấu xong</a>
		</li>
		<li class="CategoryList"><a
			href="${pageContext.request.contextPath}/qlsanphamcuatoibihuy">Sản
				phẩm bị hủy</a>
		</li>
		<li class="CategoryList"><a
			href="${pageContext.request.contextPath}/dangsanpham">Đăng sản
				phẩm</a>
		</li>
	</ul>
</div>
<!-- InstanceBeginEditable name="MainRegion" -->
<div class="Column9">
	<h2 id="HomepageFeaturedList" class="h2row" style="text-align: center">${tieude}</h2>
	<br>
	<div>
		<div class="wrap-dtb">
			<div class="wrap-header">
				<div style="width: 30%">Sản phẩm</div>
				<div style="width: 17%">Giá khởi điểm</div>
				<div style="width: 17%">Giá hiện tại</div>
				<div style="width: 16%">Người đặt giá</div>
				<div style="width: 20%">Thời gian</div>
			</div>
			<c:forEach var="sp" items="${dssp}">
				<div class="wrap-td-chan">
					<input type="hidden" id="masp${sp.masp}" value="${sp.masp}">
					<div style="width: 10%;">
						<a
							href="${pageContext.request.contextPath}/chitietsanpham?masp=${sp.masp}"><img
							src="${imageDirectory}${sp.hinhanh}" width="50px" height="40px;">
						</a>
					</div>
					<div style="padding-top: 10px;width: 20%;">
						<a
							style="font-size: 12px;text-decoration: none;font-weight: bold; "
							href="${pageContext.request.contextPath}/chitietsanpham?masp=${sp.masp}">${sp.tensp}</a>
					</div>
					<div
						style="width: 17%;color: #584C46;font-size: 12px;font-weight: bold;padding-top: 10px;">
						<fmt:formatNumber type="currency" currencyCode="VND"
							value="${sp.giakhoidiem}" />
					</div>
					<div id="giahientai${sp.masp}"
						style="width: 17%;color: #2DAB00;font-size: 14px;padding-top: 10px;font-weight: bold;">

					</div>
					<div id="nguoidat${sp.masp}"
						style="width: 16%;color: #7E7C7C;font-size: 12px;font-weight: bold;text-align: center;padding-top: 10px;">${sp.nguoidat}</div>

					<input type="hidden" id="time${sp.masp}"
						value="${sp.thoigianketthuc}">
					<div id="Countdown${sp.masp}"
						style="width: 20%; font-size: 14px;padding-top: 10px;font-weight: bold; color: blue;"></div>
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
															+ hrsLeft + ":"
															+ minsLeft + ":"
															+ secsLeft;
													$('#Countdown${sp.masp}')
															.html(timeString);
												} else {
													//var timeString = "00 ngày " + "00:" +  "00:00";
													var timeString = "kết thúc";
													$('#Countdown${sp.masp}')
															.html(timeString);
													document
															.getElementById('Countdown${sp.masp}').style.color = 'red'; //'none';

												}
											}, 1000);
						});
					</script>
				</div>
			</c:forEach>
			<div style="clear: both;"></div>
		</div>





	</div>




</div>
<!-- InstanceEndEditable -->
<div class="DIVclear"></div>