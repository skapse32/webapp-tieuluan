<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	document.title = "Đăng Nhập";
</script>

<!-- Login header -->
<div class="login-logo">
	<i class="fa fa-lock fa-4x"
		style="color: white; padding: 10px 0px 0px 40px;"></i>
</div>
<!-- /Login header -->

<!-- Login form -->

<form name='loginForm' class="form-horizontal"
	action="<c:url value='/j_spring_security_check' />" method='POST'>
	<div class="form-group">
		<div class="input-group" style="margin:0 auto;">
			<c:if test="${not empty error}">
				<div class="error-st">${error}</div>
			</c:if>
			<c:if test="${not empty msg}">
				<div class="msg-st">${msg}</div>
			</c:if>
		</div>
		<!-- <div class="input-group" style="padding-left: 26px;">
			<div class="checkbox-inline radio styled-radio">
				<label> <input type="radio" name="optionsRadios"
					id="optionsRadios1" value="option1" data-label="Sinh Viên" checked>
				</label>
			</div>
			<div class="checkbox-inline radio styled-radio">
				<label> <input type="radio" name="optionsRadios"
					id="optionsRadios2" data-label="Giảng Viên" value="option2">
				</label>
			</div>
		</div> -->
	</div>
	<div class="form-group">
		<div class="input-group">
			<span class="input-group-addon"><span
				class="elusive icon-user"></span></span> <input class="form-control"
				type="text" placeholder="User" name="username" value="${username}">
		</div>
	</div>
	<div class="form-group">
		<div class="input-group">
			<span class="input-group-addon"><span class="elusive icon-key"></span></span>
			<input class="form-control" type="password" placeholder="Password"
				name="password" value="${password}">
		</div>
	</div>
	<input type="hidden" name="${_csrf.parameterName}"
		value="${_csrf.token}" />
	<button class="btn btn-primary btn-lg btn-block" type="submit">Đăng
		Nhập</button>
	<a class="lost-password" href="${pageContext.request.contextPath}/">Back to home</a>
</form>
<!-- /Login form -->

