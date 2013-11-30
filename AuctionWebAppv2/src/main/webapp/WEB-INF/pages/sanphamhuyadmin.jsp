<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="Column3">
	<h2 id="RegionList" class="h2row">Quản lý</h2>
	<ul class="CategoriesList">
		<li class="CategoryList"><a
			href="${pageContext.request.contextPath}/admin/sanphamhuyadmin">Hủy
				đấu giá</a>
		</li>
		<li class="CategoryList"><a
			href="${pageContext.request.contextPath}/admin/sanphamchophepdauadmin">Cho
				phép đấu</a>
		</li>
	</ul>
</div>
<form action="${pageContext.request.contextPath}/admin/sanphamhuyadmin">
	<!-- InstanceBeginEditable name="MainRegion" -->
	<div class="Column9">
		<h2 id="HomepageFeaturedList" class="h2row" style="text-align: center">${tieude}</h2>
		<br>
		<div>
			<div>
				<label style="font-weight: bold;font-size: 14px;margin-left: 30px;">Tình
					trạng:&nbsp;&nbsp;</label> <select name="tinhtrang" onchange="submit()">
					<option
						<c:if test="${tinhtrang==-1}" >
		                            selected="selected"
		                        </c:if>
						value="-1">Tất cả</option>
					<option
						<c:if test="${tinhtrang==0}" >
		                            selected="selected"
		                        </c:if>
						value="0">Chưa hủy</option>
					<option
						<c:if test="${tinhtrang==1}" >
		                            selected="selected"
		                        </c:if>
						value="1">Đã hủy</option>



				</select>
			</div>
			<br>
			<div class="wrap-dtb">
				<div class="wrap-header">
					<div style="width: 30%">Sản phẩm</div>
					<div style="width: 17%">Giá khởi điểm</div>
					<div style="width: 17%">Bước giá</div>
					<div style="width: 22%">Thời gian</div>
					<div style="width: 14%"></div>
				</div>
				<c:forEach var="sp" items="${dssp}">
					<div class="wrap-td-chan">
						<div style="width: 10%;">
							<a
								href="${pageContext.request.contextPath}/chitietsanpham?masp=${sp.masp}"><img
								src="${imageDirectory}${sp.hinhanh}" width="50px" height="40px;">
							</a>
						</div>
						<div style="padding-top: 10px;width: 20%;">
							<a
								style="font-size: 12px;text-decoration: none;font-weight: bold; "
								href="${pageContext.request.contextPath}/chitietsanpham?masp=${sp.masp}">${sp.tensp}</a>
						</div>
						<div
							style="width: 17%;color: #584C46;font-size: 14px;font-weight: bold;padding-top: 10px;">
							<fmt:formatNumber type="currency" currencyCode="VND"
								value="${sp.giakhoidiem}" />
						</div>
						<div
							style="width: 17%;color: #2DAB00;font-size: 14px;padding-top: 10px;font-weight: bold;">
							<fmt:formatNumber type="currency" currencyCode="VND"
								value="${sp.buocgia}" />
						</div>

						<div
							style="width: 22%; font-size: 12px;padding-top: 10px;font-weight: bold; color: #333;">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<jsp:useBean id="myDate" class="java.util.Date" />
							<c:set target="${myDate}" property="time"
								value="${sp.thoigianbatdau}" />
							<fmt:formatDate pattern="HH:mm:ss dd-MM-yyyy" value="${myDate}" />
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-
							<c:set target="${myDate}" property="time"
								value="${sp.thoigianketthuc}" />
							<fmt:formatDate pattern="HH:mm:ss dd-MM-yyyy" value="${myDate}" />

						</div>
						<div
							style="width: 14%;color: #7E7C7C;font-size: 12px;font-weight: bold;text-align: center;padding-top: 10px;">

							<c:choose>
								<c:when test="${sp.tinhtrangdaugia == 0}">
									<a
										style="font-size: 12px;text-decoration: none;font-weight: bold; "
										href="${pageContext.request.contextPath}/admin/huysanpham?masp=${sp.masp}">Hủy</a>
								</c:when>
								<c:otherwise>
									Đã hủy
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</c:forEach>
			</div>

			<div style="clear: both;"></div>
		</div>





	</div>






	<!-- InstanceEndEditable -->
</form>
<div class="DIVclear"></div>