<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<!-- HEAD -->
<%@ include file="../../includes/head.jsp"%>

<!--Bootstrap Table [ OPTIONAL ]-->
<link href="/resources/plugins/bootstrap-table/bootstrap-table.min.css"
	rel="stylesheet">


<!--X-editable [ OPTIONAL ]-->
<link href="/resources/plugins/x-editable/css/bootstrap-editable.css"
	rel="stylesheet">

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
					<h1 class="page-header text-overflow">관심사 코드 관리</h1>
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
							<h3 class="panel-title">관심사 코드 추가</h3>
						</div>

						<form id="interestForm" name="interestForm"
							action="/admin/interest/new"
							class="panel-body form-horizontal form-padding" method="post">

							<!-- 관심사 코드-->
							<div class="form-group">
								<label class="col-md-2 control-label" for="intKey"><strong>관심사
										코드</strong></label>
								<div class="col-md-10">
									<input type="text" id="intKey" name="intKey"
										class="form-control"
										placeholder="관심사 코드를 입력해 주세요. (ex)영어 2자리 + 숫자 2자리 => IN01"
										maxlength="4"> <small class="help-block"
										id="intKeyHint"></small>
								</div>
							</div>

							<!--관심사 이름-->
							<div class="form-group">
								<label class="col-md-2 control-label" for="intName"><strong>관심사
										이름</strong></label>
								<div class="col-md-10">
									<input type="text" id="intName" name="intName"
										class="form-control" placeholder="관심사 이름을 입력해 주세요"> <small
										class="help-block" id="intNameHint"></small>
								</div>
							</div>

							<!--관심사 정렬순서-->
							<div class="form-group">
								<label class="col-md-2 control-label" for="intOrder"><strong>관심사
										정렬순서</strong></label>
								<div class="col-md-10">
									<input type="text" id="intOrder" name="intOrder"
										class="form-control"
										placeholder="관심사를 먼저 보이게 하려면 숫자를 높게 설정하세요"> <small
										class="help-block" id="intOrderHint"></small>
								</div>
							</div>

							<!--관심사 사용 여부-->
							<div class="form-group">
								<label class="col-md-2 control-label" for="intUse"><strong>관심사
										사용 여부</strong></label>
								<div class="col-md-10">
									<label class="radio-inline"> <input type="radio"
										id="intUse_Y" name="intUse" value="Y" checked> 사용
									</label> <label class="radio-inline"> <input type="radio"
										id="intUse_N" name="intUse" value="N"> 미사용
									</label>
								</div>
							</div>
							<div class="row pull-right mar-top">
								<button type="button" id="intSubmit"
									class="btn btn-success">확인</button>
								<button type="button" id="intCansel" class="btn btn-danger">취소</button>
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
	<script
		src="/resources/plugins/x-editable/js/bootstrap-editable.min.js"></script>


	<!--Bootstrap Table [ OPTIONAL ]-->
	<script src="/resources/plugins/bootstrap-table/bootstrap-table.min.js"></script>


	<!--Bootstrap Table Extension [ OPTIONAL ]-->
	<script
		src="/resources/plugins/bootstrap-table/extensions/editable/bootstrap-table-editable.js"></script>

	<script>
		$(document).ready(function() {
			validation();
			$('#intSubmit').on('click', submitCheck);
			
			$('#intCansel').on('click', function(){
				let url = location.origin+'/admin/interest/list';
				location.href = url;
			});
		});

		function validation() {
			// 유효성 검사

			// 관심사 코드 
			$('#intKey').on(
					'keyup',
					function() {

						$("#intKey").val(
								$("#intKey").val().replace(/[^a-z0-9]/gi, ''));
						let intKeyVal = $("#intKey").val();

						if (intKeyVal.length == 4) {
							$.ajax({
								method : "POST",
								url : "/admin/interest/keyCheck",
								data : {
									intKey : intKeyVal
								}
							}).done(
									function(result) {
										if (result === "true") {
											$('#intKeyHint').css('color',
													'yellowgreen');
											$('#intKeyHint')
													.data('isUse', true);
											$('#intKeyHint').html(
													'사용 가능한 코드입니다.');
										} else {
											$('#intKeyHint')
													.css('color', 'red');
											$('#intKeyHint').data('isUse',
													false);
											$('#intKeyHint').html(
													'사용 불가능한 코드입니다.');
										}
									});
						} else {
							$('#intKeyHint').css('color', 'black');
							$('#intKeyHint').data('isUse', false);
							$('#intKeyHint').html('');
						}
					});

			// 관심사 정렬 우선순위 숫자만 입력받기. 정규식 사용
			$('#intOrder').on(
					'keyup',
					function() {//키를 뗄 때
						$('#intOrder').val(
								$('#intOrder').val().replace(/[^0-9]/g, ""));
					});

		}

		function submitCheck() {

			let result = true;

			let intKey = $('#intKey').val();
			let intKeyHint = $('#intKeyHint');

			let intName = $('#intName').val();
			let intNameHint = $('#intNameHint');

			let intOrder = $('#intOrder').val();
			let intOrderHint = $('#intOrderHint');

			// 폼 입력 체크
			if (intKey === '' || intKey.length !== 4) {

				$('#intKey').focus();

				intKeyHint.css('color', 'red');
				intKeyHint.data('isUse', false);
				intKeyHint.html('관심사 코드를 입력해 주세요.');
				result = false;
			} else {
				if (!intKeyHint.data('isUse')) {
					intKeyHint.css('color', 'red');
					intKeyHint.data('isUse', false);
					intKeyHint.html('올바른 관심사 코드를 입력해 주세요.');
					result = false;
				}
			}
			if (intName === '' || intName.length === 0) {

				$('#intName').focus();
				intNameHint.css('color', 'red');
				intNameHint.html('관심사 이름을 입력해 주세요.');

				result = false;
			}
			if (intOrder === '' || intOrder.length === 0) {

				$('#intOrder').focus();
				intOrderHint.css('color', 'red');
				intOrderHint.html('관심사 우선순위를 입력해 주세요.');

				result = false;
			}

			// 모든 조건이 올바르게 입력되었다면 폼 전송
			if (result) {
				$('#interestForm').submit();
			}

		}
	</script>

	 <%-- for modal --%>
	<c:if test="${ !empty loginVO }">
		<%@ include file="../../includes/modals.jsp" %>
	</c:if>
	<%-- for modal --%>
</body>
</html>