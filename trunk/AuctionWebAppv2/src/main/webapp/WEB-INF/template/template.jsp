<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Đấu giá online - <tiles:insertAttribute name="title"
		ignore="true" /></title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/v2/css/style.css"
	type="text/css" />

<link rel="stylesheet" type="text/css"
	href="resources/v2/js/datetimepicker/jquery.datetimepicker.css" />
<link href="http://www.jqueryscript.net/css/jquerysctipttop.css"
	rel="stylesheet" type="text/css">
<script src="resources/v2/js/datetimepicker/jquery.js"></script>


<!-- OLD ------------------------------------------------------------------------------------->

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/001.css.OLD	">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/reset.css">
<link
	href="${pageContext.request.contextPath}/resources/css/jquery.countdown.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/resources/css/SpryValidationTextField.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/resources/css/SpryValidationPassword.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/resources/css/SpryValidationConfirm.css"
	rel="stylesheet" type="text/css" />
<script
	src="${pageContext.request.contextPath}/resources/js/SpryValidationTextField.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/SpryValidationPassword.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/SpryValidationConfirm.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-1.4.1.min.js__OLD"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery.countdown.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/numeral.min.js"></script>
	<script type="text/javascript" src="resources/v2/js/jquery.hovercard.min.js" ></script>
<!-- OLD -->
<script>
	var imagePath = "images/Categories/";
	var hoverHTMLDemoBasic = 'abc';
	var temp = "";
	$(document).ready(function() {
		var id;
		$(".HinhSP_Resize").mouseover(function() {
			id = this.id;
			$(".hc-details").remove();
			$("#" + id).clone().prependTo("#" + id);
			$.ajax({
				url : 'getdata.aspx?id=' + id,
				type : 'GET',
				dataType : 'json',
				success : function(data) {
					temp = "";
					$.each(data, function(index, value) {
						if (index == "Id") {
							temp += "ID Sản phẩm : " + value + "<br />";
						} else if (index == "Name") {
							temp += "Tên Sản Phẩm : " + value + "<br />";
						} else if (index == "Images") {
							imagePath = "images/Products/";
							imagePath += value;
						} else if (index == "Description") {
							temp += "Mô tả sản phẩm : " + value + "<br />";
						} else if (index == "UnitPrice") {
							temp += "Giá Sản Phẩm : " + value + "<br />";
						}
					});
				},
				complete : function() {
					$("#" + id).hovercard({
						detailsHTML : temp,
						width : 350,
						cardImgSrc : imagePath,
					});

					$(".hc-details").show();
				}
			});
		});

	});
</script>

</head>

<body>
	<tiles:insertAttribute name="header" />
	<tiles:insertAttribute name="left" />
	<tiles:insertAttribute name="maincontent" />
	<tiles:insertAttribute name="footer" />
</body>
</html>