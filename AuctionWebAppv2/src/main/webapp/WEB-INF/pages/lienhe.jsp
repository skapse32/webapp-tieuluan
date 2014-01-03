<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!-- Editor -->
<div id="sample">
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/v2/js/NicEdit/nicEdit.js"></script>
	<script type="text/javascript">
		//<![CDATA[
		bkLib.onDomLoaded(function() {
			nicEditors.allTextAreas();
		});
		//]]>
	</script>
</div>
<!-- mailto: -->
<script>
	window.onload = function() {
		var compose = document.getElementById("compose");
		var name = compose.name;
		var email = compose.email;
		var phone = compose.phone;	
		var subj = compose.subject;
		var body = compose.body;
		compose.onsubmit = function() {
			var uri1 = "Gửi thành công!!";
			var uri = compose.action.replace(/\+/g, "%20") + "?email=";
			uri += encodeURIComponent(email.value);
			uri += "&subject=";
			uri += encodeURIComponent(subj.value);
			uri += "&body=";
			uri += "Name: <br>";
			uri += encodeURIComponent(name.value.replace(/\r\n|\r|\n/g, "\r\n"));
			uri += "Email: <br>";
			uri += encodeURIComponent(email.value.replace(/\r\n|\r|\n/g, "\r\n"));
			uri += "Phone: ";
			uri += encodeURIComponent(phone.value.replace(/\r\n|\r|\n/g, "\r\n"));
			uri += "Nội dung: ";
			uri += encodeURIComponent(body.value.replace(/\r\n|\r|\n/g, "\r\n"));
			alert(uri1);
			window.open(uri);
			return false;
		};
	};
</script>
<!-- Editor END -->
<div id="content" class="wmain">
	<div id="box-left" class="fl top10 bg_white wleft">

		<!-- left box -->
		<div id="yamaha-xe-ga" class="fl top10 bg-top-products wleft">
			<div id="yamaha-xe-ga-title"
				class="fl bg-titles products-group-title-news color_white fontTahoma">
				<a class="link-white" href="#"><strong>${tieude}</strong></a>
			</div>
			<img alt="" src="resources/v2/images/sub-titles.jpg" />
		</div>
		<div style="font-family: serif; margin-left: 20px; margin-top: 1cm">
			<h4>
				Vui lòng điền đầy đủ thông tin vào form bên dưới, dấu <span
					style="color: red;">(*)</span> là bắt buộc.
			</h4>
			<form action="mailto:hieugiang92@gmail.com" id="compose" enctype="text/plain">
				<table style="width: 700px" >
					<tr>
						<td colspan="2" class="title">Liên hệ</td>
					</tr>
					<tr>
						<td width="186">Họ và tên: <span style="color: red;">(*)</span></td>
						<td width="502"><input type="text" name="name" id="name"></td>
					</tr>
					<tr>
						<td>Email: <span style="color: red;">(*)</span></td>
						<td><input type="text" name="email" id="email"></td>
					</tr>
					<tr>
						<td>Số điện thoại: <span style="color: red;">(*)</span></td>
						<td><input type="text" name="phone" id="txtsdt"></td>
					</tr>
					<tr>
						<td>Tiêu đề: <span style="color: red;">(*)</span></td>
						<td><input type="text" name="subject" id="subject"></td>
					</tr>
					<tr>
						<td>Nội dung: <span style="color: red;">(*)</span></td>
						<td><textarea name="body" id="message" rows="8"></textarea></td>
					</tr>
					<tr>
						<td colspan="2"><div align="center">
						<input type="submit" value="Gửi" /></div></td>
					</tr>
				</table>
			</form>
			<table style="width: 700px">
				<tr>
					<td colspan="2" class="title">Thông tin liên hệ</td>
				</tr>
				<tr>
					<td width="186"><img src="resources/v2/images/callicon.png"
						alt="" width="70px"></td>
					<td width="502"><h2 style="color: red;">Hotline:
							1900-585-899</h2></td>
				</tr>
				<tr>
					<td>Địa chỉ:</td>
					<td>Địa chỉ: 01 Võ Văn Ngân, Quận Thủ Đức, Tp. Hồ Chí Minh
						<div align="justify" style="margin-top: 1cm">
							<iframe width="425" height="350" frameborder="0" scrolling="no"
								marginheight="0" marginwidth="0"
								src="https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=vi&amp;geocode=&amp;q=Tr%C6%B0%E1%BB%9Dng+%C4%90%E1%BA%A1i+h%E1%BB%8Dc+S%C6%B0+ph%E1%BA%A1m+K%E1%BB%B9+thu%E1%BA%ADt+Tp.HCM,+V%C3%B5+V%C4%83n+Ng%C3%A2n,+Linh+Chi%E1%BB%83u,+H%E1%BB%93+Ch%C3%AD+Minh,+Vi%E1%BB%87t+Nam&amp;aq=0&amp;oq=truong+dai+hoc+su+pham+ky+thua&amp;sll=37.0625,-95.677068&amp;sspn=40.545434,86.572266&amp;ie=UTF8&amp;hq=Tr%C6%B0%E1%BB%9Dng+%C4%90%E1%BA%A1i+h%E1%BB%8Dc+S%C6%B0+ph%E1%BA%A1m+K%E1%BB%B9+thu%E1%BA%ADt+Tp.HCM,+V%C3%B5+V%C4%83n+Ng%C3%A2n,+Linh+Chi%E1%BB%83u,+H%E1%BB%93+Ch%C3%AD+Minh,+Vi%E1%BB%87t+Nam&amp;hnear=&amp;radius=15000&amp;ll=10.84994,106.771688&amp;spn=0.049229,0.084543&amp;t=m&amp;z=14&amp;iwloc=A&amp;cid=8812814106070850410&amp;output=embed"></iframe>
							<br /> <small><a
								href="https://maps.google.com/maps?f=q&amp;source=embed&amp;hl=vi&amp;geocode=&amp;q=Tr%C6%B0%E1%BB%9Dng+%C4%90%E1%BA%A1i+h%E1%BB%8Dc+S%C6%B0+ph%E1%BA%A1m+K%E1%BB%B9+thu%E1%BA%ADt+Tp.HCM,+V%C3%B5+V%C4%83n+Ng%C3%A2n,+Linh+Chi%E1%BB%83u,+H%E1%BB%93+Ch%C3%AD+Minh,+Vi%E1%BB%87t+Nam&amp;aq=0&amp;oq=truong+dai+hoc+su+pham+ky+thua&amp;sll=37.0625,-95.677068&amp;sspn=40.545434,86.572266&amp;ie=UTF8&amp;hq=Tr%C6%B0%E1%BB%9Dng+%C4%90%E1%BA%A1i+h%E1%BB%8Dc+S%C6%B0+ph%E1%BA%A1m+K%E1%BB%B9+thu%E1%BA%ADt+Tp.HCM,+V%C3%B5+V%C4%83n+Ng%C3%A2n,+Linh+Chi%E1%BB%83u,+H%E1%BB%93+Ch%C3%AD+Minh,+Vi%E1%BB%87t+Nam&amp;hnear=&amp;radius=15000&amp;ll=10.84994,106.771688&amp;spn=0.049229,0.084543&amp;t=m&amp;z=14&amp;iwloc=A&amp;cid=8812814106070850410"
								style="color: #0000FF; text-align: left">Xem Bản đồ cỡ lớn
									hơn</a></small>
						</div>
					</td>
				</tr>
			</table>


		</div>
	</div>
</div>
<!-- right box -->