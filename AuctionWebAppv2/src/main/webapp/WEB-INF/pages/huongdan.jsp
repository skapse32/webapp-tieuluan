<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<div id="content" class="wmain">
	<div id="box-left" class="fl top10 bg_white wleft">
		<!--  <div id="error" style="color: red;"></div> -->

		<!-- left box -->
		<div id="yamaha-xe-ga" class="fl top10 bg-top-products wleft">
			<div id="yamaha-xe-ga-title"
				class="fl bg-titles products-group-title-news color_white fontTahoma">
				<a class="link-white" href="#"><strong>${tieude}</strong></a>
			</div>
			<img alt="" src="resources/v2/images/sub-titles.jpg" />
		</div>

		<div class="noidung">
			<div id="browser-modules" class="fl browser fontTahoma">
				<a href="" class="fl url_home l8 right8"> <img class="fl w21-18" alt="" src="resources/v2/images/blank.gif"></a>
				<div class="fl top3 right8"><a class="fl link_blue bold" href="">Hướng dẫn đấu giá</a></div>
			</div>
			<div class="text-nd">
				<div class="nd-baiviet" style="font-family: serif;">
					<h4><span style="color: red">Bước 1: Đăng nhập vào hệ thống đấu giá</span></h4>
					<h4 style="margin-top: 1cm"><span style="color: red">Bước 2: Lựa chọn phiên đấu</span></h4>
					<br>
					<p>Người chơi tuỳ chọn các sản phẩm trong <b>Sản phẩm đang đấu</b> để tham gia đấu giá.</p><br>
					<div align="center" style="width: 650px; height: auto;"><img src="resources/v2/images/spdangdau.png" alt="" width="100%"></div><br>
					<b>Thông tin phiên đấu giá cần quan tâm:</b>
					<br>
					<div align="center" style="line-height: 2.0; font-family: serif;">
						<img src="resources/v2/images/huongdandatgia.png" alt=""><br>
						<br>
						<div align="justify">
							<b>Bước giá: </b><p>Mỗi lần người chơi thực hiện đặt giá, giá sản phẩm sẽ tăng 1 lượng đúng bằng giá trị bước nhảy giá. Với mỗi sản phẩm, 
							hệ thống sẽ đưa ra các bước nhảy giá khác nhau.</p>
							<br>
							<b style="color: red">Bước 3: Tham gia đấu giá</b>
							<p><b>Mỗi phiên đấu giá có các quá trình như sau: </b></p>
							<p>- Giá khởi điểm do người đăng quy định.</p>
							<p>- Người chơi chọn số bước giá. Chú ý: Bước giá  >= 1. Mỗi lần chọn bước giá, giá sản phẩm sẽ tăng thêm xxx đồng.</p>
							<p>- Chọn đặt giá để đặt giá cho sản phẩm. Hệ thống sẽ hiển thị top 10 người đặt giá sát với thời gian kết thúc.</p>
							<p>Khi thời gian đấu kết thúc, sản phẩm sẽ thuộc về người chơi đặt giá cao nhất cho sản phẩm. Nếu có trường hợp trùng mức giá, thời gian đặt giá sẽ quyết định người chiến thắng.</p>
							<p><b style="color: red">Đặc biệt: </b>Với chức năng <b>mua ngay</b>, cho phép người chơi mua ngay sản phẩm ở mức giá mua ngay do người đăng quy định.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>