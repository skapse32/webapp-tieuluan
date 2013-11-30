<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div style="margin: 100px;" align="center">
	<form 
		action="${pageContext.request.contextPath}/dangnhap?action=dangnhap"
		method="post">
		<br />
		<table style="font-size: 11pt">
			<tr>
				<td width="300px" style="text-align: right; vertical-align: middle;">Tên đăng nhập :
				</td>
				<td width="167"><input id="username" name="username" size="25"
					type="text" value="" /></td>
				<td width="269">&nbsp;</td>
			</tr>
			<tr></tr>
			<tr valign="middle">
				<td style="text-align: right; vertical-align: middle;">Mật
					khẩu :</td>
				<td><input id="password" name="password" size="25"
					type="password" value="" /></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td valign="top"><br></td>
				<td colspan="2" valign="top"><label style="color: Red">${error}</label>
				</td>
			</tr>
		</table>
		<div align="center">
			<input type="submit" value="Đăng nhập" id="btnDangNhap" />
		</div>
	</form>
</div>