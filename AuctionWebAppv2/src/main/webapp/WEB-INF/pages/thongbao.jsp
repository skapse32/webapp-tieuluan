<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="content">
	<c:if test="${not empty thanhcong}">
		<script type="text/javascript">
			var message = "<div id='titler'>Thông báo</div>"
					+ "<div id='noidung'>"
					+ "<table><tr><td>Sản phẩm mới: </td><td id='ct'><a href='${pageContext.request.contextPath}/chitietsanpham?masp=${masp}'>${tensp}</a></td></tr>"
					+ "<tr><td>Thương hiệu: </td><td id='ct'><label>${thuonghieu}</label></td></tr>"
					+ "<tr><td>Giá khởi điểm: </td><td id='ct'><label>${giakhoidiem}</label></td></tr>"
					+ "<tr><td>Giá mua ngay: </td><td id='ct'><label>${giamuangay}</label></td></tr></table></div>"
			/* var message = "<a href='${pageContext.request.contextPath}/chitietsanpham?masp=${masp}'>Sản phẩm mới : ${tensp} <br /> Thương Hiệu : ${thuonghieu} <br/> Giá khởi điểm : ${giakhoidiem} <br/> Giá mua ngay : ${giamuangay}</a>"; */
			var timeout = setTimeout(function() {
				$('#send').trigger('click');
			}, 500);
		</script>
	</c:if>
	<div class="announcement">
		<table id="announcement">
			<tr>
				<td class="title">Thông báo</td>
			</tr>
			<tr>
				<td class="noidungthongbao">${noidung}</td>
				<input id="send" type="button" onclick="sendToServerDangSP(message)" hidden="true"/>
			</tr>
		</table>
	</div>
</div>