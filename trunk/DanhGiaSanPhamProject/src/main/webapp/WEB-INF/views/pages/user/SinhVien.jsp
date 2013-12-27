<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<jsp:useBean id="bdgChoose"
	class="com.nvh.applicationscope.BangDanhGiaChoose" scope="application" />
<div class="content">
	<div class="site-map-path">
		<a href="${pageContext.request.contextPath}/sinhvien"><img
			src="${pageContext.request.contextPath}/resources/images/home.png"
			height="18" width="18" border="0px" /></a> <label> Trang Chủ ></label> <a
			class="focus" href="${pageContext.request.contextPath}/sinhvien/">${tentrang}</a>
		<hr class="line-header-padding" />
	</div>
	<c:choose>
		<c:when test="${not empty success}">
			<script type="text/javascript">
				TINY.box
						.show({
							html : '${success}'
									+ '.Cảm ơn bạn đã tham gia việc góp phần nâng cao chất lượng sản phẩm của sàn đấu giá chúng tôi!',
							animate : false,
							close : false,
							boxid : 'error',
							top : 200
						});
			</script>
		</c:when>
		<c:when test="${not empty fail }">
			<script type="text/javascript">
				TINY.box
						.show({
							html : '${fail}'
									+ '. Rất tiếc đã xãy ra lỗi, xin hãy chắc là bạn đã đánh giá đủ số lượng câu hỏi.',
							animate : false,
							close : false,
							boxid : 'error',
							top : 200
						});
			</script>
		</c:when>
	</c:choose>
	<c:forEach items="${dssp}" var="sp">
		<a href="${pageContext.request.contextPath}/sinhvien/danhgia/${sp.masp}">
			<div id="public">
				<div style=" width: 500px ; float: left">
				<div id="row" style="width: 500px">
					<span style="text-decoration: underline; font-weight: bold;">Tên sản phẩm </span> : ${sp.tensp}
				</div>
				<div id="row" style="width: 500px">
					<span style="text-decoration: underline; font-weight: bold;">Người đăng </span> : ${sp.nguoidang}
				</div>
				</div>
				<img style="border: 1px solid black;" class="img_small" alt="" src="${imageDirectory}${sp.hinhanh}"/>
			</div>
		</a>
	</c:forEach>
</div>