<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="Column12">
	<div id="UserSignInLinksContainer">
		<c:choose>
			<c:when test="${sessionScope.username != null}">
				<c:set var="username" value="${sessionScope.username}" />


				<div id="UserSignInLinks">
					<a href="${pageContext.request.contextPath}/taikhoan/thongtin">${username}</a>
					&nbsp;&nbsp;|&nbsp;&nbsp; <a href="${pageContext.request.contextPath}/dangxuat">Đăng xuất</a>
				</div>
			</c:when>
			<c:otherwise>
				<div id="UserSignInLinks">
					<a href="${pageContext.request.contextPath}/dangnhap">Đăng nhập</a>
					&nbsp;&nbsp;|&nbsp;&nbsp; <a
						href="${pageContext.request.contextPath}/dangky">Đăng ký</a>
				</div>
			</c:otherwise>
		</c:choose>


	</div>
</div>
<div class="Column12">
	<div id="Logo">
		<img
			src="${pageContext.request.contextPath}/resources/images/bg_logo.jpg">
	</div>
</div>
<div class="Column12">
	<div id="Menu">
		<div id="Menu_Top">
			<div class="Menu_Top_Link">
				<a href="${pageContext.request.contextPath}/home">Trang chủ</a>
			</div>
			<div class="Menu_Top_Link">
				<a href="${pageContext.request.contextPath}/sanphamdangdau">Danh
					sách sản phẩm</a>
			</div>
			<c:choose>
				<c:when test="${sessionScope.role != null}">
					<c:choose>
						<c:when test="${sessionScope.role == 'Admin'}">
							<div class="Menu_Top_Link">
								<a
									href="${pageContext.request.contextPath}/admin/sanphamhuyadmin">Quản
									lý sản phẩm (admin)</a>
							</div>
						</c:when>
						<c:otherwise>
							<div class="Menu_Top_Link">
								<a
									href="${pageContext.request.contextPath}/qlsanphamdangthamgia">Quản
									lý sản phẩm </a>
							</div>
							<div class="Menu_Top_Link">
								<a href="${pageContext.request.contextPath}/taikhoan/thongtin">Quản
									lý tài khoản</a>
							</div>
						</c:otherwise>
					</c:choose>
				</c:when>
				<c:otherwise>

				</c:otherwise>
			</c:choose>
		</div>
		<!-- Menu_Top -->
		<div id="Menu_Middle">
			<div id="Search_Basic">
				<form action="${pageContext.request.contextPath}/timkiem"
					method="post">
					<div>
						<c:if test="${sessionScope.loaiphien!=null}">
							<label
								style="font-weight: bold; font-size: 14px; margin-left: 30px;"></label>
							<select name="loaiphien">
								<option
									<c:if test="${sessionScope.loaiphien==1}" >
		                            selected="selected"
		                        </c:if>
									value="1">Đang đấu</option>
								<option
									<c:if test="${sessionScope.loaiphien==2}" >
		                            selected="selected"
		                        </c:if>
									value="2">Sắp đấu</option>
								<option
									<c:if test="${sessionScope.loaiphien==3}" >
		                            selected="selected"
		                        </c:if>
									value="3">Đã đấu</option>
							</select>
						</c:if>
						<c:if test="${sessionScope.tensp==null}">
							<input type="text" id="FullTextQuery" size="40" name="tensp"
								value="" placeholder="Tên sản phẩm" />
						</c:if>
						<c:if test="${sessionScope.tensp!=null}">
							<input type="text" id="FullTextQuery" size="40" name="tensp"
								value="${sessionScope.tensp}" placeholder="Tên sản phẩm" />
						</c:if>
						<input type="submit" value="Search" id="Search" name="Search" />
					</div>

				</form>
			</div>
			<!--- Search_Basic -->
			<div class="DIVclear0"></div>
		</div>
		<!-- Menu_Middle -->
		<div id="Menu_Bottom">
			<div id="Menu_Bottom_Left"></div>
			<div id="Menu_Bottom_Right"></div>
		</div>
	</div>
</div>