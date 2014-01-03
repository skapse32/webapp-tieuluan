<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="myDate" class="java.util.Date" />

<div id="content" class="wmain">
	<div id="box-left" class="fl top10 bg_white wleft">
<!-- 	 -->
	
	<!-- left box -->
		<div id="yamaha-xe-ga" class="bor_gr fl top10 bg-top-products wleft">
			<div id="yamaha-xe-ga-title"
				class="fl bg-titles products-group-title-news color_white fontTahoma">
				<a class="link-white" href="#"><strong>${tieude}</strong></a>
			</div>	
			<img alt="" src="${pageContext.request.contextPath}/resources/v2/images/sub-titles.jpg" />
			<div style="float: right; padding-top: 6px">
			<form></form>
			</div>
			<div>
				<table class="bordered">
					<tr>
						<th>Mã hoá đơn</th>
						<th>Mã sản phẩm</th>
						<th>Đơn giá</th>
						<th>Người đăng</th>
						<th>Ngày lập</th>
					</tr>
					<c:forEach var="hd" items="${hd}">
					<tr>
						<td>${hd.mahoadon}</td>
						<td>${hd.masp}</td>
						<td id="gia${hd.mahoadon}">${hd.dongia}</td>
						 <script>
						 var idd = "gia"+${hd.mahoadon};
							var x = numeral("${hd.dongia}").format('0,0');
							x = x.replace(/,/g, ".");
							document.getElementById(idd).innerHTML = x
									+ "&nbsp;đ";
						</script>
						<td>${hd.nguoidang}</td>
						<td>
						
							<c:set target="${myDate}" property="time" value="${hd.ngaylap}" /> 
							<fmt:formatDate pattern="dd-MM-yyyy" value="${myDate}" />
						</td>
					</tr>
					
					</c:forEach>
				</table>
			</div>
			<a href="${pageContext.request.contextPath}/downloadPDFhoadon">Download PDF Document</a>
		</div>	
	</div>
</div>
</div>