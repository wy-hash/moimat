<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<!-- HEAD -->
<%@ include file="../../includes/head.jsp"%>

<!--Bootstrap Table [ OPTIONAL ]-->
<link href="/resources/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">


<!--X-editable [ OPTIONAL ]-->
<link href="/resources/plugins/x-editable/css/bootstrap-editable.css" rel="stylesheet">
<!-- 썸머노트 css-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">

<title>Page Template | moim@</title>
</head>
<!-- END HEAD -->

<body>
	<!--TIPS-->
	<!--You may remove all ID or Class names which contain "demo-", they are only used for demonstration. -->
	<div id="container" class="effect aside-float aside-bright mainnav-lg">

		<!-- HEADER-NAVBAR -->
		<%@ include file="../../includes/header-navbar.jsp"%>
		<!-- END NAVBAR -->

		<!-- BOXED -->
		<div class="boxed">

			<!-- MAIN-NAV -->
			<%@ include file="../../includes/main-nav.jsp"%>
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
					<h1 class="page-header text-overflow">회원 관리</h1>
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
							<h3 class="panel-title">회원 등록</h3>
						</div>
						<form id="memForm" name="memForm" action="/admin/users/new"
							class="panel-body form-horizontal form-padding" method="post">
							<input type="hidden" id="memLevel" name="memLevel" value="${pageMaker.cri.memLevel }" />
							<input type="hidden" id="memStatus" name="memStatus" value="${pageMaker.cri.memStatus }" />
							<input type="hidden" name="type" value ="${pageMaker.cri.type }">
				        	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
							<input type="hidden" name="pageNum" value ="${pageMaker.cri.pageNum }">
							<input type="hidden" name="amount" value ="${pageMaker.cri.amount }">

							<!-- 닉네임 -->
							<div class="form-group">
								<label class="col-md-2 control-label" for="memNickname"><strong>닉네임</strong></label>
								<div class="col-md-10">
									<input type="text" id="memNickname" name="memNickname" class="form-control"
										placeholder="닉네임을 작성해 주세요">
									<small class="help-block" id="memNicknameHint"></small>
								</div>
							</div>

							<!-- 이메일 -->
							<div class="form-group">
								<label class="col-md-2 control-label" for="memEmail"><strong>이메일 </strong></label>
								<div class="col-md-10">
									<input type="text" id="memEmail" name="memEmail" class="form-control" placeholder="이메일">
									<small class="help-block" id="memEmailHint"></small>
								</div>
							</div>


							<!-- 이메일 -->
							<div class="form-group">
								<label class="col-md-2 control-label" for="memPassword"><strong>비밀번호 </strong></label>
								<div class="col-md-10">
									<input type="password" id="memPassword" name="memPassword" class="form-control" placeholder="비밀번호">
									<small class="help-block" id="memPasswordHint"></small>
								</div>
							</div>
							<!-- 생일 -->
							<div class="form-group">
								<label class="col-md-2 control-label" for="memBirthday"><strong>생일</strong></label>
								<div class="col-md-10">
									<textarea id="memBirthday" name="memBirthday" class="form-control"></textarea>
									<small class="help-block" id="memBirthdayHint"></small>
								</div>
							</div>
							<!-- 소개 -->
							<div class="form-group">
								<label class="col-md-2 control-label" for="memContent"><strong>자기소개</strong></label>
								<div class="col-md-10">
									<textarea id="memContent" name="memContent" class="form-control"></textarea>
									<small class="help-block" id="memContentHint"></small>
								</div>
							</div>
							<!-- 성별 -->
							<div class="form-group">
								<label class="col-md-2 control-label" for="memGender"><strong>성별</strong></label>
								<div class="col-md-10">
									<label class="radio-inline"> <input type="radio"
										id="memGender_M" name="memGender" value="M" checked> 남
									</label> <label class="radio-inline"> <input type="radio"
										id="memGender_F" name="memGender" value="F"> 여
									</label>
								</div>
							</div>

							<div class="row pull-right">
								<button type="button" id="memSubmit" class="btn btn-success mar-top">확인</button>
								<button type="button" id="memCansel" class="btn btn-danger mar-top">취소</button>
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
		<%@ include file="../../includes/footer.jsp"%>
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

			$('#memSubmit').on('click', submitCheck);
			$('#memCansel').on('click', function () {
				let url = location.origin + '/admin/users/list';
				location.href = url;
			});
			
			
		});


		function submitCheck() {//전송 전 입력체크
		
			let result = true;

			let memNickname= $('#memNickname').val();
			let memNicknameHint = $('#memNicknameHint');
			
			let memEmail = $('#memEmail').val();
			let memEmailHint = $('#memEmailHint');

			let memBirthday = $('#memBirthday').val();
			let memBirthdayHint = $('#memBirthdayHint');

			let memContent = $('#memContent').val();
			let memContentHint = $('#memContentHint');

			let memPassword = $('#memPassword').val();
			let memPasswordHint = $('#memPasswordHint');
			
			// 폼 입력 체크
			
			if (memNickname === '' || memNickname.length === 0) {// 닉네임
				$('#memNickname').focus();
				memNicknameHint.css('color', 'red');
				memNicknameHint.html('닉네임을 입력해 주세요.');
				result = false;
			}else{
				memNicknameHint.html('');
			}

			if (memEmail === '' || memEmail.length === 0) {// 이메일
				$('#memEmail').focus();
				memEmailHint.css('color', 'red');
				memEmailHint.html('이메일을 입력해주세요.');
				result = false;
			}else{
				memEmailHint.html('');
			}
			if (memPassword === '' || memPassword.length === 0) {// 이메일
				$('#memPassword').focus();
				memPasswordHint.css('color', 'red');
				memPasswordHint.html('이메일을 입력해주세요.');
				result = false;
			}else{
				memPasswordHint.html('');
			}
			if (memBirthday === '' || memBirthday.length === 0) {// 생일

				$('#memBirthday').focus();
				memBirthdayHint.css('color', 'red');
				memBirthdayHint.html('생일을 입력해 주세요.');

				result = false;
			}else{
				memBirthdayHint.html('');
			}
			if (memContent === '' || memContent.length === 0) {// 자기소개

				$('#memContent').focus();
				memContentHint.css('color', 'red');
				memContentHint.html('자기소개를 입력해 주세요.');

				result = false;
			}else{
				memContentHint.html('');
			}


			// 모든 조건이 올바르게 입력되었다면 폼 전송
			if (result) {
				$('#memForm').submit();
			}

		}
	</script>

</body>

</html>