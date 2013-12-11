<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="myDate" class="java.util.Date" />

<script type="text/javascript">
	var output;
	var wssocket;
	function init() {
		RunWebSocket();
	}
	function RunWebSocket() {
		wssocket = new WebSocket(
				"ws://192.168.1.2:8080/daugia/websocket/daugia");
		wssocket.onopen = function(evt) {
			onOpen(evt);
		};
		wssocket.onclose = function(evt) {
			onClose(evt);
		};
		wssocket.onmessage = function(evt) {
			onMessage(evt);
		};
		wssocket.onerror = function(evt) {
			onerror(evt);
		};
	}

	function onOpen(evt) {
		//connected
		$.ajax({
			type : "POST",
			url : "/daugia/loaddsdatgia",
			data : "masp=" + masp,
			success : function(data) {
				readdsdg(data);
			}
		});
	}

	function onClose(evt) {
		//websocket is closed
		alert("Connection is closed.....");
	}

	function onMessage(evt) {
		var received_msg = evt.data;
		readdsdg(received_msg);
	}

	function readdsdg(data) {
		// we have the response
		//$('#error').html(data);
		var dem = 0;
		var result = '';
		var dsdatgiaList = jQuery.parseJSON(data);
		$.each(dsdatgiaList,function(index, element) {
			dem++;
			if(element.masp != "${sp.masp}"){
				return;
			}				
			if (dem == 1) {
				result = element.giadat;
				$('input[name=testting]').val(result);
				document.getElementById("nguoidatgia").innerHTML = element.nguoidat;
				var x = numeral(element.giadat).format('0,0');
				x = x.replace(/,/g, ".");
				$('#giahientai').html(x + "&nbsp;đ");
			}
			if (dem <= 10) {
				document.getElementById("nguoidat" + dem).innerHTML = element.nguoidat;
				document.getElementById("giadat" + dem).innerHTML = element.giadat;
			}
		});
		document.getElementById("luotdat").innerHTML = dem;
	}

	function onError(evt) {
		alert(evt.data);
	}

	function sendToServer() {
		var masp = "${sp.masp}";
		var giahientai = $('#giahientai').val();
		var buocgia = $('#buocgia').val();
		var numberbuocgia = $('#numberbuocgia').val();
		var session = "${sessionid}";
		var usename = "${username}";
		var message = masp + "," + giahientai + "," + buocgia + ","
				+ numberbuocgia + "," + usename + "," + session;
		wssocket.send(message);
	}

	window.addEventListener("load", init, false);

	function pad(d) {
		return (d < 10) ? '0' + d.toString() : d.toString();
	}

	var timer;
	$(function() {
		timer = setInterval(vartimerticksp, 1000);
	});
	function vartimerticksp() {
		// get the form values
		var maLoaiSP = $('#maLoaiSP').val();
		var size = $('#size').val();
		var page = $('#page').val();
		$.ajax({
			type : "POST",
			url : "/daugia/loaddssanphamdangdau",
			data : "maLoaiSP=" + maLoaiSP + "&size=" + size + "&page=" + page,
			success : function(data) {
				var dsspList = jQuery.parseJSON(data);
				$
						.each(dsspList,
								function(index, element) {
									var x = numeral(element.giahientai).format(
											'0,0');
									x = x.replace(/,/g, ".");
									document.getElementById("giahientai"
											+ element.masp).innerHTML = x
											+ "&nbsp;đ";
								});

			},
			error : function(e) {
				alert('Error: ' + e);
			}
		});
	};

	var masp = "${sp.masp}";

	function doAjaxPost() {
		sendToServer();
	}

	function updateTinhTrangSP(masp){
		$.ajax({
			type : "POST",
			url : "/daugia/updateTinhTrangDG",
			data : "maSP="
					+ masp,
			success : function(data) {
			},
			error : function(e) {
				alert('Error: '+ e);
			}
		});
	}
	
	function kiemtraNguoiDat(nguoidatgia){
		$.ajax({
			type : "POST",
			url : "/daugia/kiemtranguoidatgia",
			data : "nguoidatgia="
					+ nguoidatgia,
			success : function(data) {
				// we have the response
				if (data == "true") {
					var r = confirm("Bạn đã thắng phiên này! Bấm OK để tiến hành thanh toán sản phẩm.");
					if (r == true) {
						window.location.href = "thanhtoan?masp=${sp.masp}";
					} else {
					}
				}
			},
			error : function(e) {
				alert('Error: '+ e);
			}
		});
	}
</script>

<div id="content" class="wmain">
	<div id="box-left" class="fl bg_white top15 wleft">
		<div id="products-group" class="fl bg-top-products wleft">
			<div id="browser-modules" class="fl browser fontTahoma">
				<a href="" class="fl url_home l8 right8"> <img class="fl w21-18"
					alt="" src="resources/v2/images/blank.gif" />
				</a> <img class="fl right8" src="resources/v2/images/arrow.gif" alt="" />
				<div class="fl top3 right8">
					<a class="fl link_blue bold" href="">${sp.loaisp}</a>
				</div>
				<img class="fl right8" src="resources/v2/images/arrow.gif" alt="" />
				<div class="fl top3 right8">
					<a class="fl link_blue bold" href="">${sp.thuonghieu}</a>
				</div>
				<img class="fl right8" src="resources/v2/images/arrow.gif" alt="" />
				<div class="fl top3 right8">
					<a class="fl link_blue bold" href="chitietsanpham?masp=${sp.masp}">${sp.tensp}</a>
				</div>
				<img class="fl right8" src="resources/v2/images/arrow.gif" alt="" />

			</div>
		</div>
		<ul id="products-group-list" class="fl clb top10 list-none">
			<div class="fl w373 l8">
				<div id="img_products" class="fl w373">
					<a id="thumb1"
						onclick="return hs.expand(this, {captionId: 'caption2'})"
						class="fl left1 loadimage highslide" href=""><img
						class="fl img_large" src="${imageDirectory}${sp.hinhanh}"
						style="display: inline" /></a>
				</div>
				<div class="fl w373 top10">
					<p align="center" style="font-size: medium; color: #0374CB">
						${sp.tensp}</p>
				</div>
			</div>

			<ul class="fl l8 w340 list-none">
				<li class="fl">
					<div>
						<table class="product_technical_table"
							style="font-family: Tahoma, Verdana; border-collapse: collapse; width: 340px;">
							<tbody style="font-family: Tahoma, Verdana;">
								<tr class="title"
									style="background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: rgb(229, 229, 229); color: rgb(204, 0, 0); font-weight: bold; text-align: center;">
									<td lang="vi"
										style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
										<span style="font-size: 10pt; font-family: Arial;"
										class="Apple-style-span"> STT </span>
									</td>
									<td lang="vi"
										style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
										<span style="font-size: 10pt; font-family: Arial;"
										class="Apple-style-span"> Người Đặt </span>
									</td>
									<td lang="vi"
										style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
										<span style="font-size: 10pt; font-family: Arial;"
										class="Apple-style-span"> Giá </span>
									</td>
								</tr>
								<%
									for (int i = 1; i <= 10; i++) {
								%>
								<tr class="technical" style="font-family: Tahoma, Verdana;">
									<td class="name"
										style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: center;">
										<span style="font-size: 10pt; font-family: Arial;"
										class="Apple-style-span"><span lang="vi"
											style="font-size: 10pt;" class="Apple-style-span"><%=i%></span>
									</span>
									</td>
									<td class="name"
										style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: center;">
										<span style="font-size: 10pt; font-family: Arial;"
										class="Apple-style-span"><span lang="vi"
											style="font-size: 10pt;" class="Apple-style-span"
											id="nguoidat<%=i%>"></span> </span>
									</td>
									<td class="name"
										style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: center;">
										<span style="font-size: 10pt; font-family: Arial;"
										class="Apple-style-span"><span lang="vi"
											style="font-size: 10pt;" class="Apple-style-span"
											id="giadat<%=i%>"></span> </span>
									</td>
								</tr>
								<%
									}
								%>
								<tr class="technical" style="font-family: Tahoma, Verdana;">
									<td colspan="2" class="name"
										style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: center;">
										<span style="font-size: 10pt; font-family: Arial;"
										class="Apple-style-span"><span lang="vi"
											style="font-size: 10pt;" class="Apple-style-span">
												Tổng lượt đặt </span> </span>
									</td>
									<td class="name"
										style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: center;">
										<span style="font-size: 10pt; font-family: Arial;"
										class="Apple-style-span"><span lang="vi"
											style="font-size: 10pt;" class="Apple-style-span"
											id="luotdat"></span> </span>
									</td>
								</tr>
						</table>
					</div>
				</li>
			</ul>


			<div class="fl wleft top15 line24">
				<span class="Apple-style-span"
					style="font-family: Tahoma, Verdana; font-size: 12px; line-height: 17px; background-color: rgb(255, 255, 255);">
					<table class="product_technical_table" cellpadding="0"
						cellspacing="0"
						style="font-family: Tahoma, Verdana; border-collapse: collapse; width: 730px">

						<tbody style="font-family: Tahoma, Verdana;">
							<tr class="title"
								style="background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: rgb(229, 229, 229); color: rgb(204, 0, 0); font-weight: bold; text-align: center;">
								<td colspan="2" lang="vi"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
									<span style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span"> Đấu giá </span>
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
									class="Apple-style-span">${cbuocgia}&nbsp;đ<span
										style="">&nbsp;X</span> <input type="number"
										id="numberbuocgia" value="1" size="5"
										style="width: 50px; height: 23px; font-weight: bold;" /> <input
										type="hidden" id="buocgia" value="${buocgia}"> <c:if
											test="${sessionScope.role != 'Admin'}">
											<c:choose>
												<c:when test="${sp.tinhtrangdaugia == 0}">
													<c:choose>
														<c:when test="${sessionScope.username != sp.nguoidang}">
															<input type="hidden" id="divdatgia" value="das">
															<input type="button" class="SubmitBid_Button"
																id="buttondatgia" name="datgiatudong"
																onclick="doAjaxPost()" value="Đặt giá">
															<span id="hienthichuadaugia" style="color: red;">Chưa
																bắt đầu đấu giá</span>
														</c:when>
														<c:otherwise>
															<div style="color: red;">Bạn không thể đấu giá sản
																phẩm của chính bạn</div>
														</c:otherwise>
													</c:choose>
												</c:when>
												<c:otherwise>
												</c:otherwise>
											</c:choose>
										</c:if>
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
										style="font-size: 10pt;" class="Apple-style-span">Thời
											gian còn :</span></span></td>
								<td class="name"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: left; width: 327px;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span"><span lang="vi"
										style="font-size: 10pt;" class="Apple-style-span"> <input
											type="hidden" id="thoigianbatdau"
											value="${sp.thoigianbatdau}"> <input type="hidden"
											id="time${sp.masp}" value="${sp.thoigianketthuc}">
											<div id="Countdown${sp.masp}"
												style="color: green; font-weight: bold;"></div> <script
												type="text/javascript">
													var stringday0 = $(
															'#thoigianbatdau')
															.val().toString();
													var longday0;
													var BigDay0;
													if (stringday0 != null) {
														longday0 = Number(stringday0);
														BigDay0 = new Date(
																longday0);
													}

													var stringday = $(
															'#time${sp.masp}')
															.val().toString();
													var longday = Number(stringday);
													var BigDay = new Date(
															longday);
													var msPerDay = 24 * 60 * 60 * 1000;
													var timer;
													$(function() {
														timer = setInterval(
																vartimertick,
																1000);
													});
													var varCounter = 0;
													function vartimertick() {
														var today = new Date();
														if (stringday0 !== null) {
															var timeLeft0 = (today
																	.getTime() - BigDay0
																	.getTime());
															if (timeLeft0 < 0) {
																var divdatgia = $(
																		'#divdatgia')
																		.val();
																if (divdatgia != null) {
																	document
																			.getElementById('buttondatgia').style.visibility = 'hidden';
																	document
																			.getElementById('hienthichuadaugia').style.visibility = 'visible';
																}

															} else {
																var divdatgia = $(
																		'#divdatgia')
																		.val();
																if (divdatgia != null) {
																	document
																			.getElementById('buttondatgia').style.visibility = 'visible';
																	document
																			.getElementById('hienthichuadaugia').style.visibility = 'hidden';
																}

															}
														}
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
															$(
																	'#Countdown${sp.masp}')
																	.html(
																			timeString);
														} else {
															window.clearInterval(timer);
															var timeString = "kết thúc";
															$('#Countdown${sp.masp}').html(timeString);
															document.getElementById('Countdown${sp.masp}').style.color = 'red'; //'none';
															document.getElementById('numberbuocgia').style.visibility = 'hidden';
															var divdatgia = $('#divdatgia').val();
															if (divdatgia != null) {
																document.getElementById('buttondatgia').style.visibility = 'hidden';
																document.getElementById('hienthichuadaugia').style.visibility = 'hidden';
															}
															//send request de thay doi tinh trang san pham.
															var masp = "${sp.masp}";
															updateTinhTrangSP(masp);
															//kiem tra nguoi dat gia
															var nguoidatgia = document.getElementById('nguoidatgia').innerHTML;
															kiemtraNguoiDat(nguoidatgia);

														}

													};
												</script>
									</span> </span></td>
							</tr>
							<tr class="technical" style="font-family: Tahoma, Verdana;">
								<td class="name"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span"><span lang="vi"
										style="font-size: 10pt;" class="Apple-style-span">Giá
											Hiện Tại :</span></span></td>
								<td class="value"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span">${cgiahientai}&nbsp;đ</span> <input
									type="hidden" name="testting" id="giahientai"
									value="${giahientai}"></td>

							</tr>
							<tr class="technical" style="font-family: Tahoma, Verdana;">
								<td class="name"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span"><span lang="vi"
										style="font-size: 10pt;" class="Apple-style-span">Người
											đặt giá</span></span></td>
								<td class="value"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
									<span style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span"> <span id="nguoidatgia">${sp.nguoidat}</span>
								</span>
								</td>

							</tr>


							<!-- thong tin san pham -->
							<tr class="title"
								style="background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: rgb(229, 229, 229); color: rgb(204, 0, 0); font-weight: bold; text-align: center;">
								<td colspan="2" lang="vi"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
									<span style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span"> Thông tin sản phẩm </span>
								</td>
							</tr>
							<tr class="technical" style="font-family: Tahoma, Verdana;">
								<td class="name"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span"><span lang="vi"
										style="font-size: 10pt;" class="Apple-style-span">Loại
											Xe</span>&nbsp;:</span></td>
								<td class="value"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span">${sp.loaisp}</span></td>
							</tr>
							<tr class="technical" style="font-family: Tahoma, Verdana;">
								<td class="name"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span"><span lang="vi"
										style="font-size: 10pt;" class="Apple-style-span">Xuất
											xứ</span>&nbsp;:</span></td>
								<td class="value"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span">${sp.xuatxu}</span></td>
							</tr>
							<tr class="technical" style="font-family: Tahoma, Verdana;">
								<td class="name"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span"><span lang="vi"
										style="font-size: 10pt;" class="Apple-style-span">Hãng
											Xe</span>&nbsp;:</span></td>
								<td class="value"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span">${sp.thuonghieu}</span></td>
							</tr>
							<tr class="technical" style="font-family: Tahoma, Verdana;">
								<td class="name"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span"><span lang="vi"
										style="font-size: 10pt;" class="Apple-style-span">Tình
											Trạng</span>&nbsp;:</span></td>
								<td class="value"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span">${sp.tinhtrangsp}</span></td>
							</tr>
							<tr class="technical" style="font-family: Tahoma, Verdana;">
								<td class="name"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span"><span lang="vi"
										style="font-size: 10pt;" class="Apple-style-span">Người
											Đăng</span>&nbsp;:</span></td>
								<td class="value"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span"><a href="#">${sp.nguoidang}</a></span></td>
							</tr>
							<tr class="technical" style="font-family: Tahoma, Verdana;">
								<td class="name"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span"><span lang="vi"
										style="font-size: 10pt;" class="Apple-style-span">Thời
											gian bắt đầu </span>&nbsp;:</span></td>
								<td class="value"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span"><c:set target="${myDate}"
											property="time" value="${sp.thoigianbatdau}" /> <fmt:formatDate
											pattern="HH:mm:ss dd-MM-yyyy" value="${myDate}" /></span></td>
							</tr>
							<tr class="technical" style="font-family: Tahoma, Verdana;">
								<td class="name"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span"><span lang="vi"
										style="font-size: 10pt;" class="Apple-style-span">Thời
											gian kết thúc </span>&nbsp;:</span></td>
								<td class="value"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span"><c:set target="${myDate}"
											property="time" value="${sp.thoigianketthuc}" /> <fmt:formatDate
											pattern="HH:mm:ss dd-MM-yyyy" value="${myDate}" /></span></td>
							</tr>
							<tr class="technical" style="font-family: Tahoma, Verdana;">
								<td class="name"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span"><span lang="vi"
										style="font-size: 10pt;" class="Apple-style-span">Hình
											thức thanh toán </span>&nbsp;:</span></td>
								<td class="value"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span">${sp.httt}</span></td>
							</tr>
							<tr class="title"
								style="background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: rgb(229, 229, 229); color: rgb(204, 0, 0); font-weight: bold; text-align: center;">
								<td colspan="2" lang="vi"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
									<span style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span"> Mô tả sản phẩm </span>
								</td>
							</tr>
							<tr class="technical" style="font-family: Tahoma, Verdana;">
								<td class="name"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span"><span lang="vi"
										style="font-size: 10pt;" class="Apple-style-span">Mô Tả
									</span>&nbsp;:</span></td>
								<td class="value"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span">${sp.mota}</span></td>
							</tr>
						</tbody>
					</table>
				</span>
			</div>
		</ul>


		<div id="products-group" class="fl bg-top-products wleft top15">
			<div id="products-group-title"
				class="fl bg-titles products-group-title-news color_white fontTahoma">
				<strong>Các sản phẩm khác cùng loại ${sp.loaisp}</strong>
			</div>
			<img alt="" src="resources/v2/images/sub-titles.jpg" />
			<!-- phan trang -->
			<div style="float: right; padding-top: 6px">
				<form action="">
					<input type="hidden" id="maLoaiSP" name="maLoaiSP"
						value="${maLoaiSP}"> <input type="hidden" id="page"
						name="trang" value="${trang}"> <input type="hidden"
						id="size" value="${soLuongSanPhamTrenTrang}"><label
						style="">Trang &nbsp;</label>
					<c:forEach var="i" begin="1" end="${soTrang}" step="1">
						<a style="color: #00C"
							href="?maLoaiSP=${maLoaiSP}&trang=${i}&soLuongSanPhamTrenTrang=${soLuongSanPhamTrenTrang}">

							<c:choose>
								<c:when test="${i==trang}">
									<input type="button" value="${i}"
										style="width: 25px; background-color: inactivecaption" />
								</c:when>
								<c:otherwise>
									<input type="button" value="${i}" style="width: 25px" />
								</c:otherwise>
							</c:choose>
						</a>
					</c:forEach>

					<label for="soLuongSanPhamTrenTrang">Số lượng</label> <select
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
		</div>
		<div id="yamaha-xe" class="fl wleft">
			<ul id="yamaha-xe-list"
				class="fl clb top10 list-none wleft-2 das_top">
				<c:forEach var="sp" items="${dssp}">
					<div align="center" class="fl pd05 w170 hpros sep_pros">
						<div class="HinhSP">
							<a href="chitietsanpham.html?masp=${sp.masp}"><img
								class="HinhSP_Resize" src="${imageDirectory}${sp.hinhanh}" /></a>
						</div>
						<div class="TenSP">${sp.tensp}</div>
						<div class="Gia" id="giahientai${sp.masp}"></div>
						<input type="hidden" id="time${sp.masp}"
							value="${sp.thoigianketthuc}">
						<div class="Countdown" id="Countdown${sp.masp}"></div>
						<script type="text/javascript">
							$(function() {
								var stringday = $('#time${sp.masp}').val()
										.toString();
								var longday = Number(stringday);
								var BigDay = new Date(longday);
								var msPerDay = 24 * 60 * 60 * 1000;
								window.setInterval(
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
														$(
																'#Countdown${sp.masp}')
																.html(
																		timeString);
													} else {
														//var timeString = "00 ngày " + "00:" +  "00:00";
														var timeString = "Kết thúc";
														$(
																'#Countdown${sp.masp}')
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

						<p class="top10" align="center">
							<a
								href="${pageContext.request.contextPath}/chitietsanpham.html?masp=${sp.masp}"
								class="fl l35 bg-hit detail_products">Đặt giá</a>
						</p>
					</div>
				</c:forEach>
				<!-- San Pham END-->
			</ul>
		</div>
	</div>
	<!-- right side -->
	<div id="box-right" class="fl l10 top10 bg_white wright cright">
		<div id="catalog-products" class="fl wright">
			<div id="catalog-products-titles"
				class="fl bg-titles top10 products-group-title-news color_white fontTahoma wright-26">
				<strong>Người đăng : ${sp.nguoidang }</strong>
			</div>
			<ul id="catalog-products-list"
				class="fl fontTahoma wright list-none top5">
				<li class="fl pd5 w240 "><a class="fl pdl20" href="#">
						Thông tin người đăng</a></li>
				<li class="fl wright das_top h1"></li>
				<li class="fl pd5 w240 "><a class="fl pdl20" href="#"> Độ
						tin cậy : 50%</a></li>
				<li class="fl wright das_top h1"></li>
			</ul>
		</div>
		<div id="catalog-products" class="fl wright">
			<div id="catalog-products-titles"
				class="fl bg-titles top10 products-group-title-news color_white fontTahoma wright-26">
				<strong>Loại xe</strong>
			</div>
			<ul id="catalog-products-list"
				class="fl fontTahoma wright list-none top5">
				<c:choose>
					<c:when test="${sessionScope.dsloaisp != null}">
						<c:forEach var="lsp" items="${sessionScope.dsloaisp}">
							<c:choose>
								<c:when test="${lsp.maloaisp == maLoaiSP}">
									<li class="fl pd5 w240 set-group-bg"><a
										class="fl set-group pdl20"
										href="${pageContext.request.contextPath}/?maLoaiSP=${lsp.maloaisp}&trang=${trang}&soLuongSanPhamTrenTrang=${soLuongSanPhamTrenTrang}">${lsp.tenloaisp}</a>
									</li>
									<li class="fl wright das_top h1"></li>
								</c:when>
								<c:otherwise>
									<li class="fl pd5 w240 "><a class="fl  pdl20"
										href="${pageContext.request.contextPath}/?maLoaiSP=${lsp.maloaisp}&trang=${trang}&soLuongSanPhamTrenTrang=${soLuongSanPhamTrenTrang}">${lsp.tenloaisp}</a>
									</li>
									<li class="fl wright das_top h1"></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>

						<c:choose>
							<c:when test="${-1 == maLoaiSP}">
								<li class="fl pd5 w240 set-group-bg"><a
									class="fl set-group pdl20"
									href="${pageContext.request.contextPath}/?maLoaiSP=-1&trang=${trang}&soLuongSanPhamTrenTrang=${soLuongSanPhamTrenTrang}">+&nbsp;Tất
										cả</a></li>
								<li class="fl wright das_top h1"></li>
							</c:when>
							<c:otherwise>
								<li class="fl pd5 w240 "><a class="fl  pdl20"
									href="${pageContext.request.contextPath}/?maLoaiSP=-1&trang=${trang}&soLuongSanPhamTrenTrang=${soLuongSanPhamTrenTrang}">+&nbsp;Tất
										cả</a></li>
								<li class="fl wright das_top h1"></li>
							</c:otherwise>
						</c:choose>

					</c:when>
				</c:choose>

			</ul>
		</div>
		<c:if test="${sessionScope.dshangxe != null}">
			<div id="catalog-products" class="fl wright">
				<div id="catalog-products-titles"
					class="fl bg-titles top10 products-group-title-news color_white fontTahoma wright-26">
					<strong>Hãng xe</strong>
				</div>
				<ul id="catalog-products-list"
					class="fl fontTahoma wright list-none top5">

					<c:forEach var="xe" items="${sessionScope.dshangxe}">
						<c:choose>
							<c:when test="${xe.id == idxe}">
								<li class="fl pd5 w240 set-group-bg"><a
									class="fl set-group pdl20"
									href="${pageContext.request.contextPath}/?thuonghieu=${xe.tenhang}&trang=${trang}&soLuongSanPhamTrenTrang=${soLuongSanPhamTrenTrang}">${xe.tenhang}</a>
								</li>
								<li class="fl wright das_top h1"></li>
							</c:when>
							<c:otherwise>
								<li class="fl pd5 w240 "><a class="fl  pdl20"
									href="${pageContext.request.contextPath}/?thuonghieu=${xe.tenhang}&trang=${trang}&soLuongSanPhamTrenTrang=${soLuongSanPhamTrenTrang}">${xe.tenhang}</a>
								</li>
								<li class="fl wright das_top h1"></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</ul>
			</div>
		</c:if>
		<div id="catalog-products" class="fl top10 wright">
			<div id="catalog-products-titles"
				class="fl bg-titles products-group-title-news color_white fontTahoma wright-26">
				<strong>Hỗ trợ trực tuyến</strong>
			</div>
			<ul id="catalog-products-list" class="fl wright list-none top5">
				<li class="fl pd5 w240"><a class="fl pdl10"
					title="Chăm sóc khách hàng"
					href="ymsgr:SendIM?phamhoaquan&amp;m=Hello Yamaha Motor"><img
						alt="" src="resources/v2/images/on.gif" /></a><span class="fl l5">
						- Chăm sóc khách hàng</span></li>
				<li class="fl wright das_top h1"></li>
				<li class="fl pd5 w240"><a class="fl pdl10"
					title="Phòng kinh doanh"
					href="ymsgr:SendIM?phamhoaquan&amp;m=Hello Yamaha Motor"><img
						alt="" src="resources/v2/images/on.gif" /></a><span class="fl l5">
						- Phòng kinh doanh</span></li>
				<li class="fl wright das_top h1"></li>
			</ul>
		</div>
	</div>
</div>