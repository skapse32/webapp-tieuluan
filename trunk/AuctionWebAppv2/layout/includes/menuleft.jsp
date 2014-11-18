<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<script type="text/javascript">
	
	$.ajax({
	    type: "GET",
	    url: "/hotrogiangday/menuleft", 
	    contentType: "application/json", 
	    dataType : 'json',
	    data: "", 
	    success: function(response) {
	    	var html = "";
	    	$.each(response, function(i, monhoc) {
	    		html += "<li ><a class='pdl-15-st' href='/hotrogiangday/sv/monhoc?id="+monhoc.id+"'>" +monhoc.tenmh+"</a></li>";
	    	});
	     $("#insert").html(html);
	    },
	    error: function(){
	        alert('No value');
	    }
	});

</script>
	
<div class="col-sm-3">
<div class="navbar-default sidebar mys"  role="navigation">
                <div  style="height:100%;max-height:none;" class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <!-- <li class="sidebar-search">
                            <div class="input-group custom-search-form">
                                <input type="text" class="form-control" placeholder="Search...">
                                <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                            </div>
                            /input-group
                        </li> -->
                        <li>
                            <a class="activeh" href="#"><i></i> Menu</a>
                        </li>
                          <li>
                            <a class="" href="#"><i class="fa fa-bell fa-fw"></i>Thông Báo</a>
                        </li>
                          <li>
                            <a class="" href="#"><i class="fa fa-edit fa-fw"></i>Điểm Danh</a>
                        </li>
                        
                        <li>
                            <a href="#"><i class="fa fa-book fa-fw"></i> Môn Học <span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level collapse" id="insert">
                                <li>
                                    <a href="#">Môn 1</a>
                                </li>
                                <li>
                                    <a href="#">Môn 2</a>
                                </li>
                                <li>
                                    <a href="#">Môn 3</a>
                                </li>
                                <li>
                                    <a href="#">Môn 4</a>
                                </li>
                                <li>
                                    <a href="#">Môn 5</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-file-text-o fa-fw"></i> Bài Tập</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-calendar fa-fw"></i> Thời Khóa Biểu</a>
                        </li>
                          <li>
                            <a href="#"><i class="fa fa-ellipsis-h fa-fw"></i> Thảo Luận</a>
                        </li>
                         <li>
                            <a href="#"><i class="fa fa-list fa-fw"></i> Khác</a>
                        </li>
                       
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
	

</div>

