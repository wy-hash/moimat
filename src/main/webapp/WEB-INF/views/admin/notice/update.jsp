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

<!-- 썸머노트 css-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
<style>
	.mt-20 {
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
					<h1 class="page-header text-overflow">게시판 관리</h1>
				</div>
				<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
				<!--End page title-->

				<!--Page content-->
				<!--===================================================-->
				<div id="page-content">
					<!-- #################################### -->
					<!-- #### WRITE CODE BELOW THIS LINE #### -->
					<!-- #################################### -->
					<!--Basic Columns-->
					<!--===================================================-->
					<div class="panel">
						<div class="panel-heading">
							<h3 class="panel-title">게시판 코드 상세보기</h3>
						</div>
							<form id="noticeForm" name="noticeForm" action="/admin/notice/edit"
							class="panel-body form-horizontal form-padding" method="post">
							<input type="hidden" id="postId" name="postId" value="${view.postId}"><!-- 추후 el태그로 이용할 예정 -->
							<input type="hidden" id="brdId" name="brdId" value="${view.brdId}"><!-- 추후 el태그로 이용할 예정 -->
							<input type="hidden" id="memId" name="memId" value="${view.memId }"><!-- 추후 세션으로 이용할 예정 -->
							<input type="hidden" id="postNickname" name="postNickname" value="${view.postNickname}"><!-- 추후 세션으로 이용할 예정 -->
							<input type="hidden" id="postEmail" name="postEmail" value="${view.postEmail }"><!-- 추후 세션으로 이용할 예정 -->
							<input type="hidden" id="postReply" name="postReply" value="${view.postReply }">
							<input type="hidden" id="postDepth" name="postDepth" value="${view.postDepth }">

							<!--게시글 정렬순서-->
							<div class="form-group">
								<label class="col-md-2 control-label" for="postNum"><strong>게시글 정렬순서</strong></label>
								<div class="col-md-10">
									<input type="text" id="postNum" name="postNum" class="form-control"
										placeholder="공지사항을 상단에 먼저 보이게 하려면 숫자를 높게 설정하세요. 숫자만 입력 가능합니다." value="${view.postNum}">
									<small class="help-block" id="postNumHint"></small>
								</div>
							</div>

							<!-- 제목 -->
							<div class="form-group">
								<label class="col-md-2 control-label" for="postTitle"><strong>제목 </strong></label>
								<div class="col-md-10">
									<input type="text" id="postTitle" name="postTitle" class="form-control" placeholder="제목을 입력해 주세요. " value="${view.postTitle}">
									<small class="help-block" id="postTitleHint"></small>
								</div>
							</div>

							<!-- 내용 -->
							<div class="form-group">
								<label class="col-md-2 control-label" for="postContent"><strong>내용</strong></label>
								<div class="col-md-10">
									<textarea id="postContent" name="postContent" class="form-control" >${view.postContent}</textarea>
									<small class="help-block" id="postContentHint"></small>
								</div>
							</div>


							<div class="row pull-right">
								<button type="button" id="postSubmit" class="btn btn-success  mt-20">확인</button>
								<button type="button" id="postCansel" class="btn btn-danger  mt-20">취소</button>
							</div>
						</form>

						<!--===================================================-->
						<!-- END BASIC FORM ELEMENTS -->


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
	
	
	<!-- 썸머노트 JS -->
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>

	<script>
		$(document).ready(function () {
			// 썸머노트 실행
			$('#postContent').summernote({
		        placeholder: '내용을 입력해 주세요.',
		        tabsize: 2,
		        height: 400
			});
			
			// 각 유효성 검사 이벤트 등록
			validation();
			
			$('#postSubmit').on('click', submitCheck);
			$('#postCansel').on('click', function () {
				let url = location.origin + '/admin/notice/list';
				location.href = url;
			});
			
			
		});

		function validation() {
			// 유효성 검사 이벤트 등록

			// 공지사항 정렬 우선순위 숫자만 입력받기. 정규식 사용
			$('#postNum').on('keyup', function () { //키를 뗄 때
					$('#postNum').val($('#postNum').val().replace(/[^0-9]/g, ""));
				});
		}

		function submitCheck() {
		
			let result = true;

			let postNum= $('#postNum').val();
			let postNumHint = $('#postNumHint');
			
			let postTitle = $('#postTitle').val();
			let postTitleHint = $('#postTitleHint');

			let postContent = $('#postContent').val();
			let postContentHint = $('#postContentHint');

			// 폼 입력 체크
			
			if (postNum === '' || postNum.length === 0) {
				$('#postNum').focus();
				postNumHint.css('color', 'red');
				postNumHint.html('게시글의 정렬 순서를 입력해 주세요. 숫자만 입력 가능합니다.');
				result = false;
			}else{
				postNumHint.html('');
			}
			if (postTitle === '' || postTitle.length === 0) {
				$('#postTitle').focus();
				postTitleHint.css('color', 'red');
				postTitleHint.html('제목을 입력해 주세요.');
				result = false;
			}else{
				postTitleHint.html('');
			}
			if (postContent === '' || postContent.length === 0) {

// 				$('#postContent').focus();
				$('#note-editable').focus();
				postContentHint.css('color', 'red');
				postContentHint.html('내용을 입력해 주세요.');

				result = false;
			}else{
				postContentHint.html('');
			}

			// 모든 조건이 올바르게 입력되었다면 폼 전송
			if (result) {
				$('#noticeForm').submit();
			}

		}
	</script>



</body>

</html>