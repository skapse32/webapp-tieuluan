<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!-- Content -->
<div id="content" class="wmain">
	<!-- start left-box -->
	<div id="box-left" class="fl top10 bg_white wleft">
		<form action="${pageContext.request.contextPath}/dangsanpham"
			name="formdangsanpham" id="fdangsanpham" method="post"
			enctype="multipart/form-data">
			<!-- InstanceBeginEditable name="MainRegion" -->
			<div class="Column9">
				<h2 id="HomepageFeaturedList" class="h2row"
					style="text-align: center">${tieude}</h2>
				<div class="Required_Notice">
					Bạn phải chọn các thông tin này "<b class="Required">*</b>"
				</div>

				<div id="accordion">
					<h3 class="h3row">
						<a href="#">Thông tin sản phẩm</a>
					</h3>
				<span class="Apple-style-span"
					style="font-family: Tahoma, Verdana; font-size: 12px; line-height: 17px; background-color: rgb(255, 255, 255);">
					<table class="product_technical_table" cellpadding="0" cellspacing="0"
						style="font-family: Tahoma, Verdana; border-collapse: collapse; width: 730px">
						<tr>
							<td class="td_chitietsanpham"><b>Tên sản phẩm</b></td>
							<td class="td_chitietsanpham"><input name="txttensp"
								maxlength="80" size="50" type="text" value=""><b
								class="Required">*</b></td>
							<td></td>
						</tr>

						<tr>
							<td class="td_chitietsanpham"><b>Loại sản phẩm</b></td>
							<td class="td_chitietsanpham"><select name="selectloaisp"
								style="width: 150px;">

									<c:forEach var="loaisp" items="${sessionScope.dsloaisp}">
										<option value="${loaisp.maloaisp}">${loaisp.tenloaisp}</option>
									</c:forEach>

							</select></td>
							<td></td>
						</tr>
						<tr>
							<td class="td_chitietsanpham"><b>Tình trạng sản phẩm</b></td>
							<td class="td_chitietsanpham"><select name="selectttsp"
								style="width: 150px;">

									<c:forEach var="tinhtrangsp"
										items="${sessionScope.dstinhtrangsp}">
										<option value="${tinhtrangsp.matinhtrangsp}">${tinhtrangsp.tentinhtrangsp}</option>
									</c:forEach>
							</select></td>
							<td></td>
						</tr>
						<tr>
							<td class="td_chitietsanpham"><b>Số lượng</b></td>
							<td class="td_chitietsanpham"><input name="txtsoluong"
								maxlength="80" size="50" type="text" value=""><b
								class="Required">*</b></td>
							<td></td>
						</tr>
						<tr>
							<td class="td_chitietsanpham"><b>Xuất xứ</b></td>
							<td class="td_chitietsanpham"><input name="txtxuatxu"
								maxlength="80" size="50" type="text" value=""><b
								class="Required">*</b></td>
							<td></td>
						</tr>
						<tr>
							<td class="td_chitietsanpham"><b>Thương hiệu</b></td>
							<td class="td_chitietsanpham"><input name="txtthuonghieu"
								maxlength="80" size="50" type="text" value=""><b
								class="Required">*</b></td>
							<td></td>
						</tr>
						<tr>
							<td class="td_chitietsanpham"><b>Mô tả</b></td>
							<td class="td_chitietsanpham"><textarea name="txtmota"
									cols="3" rows="3"
									style="margin: 2px; width: 580px; height: 100px;"></textarea></td>
							<td></td>
						</tr>
					</table>

					<h3 class="h3row">
						<a href="#">Hình ảnh</a>
					</h3>
					<table style="font-size: 110%;">
						<tr>
							<td class="td_chitietsanpham"><b>Hình</b></td>
							<td class="td_chitietsanpham"><input type="file" name="file"
								value="" /></td>
							<td></td>
						</tr>
					</table>
				
					<h3 class="h3row">
						<a href="#">Thông tin đấu giá</a>
					</h3>
					<table style="font-size: 110%;">

						<tr>
							<td class="td_chitietsanpham"><b>Giá khởi điểm</b></td>
							<td class="td_chitietsanpham"><input name="txtgiakhoidiem"
								maxlength="50" size="30" type="text" value="">VND<b
								class="Required">*</b></td>
							<td></td>
						</tr>

						<tr>
							<td class="td_chitietsanpham"><b>Bước giá</b></td>
							<td class="td_chitietsanpham"><input name="txtbuocgia"
								maxlength="50" size="30" type="text" value="">VND<b
								class="Required">*</b></td>
							<td></td>
						</tr>
						<tr>
							<td class="td_chitietsanpham"><b>Thời gian bắt đầu</b></td>
							<td class="td_chitietsanpham"><input name="txttgbt"
								maxlength="50" size="30" type="text" value="">VND<b
								class="Required">*</b></td>
							<td></td>
						</tr>
						<tr>
							<td class="td_chitietsanpham"><b>Thời gian kết thúc</b></td>
							<td class="td_chitietsanpham"><input name="txttgkt"
								maxlength="50" size="30" type="text" value="">VND<b
								class="Required">*</b></td>
							<td></td>
						</tr>
						<tr>
							<td class="td_chitietsanpham"><b>Hình thức thanh toán</b></td>
							<td class="td_chitietsanpham"><select name="selecthttt"
								style="width: 150px;">
									<c:forEach var="httt" items="${sessionScope.dshttt}">
										<option value="${httt.mahttt}">${httt.tenhttt}</option>
									</c:forEach>
							</select></td>
							<td></td>
						</tr>
						<tr>
							<td class="td_chitietsanpham"><b>Thông tin liên hệ</b></td>
							<td class="td_chitietsanpham"><textarea
									name="txtthongtinlienhe" cols="3" rows="3"
									style="margin: 2px; width: 300px; height: 100px;"></textarea><b
								class="Required">*</b></td>
							<td></td>
						</tr>
					</table>
					<table style="font-size: 110%;">
						<tr>
							<td style="padding-left: 150px;"><b><input type="submit"
									name="action" value="Đăng sản phẩm" /> </b></td>
							<td style="padding-left: 20px;"></td>

						</tr>
					</table>
				</span>
				</div>

			</div>
			<!-- InstanceEndEditable -->
			<div class="DIVclear"></div>
		</form>
	</div>
	<!-- end left box -->
	<!-- right box -->
	<div id="box-right" class="fl l10 top10 bg_white wright cright">
		<div id="catalog-products" class="fl wright">
			<div id="catalog-products-titles"
				class="fl bg-titles top10 products-group-title-news color_white fontTahoma wright-26">
				<strong>DANH SÁCH ĐẤU GIÁ</strong>
			</div>
			<ul id="catalog-products-list"
					class="fl fontTahoma wright list-none top5">
				<li class="fl pd5 w240 "><a class="fl  pdl20"
					href="${pageContext.request.contextPath}/qlsanphamdangthamgia">Sản
						phẩm đang tham gia</a></li>
				<li class="fl wright das_top h1"></li>
				<li class="fl pd5 w240 "><a class="fl  pdl20"
					href="${pageContext.request.contextPath}/qlsanphamdaketthuc">Sản
						phẩm đã kết thúc</a></li>
				<li class="fl wright das_top h1"></li>
				<li class="fl pd5 w240 "><a class="fl  pdl20"
					href="${pageContext.request.contextPath}/qlsanphamchienthang">Sản
						phẩm chiến thắng</a></li>
				<li class="fl wright das_top h1"></li>
			</ul>
		</div>
		<div id="catalog-products" class="fl wright">
			<div id="catalog-products-titles"
				class="fl bg-titles top10 products-group-title-news color_white fontTahoma wright-26">
				<strong>SẢN PHẨM CỦA TÔI</strong>
			</div>
			<ul id="catalog-products-list"
					class="fl fontTahoma wright list-none top5">
				<li class="fl pd5 w240 "><a class="fl  pdl20"
					href="${pageContext.request.contextPath}/qlsanphamcuatoidangdau">Sản
						phẩm đang đấu</a></li>
				<li class="fl wright das_top h1"></li>
				<li class="fl pd5 w240 "><a class="fl  pdl20"
					href="${pageContext.request.contextPath}/qlsanphamcuatoisapdau">Sản
						phẩm sắp đấu</a></li>
				<li class="fl wright das_top h1"></li>
				<li class="fl pd5 w240 "><a class="fl  pdl20"
					href="${pageContext.request.contextPath}/qlsanphamcuatoidadauxong">Sản
						phẩm đã đấu xong</a></li>
				<li class="fl wright das_top h1"></li>
				<li class="fl pd5 w240 "><a class="fl  pdl20"
					href="${pageContext.request.contextPath}/qlsanphamcuatoibihuy">Sản
						phẩm bị hủy</a></li>
				<li class="fl wright das_top h1"></li>
				<li class="fl pd5 w240 "><a class="fl  pdl20"
					href="${pageContext.request.contextPath}/dangsanpham">Đăng sản
						phẩm</a></li>
				<li class="fl wright das_top h1"></li>
			</ul>
		</div>
	</div>
</div>