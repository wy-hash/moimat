<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<!-- HEAD -->
<%
	String path = request.getContextPath();
	pageContext.setAttribute("path", path);
%>


<%@ include file="includes/head.jsp"%>
<title>Page Template | moim@</title>
<!--Bootstrap Stylesheet [ REQUIRED ]-->

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Data Tables | Nifty - Admin Template</title>


    <!--STYLESHEET-->
    <!--=================================================-->

    <!--Open Sans Font [ OPTIONAL ]-->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700' rel='stylesheet' type='text/css'>


    <!--Bootstrap Stylesheet [ REQUIRED ]-->
    <link href="css/bootstrap.min.css" rel="stylesheet">


    <!--Nifty Stylesheet [ REQUIRED ]-->
    <link href="css/nifty.min.css" rel="stylesheet">


    <!--Nifty Premium Icon [ DEMONSTRATION ]-->
    <link href="css/demo/nifty-demo-icons.min.css" rel="stylesheet">


    <!--Demo [ DEMONSTRATION ]-->
    <link href="css/demo/nifty-demo.min.css" rel="stylesheet">


        
    <!--DataTables [ OPTIONAL ]-->
    <link href="plugins/datatables/media/css/dataTables.bootstrap.css" rel="stylesheet">
	<link href="plugins/datatables/extensions/Responsive/css/dataTables.responsive.css" rel="stylesheet">
    
    <!--JAVASCRIPT-->
    <!--=================================================-->

    <!--Pace - Page Load Progress Par [OPTIONAL]-->
    <link href="plugins/pace/pace.min.css" rel="stylesheet">
    <script src="plugins/pace/pace.min.js"></script>


    <!--jQuery [ REQUIRED ]-->
    <script src="js/jquery-2.2.4.min.js"></script>


    <!--BootstrapJS [ RECOMMENDED ]-->
    <script src="js/bootstrap.min.js"></script>


    <!--NiftyJS [ RECOMMENDED ]-->
    <script src="js/nifty.min.js"></script>

    <!--=================================================-->
    
    <!--Demo script [ DEMONSTRATION ]-->
    <script src="js/demo/nifty-demo.min.js"></script>

    
    <!--DataTables [ OPTIONAL ]-->
    <script src="plugins/datatables/media/js/jquery.dataTables.js"></script>
	<script src="plugins/datatables/media/js/dataTables.bootstrap.js"></script>
	<script src="plugins/datatables/extensions/Responsive/js/dataTables.responsive.min.js"></script>


    <!--DataTables Sample [ SAMPLE ]-->
    <script src="js/demo/tables-datatables.js"></script>

</head>
<!-- END HEAD -->

<body>
	<!--TIPS-->
	<!--You may remove all ID or Class names which contain "demo-", they are only used for demonstration. -->
	<div id="container" class="effect aside-float aside-bright mainnav-lg">

		<!-- HEADER-NAVBAR -->
		<%@ include file="includes/header-navbar.jsp"%>
		<!-- END NAVBAR -->

		<!-- BOXED -->
		<div class="boxed">

			<!-- MAIN-NAV -->
			<%@ include file="includes/main-nav.jsp"%>
			<!-- END MAIN-NAV -->

			<!-- ASIDE -->
			<%-- <%@ include file="includes/aside.jsp" %> --%>
			<!-- END ASIDE -->


			<!--CONTENT CONTAINER-->
			<!--===================================================-->
			<div id="content-container">

				<!--Page Title-->
				<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
				<div id="page-title">
					<h1 class="page-header text-overflow">게시판</h1>
					 <!--Searchbox-->
                    <div class="searchbox">
                        <div class="input-group custom-search-form">
                            <input type="text" class="form-control" placeholder="Search..">
                            <span class="input-group-btn">
                                <button class="text-muted" type="button"><i class="demo-pli-magnifi-glass"></i></button>
                            </span>
                        </div>
                    </div>
				</div>

				<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
				<!--End page title-->

				<!--Page content-->
				<!--===================================================-->
				<!-- #################################### -->
				<!-- #### WRITE CODE BELOW THIS LINE #### -->
				<!-- #################################### -->
				<div class="panel">
					    <div class="panel-heading">
					    <h3 class="panel-title">환영합니다</h3>
					    </div>
					
					    <div id="demo-custom-toolbar2" class="table-toolbar-left">
					        <button type="button" onclick="location.href='boardwriteview' " id="demo-dt-addrow-btn" class="btn btn-primary">글쓰기</button>
					    </div>
					
					    <div class="panel-body">
					        <table id="demo-dt-addrow" class="table table-striped table-bordered" cellspacing="0" width="100%">
					            <thead>
					                <tr>
					                    <th>게시글번호</th>
					                    <th>제목</th>
					                    <th class="min-tablet">작성자</th>
					                    <th class="min-tablet">조회수</th>
					                    <th class="min-desktop">최근등록일</th>
					                   
					                </tr>
					            </thead>
					            <tbody>
					            <c:forEach items="${list}" var="post">				             
					                        
					                <tr>
					                    <td>${post.postId}</td>
					                    
					                    <td>
					                    
  					                   <a href="boardcontentview?postId=${post.postId}" style="
 										color: blue;font-weight: bold;">${post.postTitle}</a>	 
 										              													
										</td>  
										<input type="hidden" name=tmemId value="${post.tmemId}">         	
					                    <td>${post.postNickname}</td>
					                    <td>${post.postHit}</td>
					                    <td>${post.postRegdate}</td>
					                </tr>			              
					            </c:forEach>		        			               
					               			               
					            </tbody>
					        </table>
					    </div>
					</div>
				
				
				
				
						</div>
					
					</div>
					<!--===================================================-->
					<!--End Default Accordion-->

				</div>
				
				<!--===================================================-->
				<!--End page content-->


			</div>
			<!--===================================================-->
			<!--END CONTENT CONTAINER-->



		</div>
		<!-- END BOXED -->

		<!-- FOOTER -->
		<%@ include file="includes/footer.jsp"%>
		<!-- END FOOTER -->

	</div>
	<!-- END CONTAINER -->


</body>
</html>