<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="Column3">
	<h2 id="RegionList" class="h2row">DANH SÁCH ĐẤU GIÁ</h2>
	<ul class="CategoriesList">
		<li class="CategoryList"><a
			href="${pageContext.request.contextPath}/qlsanphamdangthamgia">Sản
				phẩm đang tham gia</a></li>
		<li class="CategoryList"><a
			href="${pageContext.request.contextPath}/qlsanphamdaketthuc">Sản
				phẩm đã kết thúc</a></li>
		<li class="CategoryList"><a
			href="${pageContext.request.contextPath}/qlsanphamchienthang">Sản
				phẩm chiến thắng</a></li>
	</ul>
	<h2 id="RegionList" class="h2row">SẢN PHẨM CỦA TÔI</h2>
	<ul class="CategoriesList">
		<li class="CategoryList"><a
			href="${pageContext.request.contextPath}/qlsanphamcuatoidangdau">Sản
				phẩm đang đấu</a></li>
		<li class="CategoryList"><a
			href="${pageContext.request.contextPath}/qlsanphamcuatoisapdau">Sản
				phẩm sắp đấu</a></li>
		<li class="CategoryList"><a
			href="${pageContext.request.contextPath}/qlsanphamcuatoidadauxong">Sản
				phẩm đã đấu xong</a></li>
		<li class="CategoryList"><a
			href="${pageContext.request.contextPath}/qlsanphamcuatoibihuy">Sản
				phẩm bị hủy</a></li>
		<li class="CategoryList"><a
			href="${pageContext.request.contextPath}/dangsanpham">Đăng sản
				phẩm</a></li>
	</ul>
</div>
<form action="${pageContext.request.contextPath}/qlsanphamchienthang">
	<!-- InstanceBeginEditable name="MainRegion" -->
	<div class="Column9">
		<h2 id="HomepageFeaturedList" class="h2row" style="text-align: center">${tieude}</h2>
		<br>
		<div>
			<div>
				<label style="font-weight: bold;font-size: 14px;margin-left: 30px;">Trạng thái</label>
				<select name="trangthai" onchange="submit()">
					<option
						<c:if test="${trangthai==-1}" >
		                            selected="selected"
		                        </c:if>
						value="-1">Tất cả</option>
					<option
						<c:if test="${trangthai==3}" >
		                            selected="selected"
		                        </c:if>
						value="3">Đã thanh toán</option>
					<option
						<c:if test="${trangthai==1}" >
		                            selected="selected"
		                        </c:if>
						value="1">Chưa thanh toán</option>


				</select>
			</div>
			<br>
			<div class="wrap-dtb">
				<div class="wrap-header">
					<div style="width: 30%">Sản phẩm</div>
					<div style="width: 17%">Giá khởi điểm</div>
					<div style="width: 17%">Giá thắng</div>
					<div style="width: 20%">Thời gian thắng</div>
					<div style="width: 16%"></div>
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
							style="width: 17%;color: #584C46;font-size: 12px;font-weight: bold;padding-top: 10px;">
							<fmt:formatNumber type="currency" currencyCode="VND"
								value="${sp.giakhoidiem}" />
						</div>
						<div
							style="width: 17%;color: #2DAB00;font-size: 14px;padding-top: 10px;font-weight: bold;">
							<fmt:formatNumber type="currency" currencyCode="VND"
								value="${sp.giahientai}" />
						</div>
						<div
							style="width: 20%; font-size: 14px;padding-top: 10px;font-weight: bold; color: blue;">
							<jsp:useBean id="myDate" class="java.util.Date" />
							<c:set target="${myDate}" property="time"
								value="${sp.thoigianketthuc}" />
							<fmt:formatDate pattern="HH:mm:ss dd-MM-yyyy" value="${myDate}" />
						</div>
						<div
							style="width: 16%;color: #7E7C7C;font-size: 12px;font-weight: bold;text-align: center;padding-top: 10px;">

							<c:choose>
								<c:when test="${sp.tinhtrangdaugia == 1}">
									<a
										style="font-size: 12px;text-decoration: none;font-weight: bold; "
										href="${pageContext.request.contextPath}/thanhtoan?masp=${sp.masp}">Thanh
										toán</a>
								</c:when>
								<c:otherwise>
							Đã thanh toán
							</c:otherwise>
							</c:choose>
						</div>
					</div>
				</c:forEach>
				<div style="clear: both;"></div>
			</div>





		</div>




	</div>

	<!-- InstanceEndEditable -->
</form>
<div class="DIVclear"></div>