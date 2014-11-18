<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<div class="col-sm-9">
	<!-- Grid row -->
	<!-- Data block -->
	<div class="data-block">
		<header style="padding: 6px 5px 6px 15px; font-size: 16px;">
			<h2 style="font-size: 14px;">
				<i class="fa fa-bullhorn"></i> Thông báo
			</h2>
		</header>
		<!-- <section style="height:90%;">
								
								<p>thong bao</p>
							</section>
							<footer>
								
							</footer> -->
	</div>

	<!-- /Data block -->
	
	<div class="contentt">
	  <c:forEach var="p" items="${thongbaos}">
	 
           <div class="alert alert-success-st alert-dismissible no-radius mar-bot-5" role="alert">
			<button type="button" class="close bla-st" data-dismiss="alert">
				<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
			</button>
			<a class="head-alert-st">${p.getTb().getTieuDe()}</a><br/>
			<span style="font-size: 0.9em;">[Môn:<a class="link-alert-st2" href="${pageContext.request.contextPath}/sv/monhoc?id=${p.getMamh()}">${p.getTenmh()}</a> , Ngày Đăng: ${p.getTb().getNgayDang()}]</span><br/>
			<div class="body-alert-st"> ${p.getTb().getNoiDung()}
			<span class="more-alert-st"><a><i class="fa fa-eye"></i> Chi Tiết</a></span>
			</div>
		</div>
      </c:forEach>
		
		
	</div>
	<!-- /Grid row -->

</div>

<!-- /Multi-level scaffolding example -->
