<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<div class="col-sm-9">
	<!-- Grid row -->
	<!-- Data block -->
	<div class="data-block" style="border-bottom-left-radius: 0px;border-bottom-right-radius: 0px;">
		<header style="padding: 6px 5px 6px 15px; font-size: 16px;">
			<h2 style="font-size: 14px;">
				<i class="fa fa-bullhorn"></i> Môn Học
			</h2>
		</header>
		<section>
			<p>Tên môn học: ${mh.getTenMh()}</p>
			<p>Số tín chỉ: ${mh.getSoTinChi()}</p>
			<p></p>
		</section>

	</div>

	<!-- /Data block -->

	<div class="contentt">
		<div class="data-block panel-group panel-group-collapsed" id="accordion">
							<div class="panel panel-info">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a class="accordion-toggle collapsed bgcolor-16a085-st" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
											Collapsed Panel Group #1
										</a>
									</h4>
								</div>
								<div id="collapseOne" class="panel-collapse collapse" style="height: 0px;">
									<div class="panel-body">
										Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et.
									</div>
								</div>
							</div>
							<div class="panel panel-info">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a class="accordion-toggle collapsed bgcolor-16a085-st" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
											Collapsed Panel Group #2
										</a>
									</h4>
								</div>
								<div id="collapseTwo" class="panel-collapse collapse" style="height: 0px;">
									<div class="panel-body">
										Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
									</div>
								</div>
							</div>
							<div class="panel panel-info">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a class="accordion-toggle collapsed bgcolor-16a085-st" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
											Collapsed Panel Group #3
										</a>
									</h4>
								</div>
								<div id="collapseThree" class="panel-collapse collapse" style="height: 0px;">
									<div class="panel-body">
										Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
									</div>
								</div>
							</div>
						</div>
		


	</div>
	<!-- /Grid row -->

</div>
<!-- /Multi-level scaffolding example -->
<script>
	document.title = "Home";
</script>