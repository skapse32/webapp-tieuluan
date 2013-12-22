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
<link href="${pageContext.request.contextPath}/resources/v2/css/tiny.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/v2/js/tinybox.js"></script>
<!-- OLD -->
<!-- socket nhan tin dang san pham -->
<script type="text/javascript">
	var wssocketRe;
	function initreceive() {
		RunWebSocketRecv();
	}
	function RunWebSocketRecv() {
		//website ho tro websocket
		wssocketRe = new WebSocket(
				"ws://192.168.1.3:8080/daugia/websocket/dangsp");
		wssocketRe.onopen = function(evt) {
			onOpenRe(evt);
		};
		wssocketRe.onclose = function(evt) {
			onCloseRe(evt);
		};
		wssocketRe.onmessage = function(evt) {
			onMessageRe(evt);
		};
		wssocketRe.onerror = function(evt) {
			onerrorRe(evt);
		};
	}
	function onOpenRe(evt) {
		//connected
	}
	function onCloseRe(evt) {
		//websocket is closed
	}

	function onMessageRe(evt) {
		var received_msg = evt.data;
		leftX = screen.width - 500;
		topY = screen.height - 400;
		TINY.box.show({html: received_msg ,animate:false,close:false,mask:false,boxid:'success',autohide:5,top:topY,left:leftX});
	}
	function onErrorRe(evt) {
		alert(evt.data);
	}

	function sendToServerDangSP(message) {
		wssocketRe.send(message);
	}

	window.addEventListener("load", initreceive, false);
</script>
</head>

<body>

	<tiles:insertAttribute name="header" />
	<tiles:insertAttribute name="left" />
	<tiles:insertAttribute name="maincontent" />
	<tiles:insertAttribute name="footer" />
</body>
</html>