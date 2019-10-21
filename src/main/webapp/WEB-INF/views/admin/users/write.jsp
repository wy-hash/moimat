<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
						<form id="memForm" name="memForm" action="/admin/users/new" class="panel-body form-horizontal form-padding"
							method="post">
							<input type="hidden" id="memLevel" name="memLevel" value="${pageMaker.cri.memLevel }" />
							<input type="hidden" id="memStatus" name="memStatus" value="${pageMaker.cri.memStatus }" />
							<input type="hidden" name="type" value="${pageMaker.cri.type }">
							<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
							<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
							<input type="hidden" name="amount" value="${pageMaker.cri.amount }">


							<!-- 이메일 -->
							<div class="form-group">
								<label class="col-lg-3 control-label">이메일*</label>
								<div class="col-lg-7">
									<input type="email" class="form-control" id="memEmail" name="memEmail" placeholder="이메일 주소">
									<small class="help-block" id="memEmailHint"></small>
								</div>
							</div>

							<!-- 비밀번호 -->
							<div class="form-group">
								<label class="col-lg-3 control-label">비밀번호*</label>
								<div class="col-lg-7">
									<input type="password" class="form-control" id="memPassword" name="memPassword" placeholder="비밀번호">
									<small class="help-block" id="memPasswordHint"></small>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-3 control-label">비밀번호 확인*</label>
								<div class="col-lg-7">
									<input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="비밀번호 확인">
									<small class="help-block" id="confirmPasswordHint"></small>
								</div>
							</div>
							<!-- 이름(별명) -->
							<div class="form-group">
								<label class="col-lg-3 control-label">이름(별명)*</label>
								<div class="col-lg-7">
									<input type="text" class="form-control" id="memNickname" name="memNickname" placeholder="이름(별명)">
									<small class="help-block" id="memNicknameHint"></small>
								</div>
							</div>
							<!-- 생일 -->
							<div class="form-group">
								<label class="col-lg-3 control-label">생년월일*</label>
								<div class="col-lg-7">
									<input type="text" placeholder="주민번호 앞자리 (YYMMDD)" id="memBirthday" name="memBirthday" class="form-control">
									<small class="help-block" id="memBirthdayHint"></small>
								</div>
							</div>
							<!-- 성별 -->
							<div class="form-group">
								<label class="col-lg-3 control-label">성별*</label>
								<div class="col-lg-7">
									<div class="radio">
										<!-- Inline radio buttons -->
										<input id="memGender_M" class="form-control magic-radio" type="radio" name="memGender" value="M" checked>
										<label for="memGender_M">남</label>
										<input id="memGender_F" class="form-control magic-radio" type="radio" name="memGender" value="F">
										<label for="memGender_F">여</label>
									</div>
								</div>
							</div>
							<!-- 활동 지역 -->
							<div class="form-group">
								<label class="col-lg-3 control-label">활동지역*</label>
								<div class="col-lg-7">
									<select id="areaId" name="areaId" class="form-control" >
										<c:forEach items="${ areas }" var="area">
											<c:choose>
												<c:when test="${ area.areaKey eq 'O000' }">
													<option value="${ area.areaId }">${ area.areaRegionName }</option>
												</c:when>
												<c:otherwise>
													<option value="${ area.areaId }">${ area.areaName } ${ area.areaRegionName }</option>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</select>
								</div>
							</div>

							<!-- 소개글 -->
							<div class="form-group">
								<label class="col-lg-3 control-label">소개글</label>
								<div class="col-lg-7">
									<textarea class="form-control" id="memContent" name="memContent" rows="5" placeholder="간단한 소개글을 적어보세요."></textarea>
									<small class="help-block" id="memContentHint"></small>
								</div>
							</div>

							<!-- 관심사 선택 -->
							<div class="form-group">
								<label class="col-lg-3 control-label">관심사1 선택*</label>
								<div class="col-lg-7">
									<select id="memInt1" name="memInt1" class="form-control" >
										<c:forEach items="${ interest }" var="item">
											<c:choose>
												<c:when test="${fn:substring(item.intKey, 2, 4) ne '00' }">
													<option value="${ item.intId }">${ item.intName }</option>
												</c:when>
											</c:choose>
										</c:forEach>
									</select>
								</div>
								<label class="col-lg-3 control-label">관심사2 선택*</label>
								<div class="col-lg-7">
									<select id="memInt2" name="memInt2" class="form-control" >
										<c:forEach items="${ interest }" var="item">
											<c:choose>
												<c:when test="${fn:substring(item.intKey, 2, 4) ne '00' }">
													<option value="${ item.intId }">${ item.intName }</option>
												</c:when>
											</c:choose>
										</c:forEach>
									</select>
								</div>
								<label class="col-lg-3 control-label">관심사3 선택*</label>
								<div class="col-lg-7">
									<select id="memInt3" name="memInt3" class="form-control" >
										<c:forEach items="${ interest }" var="item">
											<c:choose>
												<c:when test="${fn:substring(item.intKey, 2, 4) ne '00' }">
													<option value="${ item.intId }">${ item.intName }</option>
												</c:when>
											</c:choose>
										</c:forEach>
									</select>
								</div>
								<small class="help-block" id="memIntHint"></small>
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
	 <%-- for modal --%>
	<c:if test="${ !empty loginVO }">
		<%@ include file="../../includes/modals.jsp" %>
	</c:if>
	<%-- for modal --%>

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
			$('#memEmail').on('blur', function(){
				$('#memEmail').val($('#memEmail').val().replace(/\s/gi, "")); //공백제거
				$.ajax({
					method : "POST",
					url : "/admin/users/emailCheck",
					data : {
						memEmail : $('#memEmail').val()
					}
				}).done(function(result) {
					const memEmailHint = $('#memEmailHint');
					if (result === "true") {
						memEmailHint.css('color', 'yellowgreen');
						memEmailHint.data('isUse', true);
					} else if (result === "false") {
						memEmailHint.css('color', 'red');
						memEmailHint.data('isUse', false);
						memEmailHint.html('사용 불가능한 이메일입니다.');
					}
				});
			});
			

		});


		function submitCheck() { //전송 전 입력체크11

			let result = true;

			// 이메일
			const memEmail = $('#memEmail').val();
			const memEmailHint = $('#memEmailHint');
			// 패스워드
			const memPassword = $('#memPassword').val();
			const memPasswordHint = $('#memPasswordHint');
			const confirmPassword = $('#confirmPassword').val();
			const confirmPasswordHint = $('#confirmPasswordHint');
			// 이름(닉네임)
			const memNickname = $('#memNickname').val();
			const memNicknameHint = $('#memNicknameHint');
			// 생일
			const memBirthday = $('#memBirthday').val();
			const memBirthdayHint = $('#memBirthdayHint');
			// 소개글
			const memContent = $('#memContent').val($('#memContent').val().trim());
			const memContentHint = $('#memContentHint');
			// 관심사
			const memInt1 = $('#memInt1').val();
			const memInt2 = $('#memInt2').val();
			const memInt3 = $('#memInt3').val();
			const memIntHint = $('#memIntHint');
			
			// 폼 입력 체크
			// 이메일
			if (memEmail === '' || memEmail.length === 0) { // 이메일
				$('#memEmail').focus();
				memEmailHint.css('color', 'red');
				memEmailHint.html('이메일을 입력해주세요.');
				result = false;
			} else {
				if (!memEmailHint.data('isUse')) {
					memEmailHint.css('color', 'red');
					memEmailHint.data('isUse', false);
					memEmailHint.html('올바른 이메일을 입력해 주세요.');
					result = false;
				}else{
					memEmailHint.html('');
				}
			}
			// 비밀번호
			if (memPassword === '' || memPassword.length === 0) { // 패스워드
				$('#memPassword').focus();
				memPasswordHint.css('color', 'red');
				memPasswordHint.html('패스워드를 입력해주세요.');
				result = false;
			} else {
				memPasswordHint.html('');
			}
			if (confirmPassword === '' || confirmPassword.length === 0) { // 패스워드 확인
				$('#confirmPassword').focus();
				confirmPasswordHint.css('color', 'red');
				confirmPasswordHint.html('패스워드 확인을 입력해주세요.');
				result = false;
			} else {
				if (memPassword !== confirmPassword) { // 패스워드 == 패스워드 확인
					$('#confirmPassword').focus();
					confirmPasswordHint.css('color', 'red');
					confirmPasswordHint.html('패스워드가 서로 일치 하지 않습니다..');
					result = false;
				} else {
					confirmPasswordHint.html('');
				}
			}
			// 이름(닉네임)
			if (memNickname === '' || memNickname.length === 0) { // 닉네임
				$('#memNickname').focus();
				memNicknameHint.css('color', 'red');
				memNicknameHint.html('이름(닉네임)을 입력해 주세요.');
				result = false;
			} else {
				memNicknameHint.html('');
			}
			// 생일
			if (memBirthday === '' || memBirthday.length === 0) { // 생일
				$('#memBirthday').focus();
				memBirthdayHint.css('color', 'red');
				memBirthdayHint.html('생일을 입력해 주세요.');
				result = false;
			} else {
				memBirthdayHint.html('');
			}
			// 소개글
			if (memContent === '' || memContent.length === 0) { // 자기소개
				$('#memContent').focus();
				memContentHint.css('color', 'red');
				memContentHint.html('자기소개를 입력해 주세요.');
				result = false;
			} else {
				memContentHint.html('');
			}
			// 관심사 일치하면 안되도록
			if (memInt1 === memInt2 || memInt1 === memInt3 ||	memInt2 === memInt3) { // 자기소개
				memIntHint.css('color', 'red');
				memIntHint.html('관심사는 서로 다른 것을 선택하여 주세요');
				result = false;
			} else {
				memIntHint.html('');
			}


			// 모든 조건이 올바르게 입력되었다면 폼 전송
			if (result) {
				$('#memForm').submit();
			}

		}
	</script>

</body>

</html>