<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="myDate" class="java.util.Date" />

<script type="text/javascript">
	function pad(d) {
		return (d < 10) ? '0' + d.toString() : d.toString();
	}
	function doAjaxPost() {
		// get the form values
		var masp = $('#masp').val();
		var giahientai = $('#giahientai').val();
		var buocgia = $('#buocgia').val();
		var numberbuocgia = $('#numberbuocgia').val();
		$
				.ajax({
					type : "POST",
					url : "/daugia/datgia",
					data : "masp=" + masp + "&giahientai=" + giahientai
							+ "&buocgia=" + buocgia + "&numberbuocgia="
							+ numberbuocgia,
					success : function(data) {
						// we have the response
						//$('#error').html(data);
						var dem = 0;
						var result = '';
						var dsdatgiaList = jQuery.parseJSON(data);
						$
								.each(
										dsdatgiaList,
										function(index, element) {
											dem++;

											if (dem == 1) {
												result = element.giadat;
												$('input[name=testting]').val(
														result);
												document
														.getElementById("nguoidatgia").innerHTML = element.nguoidat;
												var x = numeral(element.giadat)
														.format('0,0');
												x = x.replace(/,/g, ".");
												$('#cgiahientai').html(
														x + "&nbsp;đ");

											}
											if (dem <= 10) {
												document
														.getElementById("nguoidat"
																+ dem).innerHTML = element.nguoidat;
												document
														.getElementById("giadat"
																+ dem).innerHTML = element.giadat;
											}
										});
						document.getElementById("luotdat").innerHTML = dem;
					},
					error : function(e) {
						alert('Error: ' + e);
					}
				});
	}
</script>

<!-- InstanceBeginEditable name="MainRegion" -->
<div class="Column9">
	<h2 id="HomepageFeaturedList" class="h2row" style="text-align: center">${tieude}</h2>
	<h1 id="Listing_Details_Title">
		&nbsp;${sp.tensp}&nbsp;<i>(${sp.masp})</i> <input type="hidden"
			id="masp" value="${sp.masp}">
	</h1>
	<script type="text/javascript">
		// get the form values
		var masp = $('#masp').val();
		var timerloaddsdatgia;
		$(function() {
			timerloaddsdatgia = setInterval(vartimerdsdgtick, 1000);
		});
		var varCounter = 0;
		function vartimerdsdgtick() {
			$
					.ajax({

						type : "POST",
						url : "/daugia/loaddsdatgia",
						data : "masp=" + masp,
						success : function(data) {
							// we have the response
							//$('#error').html(data);
							var dem = 0;
							var result = '';
							var dsdatgiaList = jQuery.parseJSON(data);
							$
									.each(
											dsdatgiaList,
											function(index, element) {
												dem++;

												if (dem == 1) {
													result = element.giadat;
													$('input[name=testting]')
															.val(result);
													document
															.getElementById("nguoidatgia").innerHTML = element.nguoidat;
													var x = numeral(
															element.giadat)
															.format('0,0');
													x = x.replace(/,/g, ".");
													$('#cgiahientai').html(
															x + "&nbsp;đ");
												}
												if (dem <= 10) {
													document
															.getElementById("nguoidat"
																	+ dem).innerHTML = element.nguoidat;
													document
															.getElementById("giadat"
																	+ dem).innerHTML = element.giadat;
												}
											});
							document.getElementById("luotdat").innerHTML = dem;
						},
						error : function(e) {
							alert('1Error: ' + e + masp);
						}
					});

		};
	</script>

	<div>
		<table>
			<tr>
				<td align="center" valign="middle"><img
					src="${imageDirectory}${sp.hinhanh}" height="330" width="400">
				</td>

				<td style="padding-left: 5px;"><br>
					<table cellpadding="0" cellspacing="0" width="100%">
						<tbody valign="top">
							<tr>
								<td align="center" class="borderdsdatgiaheader" width="20px">STT</td>
								<td align="center" class="borderdsdatgiaheader" width="120px">Người
									đặt</td>
								<td align="center" class="borderdsdatgiaheader" width="120px">Giá</td>
							</tr>
							<tr>
								<td align="center" class="borderdsdatgiabody">1</td>
								<td align="center" class="borderdsdatgiabody"><div
										id="nguoidat1" style="color: blue;"></div></td>
								<td align="center" class="borderdsdatgiabody"><div
										id="giadat1" style="color: green;"></div></td>
							</tr>
							<tr>
								<td align="center" class="borderdsdatgiabody">2</td>
								<td align="center" class="borderdsdatgiabody"><div
										id="nguoidat2" style="color: blue;"></div></td>
								<td align="center" class="borderdsdatgiabody"><div
										id="giadat2" style="color: green;"></div></td>
							</tr>
							<tr>
								<td align="center" class="borderdsdatgiabody">3</td>
								<td align="center" class="borderdsdatgiabody"><div
										id="nguoidat3" style="color: blue;"></div></td>
								<td align="center" class="borderdsdatgiabody"><div
										id="giadat3" style="color: green;"></div></td>
							</tr>
							<tr>
								<td align="center" class="borderdsdatgiabody">4</td>
								<td align="center" class="borderdsdatgiabody"><div
										id="nguoidat4" style="color: blue;"></div></td>
								<td align="center" class="borderdsdatgiabody"><div
										id="giadat4" style="color: green;"></div></td>
							</tr>
							<tr>
								<td align="center" class="borderdsdatgiabody">5</td>
								<td align="center" class="borderdsdatgiabody"><div
										id="nguoidat5" style="color: blue;"></div></td>
								<td align="center" class="borderdsdatgiabody"><div
										id="giadat5" style="color: green;"></div></td>
							</tr>
							<tr>
								<td align="center" class="borderdsdatgiabody">6</td>
								<td align="center" class="borderdsdatgiabody"><div
										id="nguoidat6" style="color: blue;"></div></td>
								<td align="center" class="borderdsdatgiabody"><div
										id="giadat6" style="color: green;"></div></td>
							</tr>
							<tr>
								<td align="center" class="borderdsdatgiabody">7</td>
								<td align="center" class="borderdsdatgiabody"><div
										id="nguoidat7" style="color: blue;"></div></td>
								<td align="center" class="borderdsdatgiabody"><div
										id="giadat7" style="color: green;"></div></td>
							</tr>
							<tr>
								<td align="center" class="borderdsdatgiabody">8</td>
								<td align="center" class="borderdsdatgiabody"><div
										id="nguoidat8" style="color: blue;"></div></td>
								<td align="center" class="borderdsdatgiabody"><div
										id="giadat8" style="color: green;"></div></td>
							</tr>
							<tr>
								<td align="center" class="borderdsdatgiabody">9</td>
								<td align="center" class="borderdsdatgiabody"><div
										id="nguoidat9" style="color: blue;"></div></td>
								<td align="center" class="borderdsdatgiabody"><div
										id="giadat9" style="color: green;"></div></td>
							</tr>
							<tr>
								<td align="center" class="borderdsdatgiabody">10</td>
								<td align="center" class="borderdsdatgiabody"><div
										id="nguoidat10" style="color: blue;"></div></td>
								<td align="center" class="borderdsdatgiabody"><div
										id="giadat10" style="color: green;"></div></td>
							</tr>
							<tr>
								<td align="center" colspan="2" class="borderdsdatgiabody">Tổng
									lượt đặt</td>
								<td align="center" class="borderdsdatgiabody"><div
										id="luotdat" style="color: blue;"></div></td>

							</tr>
					</table></td>
			</tr>
			</tbody>
		</table>
	</div>
	<div id="error" style="color: red;"></div>
	<div id="error1" style="color: red;"></div>
	<table cellpadding="0" cellspacing="0" width="400px">
		<tr>
			<td colspan="2" align="center" valign="middle"><input
				type="hidden" id="thoigianbatdau" value="${sp.thoigianbatdau}">
				<input type="hidden" id="time${sp.masp}"
				value="${sp.thoigianketthuc}">
				<div id="Countdown${sp.masp}"
					style="color: green; font-weight: bold;"></div> <script
					type="text/javascript">
						var stringday0 = $('#thoigianbatdau').val().toString();
						var longday0;
						var BigDay0;
						if (stringday0 != null) {
							longday0 = Number(stringday0);
							BigDay0 = new Date(longday0);
						}

						var stringday = $('#time${sp.masp}').val().toString();
						var longday = Number(stringday);
						var BigDay = new Date(longday);
						var msPerDay = 24 * 60 * 60 * 1000;
						var timer;
						$(function() {
							timer = setInterval(vartimertick, 1000);
						});
						var varCounter = 0;
						function vartimertick() {
							var today = new Date();
							if (stringday0 !== null) {
								var timeLeft0 = (today.getTime() - BigDay0
										.getTime());
								if (timeLeft0 < 0) {
									var divdatgia = $('#divdatgia').val();
									if (divdatgia != null) {
										document.getElementById('buttondatgia').style.visibility = 'hidden';
										document
												.getElementById('hienthichuadaugia').style.visibility = 'visible';
									}

								} else {
									var divdatgia = $('#divdatgia').val();
									if (divdatgia != null) {
										document.getElementById('buttondatgia').style.visibility = 'visible';
										document
												.getElementById('hienthichuadaugia').style.visibility = 'hidden';
									}

								}
							}
							var timeLeft = (BigDay.getTime() - today.getTime());
							if (Math.floor(timeLeft) > 0) {
								var e_daysLeft = timeLeft / msPerDay;
								var daysLeft = pad(Math.floor(e_daysLeft));
								var e_hrsLeft = (e_daysLeft - daysLeft) * 24;
								var hrsLeft = pad(Math.floor(e_hrsLeft));
								var e_minsLeft = (e_hrsLeft - hrsLeft) * 60;
								var minsLeft = pad(Math.floor(e_minsLeft));
								var e_secsLeft = (e_minsLeft - minsLeft) * 60;
								var secsLeft = pad(Math.floor(e_secsLeft));
								var timeString = daysLeft + " ngày " + hrsLeft
										+ ":" + minsLeft + ":" + secsLeft;
								$('#Countdown${sp.masp}').html(timeString);
							} else {
								window.clearInterval(timer);
								var timeString = "kết thúc";
								$('#Countdown${sp.masp}').html(timeString);
								document.getElementById('Countdown${sp.masp}').style.color = 'red'; //'none';
								document.getElementById('numberbuocgia').style.visibility = 'hidden';
								var divdatgia = $('#divdatgia').val();
								if (divdatgia != null) {
									document.getElementById('buttondatgia').style.visibility = 'hidden';
									document
											.getElementById('hienthichuadaugia').style.visibility = 'hidden';
								}

								var nguoidatgia = document
										.getElementById('nguoidatgia').innerHTML;
								$
										.ajax({
											type : "POST",
											url : "/daugia/kiemtranguoidatgia",
											data : "nguoidatgia=" + nguoidatgia,
											success : function(data) {
												// we have the response
												//$('#error').html(data);
												if (data == "true") {
													var r = confirm("Bạn đã thắng phiên này! Bấm OK để tiến hành thanh toán sản phẩm.");
													if (r == true) {
														var masp = $('#masp')
																.val();
														window.location.href = "thanhtoan?masp="
																+ masp;
													} else {

													}
												}

											},
											error : function(e) {
												alert('Error: ' + e);
											}
										});

							}

						};
					</script>
			</td>
		</tr>
		<tr>
			<td class="td_chitietsanpham" align="right" valign="middle"><b>Giá
					hiện tại</b></td>
			<td align="left" valign="middle">
				<div id="cgiahientai" style="padding-top: 5px;padding-left: 5px;"
					class="Bidding_Current_Price">${cgiahientai}&nbsp;đ</div> <input
				type="hidden" name="testting" id="giahientai" value="${giahientai}">
			</td>

		</tr>
		<tr>
			<td class="td_chitietsanpham" align="right" valign="middle"><b>Người
					đặt giá</b></td>
			<td align="left" valign="middle">
				<div id="nguoidatgia" style="padding-top: 5px; padding-left: 5px;"
					class="Bidding_Current_Person">${sp.nguoidat}</div>
			</td>

		</tr>

	</table>


	<h3 class="h3row">
		<a href="#">Đặt giá</a>
	</h3>
	<table style="font-size: 110%;">
		<tr>
			<td class="td_chitietsanpham"><b>Giá khởi điểm:</b></td>
			<td class="td_chitietsanpham"><span
				class="Bidding_Current_Price">${cgiakhoidiem}&nbsp;đ </span> <input
				type="hidden" id="giakhoidiem" value="${giakhoidiem}"></td>
			<td></td>
		</tr>

		<tr>
			<td class="td_chitietsanpham"><b>Bước giá:</b></td>
			<td class="td_chitietsanpham"><span
				class="Bidding_Current_Price">${cbuocgia}&nbsp;đ</span><span
				style="">&nbsp;X</span> <input type="number" id="numberbuocgia"
				value="1" size="5" style="width:50px;height:23px;font-weight:bold;" />
				<input type="hidden" id="buocgia" value="${buocgia}"></td>
			<td style="vertical-align: middle;"><c:if
					test="${sessionScope.role != 'Admin'}">


					<c:choose>
						<c:when test="${sp.tinhtrangdaugia == 0}">
							<c:choose>
								<c:when test="${sessionScope.username != sp.nguoidang}">
									<input type="hidden" id="divdatgia" value="das">
									<input type="button" class="SubmitBid_Button" id="buttondatgia"
										name="datgiatudong" onclick="doAjaxPost()" value="Đặt giá">
									<span id="hienthichuadaugia" style="color: red;">Chưa
										bắt đầu đấu giá</span>
								</c:when>
								<c:otherwise>
									<div style="color: red;">Bạn không thể đấu giá sản phẩm
										của chính bạn</div>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>
				</c:if></td>
		</tr>

	</table>

	<h3 class="h3row">
		<a href="#">Thông tin sản phẩm</a>
	</h3>
	<table style="font-size: 110%;">
		<tr>
			<td class="td_chitietsanpham"><b>Loại sản phẩm:</b></td>
			<td class="td_chitietsanpham"><span
				class="Bidding_Current_Price">${sp.loaisp}</span></td>
			<td></td>
		</tr>
		<tr>
			<td class="td_chitietsanpham"><b>Xuất xứ:</b></td>
			<td class="td_chitietsanpham"><span
				class="Bidding_Current_Price">${sp.xuatxu}</span></td>
			<td></td>
		</tr>
		<tr>
			<td class="td_chitietsanpham"><b>Thương hiệu:</b></td>
			<td class="td_chitietsanpham"><span
				class="Bidding_Current_Price">${sp.thuonghieu}</span></td>
			<td></td>
		</tr>
		<tr>
			<td class="td_chitietsanpham"><b>Tình trạng:</b></td>
			<td class="td_chitietsanpham"><span
				class="Bidding_Current_Price">${sp.tinhtrangsp}</span>
			</td>
			<td></td>
		</tr>
		<tr>
			<td class="td_chitietsanpham"><b>Người đăng:</b></td>
			<td class="td_chitietsanpham"><span
				class="Bidding_Current_Price">${sp.nguoidang}</span></td>
			<td><br>
			</td>
		</tr>
		<tr>
			<td class="td_chitietsanpham"><b>Thời gian bắt đầu:</b></td>
			<td class="td_chitietsanpham"><span
				class="Bidding_Current_Price"> <c:set target="${myDate}"
						property="time" value="${sp.thoigianbatdau}" /> <fmt:formatDate
						pattern="HH:mm:ss dd-MM-yyyy" value="${myDate}" /> </span>
			</td>
			<td></td>
		</tr>
		<tr>
			<td class="td_chitietsanpham"><b>Thời gian kết thúc:</b></td>
			<td class="td_chitietsanpham"><span
				class="Bidding_Current_Price"> <c:set target="${myDate}"
						property="time" value="${sp.thoigianketthuc}" /> <fmt:formatDate
						pattern="HH:mm:ss dd-MM-yyyy" value="${myDate}" /> </span></td>
			<td></td>
		</tr>
		<tr>
			<td class="td_chitietsanpham"><b>Hình thức thanh toán:</b></td>
			<td class="td_chitietsanpham"><span
				class="Bidding_Current_Price">${sp.httt}</span>
			</td>
			<td></td>
		</tr>


	</table>
	<h3 class="h3row">
		<a href="#">Mô tả sản phẩm</a>
	</h3>

	<table style="font-size: 110%">

		<tr>
			<td>${sp.mota}</td>

		</tr>
	</table>

</div>
<!-- InstanceEndEditable -->
<div class="DIVclear"></div>


