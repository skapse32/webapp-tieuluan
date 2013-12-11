<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!-- Content -->
<div id="content" class="wmain">
	<!-- Left side -->
	<div id="box-left" class="fl top10 bg_white wleft">
		<div id="products-group" class="fl bg-top-products wleft">
			<div id="browser-modules" class="fl browser fontTahoma">
				<a href="" class="fl url_home l8 right8"> <img class="fl w21-18"
					alt="" src="resources/v2/images/blank.gif" />
				</a> <img class="fl right8" src="resources/v2/images/arrow.gif" alt="" />
				<div class="fl top3 right8">
					<a class="fl link_blue bold" href="">Admin</a>
				</div>
				<img class="fl right8" src="resources/v2/images/arrow.gif" alt="" />
				<div class="fl top3 right8">
					<a class="fl link_blue bold" href="">Hủy sản phẩm</a>
				</div>
				<img class="fl right8" src="resources/v2/images/arrow.gif" alt="" />
			</div>
		</div>
		<div class="fl clb">
			<div class="fl wleft">
				<form
					action="${pageContext.request.contextPath}/admin/sanphamhuyadmin">
					<!-- InstanceBeginEditable name="MainRegion" -->
					<div class="Column9">
						<h2 id="HomepageFeaturedList" class="h2row"
							style="text-align: center">${tieude}</h2>
						<br>
						<div>
							<div>
								<label
									style="font-weight: bold; font-size: 14px; margin-left: 30px;">Tình
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
												src="${imageDirectory}${sp.hinhanh}" width="50px"
												height="40px;"> </a>
										</div>
										<div style="padding-top: 10px; width: 20%;">
											<a
												style="font-size: 12px; text-decoration: none; font-weight: bold;"
												href="${pageContext.request.contextPath}/chitietsanpham?masp=${sp.masp}">${sp.tensp}</a>
										</div>
										<div
											style="width: 17%; color: #584C46; font-size: 14px; font-weight: bold; padding-top: 10px;">
											<fmt:formatNumber type="currency" currencyCode="VND"
												value="${sp.giakhoidiem}" />
										</div>
										<div
											style="width: 17%; color: #2DAB00; font-size: 14px; padding-top: 10px; font-weight: bold;">
											<fmt:formatNumber type="currency" currencyCode="VND"
												value="${sp.buocgia}" />
										</div>

										<div
											style="width: 22%; font-size: 12px; padding-top: 10px; font-weight: bold; color: #333;">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<jsp:useBean id="myDate" class="java.util.Date" />
											<c:set target="${myDate}" property="time"
												value="${sp.thoigianbatdau}" />
											<fmt:formatDate pattern="HH:mm:ss dd-MM-yyyy"
												value="${myDate}" />
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-
											<c:set target="${myDate}" property="time"
												value="${sp.thoigianketthuc}" />
											<fmt:formatDate pattern="HH:mm:ss dd-MM-yyyy"
												value="${myDate}" />

										</div>
										
									</div>
								</c:forEach>
							</div>

							<div style="clear: both;"></div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Right side -->
	<div id="box-right" class="fl l10 top10 bg_white wright cright">
		<div id="catalog-products" class="fl wright">
			<div id="catalog-products-titles"
				class="fl bg-titles top10 products-group-title-news color_white fontTahoma wright-26">
				<strong>Quản lý</strong>
			</div>
			<ul id="catalog-products-list"
				class="fl fontTahoma wright list-none top5">
				<li class="fl pd5 w240 "><a class="fl  pdl20"
					href="${pageContext.request.contextPath}/sanphamhuyadmin">Hủy
						đấu giá</a></li>
				<li class="fl wright das_top h1"></li>
				<li class="fl pd5 w240 "><a class="fl  pdl20"
					href="${pageContext.request.contextPath}/sanphamchophepdauadmin">Cho
						phép đấu</a></li>
				<li class="fl wright das_top h1"></li>
			</ul>
		</div>
	</div>
</div>