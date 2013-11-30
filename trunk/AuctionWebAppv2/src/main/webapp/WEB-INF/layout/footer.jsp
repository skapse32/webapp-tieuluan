<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!-- Partner -->
<div id="banner" class="wmain">
	<div class="fl clb wmain partner">
		<img class="fl" src="resources/v2/images/partner.jpg" alt="Partner" />
		<ul class="fl partners list-none">
			<li class="fl l20"><a href="#"
				title="Phong Cách Mới Việt Nam - Thiết kế Website, thiết kế Wapsite, Hostting"
				target="_blank" class="fl cOver"><img
					alt="Phong Cách Mới Việt Nam - Thiết kế Website, thiết kế Wapsite, Hostting"
					src="resources/v2/upload/thietkeweb_1316248640.jpg" /></a></li>
			<li class="fl l20"><a href="#" title="Yamaha Nozza FC Việt Nam"
				target="_blank" class="fl cOver"><img
					alt="Yamaha Nozza FC Việt Nam"
					src="resources/v2/upload/yamaha-nozza-fc_1316723865.jpg" /></a></li>
			<li class="fl l20"><a href="#" title="Mua Chung Việt Nam"
				target="_blank" class="fl cOver"><img alt="Mua Chung Việt Nam"
					src="resources/v2/upload/muachung_1316248890.jpg" /></a></li>
			<li class="fl l20"><a href="#" title="Tập đoàn Prime group"
				target="_blank" class="fl cOver"><img alt="Tập đoàn Prime group"
					src="resources/v2/upload/4_1316248734.jpg" /></a></li>
			<li class="fl l20"><a href="#" title="Tập đoàn Hòa Phát"
				target="_blank" class="fl cOver"><img alt="Tập đoàn Hòa Phát"
					src="resources/v2/upload/5_1316248691.jpg" /></a></li>
			<li class="fl l20"><a href="#"
				title=" MÁY PHÁT ĐIỆN KAMA HỒNG ĐÀO" target="_blank"
				class="fl cOver"><img alt=" MÁY PHÁT ĐIỆN KAMA HỒNG ĐÀO"
					src="resources/v2/upload/1_1316248983.jpg" /></a></li>
		</ul>
	</div>
</div>
<!-- Partner END -->

<!-- Footer -->
<div id="footer" class="wmain clb">
	<ul class="fl bg-footer-top wmain menuf list-none top10">
		<li class="fl top9 sep-footer-top"><a class="fl menu-footer"
			href=".">Trang chủ</a></li>
		<li class="fl top9 sep-footer-top"><a class="fl menu-footer"
			href="sanphamdangdau.html">Đang đấu</a></li>
		<li class="fl top9 sep-footer-top"><a class="fl menu-footer"
			href="sanphamsapdau.html">Sắp đấu</a></li>
		<li class="fl top9 sep-footer-top"><a class="fl menu-footer"
			href="sanphamdadau.html">Đã đấu</a></li>
		<li class="fl top9 sep-footer-top"><a class="fl menu-footer"
			href="#">Hướng dẫn</a></li>
		<li class="fl top9 sep-footer-top"><a class="fl menu-footer"
			href="#">Liên hệ</a></li>
		<li class="fr top9 bg-ontop"><a class="fl menu-footer" href="#">Lên
				đầu trang</a></li>
	</ul>
	<div class="fl wmain">
		<div class="fl wleft pdl10 top10 pdb10 fontTahoma line18">
			<span style="font-weight: bold;">Sàn đấu giá Xe gắn máy Online</span><br>
			Địa chỉ : 01 Võ Văn Ngân, Quận Thủ Đức, Tp. Hồ Chí Minh<br> Tel
			: 1900-585-585, Fax: 08-6292-6292<br> Email : <a
				href="mailto:mail@10110clc.com">mail@10110clc.com</a> | Website : <a
				href="http://10110clc.com">http://10110clc.com</a><br>

		</div>
		<div class="fr top20">
			<!-- Histats.com  START (html only)-->
			<a href="http://www.histats.com" alt="page hit counter"
				target="_blank"> <embed src="http://s10.histats.com/10.swf"
					flashvars="jver=1&acsid=1648566&domi=4" quality="high" width="200"
					height="40" name="10.swf" align="middle"
					type="application/x-shockwave-flash"
					pluginspage="http://www.macromedia.com/go/getflashplayer"
					wmode="transparent" /></a> <img
				src="http://sstatic1.histats.com/0.gif?1648566&101"
				alt="hit tracker" border="0">
			<!-- Histats.com  END  -->
		</div>
	</div>
</div>
<!-- Footer end -->

<script type="text/javascript" language="javascript"
	src="resources/v2/js/jquery.lazyload.js"></script>
<script>
	//Lazy load
	var isIE = (navigator.userAgent.toLowerCase().indexOf("msie") == -1 ? false
			: true);
	if (!isIE) {
		$(".loadimage img").lazyload({
			placeholder : "resources/v2/images/jcarousel_loading.gif",
			effect : "fadeIn"
		});
	}
</script>

<script>
	var path = location.pathname;
	path = path.replace("/daugia/", "");
	if (document.getElementById(path)) {
		document.getElementById(path).className = "fl w141 bold menuh-active";
	} else {
		document.getElementById("home").className = "fl w141 bold menuh-active";

	}
</script>