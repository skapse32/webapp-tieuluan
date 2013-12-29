<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="content">
	<c:if test="${not empty error }">
		<script type="text/javascript">
			alert("${error}");
		</script>
	</c:if>
	<div class="login">
		<form
			action="${pageContext.request.contextPath}/dangnhap?action=dangnhap"
			method="post">
			<table>
				<tr>
					<td colspan="2" class="title">Đăng nhập</td>
				</tr>
				<tr>
					<td>Tên đăng nhập :</td>
					<td><input id="username" name="username" size="25" type="text"
						value="" /></td>
				</tr>
				<tr>
					<td>Mật khẩu :</td>
					<td><input id="password" name="password" size="25"
						type="password" value="" /></td>
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