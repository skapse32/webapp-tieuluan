<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<div class="login">
<c:if test="${not empty error}">
	<script>
		TINY.box.show({html:'${error}!',animate:true,close:false,boxid:'error',top:200});
	</script>
</c:if>
<form id="frmlogin" method="post" action="${pageContext.request.contextPath}/login">
	<fieldset>
		<legend>Login</legend>
		User Name : <input id="textbox" type="text" name="username"
			class="textfield"><br /> Password : <input id="textbox"
			type="password" name="password" class="textfield"> <br />
		<br /> <input id="button" type="submit" class="btn_search"
			value="Login">
	</fieldset>
</form>

<div class="title">
	<img
		src="${pageContext.request.contextPath}/resources/images/logo_1.png" />
	<h1>PHẦN MỀM HỖ TRỢ KHÁCH HÀNG</h1>
	<h2>WEBSITE ĐẤU GIÁ TRỰC TUYẾN G114315</h2>

</div>
</div>
