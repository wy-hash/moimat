<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<!-- HEAD -->
<%@ include file="../includes/head.jsp" %>

    <!--Bootstrap Table [ OPTIONAL ]-->
    <link href="/resources/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">


    <!--X-editable [ OPTIONAL ]-->
    <link href="/resources/plugins/x-editable/css/bootstrap-editable.css" rel="stylesheet">

	<title>Page Template | moim@</title>
</head>
<!-- END HEAD -->

<body>
	<!--TIPS-->
	<!--You may remove all ID or Class names which contain "demo-", they are only used for demonstration. -->
	<div id="container" class="effect aside-float aside-bright mainnav-lg">
	
		<!-- HEADER-NAVBAR -->
		<%@ include file="../includes/header-navbar.jsp" %>
		<!-- END NAVBAR -->
		
		<!-- BOXED -->
		<div class="boxed">
		
			<!-- MAIN-NAV -->
			<%@ include file="../includes/main-nav.jsp" %>
			<!-- END MAIN-NAV -->
			
			<!-- ASIDE -->
			<%-- <%@ include file="../includes/aside.jsp" %> --%>
			<!-- END ASIDE -->
			
			
					
           <!--CONTENT CONTAINER-->
            <!--===================================================-->
            <div id="content-container">
		                
		        <!--Page Title-->
		        <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
		        <div id="page-title">
					<div class="panel panel-bordered panel-dark">
			            <div class="panel-heading">
			                <h3 class="panel-title">관리자
			                <div class="pull-right">asdasd	</div>
			                </h3>
			                
			                
			            </div>
			        </div>
                </div>
                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                <!--End page title-->
                <!--Page content-->
                <!--===================================================-->
                <div id="page-content">
                	<!-- #################################### -->
                	<!-- #### WRITE CODE BELOW THIS LINE #### -->
            	    <!-- #################################### -->
					<!--  관리자 인덱스 -->
					<!--===================================================-->
		
							        <!--Panel with Tabs-->
					        <!--===================================================-->
					        <div class="panel panel-mint">
					
					            <!--Panel heading-->
					            <div class="panel-heading">
					                <div class="panel-control">
					
					                    <!--Nav tabs-->
					                    <ul class="nav nav-tabs">
					                        <li class="active"><a href="#">First Tab</a></li>
					                        <li><a href="#">Second Tab</a></li>
					                    </ul>
					
					                </div>
					                <h3 class="panel-title">With tabs</h3>
					            </div>
					
					            <!--Panel body-->
					            <div class="panel-body">
					
					                <!--Tabs content-->
					                <div class="tab-content">
					                    <div id="tab-content-box" class="tab-pane in active">
					                        <p class="text-main text-lg mar-no">첫번째 제목</p>
					                        	여기엔 내용이.
					                    </div>
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
		<%@ include file="../includes/footer.jsp" %>
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

	
</body>
</html>