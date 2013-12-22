<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div style="margin:40px auto 20px auto;" align="center">
	<c:if test="${not empty error }">
		<script type="text/javascript">
			alert("${errorcontent}");
		</script>
	</c:if>
	<form class="loginform"
		action="${pageContext.request.contextPath}/dangnhap?action=dangnhap"
		method="post">
		<br/>
		<table style="font-size: 11pt" class="logintable">
			<tr>
				<td width="300px" style="text-align: right; vertical-align: middle;"><label class="control-label">Tên đăng nhập</label>   
				</td>
				<td width="167"><input id="username" class="login" name="username" size="25"
					type="text" value="" /></td>
				<td width="269">&nbsp;</td>
			</tr>
			<tr></tr>
			<tr valign="middle">
				<td style="padding:5px;text-align: right; vertical-align: middle;"><label class="control-label">Mật khẩu</label></td>
				<td><input id="password" class="login" name="password" size="25"
					type="password" value="" /></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td valign="top"><br></td>
				<td colspan="2" valign="top" style="padding:10px;"><a href="dangky" class="qlogin">Bạn chưa có tài khoản?</a>
				</td>
			</tr>
			
		</table>
		<div align="center">
		<div style="width:100px;">
			<input class="button orange" type="submit"  value="Đăng nhập" id="btnDangNhap">
		</div>
		</div>
	</form>
</div>