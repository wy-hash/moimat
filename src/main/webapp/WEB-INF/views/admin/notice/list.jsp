<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<!-- HEAD -->
<%@ include file="../../includes/head.jsp" %>

    <!--Bootstrap Table [ OPTIONAL ]-->
    <link href="/resources/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">


    <!--X-editable [ OPTIONAL ]-->
    <link href="/resources/plugins/x-editable/css/bootstrap-editable.css" rel="stylesheet">
    <style>
    	.mt-20{
    		margin-top: 20px;
    	}
    </style>

	<title>Page Template | moim@</title>
</head>
<!-- END HEAD -->

<body>
	<!--TIPS-->
	<!--You may remove all ID or Class names which contain "demo-", they are only used for demonstration. -->
	<div id="container" class="effect aside-float aside-bright mainnav-lg">
	
		<!-- HEADER-NAVBAR -->
		<%@ include file="../../includes/header-navbar.jsp" %>
		<!-- END NAVBAR -->
		
		<!-- BOXED -->
		<div class="boxed">
		
			<!-- MAIN-NAV -->
			<%@ include file="../../includes/main-nav.jsp" %>
			<!-- END MAIN-NAV -->
			
			<!-- ASIDE -->
			<%-- <%@ include file="../../includes/aside.jsp" %> --%>
			<!-- END ASIDE -->
			
			
					
           <!--CONTENT CONTAINER-->
            <!--===================================================-->
            <div id="content-container">
                
                <!--Page Title-->
                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                <div id="page-title">
                    <h1 class="page-header text-overflow">공지사항 관리</h1>
                </div>
                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                <!--End page title-->

                <!--Page content-->
                <!--===================================================-->
                <div id="page-content">
                	<!-- #################################### -->
                	<!-- #### WRITE CODE BELOW THIS LINE #### -->
            	    <!-- #################################### -->
           		<!--목록 뷰-->
					<!--===================================================-->
					<div class="panel">
						<div class="panel-heading text-center">
							<h3 class="panel-title">목록</h3>
						</div>
						<div class="panel-body">
						<div class="row">
							<table class="table table-bordered">
								<thead>
									<tr>
										<th>No</th>
										<th>제목</th>
										<th>내용</th>
										<th>작성자</th>
										<th>최종 수정일</th>
										<th>조회수</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list }" var="list" varStatus="status">
										<tr>
											<td>${status.count}</td>
											<!-- 게시물 번호 -->
											<td><a href="#" class="view"
												data-id="${list.postId }">${list.postTitle}</a></td>
											<td>${list.postContent}</td>
											<td>${list.postNickname}</td>
											<td>${list.postUpdate}</td>
											<td>${list.postHit}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							</div>
								<div class="row text-center">
							<nav aria-label="Page navigation">
									
									<ul class="pagination">
<!-- 										<li><a href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li> -->
										<li class="active"><a href="#">1</a></li>
<!-- 										<li><a href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li> -->
									</ul>
								<button id="newNotice" type="button" class="btn btn-success pull-right mt-20"><i class="demo-pli-plus"></i> 게시판 추가</button>	
							</nav>
						</div>
							 
						</div>
					</div>
					<!--===================================================-->    
                
					
                </div>
                <!--===================================================-->
                <!--End page content-->


            </div>
            <!--===================================================-->
            <!--END CONTENT CONTAINER-->			
			
			
			
		</div>
		<!-- END BOXED -->
		
		<!-- FOOTER -->
		<%@ include file="../../includes/footer.jsp" %>
		<!-- END FOOTER -->
		
			
	</div>
	<!-- END CONTAINER -->
  
    <!--Bootstrap Table Sample [ SAMPLE ]-->
    <script src="/resources/js/demo/tables-bs-table.js"></script>


    <!--X-editable [ OPTIONAL ]-->
    <script src="/resources/plugins/x-editable/js/bootstrap-editable.min.js"></script>


    <!--Bootstrap Table [ OPTIONAL ]-->
    <script src="/resources/plugins/bootstrap-table/bootstrap-table.min.js"></script>


    <!--Bootstrap Table Extension [ OPTIONAL ]-->
    <script src="/resources/plugins/bootstrap-table/extensions/editable/bootstrap-table-editable.js"></script>

	<script>
		$(document).ready(function(){
			$('#newNotice').on('click', function(){
				let url = location.origin+'/admin/notice/new';
				location.href = url;
			});
			
			$('.view').on('click', function(){
				let id = this.dataset.id;
				let url = location.origin+'/admin/notice/view/'+id;
				location.href = url;
			});
		});
	</script>

</body>
</html>