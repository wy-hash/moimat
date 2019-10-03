1<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<!-- HEAD -->
<% String path = request.getContextPath();
   pageContext.setAttribute("path", path);
%>  

<%@ include file="includes/head.jsp" %>
	<title>Page Template | moim@</title>
 <!--Bootstrap Stylesheet [ REQUIRED ]-->
 
  <!-- include libraries(jQuery, bootstrap) -->
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
		<%@ include file="includes/header-navbar.jsp" %>
		<!-- END NAVBAR -->
		
		<!-- BOXED -->
		<div class="boxed">
		
			<!-- MAIN-NAV -->
			<%@ include file="includes/main-nav.jsp" %>
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
                    <h1 class="page-header text-overflow">Page Template</h1>
                </div>
                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                <!--End page title-->

                <!--Page content-->
                <!--===================================================-->
                	<!-- #################################### -->
                	<!-- #### WRITE CODE BELOW THIS LINE #### -->
            	    <!-- #################################### -->
            	  <form method="post" action="boardwrite" enctype="multipart/form-data">
            	 
					<input type="hidden" name="team_id" value="${teamId}">
					<input type="hidden" name="brd_id" value="${brdId}">
					<input type="hidden" name="tmem_id" value="${tmemId}">
					<input type="hidden" name="post_tmem_level" value="${postTmemLevel}">
					<input type="hidden" name="post_nickname" value="${postNickname}">
					<input type="hidden" name="post_email" value="${postEmail}">
				
					
					
					
					 
            	 <div class="panel">
					    <div class="panel-heading">
					        <h3 class="panel-title">Bootstrap theme</h3>
					    </div>
					    <div class="panel-body">
					
					        <!--Dropzonejs using Bootstrap theme-->
					        <!--===================================================-->
					        <p>This is a bootstrap theme of Dropzone.js with a completely different user experience.</p>
					
					        <div class="bord-top pad-ver">
					            <!-- The fileinput-button span is used to style the file input field as button -->
					            <span class="btn btn-success">
					                <i class="fa fa-plus"></i>
					                <a onclick="location.href='boardlist' ">확인</a>					                
					            </span>
					           <span class="btn btn-danger">
					                <i class="fa fa-plus"></i>
					               <a onclick="location.href='boardlist' ">돌아가기</a>		
					           <input type="hidden" onClick="location.href='boardlist'">
	                
					            </span>
												           
                            </div>
                            
				        <div id="dz-previews">
					            <div id="dz-template" class="pad-top bord-top">
					                <div class="media">
					                    <div class="media-body">
					                         <!--This is used as the file preview template-->
					                        <div class="media-block">
					                            <div class="media-left">
					                                <img class="dz-img" data-dz-thumbnail>
					                            </div>
					                            <div class="media-body">
					                                <p class="text-main text-bold mar-no text-overflow" data-dz-name></p>
					                                <span class="dz-error text-danger text-sm" data-dz-errormessage></span>
					                                <p class="text-sm" data-dz-size></p>
					                                <div id="dz-total-progress" style="opacity:0">
					                                     <div class="progress progress-xs active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0">
					                                        <div class="progress-bar progress-bar-success" style="width:0%;" data-dz-uploadprogress></div>
					                                    </div>
					                                </div>
					                            </div>
					                        </div>
					                    </div>
					                    <div class="media-right">
					                        <button data-dz-remove class="btn btn-xs btn-danger dz-cancel"><i class="demo-pli-cross"></i></button>
					                    </div>
					                </div>
					            </div>
                            </div>

							<div class="panel">
							
									<label for="exampleInputEmail1"></label> <input name="postTitle" type="text"
										class="form-control" id="exampleInputEmail1"
										placeholder="게시물 제목을 입력하세요">
							
								<div class="panel-body">

									<!--Summernote-->
									<!--===================================================-->
									<textarea id="demo-summernote" name="postContent">
                                        <h4>
											<span
												style="line-height: 1.1;">내용을 입력 해주세요</span><br>
										</h4>
										<h4>
											<font color="#9c9c94"></font>
										</h4>
                                    </textarea>
                                    </form>
									
                                    <!--===================================================-->
                                    <!-- End Summernote -->
                            
                                </div>
                            </div>
					        <!--===================================================-->
					        <!--End Dropzonejs using Bootstrap theme-->
					
					
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
		<%@ include file="includes/footer.jsp" %>
		<!-- END FOOTER -->
			
	</div>
	<!-- END CONTAINER -->
	

</body>
</html>