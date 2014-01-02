<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="myDate" class="java.util.Date" />


<div id="content" class="wmain">
	<div id="box-left" class="fl top10 bg_white wleft">
		<div id="products-group" class="fl bg-top-products wleft">
			<div id="browser-modules" class="fl browser fontTahoma">
				<a href="" class="fl url_home l8 right8"> <img class="fl w21-18"
					alt="" src="${pageContext.request.contextPath}/resources/v2/images/blank.gif" />
				</a> <img class="fl right8" src="${pageContext.request.contextPath}/resources/v2/images/arrow.gif" alt="" />
				<div class="fl top3 right8">
					<a class="fl link_blue bold" href="">${username}</a>
				</div>
				<img class="fl right8" src="${pageContext.request.contextPath}/resources/v2/images/arrow.gif" alt="" />
				<div class="fl top3 right8">
					<a class="fl link_blue bold" href="">Danh sách đặt giá bạn đã đặt</a>
				</div>
			</div>
		</div>
		<table class="product_technical_table"
			style="font-family: Tahoma, Verdana; border-collapse: collapse; width: 340px; margin: auto">
			<tbody style="font-family: Tahoma, Verdana;">
				<tr class="title"
					style="background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: rgb(229, 229, 229); color: rgb(204, 0, 0); font-weight: bold; text-align: center;">
					<td lang="vi"
						style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
						<span style="font-size: 10pt; font-family: Arial;"
						class="Apple-style-span"> STT </span>
					</td>
					<td lang="vi"
						style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
						<span style="font-size: 10pt; font-family: Arial;"
						class="Apple-style-span"> Thời gian </span>
					</td>
					<td lang="vi"
						style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: top;">
						<span style="font-size: 10pt; font-family: Arial;"
						class="Apple-style-span"> Giá </span>
					</td>
				</tr>
				<%
					int i = 0;
				%>
				<c:forEach var="ls" items="${lss}">
					<%
						i++;
					%>
					<tr class="technical" style="font-family: Tahoma, Verdana;">
						<td class="name"
							style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: center;">
							<span style="font-size: 10pt; font-family: Arial;"
							class="Apple-style-span"><span lang="vi"
								style="font-size: 10pt;" class="Apple-style-span"><%=i%></span>
						</span>
						</td>
						<td class="name"
							style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: center;">
							<span style="font-size: 10pt; font-family: Arial;"
							class="Apple-style-span"><c:set target="${myDate}" property="time" value="${ls.getThoigian()}" /> 
							<fmt:formatDate pattern="HH:mm:ss dd-MM-yyyy" value="${myDate}" /></span>
						</td>
						<td class="name"
							style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(202, 202, 202); border-right-color: rgb(202, 202, 202); border-bottom-color: rgb(202, 202, 202); border-left-color: rgb(202, 202, 202); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 3px; padding-right: 6px; padding-bottom: 3px; padding-left: 6px; vertical-align: middle; font-weight: bold; text-align: center;">
							<span style="font-size: 10pt; font-family: Arial;"
							class="Apple-style-span"><span lang="vi"
								style="font-size: 10pt;" class="Apple-style-span" id="gia<%=i%>"> ${ls.getGiadat()}&nbsp;</span>
						</span> <script>
							var x = numeral("${ls.getGiadat()}").format('0,0');
							x = x.replace(/,/g, ".");
							var idd = "gia"+<%=i%>;
							document.getElementById(idd).innerHTML = x
									+ "&nbsp;đ";
						</script>
						</td>
					</tr>
				</c:forEach>
				
			</tbody>
		</table>
	</div>
</div>
