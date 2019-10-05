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
                    <h1 class="page-header text-overflow">관심사 관리</h1>
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
										<th>관심사 코드</th>
										<th>관심사 이름</th>
										<th>정렬 순서</th>
										<th>사용 유무</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list }" var="list" varStatus="status">
										<tr>
											<td>${status.count}</td>
											<!-- 게시물 번호 -->
											<td><a href="#" class="view"
												data-seq="${list.intId }">${list.intKey}</a></td>
											<td>${list.intName}</td>
											<td>${list.intOrder}</td>
											<td>${list.intUse}</td>
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
								<button id="newInterest" type="button" class="btn btn-success pull-right mt-20"><i class="demo-pli-plus"></i> 관심사 추가</button>	
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
			$('#newInterest').on('click', function(){
				let url = location.origin+'/admin/interest/new';
				location.href = url;
			});
			
			$('.view').on('click', function(){
				let seq = this.dataset.seq;
				let url = location.origin+'/admin/interest/view/'+seq;
				location.href = url;
			});
		});
	</script>

</body>
</html>