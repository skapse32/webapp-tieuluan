<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/v2/js/SpryValidation/SpryValidationTextField.js"></script>
<link href="${pageContext.request.contextPath}/resources/v2/js/SpryValidation/SpryValidationTextField.css" rel="stylesheet" type="text/css" />

<div class="content">
	<div class="login">
	<c:if test="${error != null }" >
		<div id="error">${error }</div>
	</c:if>
	
		<form
			action="${pageContext.request.contextPath}/dangnhap?action=dangnhap"
			method="post">
			<table id="login">
				<tr>
					<td colspan="2" class="title">Đăng nhập</td>
				</tr>
				<tr>
					<td>Tên đăng nhập :</td>
					<td id="vtfusername"><input id="username" name="username" size="25" type="text"
						value="${username }" />
						<span class="textfieldRequiredMsg">*</span></td>
				</tr>
				<tr>
					<td>Mật khẩu :</td>
					<td id="vtfpassword"><input id="password" name="password" size="25"
						type="password" value="${password }" />
						<span class="textfieldRequiredMsg">*</span></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" value="Đăng nhập" id="btnDangNhap"></td>
				</tr>
			</table>
		</form>
		<a href="dangky">Đăng ký</a> | <a href="quenmatkhau">Quên mật khẩu
			?</a>
	</div>
</div>
<script type="text/javascript">
var vtfusername = new Spry.Widget.ValidationTextField("vtfusername", "none", {
	validateOn : [ "change" ]
});
var vtfpassword = new Spry.Widget.ValidationTextField("vtfpassword", "none", {
	validateOn : [ "change" ]
});
</script>