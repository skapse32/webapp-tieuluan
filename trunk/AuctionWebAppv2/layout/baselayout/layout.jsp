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
	<title><tiles:insertAttribute name="title"
		ignore="true" /></title>
	<link href="${pageContext.request.contextPath}/resources/css/sangoma-blue.css" rel="stylesheet" >
	<link href="${pageContext.request.contextPath}/resources/css/mystyle.css" rel="stylesheet" >
	<link href="${pageContext.request.contextPath}/resources/css/metisMenu.min.css" rel="stylesheet" >
	<link href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" rel="stylesheet" >
	
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
<body>
   <div id="maiin">
   	<div id="wrapper">
     <tiles:insertAttribute name="header"/>
      	<section class="container">
      		<div class="row">
      		<tiles:insertAttribute name="menuleft"/> 
         	<tiles:insertAttribute name="content"/> 
         	</div>
       </section>
      <!-- /Main page footer -->
     </div>
    <tiles:insertAttribute name="footer"/> 
   </div> 	
   
<!-- Bootstrap scripts -->
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

	<!-- jQuery FullCalendar -->
	<script src="${pageContext.request.contextPath}/resources/js/fullcalendar.min.js"></script>
		
	<script>
			$(document).ready(function() {
			
				var date = new Date();
				var d = date.getDate();
				var m = date.getMonth();
				var y = date.getFullYear();
				
				$('.full-calendar-demo').fullCalendar({
					header: {
						left: 'prev today',
						center: 'title',
						right: 'next'
					},
					buttonText: {
						prev: '<span class="elusive icon-chevron-left"></span>',
						next: '<span class="elusive icon-chevron-right"></span>'
					},
					editable: true,
					events: [
						{
							title: 'All Day Event',
							start: new Date(y, m, 1)
						},
						{
							title: 'Long Event',
							start: new Date(y, m, d-5),
							end: new Date(y, m, d-2),
							className: 'event-red'
						},
						{
							id: 999,
							title: 'Repeating Event',
							start: new Date(y, m, d-3, 16, 0),
							allDay: false,
							className: 'event-blue'
						},
						{
							id: 999,
							title: 'Repeating Event',
							start: new Date(y, m, d+4, 16, 0),
							allDay: false,
							className: 'event-green'
						},
						{
							title: 'Meeting',
							start: new Date(y, m, d, 10, 30),
							allDay: false,
							className: 'event-orange'
						},
						{
							title: 'Lunch',
							start: new Date(y, m, d, 12, 0),
							end: new Date(y, m, d, 14, 0),
							allDay: false,
							className: 'event-purple'
						},
						{
							title: 'Birthday Party',
							start: new Date(y, m, d+1, 19, 0),
							end: new Date(y, m, d+1, 22, 30),
							allDay: false,
							className: 'event-turquoise'
						},
						{
							title: 'Walking Pixels website',
							start: new Date(y, m, 28),
							end: new Date(y, m, 29),
							url: 'http://www.walkingpixels.com/',
							className: 'event-dark'
						}
					]
				});
				
			});
		</script>

	<!-- PrettyCheckable checkbox and radio -->
	<script src="${pageContext.request.contextPath}/resources/js/prettyCheckable.js"></script>
	<script>
			$(document).ready(function() {

				$('.todo-block input').prettyCheckable();

			});
		</script>

	<!-- Block TODO list -->
	<script>
			$(document).ready(function() {
				
				$('.todo-block input[type="checkbox"], .todo-block .prettycheckbox').click(function(){
					$(this).closest('tr').toggleClass('done');
				});
				$('.todo-block input[type="checkbox"]:checked').closest('tr').addClass('done');
				
			});
		</script>

	<!-- jQuery Flot Charts -->
	<!--[if lte IE 8]>
	<script language="javascript" type="text/javascript" src="js/plugins/flot/excanvas.min.js"></script>
	<![endif]-->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.flot.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.flot.resize.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/metisMenu.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/sb-admin-2.js"></script>
	<script>
	

			$(document).ready(function() {
				
				// Demo #1
				// we use an inline data source in the example, usually data would be fetched from a server
				var data = [], totalPoints = 300;
				function getRandomData() {
					if (data.length > 0)
						data = data.slice(1);
				
					// do a random walk
					while (data.length < totalPoints) {
						var prev = data.length > 0 ? data[data.length - 1] : 50;
						var y = prev + Math.random() * 10 - 5;
						if (y < 0)
							y = 0;
						if (y > 100)
							y = 100;
						data.push(y);
					}
				
					// zip the generated y values with the x values
					var res = [];
					for (var i = 0; i < data.length; ++i)
						res.push([i, data[i]])
					return res;
				}
				
				// setup control widget
				var updateInterval = 30;
				$("#updateInterval").val(updateInterval).change(function () {
					var v = $(this).val();
					if (v && !isNaN(+v)) {
						updateInterval = +v;
					if (updateInterval < 1)
						updateInterval = 1;
					if (updateInterval > 2000)
						updateInterval = 2000;
					$(this).val("" + updateInterval);
					}
				});
				
				// setup plot
				var options = {
					series: {
						shadowSize: 0,
						color: '#c0392b',
						lines: {
							fill: true
						}
					}, // drawing is faster without shadows
					yaxis: { min: 0, max: 100 },
					xaxis: { show: false },
					grid: { backgroundColor: '#ffffff', borderColor: 'transparent' },
				};
				var plot = $.plot($("#demo-1"), [ getRandomData() ], options);
				
				function update() {
					plot.setData([ getRandomData() ]);
					// since the axes don't change, we don't need to call plot.setupGrid()
					plot.draw();
					setTimeout(update, updateInterval);
				}
				
				update();
			
			});
		</script>
	
		
		
	
   
</body>
</html>