<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<!-- HEAD -->
<%
	String path = request.getContextPath();
	pageContext.setAttribute("path", path);
%>


<%@ include file="../includes/head.jsp" %>
<title>Page Template | moim@</title>
<!--Bootstrap Stylesheet [ REQUIRED ]-->

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Data Tables | Nifty - Admin Template</title>


    <!--STYLESHEET-->
    <!--=================================================-->

    <!--Open Sans Font [ OPTIONAL ]-->
   <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script>

 	<!--Summernote [ OPTIONAL ]-->
     <link href="/resources/plugins/summernote/summernote.min.css" rel="stylesheet">
    
   <!--Summernote [ OPTIONAL ]-->
    <script src="/resources/plugins/summernote/summernote.min.js"></script>
    
      <!--Demo script [ DEMONSTRATION ]-->
    <script src="/resources/js/demo/nifty-demo.min.js"></script>
    
        <!--Form File Upload [ SAMPLE ]-->
    <script src="/resources/js/demo/form-text-editor.js"></script>

    <!--Form File Upload [ SAMPLE ]-->
    <script src="/resources/js/demo/form-file-upload.js"></script>

      <!--Dropzone [ OPTIONAL ]-->
    <link href="/resources/plugins/dropzone/dropzone.min.css" rel="stylesheet">

    <!--Dropzone [ OPTIONAL ]-->
    <script src="/resources/plugins/dropzone/dropzone.min.js"></script>
    
    <!--STYLESHEET-->
    <!--=================================================-->

    <!--Open Sans Font [ OPTIONAL ]-->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700' rel='stylesheet' type='text/css'>


    <!--Bootstrap Stylesheet [ REQUIRED ]-->
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">


    <!--Nifty Stylesheet [ REQUIRED ]-->
    <link href="/resources/css/nifty.min.css" rel="stylesheet">


    <!--Nifty Premium Icon [ DEMONSTRATION ]-->
    <link href="/resources/css/demo/nifty-demo-icons.min.css" rel="stylesheet">


    <!--Demo [ DEMONSTRATION ]-->
    <link href="/resources/css/demo/nifty-demo.min.css" rel="stylesheet">
        
    <!--Dropzone [ OPTIONAL ]-->
    <link href="/resources/plugins/dropzone/dropzone.min.css" rel="stylesheet">

 	<!--Summernote [ OPTIONAL ]-->
    <link href="/resources/plugins/summernote/summernote.min.css" rel="stylesheet">




    
    <!--JAVASCRIPT-->
    <!--=================================================-->

    <!--Pace - Page Load Progress Par [OPTIONAL]-->
    <link href="/resources/plugins/pace/pace.min.css" rel="stylesheet">
    <script src="/resources/plugins/pace/pace.min.js"></script>


    <!--jQuery [ REQUIRED ]-->
    <script src="/resources/js/jquery-2.2.4.min.js"></script>


    <!--BootstrapJS [ RECOMMENDED ]-->
    <script src="/resources/js/bootstrap.min.js"></script>


    <!--NiftyJS [ RECOMMENDED ]-->
    <script src="/resources/js/nifty.min.js"></script>






    <!--=================================================-->
    
    <!--Demo script [ DEMONSTRATION ]-->
    <script src="/resources/js/demo/nifty-demo.min.js"></script>

    
    <!--Summernote [ OPTIONAL ]-->
    <script src="/resources/plugins/summernote/summernote.min.js"></script>
    
    
    <!--Dropzone [ OPTIONAL ]-->
    <script src="/resources/plugins/dropzone/dropzone.min.js"></script>

    <!--Form File Upload [ SAMPLE ]-->
    <script src="/resources/js/demo/form-text-editor.js"></script>

    <!--Form File Upload [ SAMPLE ]-->
    <script src="/resources/js/demo/form-file-upload.js"></script>
</head>
<!-- END HEAD -->

<body>
	<!--TIPS-->
	<!--You may remove all ID or Class names which contain "demo-", they are only used for demonstration. -->
	<div id="container" class="effect aside-float aside-bright mainnav-lg">

		<!-- HEADER-NAVBAR -->
		<%@ include file="../includes/header-navbar.jsp"%>
		<!-- END NAVBAR -->

		<!-- BOXED -->
		<div class="boxed">

			<!-- MAIN-NAV -->
			<%@ include file="../includes/main-nav.jsp"%>
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
					                <tr>
					                <form action="boardmodifywrite?postId=${list.postId}" method="post">
					                   	<td>${list.postId}</td>
					                   	<input type="hidden" name="tmemId" value="${list.tmemId}">  
					                    <td><input type="text" name="postTitle" size="50" value="${list.postTitle}"></td>
					                    
					                    <td>${list.postNickname}</td>
					                    <td>${list.postHit}</td>
					                    <td>${list.postRegdate}</td>				                 
				                </tr>		          
				                <tr>
				                </tr>
					                
					            </tbody>
					        
					         <table align="center" width="800" height="500" cell5ding="0" cellspacing="0" border="1">
					         <tbody align="center">
							        <div>
							             <textarea id="demo-summernote" name="postContent">
									 	${list.postContent}
                                    </textarea>
							           
							        </div>
    
								
								
							<input type="submit" value="확인">
								</form>
								</table>
								</tbody>
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
		<%@ include file="../includes/footer.jsp"%>
		<!-- END FOOTER -->

	</div>
	<!-- END CONTAINER -->


</body>
</html>