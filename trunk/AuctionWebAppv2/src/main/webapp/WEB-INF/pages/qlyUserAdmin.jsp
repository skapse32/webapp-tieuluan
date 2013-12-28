<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script>
	$(function() {
		$("#list")
				.jqGrid(
						{
							url : '${pageContext.request.contextPath}/grid',
							datatype : 'json',
							mtype : 'GET',
							colModel : [ {
								name : 'username',
								label : 'User Name',
								formatter : 'string',
								width : 150
							}, {
								name : 'email',
								label : 'E-Mail',
								width : 300
							}, {
								name : 'ngaySinh',
								label : 'Ngày Sinh',
								width : 150
							}, {
								name : 'gioiTinh',
								label : 'Giới tính',
								width : 100
							} ],
							height : 'auto',
							jsonReader : {
								page : "page",
								total : "total",
								records : "records",
								repeatitems : false,
								id : "username",
							},
							pager : '#pager',
							rowNum : 20,
							rowList : [ 10, 20, 30 ],
							sortname : 'hoTen',
							sortorder : 'asc',
							viewrecords : true,
							gridview : true,
							height : 300,
							width : 710,
							caption : 'Danh Sách User',
							onSelectRow : function(id) {
								document.location.href = "${pageContext.request.contextPath}/thongtintaikhoannguoiban/"
										+ id;
							}

						});
		$('#mysearch').jqGrid('filterGrid', '#list', {
			filterModel : [ {
				label : 'User Name',
				name : 'username'
			}, {
				label : 'Email',
				name : 'email'
			} ],
			formtype : 'vertical',
			enableSearch : true,
			enableClear : true,
			autosearch : false
		});
	});
</script>
<!-- Content -->
<div id="content" class="wmain">
	<!-- Left side -->
	<div id="box-left" class="fl top10 bg_white wleft">
		<div id="products-group" class="fl bg-top-products wleft">
			<div id="browser-modules" class="fl browser fontTahoma">
				<a href="" class="fl url_home l8 right8"> <img class="fl w21-18"
					alt="" src="${pageContext.request.contextPath}/resources/v2/images/blank.gif" />
				</a> <img class="fl right8" src="${pageContext.request.contextPath}/resources/v2/images/arrow.gif" alt="" />
				<div class="fl top3 right8">
					<a class="fl link_blue bold" href="">Admin</a>
				</div>
				<img class="fl right8" src="${pageContext.request.contextPath}/resources/v2/images/arrow.gif" alt="" />
				<div class="fl top3 right8">
					<a class="fl link_blue bold" href="">Quản lý User</a>
				</div>
			</div>
		</div>

		<div style="margin-top: 30px">
			<div id="mysearch">
				<br />
			</div>
			<table id="list">
				<tr>
					<td />
				</tr>
			</table>
		</div>
		<div id="pager"></div>
	</div>
	<!-- End Left side -->
	<!-- Right side -->
	<div id="box-right" class="fl l10 top10 bg_white wright cright">
		<c:choose>
			<c:when test="${sessionScope.role != null}">
				<c:choose>
					<c:when test="${sessionScope.role == 'Admin'}">
						<div id="catalog-products-titles"
							class="fl bg-titles top10 products-group-title-news color_white fontTahoma wright-26">
							<strong>Quản lý Sản phẩm(Admin)</strong>
						</div>
						<ul id="catalog-products-list"
							class="fl fontTahoma wright list-none top5">
							<li class="fl pd5 w240 "><a class="fl  pdl20"
								href="${pageContext.request.contextPath}/sanphamhuyadmin">Quản
									lý sản phẩm (admin)</a></li>
							<li class="fl wright das_top h1"></li>
							<li class="fl pd5 w240 "><a class="fl  pdl20"
								href="${pageContext.request.contextPath}/qlyuser">Quản lý
									User</a></li>
							<li class="fl wright das_top h1"></li>
							<li class="fl pd5 w240 "><a class="fl  pdl20"
								href="${pageContext.request.contextPath}/hoadon">Hoá đơn</a></li>
							<li class="fl wright das_top h1"></li>
						</ul>
					</c:when>
					<c:otherwise></c:otherwise>
				</c:choose>
			</c:when>
		</c:choose>
	</div>
	<!-- Right side END -->
</div>