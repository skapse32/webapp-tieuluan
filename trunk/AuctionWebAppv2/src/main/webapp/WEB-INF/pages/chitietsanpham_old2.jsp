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
						alert('1Error: ' + e + masp);
					}
				});

	};
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
					<p align="center"></p>
				</div>
			</div>

			<ul class="fl l8 w340 list-none">
				<li class="fl">
					<h1 class="fl w340 font18 color3d">${sp.tensp}</h1>
				</li>
				<li class="fl pd5 w330 clb">Mã sản phẩm: <strong
					class="color_red">${sp.masp }</strong>
				</li>
				<li class="fl pd5 w330 clb">Giá bán: <strong class="color_red">39,200,000
						đ</strong>
				</li>
				<li class="fl w340 das_top h1"></li>
				<li class="fl pd5 w330 clb">Dòng xe: <strong class="color3d">Xe
						số</strong>
				</li>
				<li class="fl w340 das_top h1"></li>
				<li class="fl pd5 w330 clb">Động cơ: <strong class="color3d"></strong>
				</li>
				<li class="fl w340 das_top h1"></li>
				<li class="fl pd5 w330 clb">Vận chuyển: <strong
					class="color_green">Liên hệ</strong>
				</li>
				<li class="fl w340 das_top h1"></li>
				<li class="fl pd5 w330 clb"><span class="fl r3">Chia sẻ:</span>
					<!-- AddThis Button BEGIN -->
					<div class="fl addthis_toolbox addthis_default_style r10">
						<a class="fl r3 addthis_button_preferred_1"></a> <a
							class="fl r3 addthis_button_preferred_2"></a> <a
							class="fl r3 addthis_button_preferred_3"></a> <a
							class="fl r3 addthis_button_preferred_4"></a> <a
							class="fl r3 addthis_button_compact"></a> <a
							class="fl r3 addthis_counter addthis_bubble_style"></a>
					</div> <script type="text/javascript">
						var addthis_config = {
							"data_track_clickback" : true
						};
					</script> <!-- AddThis Button END --></li>
				<li class="fl w340 das_top h1"></li>
				<li class="fl pd5 w330 clb"><a id="mua-san-pham"
					href="mua/10589/Yamaha-Exciter-RC-2011-Con-tay-5-so-Vang.html"
					class="fr font13 bold order bg_order_pro">Mua ngay</a></li>
			</ul>
			<div class="fl wleft top15 line24">
				<span class="Apple-style-span"
					style="font-family: Tahoma, Verdana; font-size: 12px; line-height: 17px; background-color: rgb(255, 255, 255);">
					<table
						class="product_technical_table" cellpadding="0" cellspacing="0"
						style="font-family: Tahoma, Verdana; border-collapse: collapse; width: 730px">
						<tbody style="font-family: Tahoma, Verdana;">
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
									class="Apple-style-span">Xe côn</span></td>
							</tr>
							<tr class="title"
								style="background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: rgb(229, 229, 229); color: rgb(204, 0, 0); font-weight: bold; text-align: center;">
								<td colspan="2" lang="vi"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span">Thông số chi tiết</span></td>
							</tr>
							<tr class="technical">
								<td class="name"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span"><span lang="vi"
										style="font-size: 10pt;" class="Apple-style-span">Hãng
											sản xuất</span>&nbsp;:</span></td>
								<td class="value"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span">YAMAHA</span></td>
							</tr>
							<tr class="technical">
								<td class="name"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span"><span lang="vi"
										style="font-size: 10pt;" class="Apple-style-span">Động
											cơ</span>&nbsp;:</span></td>
								<td class="value"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span">4 thì SOHC 4 van làm mát bằng
										nước</span></td>
							</tr>
							<tr class="technical">
								<td class="name"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span"><span lang="vi"
										style="font-size: 10pt;" class="Apple-style-span">Dung
											tich xy lanh</span>&nbsp;:</span></td>
								<td class="value"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span">135cc</span></td>
							</tr>
							<tr class="technical">
								<td class="name"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span"><span lang="vi"
										style="font-size: 10pt;" class="Apple-style-span">Tỷ số
											n&eacute;n&nbsp;</span>:</span></td>
								<td class="value"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span">10.9:1</span></td>
							</tr>
							<tr class="technical">
								<td class="name"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span"><span lang="vi"
										style="font-size: 10pt;" class="Apple-style-span">Công
											suất tối đa</span>&nbsp;:</span></td>
								<td class="value"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span">8.93kW / 8500 rpm</span></td>
							</tr>
							<tr class="technical">
								<td class="name"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span"><span lang="vi"
										style="font-size: 10pt;" class="Apple-style-span">Mô
											men cực đại</span>&nbsp;:</span></td>
								<td class="value"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span">11.79 N.m / 5500 rpm</span></td>
							</tr>
							<tr class="title"
								style="background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: rgb(229, 229, 229); color: rgb(204, 0, 0); font-weight: bold; text-align: center;">
								<td colspan="2" lang="vi"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span">Hệ thống truyền động,động cơ</span></td>
							</tr>
							<tr class="technical">
								<td class="name"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span"><span lang="vi"
										style="font-size: 10pt;" class="Apple-style-span">Hệ
											thống khởi động</span>&nbsp;:</span></td>
								<td class="value"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span">• Khởi động bằng điện<br>•
										Cần khởi động
								</span></td>
							</tr>
							<tr class="technical">
								<td class="name"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span"><span lang="vi"
										style="font-size: 10pt;" class="Apple-style-span">Hệ
											thống bôi trơn</span>&nbsp;:</span></td>
								<td class="value"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span">Wet sump</span></td>
							</tr>
							<tr class="technical">
								<td class="name"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span"><span lang="vi"
										style="font-size: 10pt;" class="Apple-style-span">Dầu
											nhớt động cơ</span>&nbsp;:</span></td>
								<td class="value"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span">0.9 lít</span></td>
							</tr>
							<tr class="technical">
								<td class="name"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span"><span lang="vi"
										style="font-size: 10pt;" class="Apple-style-span">Bộ
											chế hoà khí</span>&nbsp;:</span></td>
								<td class="value"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span">Bs25 x 1</span></td>
							</tr>
							<tr class="technical">
								<td class="name"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span"><span lang="vi"
										style="font-size: 10pt;" class="Apple-style-span">Hệ
											thống đánh lửa</span>&nbsp;:</span></td>
								<td class="value"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span">DC-CDI</span></td>
							</tr>
							<tr class="technical">
								<td class="name"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span"><span lang="vi"
										style="font-size: 10pt;" class="Apple-style-span">Hệ
											thống ly hợp</span>&nbsp;:</span></td>
								<td class="value"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span">• Ly tâm tự động</span></td>
							</tr>
							<tr class="title"
								style="background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: rgb(229, 229, 229); color: rgb(204, 0, 0); font-weight: bold; text-align: center;">
								<td colspan="2" lang="vi"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span">Kích thước,trọng lượng</span></td>
							</tr>
							<tr class="technical">
								<td class="name"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span"><span lang="vi"
										style="font-size: 10pt;" class="Apple-style-span">Chiều
											dài (mm)</span>&nbsp;:</span></td>
								<td class="value"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span">1960mm</span></td>
							</tr>
							<tr class="technical">
								<td class="name"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span"><span lang="vi"
										style="font-size: 10pt;" class="Apple-style-span">Chiều
											rộng (mm)</span>&nbsp;:</span></td>
								<td class="value"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span">695mm</span></td>
							</tr>
							<tr class="technical">
								<td class="name"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span"><span lang="vi"
										style="font-size: 10pt;" class="Apple-style-span">Chiều
											cao (mm)</span>&nbsp;:</span></td>
								<td class="value"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span">1080mm</span></td>
							</tr>
							<tr class="technical">
								<td class="name"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span"><span lang="vi"
										style="font-size: 10pt;" class="Apple-style-span">Độ
											cao yên xe</span>&nbsp;:</span></td>
								<td class="value"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span">775mm</span></td>
							</tr>
							<tr class="technical">
								<td class="name"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span"><span lang="vi"
										style="font-size: 10pt;" class="Apple-style-span">Trọng
											lượng</span>&nbsp;:</span></td>
								<td class="value"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span">105kg</span></td>
							</tr>
							<tr class="technical">
								<td class="name"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span"><span lang="vi"
										style="font-size: 10pt;" class="Apple-style-span">Khoảng
											cách gầm xe</span>&nbsp;:</span></td>
								<td class="value"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span">130mm</span></td>
							</tr>
							<tr class="title"
								style="background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: rgb(229, 229, 229); color: rgb(204, 0, 0); font-weight: bold; text-align: center;">
								<td colspan="2" lang="vi"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span">Phanh xe</span></td>
							</tr>
							<tr class="technical">
								<td class="name"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span"><span lang="vi"
										style="font-size: 10pt;" class="Apple-style-span">Phanh
											trước</span>&nbsp;:</span></td>
								<td class="value"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span">• Phanh đĩa thủy lực</span></td>
							</tr>
							<tr class="technical">
								<td class="name"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span"><span lang="vi"
										style="font-size: 10pt;" class="Apple-style-span">Phanh
											sau</span>&nbsp;:</span></td>
								<td class="value"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span">• Phanh đĩa</span></td>
							</tr>
							<tr class="title"
								style="background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: rgb(229, 229, 229); color: rgb(204, 0, 0); font-weight: bold; text-align: center;">
								<td colspan="2" lang="vi"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span">Thông số khác</span></td>
							</tr>
							<tr class="technical">
								<td class="name"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span"><span lang="vi"
										style="font-size: 10pt;" class="Apple-style-span">Dung
											tích bình xăng</span>&nbsp;:</span></td>
								<td class="value"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span">4lít</span></td>
							</tr>
							<tr class="technical">
								<td class="name"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span"><span lang="vi"
										style="font-size: 10pt;" class="Apple-style-span">Bánh
											xe trước/ sau</span>&nbsp;:</span></td>
								<td class="value"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span">70/90-17 / 80/90-17</span></td>
							</tr>
							<tr class="technical">
								<td class="name"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span"><span lang="vi"
										style="font-size: 10pt;" class="Apple-style-span">Khung
											xe</span>&nbsp;:</span></td>
								<td class="value"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span">Khung kiểu kim cương</span></td>
							</tr>
							<tr class="title"
								style="background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: rgb(229, 229, 229); color: rgb(204, 0, 0); font-weight: bold; text-align: center;">
								<td colspan="2" lang="vi"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span">Giảm xóc</span></td>
							</tr>
							<tr class="technical">
								<td class="name"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span"><span lang="vi"
										style="font-size: 10pt;" class="Apple-style-span">Giảm
											xóc trước</span>&nbsp;:</span></td>
								<td class="value"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span">• Telescopic</span></td>
							</tr>
							<tr class="technical">
								<td class="name"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span"><span lang="vi"
										style="font-size: 10pt;" class="Apple-style-span">Giảm
											xóc sau</span>&nbsp;:</span></td>
								<td class="value"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span">• Đơn giản chấn kiểu monocross</span></td>
							</tr>
							<tr class="technical" style="font-family: Tahoma, Verdana;">
								<td class="name"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: right; width: 327px;"><span
									style="font-size: 10pt; font-family: Arial;"
									class="Apple-style-span">-</span></td>
								<td class="value"
									style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;"><a
									href="http://www.yamaha-motor.com.my/135lc/specifications.html"
									target="_blank"
									style="text-decoration: none; color: rgb(179, 6, 5);"><span
										style="font-size: 10pt; font-family: Arial;"
										class="Apple-style-span">-</span></a></td>
							</tr>
						</tbody>
					</table></span>
			</div>
		</ul>
	</div>
	<div id="products-group" class="fl bg-top-products wleft top15">
		<div id="products-group-title"
			class="fl bg-titles products-group-title-news color_white fontTahoma">
			<strong>Các sản phẩm khác cùng loại</strong>
		</div>
		<img alt="" src="resources/v2/images/sub-titles.jpg" />
	</div>
	<div id="yamaha-xe" class="fl wleft">
		<ul id="yamaha-xe-list" class="fl clb top10 list-none wleft-2 das_top">
			<li id="yamaha-xe-items-10582" class="fl pd05 w170 hpros sep_pros">
				<a class="fl l8 loadimage cOver top15 w163"
				href="xe-may/383/10582/Yamaha-Exciter-GP-con-tay-2010-Xanh.html"
				title="Yamaha Exciter GP côn tay 2010 Xanh"><img
					name="Yamaha Exciter GP côn tay 2010 Xanh" class="fl img_pro_small"
					src="resources/v2/upload/omz1274340756_1316419080.jpg"
					style="display: inline" /></a>
				<p class="top15" align="center">
					<a href="xe-may/383/10582/Yamaha-Exciter-GP-con-tay-2010-Xanh.html"
						title="Yamaha Exciter GP côn tay 2010 Xanh">Yamaha Exciter GP
						côn tay 2010 Xanh</a>
				</p>
				<p class="top10" align="center">
					Giá: <strong class="color_red">Liên hệ</strong>
				</p>
				<p class="top10" align="center">
					<a href="xe-may/383/10582/Yamaha-Exciter-GP-con-tay-2010-Xanh.html"
						class="fl l35 bg-hit detail_products">Đặt giá</a>
				</p>
			</li>

			<li id="yamaha-xe-items-10581" class="fl pd05 w170 hpros sep_pros">
				<a class="fl l8 loadimage cOver top15 w163"
				href="xe-may/383/10581/Yamaha-Exciter-RC-2010-Trang.html"
				title="Yamaha Exciter RC 2010 Trắng"><img
					name="Yamaha Exciter RC 2010 Trắng" class="fl img_pro_small"
					src="resources/v2/upload/njk1274339830_1316418975.jpg"
					style="display: inline" /></a>
				<p class="top15" align="center">
					<a href="xe-may/383/10581/Yamaha-Exciter-RC-2010-Trang.html"
						title="Yamaha Exciter RC 2010 Trắng">Yamaha Exciter RC 2010
						Trắng</a>
				</p>
				<p class="top10" align="center">
					Giá: <strong class="color_red">Liên hệ</strong>
				</p>
				<p class="top10" align="center">
					<a href="xe-may/383/10581/Yamaha-Exciter-RC-2010-Trang.html"
						class="fl l35 bg-hit detail_products">Đặt giá</a>
				</p>
			</li>

			<li id="yamaha-xe-items-10580" class="fl pd05 w170 hpros sep_pros">
				<a class="fl l8 loadimage cOver top15 w163"
				href="xe-may/383/10580/Yamaha-Exciter-RC-2010-Vang-den.html"
				title="Yamaha Exciter RC 2010 Vàng đen"><img
					name="Yamaha Exciter RC 2010 Vàng đen" class="fl img_pro_small"
					src="resources/v2/upload/aok1274339769_1316418861.jpg"
					style="display: inline" /></a>
				<p class="top15" align="center">
					<a href="xe-may/383/10580/Yamaha-Exciter-RC-2010-Vang-den.html"
						title="Yamaha Exciter RC 2010 Vàng đen">Yamaha Exciter RC 2010
						Vàng đen</a>
				</p>
				<p class="top10" align="center">
					Giá: <strong class="color_red">Liên hệ</strong>
				</p>
				<p class="top10" align="center">
					<a href="xe-may/383/10580/Yamaha-Exciter-RC-2010-Vang-den.html"
						class="fl l35 bg-hit detail_products">Đặt giá</a>
				</p>
			</li>

			<li id="yamaha-xe-items-10577" class="fl pd05 w170 hpros "><a
				class="fl l8 loadimage cOver top15 w163"
				href="xe-may/383/10577/Yamaha-Exciter-Con-tay-2009-Trang.html"
				title="Yamaha Exciter Côn tay 2009 Trắng"><img
					name="Yamaha Exciter Côn tay 2009 Trắng" class="fl img_pro_small"
					src="resources/v2/upload/ixi1240894164_1316418481.jpg"
					style="display: inline" /></a>
				<p class="top15" align="center">
					<a href="xe-may/383/10577/Yamaha-Exciter-Con-tay-2009-Trang.html"
						title="Yamaha Exciter Côn tay 2009 Trắng">Yamaha Exciter Côn
						tay 2009 Trắng</a>
				</p>
				<p class="top10" align="center">
					Giá: <strong class="color_red">Liên hệ</strong>
				</p>
				<p class="top10" align="center">
					<a href="xe-may/383/10577/Yamaha-Exciter-Con-tay-2009-Trang.html"
						class="fl l35 bg-hit detail_products">Đặt giá</a>
				</p></li>
			<li id="product-items-sep" class="fl wleft h1"></li>
			<li id="yamaha-xe-items-10587" class="fl pd05 w170 hpros sep_pros">
				<a class="fl l8 loadimage cOver top15 w163"
				href="xe-may/383/10587/Yamaha-Exciter-RC-2011-Con-tay-Do.html"
				title="Yamaha Exciter RC 2011 Côn tay - Đỏ"><img
					name="Yamaha Exciter RC 2011 Côn tay - Đỏ" class="fl img_pro_small"
					src="resources/v2/upload/dsb1302084915_1316420070.jpg"
					style="display: inline" /></a>
				<p class="top15" align="center">
					<a href="xe-may/383/10587/Yamaha-Exciter-RC-2011-Con-tay-Do.html"
						title="Yamaha Exciter RC 2011 Côn tay - Đỏ">Yamaha Exciter RC
						2011 Côn tay - Đỏ</a>
				</p>
				<p class="top10" align="center">
					Giá: <strong class="color_red">39,200,000 đ</strong>
				</p>
				<p class="top10" align="center">
					<a href="xe-may/383/10587/Yamaha-Exciter-RC-2011-Con-tay-Do.html"
						class="fl l35 bg-hit detail_products">Đặt giá</a>
				</p>
			</li>

			<li id="yamaha-xe-items-10579" class="fl pd05 w170 hpros sep_pros">
				<a class="fl l8 loadimage cOver top15 w163"
				href="xe-may/383/10579/Yamaha-Exciter-RC-2010-Den-do.html"
				title="Yamaha Exciter RC 2010 Đen đỏ"><img
					name="Yamaha Exciter RC 2010 Đen đỏ" class="fl img_pro_small"
					src="resources/v2/upload/ybq1304045430_1316418734.jpg"
					style="display: inline" /></a>
				<p class="top15" align="center">
					<a href="xe-may/383/10579/Yamaha-Exciter-RC-2010-Den-do.html"
						title="Yamaha Exciter RC 2010 Đen đỏ">Yamaha Exciter RC 2010
						Đen đỏ</a>
				</p>
				<p class="top10" align="center">
					Giá: <strong class="color_red">39,200,000 đ</strong>
				</p>
				<p class="top10" align="center">
					<a href="xe-may/383/10579/Yamaha-Exciter-RC-2010-Den-do.html"
						class="fl l35 bg-hit detail_products">Đặt giá</a>
				</p>
			</li>

			<li id="yamaha-xe-items-10578" class="fl pd05 w170 hpros sep_pros">
				<a class="fl l8 loadimage cOver top15 w163"
				href="xe-may/383/10578/Yamaha-Exciter-RC-2010-Do.html"
				title="Yamaha Exciter RC 2010 Đỏ"><img
					name="Yamaha Exciter RC 2010 Đỏ" class="fl img_pro_small"
					src="resources/v2/upload/xnd1274339650_1316418604.jpg"
					style="display: inline" /></a>
				<p class="top15" align="center">
					<a href="xe-may/383/10578/Yamaha-Exciter-RC-2010-Do.html"
						title="Yamaha Exciter RC 2010 Đỏ">Yamaha Exciter RC 2010 Đỏ</a>
				</p>
				<p class="top10" align="center">
					Giá: <strong class="color_red">39,500,000 đ</strong>
				</p>
				<p class="top10" align="center">
					<a href="xe-may/383/10578/Yamaha-Exciter-RC-2010-Do.html"
						class="fl l35 bg-hit detail_products">Đặt giá</a>
				</p>
			</li>

			<li id="yamaha-xe-items-10576" class="fl pd05 w170 hpros "><a
				class="fl l8 loadimage cOver top15 w163"
				href="xe-may/383/10576/Yamaha-Exciter-RC-2011-Con-tay-Trang.html"
				title="Yamaha Exciter RC 2011 Côn tay - Trắng"><img
					name="Yamaha Exciter RC 2011 Côn tay - Trắng"
					class="fl img_pro_small"
					src="resources/v2/upload/wrp1302085805_1316418338.png"
					style="display: inline" /></a>
				<p class="top15" align="center">
					<a
						href="xe-may/383/10576/Yamaha-Exciter-RC-2011-Con-tay-Trang.html"
						title="Yamaha Exciter RC 2011 Côn tay - Trắng">Yamaha Exciter
						RC 2011 Côn tay - Trắng</a>
				</p>
				<p class="top10" align="center">
					Giá: <strong class="color_red">39,500,000 đ</strong>
				</p>
				<p class="top10" align="center">
					<a
						href="xe-may/383/10576/Yamaha-Exciter-RC-2011-Con-tay-Trang.html"
						class="fl l35 bg-hit detail_products">Đặt giá</a>
				</p></li>
			<li id="product-items-sep" class="fl wleft h1"></li>
			<li class="fl wleft pdt10">
				<div class="start fl">
					<span> Trước </span>
				</div> <a class="PageingII fl">1</a> <a class="Pageing fl"
				href="xe-may/383/Xe-may-Yamaha/Yamaha-Exciter-RC/?find=1&page=8">2</a><a
				class="Pageing fl"
				href="xe-may/383/Xe-may-Yamaha/Yamaha-Exciter-RC/?find=1&page=8">
					Sau </a>
			</li>
		</ul>
	</div>
</div>
</div>