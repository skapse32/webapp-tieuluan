<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<script type="text/javascript">
	//
	function pad(d) {
		return (d < 10) ? '0' + d.toString() : d.toString();
	}
	var timer;
	$(function() {
		timer = setInterval(vartimertick, 1000);
	});
	function vartimertick() {
		// get the form values
		if($("#spct").hasClass( "isred")){
			$("#spct a").css("color","red");
			$("#spct").removeClass( "isred");
		}else{
			
			$("#spct a").css("color","blue");
			$("#spct").addClass( "isred");
		}
		
		
		var maLoaiSP = $('#maLoaiSP').val();
		var size = $('#size').val();
		var page = $('#page').val();
		$.ajax({
			type : "POST",
			url : "/daugia/loaddssanphamhome",
			data : "maLoaiSP=" + maLoaiSP + "&size=" + size + "&page=" + page,
			success : function(data) {
				// we have the response
				var dsspList = jQuery.parseJSON(data);
				$.each(dsspList,
								function(index, element) {
									var x = numeral(element.giahientai).format(
											'0,0');
									x = x.replace(/,/g, ".");

									document.getElementById("giahientai"
											+ element.masp).innerHTML = x
											+ "&nbsp;d";
									
								});

			}
		});
		$.ajax({
			type : "POST",
			url : "/daugia/loaddssanphamhot",
			data : "",
			success : function(data) {
				// we have the response
				var dssphot = jQuery.parseJSON(data);
				$.each(dssphot,
								function(index, element) {
									var x = numeral(element.giahientai).format(
											'0,0');
									x = x.replace(/,/g, ".");

									
									document.getElementById("agiahientai"
											+ element.masp).innerHTML = x
											+ "&nbsp;d";
								});

			}
		});
	};
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

	
</script>
<!-- Content -->
<div id="content" class="wmain">
	<!-- Left side -->
	<div id="box-left" class="fl top10 bg_white wleft">
		<!-- Banner -->
		<div id="yamaha-xe-ga" class="fl top10 bg-top-products wleft">
			<div id="yamaha-xe-ga-title"
				class="fl bg-titles products-group-title-news color_white fontTahoma">
				<a class="link-white" href="#"><strong>Sản phẩm đang hot</strong></a>
			</div>
			<img alt="" src="${pageContext.request.contextPath}/resources/v2/images/sub-titles.jpg" />
		<div id="banner-home" class="fl wleft">
		<ul id="flexiselslider">
			   <c:forEach var="sp" items="${dstop}">
			   <li>
					<div align="center" class="fl pd05 w170 hpros sep_pros">
						<div class="HinhSP">
							<a
								href="${pageContext.request.contextPath}/chitietsanpham?masp=${sp.masp}"><img
								class="HinhSP_Resize" src="${imageDirectory}${sp.hinhanh}" /></a>
						</div>
						<div class="TenSP"><c:out value="${sp.tensp}" /></div>
						<div class="Gia" id="agiahientai${sp.masp}"></div>
						<input type="hidden" id="atime${sp.masp}"
							value="${sp.thoigianketthuc}">
						<div class="Countdown" id="aCountdown${sp.masp}"></div>
						<script type="text/javascript">
							$(function() {
								var stringday = $('#atime${sp.masp}').val()
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
																'#aCountdown${sp.masp}')
																.html(
																		timeString);
													} else {
														//var timeString = "00 ngày " + "00:" +  "00:00";
														var timeString = "kết thúc";
														$(
																'#aCountdown${sp.masp}')
																.html(
																		timeString);
														document.getElementById('aCountdown${sp.masp}').style.color = 'red'; //'none';
														document.getElementById('abid${sp.masp}').style.visibility = 'hidden';
								
														updateTinhTrangSP("${sp.masp}","");
														//clearInterval(refreshIntervalId);
													}
												}, 1000);
							});
						</script>

						<p class="top10" align="center">
							<a href="${pageContext.request.contextPath}/chitietsanpham?masp=${sp.masp}" class="fl l35 bg-hit detail_products">Đặt giá</a>
						</p>
					</div>
				</li>
				</c:forEach>
		</ul>
		<script type="text/javascript">
		$(window).load(function() {
			$("#flexiselslider").flexisel({
		        visibleItems: 4,
		        animationSpeed: 1000,
		        autoPlay: true,
		        autoPlaySpeed: 3000,            
		        pauseOnHover: true,
		        enableResponsiveBreakpoints: true,
		        responsiveBreakpoints: { 
		            portrait: { 
		                changePoint:480,
		                visibleItems: 1
		            }, 
		            landscape: { 
		                changePoint:640,
		                visibleItems: 2
		            },
		            tablet: { 
		                changePoint:768,
		                visibleItems: 3
		            }
		        }
		    });
		});
		</script>
		
			<!-- <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000"
				codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0"
				width="730" height="251" id="tech" align="middle">
				<param name="allowScriptAccess" value="sameDomain" />
				<param name="movie" value="images/banner.swf" />
				<param name="quality" value="high" />
				<embed src="${pageContext.request.contextPath}/resources/v2/images/banner.swf" quality="high"
					width="730" height="251" name="tech" align="middle"
					allowScriptAccess="sameDomain" type="application/x-shockwave-flash"
					pluginspage="http://www.macromedia.com/go/getflashplayer" />
			</object> -->
		</div>
	</div>
		<!-- Banner end -->
		<!-- Sản phẩm đang đấu -->
		<div id="yamaha-xe-ga" class="fl top10 bg-top-products wleft">
			<div id="yamaha-xe-ga-title"
				class="fl bg-titles products-group-title-news color_white fontTahoma">
				<a class="link-white" href="#"><strong>${tieude}</strong></a>
			</div>
			<img alt="" src="${pageContext.request.contextPath}/resources/v2/images/sub-titles.jpg" />
			<div style="float: right; padding-top: 6px">
				<form action="${pageContext.request.contextPath}/">
					<input type="hidden" id="maLoaiSP" name="maLoaiSP"
						value="${maLoaiSP}"> <input type="hidden" id="page"
						name="trang" value="${trang}"> <input type="hidden"
						id="size" value="${soLuongSanPhamTrenTrang}"><label
						style="color:#AB2D2A">Trang &nbsp;</label>
					<c:forEach var="i" begin="1" end="${soTrang}" step="1">
						<c:choose>
							<c:when test="${check == 'thuonghieu'}">
								<a style="color: #00C"
									href="${pageContext.request.contextPath}/?thuonghieu=${thuonghieu}&trang=${i}&soLuongSanPhamTrenTrang=${soLuongSanPhamTrenTrang}">
							</c:when>
							<c:when test="${check == 'maloaiSP'}">
								<a style="color: #00C"
									href="${pageContext.request.contextPath}/?maLoaiSP=${maLoaiSP}&trang=${i}&soLuongSanPhamTrenTrang=${soLuongSanPhamTrenTrang}">
							</c:when>
							<c:otherwise>
								<a style="color: #00C"
									href="${pageContext.request.contextPath}/?locsp=${locsp}&trang=${i}&soLuongSanPhamTrenTrang=${soLuongSanPhamTrenTrang}">
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

					<label for="soLuongSanPhamTrenTrang" style="color:#AB2D2A">Số lượng</label> 
					<select class="s-page" name="soLuongSanPhamTrenTrang" onchange="submit()">
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
								href="${pageContext.request.contextPath}/chitietsanpham?masp=${sp.masp}"><img
								class="HinhSP_Resize" src="${imageDirectory}${sp.hinhanh}" /></a>
						</div>
						<div class="TenSP"><c:out value="${sp.tensp}" /></div>
						<div class="Gia" id="giahientai${sp.masp}"></div>
						<input type="hidden" id="time${sp.masp}"
							value="${sp.thoigianketthuc}">
						<div class="Countdown" id="Countdown${sp.masp}"></div>
						<script type="text/javascript">
							$(function() {
								var stringday = $('#time${sp.masp}').val().toString();
								var longday = Number(stringday);
								var BigDay = new Date(longday);
								var msPerDay = 24 * 60 * 60 * 1000;
								window.setInterval(function() {
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
											var timeString = "kết thúc";
											updateTinhTrangSP("${sp.masp}", "");
											var message = "${sp.nguoidat},<div id='titler'>Thông báo</div>"
												+ "<div id='noidung'>"
												+ "<table><tr><td>Thắng cuộc: </td><td id='ct'><a href='${pageContext.request.contextPath}/chitietsanpham?masp=${sp.masp}'><c:out value="${sp.tensp}"/></a></td></tr>"
												+ "<tr><td>Thương hiệu: </td><td id='ct'><label>${sp.thuonghieu}</label></td></tr>"
												+ "<tr><td>Giá giá thắng : </td><td id='ct'><label>${sp.giahientai}</label></td></tr>";
												//kiem tra nguoi dat gia
											sendToServerDangSP(message);
											$('#Countdown${sp.masp}').html(timeString);
											document.getElementById('Countdown${sp.masp}').style.color = 'red'; //'none';
											document.getElementById('bid${sp.masp}').style.visibility = 'hidden';
											$('#content').load('home.jsp');
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
		<!-- Sản phẩm đang đấu end -->

	</div>
</div>
<!-- Content END -->
