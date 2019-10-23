<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">

<!-- HEAD -->
<%@ include file="../../includes/head.jsp" %>
	<title>게시물등록 - ${ group.teamName } | moim@</title>
	
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
    
	<!--Dropzone [ OPTIONAL ]-->
	<link href="/resources/plugins/dropzone/dropzone.min.css" rel="stylesheet">

    <!--Summernote [ OPTIONAL ]-->
    <script src="/resources/plugins/summernote/summernote.min.js"></script>

	<!--Dropzone [ OPTIONAL ]-->
	<script src="/resources/plugins/dropzone/dropzone.min.js"></script>

	<!--Ion Icons [ OPTIONAL ]-->
	<link href="/resources/plugins/ionicons/css/ionicons.min.css" rel="stylesheet">


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
                    <h1 class="page-header text-overflow">${ group.teamName }</h1>
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

						<form class="form" method="post" action="/groups/${ group.teamId }/posts/new">
							<div class="panel-body">

								<!--Summernote-->
								<!--===================================================-->
								<div class="form-group pad-ver clearfix">
									<input type="text" name="postTitle" placeholder="제목을 입력해주세요" id="postTitle" class="form-control input-lg">
								</div>

								<div class="form-group">
									<textarea id="summernote" name="postContent"></textarea>
								</div>
								<!--===================================================-->
								<!-- End Summernote -->

								<input type="hidden" name="brdId" value="23">
								<input type="hidden" name="postNickname" value="${ loginVO.memNickname }">
								<input type="hidden" name="postEmail" value="${ loginVO.memEmail }">
								<input type="hidden" name="teamId" value="${ group.teamId }">
								<input type="hidden" name="memId" value="${ loginVO.memId }">


								<div class="action-btn text-right">
									<button type="button" class="btn btn-danger btn-rounded mar-rgt">취소</button>
									<button type="submit" class="btn btn-success btn-rounded mar-lft">올리기</button>
								</div>
							</div>
						</form>

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
			var summernote = $('#summernote');

			var imgs = 0;

			$('#summernote').summernote({
				placeholder: '여기에 글을 작성해주세요',
				height: 300,
				callbacks: {
					onChange: function(data) {
						imgs = $(data).find('img').length;
					}
				}
			});

			$('.action-btn > .btn-success').on('click', function(e) {
				e.preventDefault();
				e.stopPropagation();


				if ($('#postTitle').val() == null || $('#postTitle').val() == '') {
					alert('제목을 입력해주세요.');
					return false;
				}

				if (summernote.summernote('isEmpty')) {
					alert('내용을 작성해주세요.');
					return false;
				}

				$('form').submit();
			});



			$('.action-btn > .btn-danger').on('click', function() {
				window.location.href='/groups/${ group.teamId }/posts';
			});



		});
	</script>
</body>
</html>