<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">

<!-- HEAD -->
<%@ include file="../../includes/head.jsp" %>
	<title>사진등록 - ${ team.teamName } | moim@</title>
	
	<style>
		@media screen and (max-width: 768px) {
			.tab-base > ul {
				display: none;
			}
			
			.tab-base > .btn-group {
				display: inline-block;
			}
		}
		
		@media screen and (min-width: 768px) {
			.tab-base > ul {
				display: block;
			}
			
			.tab-base > .btn-group {
				display: none;
			}
		}
		
	</style>
	
    <!--Summernote [ OPTIONAL ]-->
    <link href="/resources/plugins/summernote/summernote.min.css" rel="stylesheet">
    
    <!--Summernote [ OPTIONAL ]-->
    <script src="/resources/plugins/summernote/summernote.min.js"></script>
    
    <!--Form File Upload [ SAMPLE ]-->
    <!-- <script src="/resources/js/demo/form-text-editor.js"></script> -->
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
			<%-- <%@ include file="includes/aside.jsp" %> --%>
			<!-- END ASIDE -->
			
					
           <!--CONTENT CONTAINER-->
            <!--===================================================-->
            <div id="content-container">
                
                <!--Page Title-->
                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                <div id="page-title">
                    <h1 class="page-header text-overflow">{ _team.teamName_ }</h1>
                </div>
                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                <!--End page title-->

                <!--Page content-->
                <!--===================================================-->
                <div id="page-content">
                	<!-- #################################### -->
                	<!-- #### WRITE CODE BELOW THIS LINE #### -->
            	    <!-- #################################### -->
            	    
					<div class="panel">
					    <div class="panel-heading">
					        <h3 class="panel-title">즐거웠던 모임, 사진으로 남겨보세요!</h3>
					    </div>
					    <div class="panel-body">
					
					        <!--Summernote-->
					        <!--===================================================-->
				            <form method="post">
				            	<textarea id="summernote" name="editordata"></textarea>
				            </form>
					        <!--===================================================-->
					        <!-- End Summernote -->
					        
					        <div class="action-btns text-right">
							    <button class="btn btn-danger btn-rounded mar-rgt">취소</button>
							    <button class="btn btn-success btn-rounded mar-lft">올리기</button>
					        
					        </div>
	
					
					    </div>
					    
					</div>    
					  

 

					
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
	
	<script>
		$(document).ready(function() {
			$('#summernote').summernote({
				placeholder: '여기에서 사진을 등록하고 글을 작성하세요',
				height: 300
			});
		});
	</script>
</body>
</html>