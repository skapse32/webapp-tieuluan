<%@page
	import="org.apache.taglibs.standard.tag.common.core.ForEachSupport"%>
<%@page import="com.nvh.daugia.model.jpa.BangDanhGia"%>
<%@page import="org.springframework.ui.Model,java.util.List"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<style>
input.text,select {
	margin-bottom: 12px;
	width: 95%;
	padding: .4em;
}

fieldset {
	padding: 0;
	border: 0;
	margin-top: 10px;
}

.ui-dialog .ui-state-error {
	padding: .3em;
}

.validateTips {
	border: 1px solid transparent;
	padding: 0.3em;
}
</style>
<script>
	function deleteQuestion(URL) {
		$.ajax({
			url : URL,
			type : 'POST',
			success : function() {
				TINY.box.show({
					html : 'Xóa Thành Công!',
					animate : true,
					close : true,
					boxid : 'error',
					top : 200
				});
				var millisecondsToWait = 1000;
				setTimeout(function() {
					location.reload();
				}, millisecondsToWait);
			}
		});
	};
	$(function() {
		$("#dialog-form").dialog({
			autoOpen : false,
			height : 350,
			width : 350,
			modal : true,
			buttons : {
				"Chấp nhận" : function() {
					formData = $('#inputForm').serialize();
					$.ajax({
						url : $("#inputForm").attr('action'),
						type : 'POST',
						data : formData,
						success : function(data) {
							var thongbao = "";
							if(data == "1"){
								thongbao = "Bảng đánh giá đã có câu hỏi có nội dung này!<br /> Vui lòng chọn câu hỏi có nội dung khác!";
							}else if(data == "2"){
								thongbao ="Trùng ID câu hỏi!<br /> Vui lòng chọn ID khác!";
							}else if(data == "3"){
								thongbao = "Thao Tác Thành Công!";
							}else if(data == "4"){
								thongbao = "Thao Tác Thất Bại!<br/> Không được bỏ trống ID!!!";
							}else{
								thongbao = "Thao Tác Thất Bại!<br/> Không được bỏ trống Nội Dung Câu Hỏi!!!";
							}
							TINY.box.show({
								html : thongbao,
								animate : true,
								close : true,
								boxid : 'error',
								top : 200
							});
							var millisecondsToWait = 2000;
							setTimeout(function() {
								location.reload();
							}, millisecondsToWait);
						}
					});
					$(this).dialog("close");
				},
				Cancel : function() {
					$(this).dialog("close");
				}
			},
			close : function() {

			}
		});

		$(".btn_them")
				.button()
				.click(function() {
							if ($("#reuse").is(':checked')) {
								$("#inputForm").attr("action","${pageContext.request.contextPath}/admin/question");
								reuseQuestion();
							} else {
								$("#inputForm").attr("action","${pageContext.request.contextPath}/admin/question");
								$("#id").val("");
								$("#noidung").val("");
								$("typequestion").val(1);
								$("#dialog-form").dialog("open");
							}
						});
	});
	function reuseQuestion() {
		//get all question
		$.ajax({
			url : '${pageContext.request.contextPath}/admin/getAllQuestion',
			type : 'GET',
			success : function(data) {
				var sel = $('<select name="noidung" id="noidung" class="text ui-widget-content ui-corner-all">');
				$.each(data, function(val, text) {
					sel.append($('<option>').attr('value',text).text(text));
				});
				$("#noidung").replaceWith(sel);
			}
		});
		//$("#inputForm").attr("action","${pageContext.request.contextPath}/admin/question/"+idquestion+"?updatequestion");
		$("#dialog-form").dialog("open");
	}
	function updateQuestion(idquestion, contentQuestion, idtype) {
		$("#id").val(idquestion);
		$("#noidung").val(contentQuestion);
		$("#typequestion").val(idtype);
		$("#inputForm").attr(
				"action",
				"${pageContext.request.contextPath}/admin/question/"
						+ idquestion + "?updatequestion");
		$("#dialog-form").dialog("open");
	}
</script>

<div class="content">


	<div class="site-map-path">
		<a href="${pageContext.request.contextPath}/admin"><img
			src="${pageContext.request.contextPath}/resources/images/home.png"
			height="18" width="18" border="0px" /></a> <label> Trang Chủ ></label> <a
			class="focus" href="${pageContext.request.contextPath}/admin?qldg">Danh
			Sách Bảng Đánh Giá</a> &gt; <a class="focus"
			href="${pageContext.request.contextPath}/admin/${bangdanhgia.id}">Bảng
			Đánh Giá</a>
		<hr class="line-header-padding" />
	</div>
	<c:if test="${not empty bangdanhgia}">
		<div id="dialog-form" title="Tạo câu hỏi">
			<p class="validateTips">Điền đầy đủ thông tin</p>
			<form id="inputForm" method="post" action="">
				<fieldset>
					<input name="bangid" id="bangid" type="hidden"
						value="${bangdanhgia.id}" /> <label for="id">ID</label> <input
						type="text" name="id" id="id"
						class="text ui-widget-content ui-corner-all" /> <label
						for="noidung">Nội dung</label> <input type="text" name="noidung"
						id="noidung" value="" class="text ui-widget-content ui-corner-all" />
					<label for="typequestion">Loại Câu Hỏi</label><br>
					<select name="typequestion" id="typequestion"
						class="text ui-widget-content ui-corner-all">
						<c:forEach items="${dslch}" var="lch">
							<option value="${lch.id}">${lch.tenloai}</option>
						</c:forEach>
					</select>
				</fieldset>
			</form>
		</div>
		
		<div id="public">
			<div id="row">Bảng : ${bangdanhgia.id}</div>
			<div id="row">
				<img
					src="${pageContext.request.contextPath}/resources/images/webpage16x16_1.png" />
				Tên bảng : ${bangdanhgia.tenbang}
			</div>
			<div id="row" align="right">
				<input id="reuse" type="checkbox" name="reuse" value="" />Sử dụng
				lại câu hỏi đã có <input id="button" class="btn_them" type="button"
					value="Thêm Câu Hỏi" />
			</div>
		</div>
		<c:choose>
			<c:when test="${not empty lchs1}">
				<c:forEach items="${lchs1}" var="lch">
					<div id="public" style="width: 600px">
						<div id="row" style="font-weight: bold;">Tiêu Chí ${lch.id}
							: ${lch.tenloai}</div>
						<c:forEach items="${lch.cauhois}" var="cauhoi">
							<c:if test="${bangdanhgia.cauhois.contains(cauhoi)}">
								<div id="private" style="width: 580px">
									<div id="row" style="width: 570px">${cauhoi.id} :
										${cauhoi.noidung}</div>
									<div id="row" align="right" style="width: 570px">
										<input id="button" type="button" value="Sữa"
											onclick="updateQuestion('${cauhoi.id}','${cauhoi.noidung}','${cauhoi.loaicau.id}')" />
										<input id="button" type="button" value="Xóa"
											onclick="deleteQuestion('${pageContext.request.contextPath}/admin/question/${cauhoi.id}?bangid=${bangdanhgia.id}')" />
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<div id="private">
					<div id="row" style="width: 570px">Phiếu đánh giá chưa tạo
						câu hỏi.</div>
				</div>
			</c:otherwise>
		</c:choose>
	</c:if>
</div>