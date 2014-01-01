<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!-- Banner -->
	<div id="header" class="header wmain">
        <a class="fl top28" href="."><img class="fl logo" alt="Website dau gia online" src="${pageContext.request.contextPath}/resources/v2/images/logo2.png"/></a>
    </div>
<!-- Banner END -->

<!-- Menu -->
    <div id="menu-horizontal" class="wmain">
        <div class="fl bg_menu wmain">
            <a id="home" href="${pageContext.request.contextPath}/" class="fl w141 bold menuh msep">Trang chủ</a>
            <a id="sanphamdangdau.html" href="${pageContext.request.contextPath}/sanphamdangdau.html" class="fl w141 bold menuh msep">Đang đấu</a>
            <a id="sanphamsapdau.html" href="${pageContext.request.contextPath}/sanphamsapdau.html" class="fl w141 bold menuh msep">Sắp đấu</a>
            <a id="sanphamdadau.html" href="${pageContext.request.contextPath}/sanphamdadau.html" class="fl w141 bold menuh msep">Đã đấu</a>
            <a href="#" class="fl w141 bold menuh msep">Hướng dẫn</a>
            <a href="#" class="fl w141 bold menuh msep">Liên hệ</a>
            <c:choose>
            	<c:when test="${not empty username}">
            		<a id="dangnhap" href="userpanel" class="fl w141 bold menuh msep">Xin chào : ${username}</a>
            	</c:when>
            	<c:otherwise>
            		<a id="dangnhap" href="dangnhap" class="fl w141 bold menuh msep">Đăng nhập</a>
            	</c:otherwise>
            </c:choose>
        </div>
    </div>
    <div id="banner" class="wmain">
        <div class="fl banner wmain"></div>
    </div>
<!-- Menu end -->