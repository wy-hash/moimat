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
					<h1 class="page-header text-overflow">모임 관리</h1>
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
							<h3 class="panel-title">모임 등록</h3>
						</div>
						<form id="teamForm" name="teamForm" action="/admin/groups/new" class="panel-body form-horizontal form-padding"
							method="post">
							<input type="hidden" name="memId" value="${sessionScope.loginVO.memId }">
							<input type="hidden" name="type" value="${pageMaker.cri.type }">
							<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
							<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
							<input type="hidden" name="amount" value="${pageMaker.cri.amount }">


							<!-- 모임 명 -->
							<div class="form-group">
								<label class="col-lg-3 control-label">모임 명</label>
								<div class="col-lg-7">
									<input type="email" class="form-control" id="teamName" name="teamName" placeholder="모임 명" maxlength="13">
									<small class="help-block" id="teamNameHint"></small>
								</div>
							</div>
							<!-- 최대 인원 수-->
							<div class="form-group">
								<label class="col-lg-3 control-label">최대 인원 수</label>
								<div class="col-lg-7">
									<input type="text" class="form-control" id="teamMax" name="teamMax" placeholder="최대 인원 수를 입력해 주세요 ">
									<small class="help-block" id="teamMaxHint"></small>
								</div>
							</div>
							
							<!-- 관심사 선택 -->
							<div class="form-group">
								<label class="col-lg-3 control-label">관심사 선택</label>
								<div class="col-lg-7">
									<select id="intId" name="intId" class="form-control" >
										<c:forEach items="${ interest }" var="item">
											<c:choose>
												<c:when test="${fn:substring(item.intKey, 2, 4) ne '00' }">
													<option value="${ item.intId }">${ item.intName }</option>
												</c:when>
											</c:choose>
										</c:forEach>
									</select>
								</div>
							</div>
							
							<!-- 활동 지역 -->
							<div class="form-group">
								<label class="col-lg-3 control-label">활동지역</label>
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
							<!-- 짧은 소개글 -->
							<div class="form-group">
								<label class="col-lg-3 control-label">짧은 소개글</label>
								<div class="col-lg-7">
									<textarea class="form-control" id="teamShortContent" name="teamShortContent" rows="5" placeholder="간단한 소개글을 적어보세요."></textarea>
									<small class="help-block" id="teamShortContentHint"></small>
								</div>
							</div>
							<!-- 소개글 -->
							<div class="form-group">
								<label class="col-lg-3 control-label">소개글</label>
								<div class="col-lg-7">
									<textarea class="form-control" id="teamContent" name="teamContent" placeholder="소개글을 적어보세요."></textarea>
									<small class="help-block" id="teamContentHint"></small>
								</div>
							</div>
					

							<div class="row pull-right">
								<button type="button" id="teamSubmit" class="btn btn-success mar-top">확인</button>
								<button type="button" id="teamCansel" class="btn btn-danger mar-top">취소</button>
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
			// 썸머노트 실행
			$('#teamContent').summernote({
		        placeholder: '내용을 입력해 주세요.',
		        tabsize: 2,
		        height: 400
			});
			
			$('#teamSubmit').on('click', submitCheck);
			$('#teamCansel').on('click', function () {
				let url = location.origin + '/admin/groups/list';
				location.href = url;
			});
			
			$('#teamMax').on(
					'keyup',
					function() {//키를 뗄 때
						$('#teamMax').val(
								$('#teamMax').val().replace(/[^0-9]/g, ""));
					});

		});


		function submitCheck() { //전송 전 입력체크11

			let result = true;

			// 모임 명
			const teamName = $('#teamName').val();
			const teamNameHint = $('#teamNameHint');
			// 짧은 소개글
			const teamShortContent = $('#teamShortContent').val($('#teamShortContent').val().trim());
			const teamShortContentHint = $('#teamShortContentHint');
			// 소개글
			const teamContent = $('#teamContent').val();
			const teamContentHint = $('#teamContentHint');
			// 인원 수
			const teamMax = $('#teamMax').val();
			const teamMaxHint = $('#teamMaxHint');

			
			// 폼 입력 체크
			// 모임 명
			if (teamName === '' || teamName.length === 0) { // 모임 명
				$('#teamName').focus();
				teamNameHint.css('color', 'red');
				teamNameHint.html('모임 명을 입력해주세요.');
				result = false;
			} else {
				teamNameHint.html('');
			}

			// 짧은 소개글
			if (teamShortContent === '' || teamShortContent.length === 0) { // 짧은 소개글
				$('#teamShortContent').focus();
				teamShortContentHint.css('color', 'red');
				teamShortContentHint.html('짧은 소개글을 입력해 주세요.');
				result = false;
			} else {
				teamShortContentHint.html('');
			}
			// 소개글
			if (teamContent === '' || teamContent.length === 0) {
				$('#note-editable').focus();
				teamContentHint.css('color', 'red');
				teamContentHint.html('내용을 입력해 주세요.');
				result = false;
			}else{
				teamContentHint.html('');
			}

			// 인원 수
			if (teamMax === '' || teamMax.length === 0) {
				$('#teamMax').focus();
				teamMaxHint.css('color', 'red');
				teamMaxHint.html('내용을 입력해 주세요.');
				result = false;
			}else{
				teamMaxHint.html('');
			}


			// 모든 조건이 올바르게 입력되었다면 폼 전송
			if (result) {
				$('#teamForm').submit();
			}

		}
	</script>

</body>

</html>