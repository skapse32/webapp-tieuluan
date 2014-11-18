<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
	
<!-- Main page header -->
<header id="header" class="container">

	<h1 style="margin-top: -20px;">
		<!-- Main page logo -->
		<a href="#">HCMUTE-CLC</a>
		<!-- Main page headline -->
		<span></span>
	</h1>
	<!-- User profile -->
	<div class="user-profile" style="margin-right: -30px;">
		<figure>

			<!-- User profile avatar -->

			<div style="float: left; display: inline-flex;">
				<ul class="nav navbar-top-links navbar-right">

					<c:choose>
						<c:when test="${pageContext.request.userPrincipal.name != null}">
							<li class="dropdown"><a class="stnav dropdown-toggle"
								data-toggle="dropdown" href="#"> <i class="fa fa-bell fa-lg"></i>
									<span class="stlabel label label-danger">9</span>

							</a>
								<ul class="dropdown-menu dropdown-alerts stalert">
									<li><a href="#">
											<div>
												<i class="fa fa-comment fa-fw"></i> New Comment <span
													class="pull-right text-muted small">4 minutes ago</span>
											</div>
									</a></li>
									<li class="divider"></li>
									<li><a href="#">
											<div>
												<i class="fa fa-twitter fa-fw"></i> 3 New Followers <span
													class="pull-right text-muted small">12 minutes ago</span>
											</div>
									</a></li>
									<li class="divider"></li>
									<li><a href="#">
											<div>
												<i class="fa fa-envelope fa-fw"></i> Message Sent <span
													class="pull-right text-muted small">4 minutes ago</span>
											</div>
									</a></li>
									<li class="divider"></li>
									<li><a href="#">
											<div>
												<i class="fa fa-tasks fa-fw"></i> New Task <span
													class="pull-right text-muted small">4 minutes ago</span>
											</div>
									</a></li>
									<li class="divider"></li>
									<li><a href="#">
											<div>
												<i class="fa fa-upload fa-fw"></i> Server Rebooted <span
													class="pull-right text-muted small">4 minutes ago</span>
											</div>
									</a></li>
									<li class="divider"></li>
									<li><a class="text-center" href="#"> <strong>See
												All Alerts</strong> <i class="fa fa-angle-right"></i>
									</a></li>
								</ul> <!-- /.dropdown-alerts --></li>
							<!-- /.dropdown -->
							<li><a class="stnav"
								href="${pageContext.request.contextPath}/user"> <i
									class="fa fa-user fa-lg"></i> <b class="stlink">${pageContext.request.userPrincipal.name}</b></a>
							</li>

						</c:when>
						<c:otherwise>
							<li><a class="stnav"
								href="${pageContext.request.contextPath}/dangnhap"> <i
									class="fa fa-user fa-lg"></i> <b class="stlink">Đăng Nhập</b></a></li>
						</c:otherwise>
					</c:choose>

					<!-- /.dropdown -->
				</ul>
				</div>
		</figure>
	</div>

	<!-- Main navigation -->
	<nav class="main-navigation navbar navbar-default" role="navigation">

		<!-- Collapse navigation for mobile -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".main-navigation-collapse">
				<span class="elusive icon-home"></span> Trang Chủ
			</button>
		</div>
		<!-- /Collapse navigation for mobile -->

		<!-- Navigation -->
		<div class="main-navigation-collapse collapse navbar-collapse">

			<!-- Navigation items -->
			<ul class="nav navbar-nav font14 navbar-right">

				<!-- Active navigation items -->
				<li class="active" style="border-left: 2px solid #ecf0f1;"><a
					style="border-radius: 0px;"
					href="${pageContext.request.contextPath}/"><span
						class="elusive icon-home"></span> Trang Chủ</a></li>

				<li><a href="#"><span class="elusive icon-comment"></span>
						Diễn Đàn</a></li>
				<li><a href="#"><span class="elusive  icon-book"></span>
						Hướng Dẫn</a></li>
				<li><a style="padding-right: 20px" href="#"><span
						class="elusive icon-info-sign"></span> Liên Hệ</a></li>

				<!-- /Navigation items -->

				<!-- Navigation form -->
				<!-- <li style="padding:0 80px">
						<form class="navbar-form" role="search">
							<div class="form-group">
								<input type="text" class="form-control" placeholder="Tìm kiếm">
							</div>
							<button type="submit" class="btn btn-default"><span class="elusive icon-search" style="padding: 2px;"></span></button>
						</form>
						
						/Navigation form
						</li> -->
			</ul>
			<div class="col-sm-3" style="padding-left: 0px; padding-right: 2px;">
				<form class="navbar-form" role="search">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="Tìm kiếm">
						<span class="input-group-btn">
							<button class="btn btn-default" style="height: 34px;"
								type="submit">
								<span class="elusive icon-search" style="padding: 2px;"></span>
							</button>
						</span>
					</div>

				</form>
			</div>

		</div>
		<!-- /Navigation -->

	</nav>
	<!-- /Main navigation -->

</header>
<!-- /Main page header -->