<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="myDate" class="java.util.Date" />

<%@ page language="java" import="com.tieuluan.daugia.function.Server"%>


<script type="text/javascript">
	var output;
	var wssocket;
	function init() {
		RunWebSocket();
	}
	function RunWebSocket() {

		if ("WebSocket" in window) {
			//website ho tro websocket
			wssocket = new WebSocket(
					"<%=Server.addressWebSocket%>/daugia/websocket/daugia");
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
		} else {
			var masp = $('#masp').val();
			var timerloaddsdatgia;
			$(function() {
				timerloaddsdatgia = setInterval(vartimerdsdgtick, 1000);
			});
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
														$(
																'input[name=testting]')
																.val(result);
														document
																.getElementById("nguoidatgia").innerHTML = element.nguoidat;
														var x = numeral(
																element.giadat)
																.format('0,0');
														x = x
																.replace(/,/g,
																		".");
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
							}
						});
			}
			;
		}
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
		//alert("Connection is closed.....");
	}

	function onMessage(evt) {
		var received_msg = evt.data;
		readdsdg(received_msg);
		document.getElementById('buttondatgia').style.visibility = 'visible';
	}

	function readdsdg(data) {
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
							if (element.masp != "${sp.masp}") {
								//neu message den khong phai danh` cho san pham dang hien thi khong hien thi message
								return;
							}
							if (dem == 1) {
								result = element.giadat;
								$('input[name=testting]').val(result);
								document.getElementById("nguoidatgia").innerHTML = element.nguoidat;
								var x = numeral(element.giadat).format('0,0');
								x = x.replace(/,/g, ".");
								$('#cgiahientai').html(x + "&nbsp;đ");
							}
							if (dem <= 10) {
								document.getElementById("nguoidat" + dem).innerHTML = element.nguoidat;
								document.getElementById("giadat" + dem).innerHTML = element.giadat;
							}
						});
		document.getElementById("luotdat").innerHTML = dem;
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

			}
		});
	};

	var masp = "${sp.masp}";

	function doAjaxPost() {
		if (($('#numberbuocgia').val() < 1) || ($('#numberbuocgia').val() > 10)) {
			alert("Bước giá không hợp lệ.\nBước giá phải từ 1 đến 10");
		} else {
			document.getElementById('buttondatgia').style.visibility = 'hidden';
			sendToServer();
		}
	}

	function updateTinhTrangSP(masp, nguoidatgia) {
		$.ajax({
			type : "POST",
			url : "/daugia/updateTinhTrangDG",
			data : {
				maSP : masp,
				nguoidat : nguoidatgia
			},
			success : function(data) {
				
			}
		});
	}

	function kiemtraNguoiDat(nguoidatgia) {
		$
				.ajax({
					type : "POST",
					url : "/daugia/kiemtranguoidatgia",
					data : "nguoidatgia=" + nguoidatgia,
					success : function(data) {
						// we have the response
						if (data == "true") {
							var r = confirm("Bạn đã thắng phiên này! Bấm OK để tiến hành thanh toán sản phẩm.");
							if (r == true) {
								window.location.href = "thanhtoan?masp=${sp.masp}";
							} else {
							}
						}
					}
				});
	}
</script>

<div id="content" class="wmain">
	<div id="box-left" class="fl bg_white top15 wleft">
		<div id="products-group" class="fl bg-top-products wleft">
			<div id="browser-modules" class="fl browser fontTahoma">
				<a href="" class="fl url_home l8 right8"> <img class="fl w21-18"
					alt=""
					src="${pageContext.request.contextPath}/resources/v2/images/blank.gif" />
				</a> <img class="fl right8"
					src="${pageContext.request.contextPath}/resources/v2/images/arrow.gif"
					alt="" />
				<div class="fl top3 right8">
					<a class="fl link_blue bold" href="">${sp.loaisp}</a>
				</div>
				<img class="fl right8"
					src="${pageContext.request.contextPath}/resources/v2/images/arrow.gif"
					alt="" />
				<div class="fl top3 right8">
					<a class="fl link_blue bold" href="">${sp.thuonghieu}</a>
				</div>
				<img class="fl right8"
					src="${pageContext.request.contextPath}/resources/v2/images/arrow.gif"
					alt="" />
				<div class="fl top3 right8">
					<a class="fl link_blue bold" href="chitietsanpham?masp=${sp.masp}"><c:out value="${sp.tensp}"/></a>
				</div>
				<img class="fl right8"
					src="${pageContext.request.contextPath}/resources/v2/images/arrow.gif"
					alt="" />

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
							<c:if test="${not empty username}">
								<c:choose>
									<c:when test="${sessionScope.role == 'BannedUser' }">
										<tr class="title"
											style="background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: rgb(229, 229, 229); color: rgb(204, 0, 0); font-weight: bold; text-align: center;">
											<td colspan="2" lang="vi"
												style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
												<span style="font-size: 10pt; font-family: Arial;"
												class="Apple-style-span"> Tài khoản của bạn không
													được phép đấu giá. </span>
											</td>
										</tr>

									</c:when>
									<c:otherwise>
										<c:if test="${empty dathanhtoan}">
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
														id="numberbuocgia" value="1" size="5" min="1" max="10"
														style="width: 50px; height: 23px; font-weight: bold;" />
														<input type="hidden" id="buocgia" value="${buocgia}">
														<c:if test="${sessionScope.role != 'Admin'}">
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
																	<div style="color: red;">Bạn không thể đấu giá
																		sản phẩm của chính bạn</div>
																</c:otherwise>
															</c:choose>

														</c:if>
												</span>
												</td>
											</tr>
											<c:if test="${sessionScope.role != 'Admin'}">
												<tr class="technical" style="font-family: Tahoma, Verdana;">
													<td class="name"
														style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;"><span
														style="font-size: 10pt; font-family: Arial;"
														class="Apple-style-span"><span lang="vi"
															style="font-size: 10pt;" class="Apple-style-span">Giá
																mua ngay :</span></span></td>
													<td class="value"
														style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;"><span
														style="font-size: 10pt; font-family: Arial;"
														class="Apple-style-span" id="giamuangay">${giamuangay}&nbsp;đ
													</span> <c:choose>
															<c:when test="${sessionScope.username != sp.nguoidang}">
																<input type="button" value="Mua Ngay"
																	onclick="window.location.href = 'thanhtoanngay?masp=${sp.masp}'" />
															</c:when>
															<c:otherwise>
																<span
																	style="font-size: 10pt; font-family: Arial; color: red;"
																	class="Apple-style-span">Bạn không thể mua sản
																	phẩm của chính bạn</span>
															</c:otherwise>
														</c:choose></td>
													<script>
														var x = numeral(
																"${giamuangay}")
																.format('0,0');
														x = x
																.replace(/,/g,
																		".");
														document
																.getElementById("giamuangay").innerHTML = x
																+ "&nbsp;đ";
													</script>
												</tr>
											</c:if>
										</c:if>
										<c:if test="${not empty dathanhtoan}">
											<tr class="title"
												style="background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: rgb(229, 229, 229); color: rgb(204, 0, 0); font-weight: bold; text-align: center;">
												<td colspan="2" lang="vi"
													style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
													<span style="font-size: 10pt; font-family: Arial;"
													class="Apple-style-span"> Đánh giá </span>
												</td>
											</tr>
											<tr class="technical" style="font-family: Tahoma, Verdana;">
												<td class="name"
													style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;"><span
													style="font-size: 10pt; font-family: Arial;"
													class="Apple-style-span"><span lang="vi"
														style="font-size: 10pt;" class="Apple-style-span">Đánh
															giá :</span></span></td>
												<td class="value"
													style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;"><span
													style="font-size: 10pt; font-family: Arial;"
													class="Apple-style-span"><a
														href="<%= Server.addressDanhGiaWA %>/user/danhgia/${sp.masp}">${sp.nguoidang}</a></span>
												</td>
											</tr>
										</c:if>
									</c:otherwise>
								</c:choose>
							</c:if>
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
												style="color: green; font-weight: bold;"></div> <input
											id="countFunction" type="hidden" value="0" /> <c:choose>
												<c:when test="${not empty dathanhtoan}">
													<script>
														window
																.clearInterval(timer);
														var timeString = "kết thúc";
														$(
																'#Countdown${sp.masp}')
																.html(
																		timeString);
														document
																.getElementById('Countdown${sp.masp}').style.color = 'red'; //'none';
														document
																.getElementById('numberbuocgia').style.visibility = 'hidden';
													</script>
												</c:when>
												<c:otherwise>
													<script type="text/javascript">
														var stringday0 = $(
																'#thoigianbatdau')
																.val()
																.toString();
														var longday0;
														var BigDay0;
														if (stringday0 != null) {
															longday0 = Number(stringday0);
															BigDay0 = new Date(
																	longday0);
														}
														var stringday = $(
																'#time${sp.masp}')
																.val()
																.toString();
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
															var count = $(
																	'#countFunction')
																	.val();
															var today = new Date();
															if (stringday0 != null) {
																var timeLeft0 = (today
																		.getTime() - BigDay0
																		.getTime());
																var divdatgia = $(
																		'#divdatgia')
																		.val();
																if (timeLeft0 < 0) {
																	if (divdatgia != null
																			&& count == 0) {
																		count++;
																		$(
																				'#countFunction')
																				.val(
																						count);
																		document
																				.getElementById('buttondatgia').style.visibility = 'hidden';
																		document
																				.getElementById('hienthichuadaugia').style.visibility = 'visible';
																	}
																} else {
																	if (divdatgia != null) {
																		document
																				.getElementById('buttondatgia').style.visibility = 'visible';
																		document
																				.getElementById('hienthichuadaugia').style.visibility = 'hidden';
																		window
																				.clearInterval(timer);
																	}

																}
															}
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
																window
																		.clearInterval(timer);
																var timeString = "kết thúc";
																$(
																		'#Countdown${sp.masp}')
																		.html(
																				timeString);
																document
																		.getElementById('Countdown${sp.masp}').style.color = 'red'; //'none';
																document
																		.getElementById('numberbuocgia').style.visibility = 'hidden';
																var divdatgia = $(
																		'#divdatgia')
																		.val();
																if (divdatgia != null) {
																	document
																			.getElementById('buttondatgia').style.visibility = 'hidden';
																	document
																			.getElementById('hienthichuadaugia').style.visibility = 'hidden';
																}
																//send request de thay doi tinh trang san pham.

																var nguoidatgia = document
																		.getElementById('nguoidatgia').innerHTML;
																var masp = "${sp.masp}";
																updateTinhTrangSP(
																		masp,
																		nguoidatgia);
																var message = nguoidatgia +",<div id='titler'>Thông báo</div>"
																	+ "<div id='noidung'>"
																	+ "<table><tr><td>Thắng cuộc: </td><td id='ct'><a href='${pageContext.request.contextPath}/chitietsanpham?masp=${sp.masp}'>${sp.tensp}</a></td></tr>"
																	+ "<tr><td>Thương hiệu: </td><td id='ct'><label>${sp.thuonghieu}</label></td></tr>"
																	+ "<tr><td>Giá giá thắng : </td><td id='ct'><label>${sp.giahientai}</label></td></tr>";
																//kiem tra nguoi dat gia
																sendToServerDangSP(message);
																kiemtraNguoiDat(nguoidatgia);
															}
														};
													</script>
												</c:otherwise>
											</c:choose>

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
									class="Apple-style-span" id="cgiahientai">${cgiahientai}&nbsp;đ</span>
									<input type="hidden" name="testting" id="giahientai"
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
							<c:if test="${not empty username }">
								<tr class="technical" style="font-family: Tahoma, Verdana;">
									<td class="name"
										style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;"><span
										style="font-size: 10pt; font-family: Arial;"
										class="Apple-style-span"><span lang="vi"
											style="font-size: 10pt;" class="Apple-style-span">Số
												lượt đặt của bạn</span></span></td>
									<td class="value"
										style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
										<span style="font-size: 10pt; font-family: Arial;"> <a
											href="luotdattrensp?masp=${sp.masp}">Xem chi tiết</a>
									</span>
									</td>

								</tr>
							</c:if>

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
									class="Apple-style-span"><a
										href="${pageContext.request.contextPath}/thongtintaikhoannguoiban/${sp.nguoidang}">${sp.nguoidang}</a></span></td>
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
									class="Apple-style-span">Mô tả sản phẩm </span>
								</td>
							</tr>
							<tr class="technical" style="font-family: Tahoma, Verdana;">
								<td colspan="2">${sp.mota}</td>
							</tr>
							<tr class="title"
								style="background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: rgb(229, 229, 229); color: rgb(204, 0, 0); font-weight: bold; text-align: center;">
								<td colspan="2" lang="vi"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
									<span style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span">Thông tin liên hệ</span>
								</td>
							</tr>
							<tr class="technical" style="font-family: Tahoma, Verdana;">
								<td colspan="2">${sp.thongtinlienhe}</td>
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
			<img alt=""
				src="${pageContext.request.contextPath}/resources/v2/images/sub-titles.jpg" />
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
							<a href="chitietsanpham?masp=${sp.masp}"><img
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
								href="${pageContext.request.contextPath}/chitietsanpham?masp=${sp.masp}"
								class="fl l35 bg-hit detail_products">Đặt giá</a>
						</p>
					</div>
				</c:forEach>
				<!-- San Pham END-->
			</ul>
		</div>
	</div>
</div>