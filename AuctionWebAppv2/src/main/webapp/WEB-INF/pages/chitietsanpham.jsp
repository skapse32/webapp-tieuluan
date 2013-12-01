<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="myDate" class="java.util.Date" />

<script type="text/javascript">
	function pad(d) {
		return (d < 10) ? '0' + d.toString() : d.toString();
	}
	
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
			url : "/daugia/loaddssanphamdangdau",
			data : "maLoaiSP=" + maLoaiSP + "&size=" + size + "&page=" + page,
			success : function(data) {
				var dsspList = jQuery.parseJSON(data);
				$.each(dsspList,function(index, element) {
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
				<li class="fl pd5 w330 clb">Dòng xe: <strong class="color3d">${sp.loaisp}</strong>
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
		<ul id="yamaha-xe-list" class="fl clb top10 list-none wleft-2 das_top">
			<c:forEach var="sp" items="${dssp}">
					<div align="center" class="fl pd05 w170 hpros sep_pros">
						<div class="HinhSP">
							<a
								href="chitietsanpham.html?masp=${sp.masp}"><img
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
</div>