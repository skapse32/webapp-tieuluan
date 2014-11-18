<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %> 
<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="description" content="">
	<meta name="robots" content="index, follow">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Đăng Nhập</title>
	<link href="${pageContext.request.contextPath}/resources/css/sangoma-blue.css" rel="stylesheet" >
	<link href="${pageContext.request.contextPath}/resources/css/mystyle.css" rel="stylesheet" >
	<link href="${pageContext.request.contextPath}/resources/css/metisMenu.min.css" rel="stylesheet" >
	<link href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" rel="stylesheet" >
	<link href="${pageContext.request.contextPath}/resources/css/prettyCheckable.css" rel="stylesheet" >
	<script type="text/javascript" async="" src="${pageContext.request.contextPath}/resources/js/ga.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script>window.jQuery || document.write('<script src="js/libs/jquery.js"><\/script>')</script>
	<script src="${pageContext.request.contextPath}/resources/js/modernizr.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.css" />
	<script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
	<script>
			$(document).ready(function(){
				
				// Tooltips
				$('[title]').tooltip();

				// Tabs
				$('.demoTabs a, .demoTabs2 a').click(function (e) {
					e.preventDefault();
					$(this).tab('show');
					$('.fullcalendar, .full-calendar-gcal').fullCalendar('render'); // Refresh jQuery FullCalendar for hidden tabs
				})
				
			});
		</script>
	<script type="text/javascript">
			var _gaq=_gaq||[];_gaq.push(["_setAccount","UA-22557155-10"]);_gaq.push(["_trackPageview"]);(function(){var b=document.createElement("script");b.type="text/javascript";b.async=true;b.src=("https:"==document.location.protocol?"https://ssl":"http://www")+".google-analytics.com/ga.js";var a=document.getElementsByTagName("script")[0];a.parentNode.insertBefore(b,a)})();
		</script>
	<style type="text/css"></style>
</head>
<body class="login" style="padding-top:150px;">
		
<div id="maiin">
    <section class="container">  		
         	<tiles:insertAttribute name="content"/> 	
     </section>
     
</div>
<!-- Bootstrap scripts -->
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/prettyCheckable.js"></script>
	<script>
			$(document).ready(function() {

				$('.styled-checkbox input, .styled-radio input').prettyCheckable();

			});
		</script>
	
</body>
</html>