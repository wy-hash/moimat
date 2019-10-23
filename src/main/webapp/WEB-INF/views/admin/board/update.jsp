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
						<form id="boardForm" name="boardForm" action="/admin/board/edit"
							class="panel-body form-horizontal form-padding" method="post">
							<input type="hidden" id="brdId" name="brdId" value="${view.brdId }" />
							<input type="hidden" id="brdKeyPrev" value="${view.brdKey }" />
							<!-- 게시판 코드-->
							<div class="form-group">
								<label class="col-md-2 control-label" for="brdKey"><strong>게시판
										코드</strong></label>
								<div class="col-md-10">
									<input type="text" id="brdKey" name="brdKey" class="form-control" value="${view.brdKey }" 
										placeholder="게시판 코드를 입력해 주세요. (ex)영어 2자리 + 숫자 2자리 => BO01" maxlength="4"> <small class="help-block"
										id="brdKeyHint"></small>
								</div>
							</div>

							<!--게시판 이름-->
							<div class="form-group">
								<label class="col-md-2 control-label" for="brdName"><strong>게시판
										이름</strong></label>
								<div class="col-md-10">
									<input type="text" id="brdName" name="brdName" class="form-control" value="${view.brdName }" placeholder="게시판 이름을 입력해 주세요">
									<small class="help-block" id="brdNameHint"></small>
								</div>
							</div>

							<!--게시판 정렬순서-->
							<div class="form-group">
								<label class="col-md-2 control-label" for="brdOrder"><strong>게시판
										정렬순서</strong></label>
								<div class="col-md-10">
									<input type="text" id="brdOrder" name="brdOrder" class="form-control" value="${view.brdOrder }"
										placeholder="게시판를 먼저 보이게 하려면 숫자를 높게 설정하세요"> <small class="help-block" id="brdOrderHint"></small>
								</div>
							</div>

							<!--게시판 사용 여부-->
							<div class="form-group">
								<label class="col-md-2 control-label" for="brdUse"><strong>게시판
										사용 여부</strong></label>
								<div class="col-md-10">
									<label class="radio-inline"> <input type="radio" id="brdUse_Y" name="brdUse" value="Y" <c:if test="${'Y' eq view.brdUse }"> checked</c:if>> 사용
									</label> <label class="radio-inline"> <input type="radio" id="brdUse_N" name="brdUse" value="N" <c:if test="${'N' eq view.brdUse }"> checked</c:if>>
										미사용
									</label>
								</div>
							</div>
							<div class="row pull-right mar-top">
								<button type="button" id="brdSubmit" class="btn btn-success">확인</button>
								<button type="button" id="brdCansel" class="btn btn-danger">취소</button>
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

	<script>
		$(document).ready(function() {
			validation();
			
			$('#brdSubmit').on('click', submitCheck);
			
			$('#brdCansel').on('click', function(){
				let url = location.origin+'/admin/board/list';
				location.href = url;
			});
		});
		function validation() {
			// 유효성 검사
			// 게시판 코드 
			$('#brdKey').on(
					'keyup',
					function() {
						$("#brdKey").val(
								$("#brdKey").val().replace(/[^a-z0-9]/gi, ''));
						let brdKeyPrev = $('#brdKeyPrev').val();
						let brdKeyVal = $("#brdKey").val();
						
						if( brdKeyPrev !== brdKeyVal ){
							if (brdKeyVal.length == 4) {
								$.ajax({
									method : "POST",
									url : "/admin/board/keyCheck",
									data : {
										brdKey : brdKeyVal
									}
								}).done(
										function(result) {
											if (result === "true") {
												$('#brdKeyHint').css('color',
														'yellowgreen');
												$('#brdKeyHint')
														.data('isUse', true);
												$('#brdKeyHint').html(
														'사용 가능한 코드입니다.');
											} else {
												$('#brdKeyHint')
														.css('color', 'red');
												$('#brdKeyHint').data('isUse',
														false);
												$('#brdKeyHint').html(
														'사용 불가능한 코드입니다.');
											}
										});
							} else {
								$('#brdKeyHint').css('color', 'black');
								$('#brdKeyHint').data('isUse', false);
								$('#brdKeyHint').html('');
							}
						}
					});
			// 게시판 정렬 우선순위 숫자만 입력받기. 정규식 사용
			$('#brdOrder').on(
					'keyup',
					function() {//키를 뗄 때
						$('#brdOrder').val(
								$('#brdOrder').val().replace(/[^0-9]/g, ""));
					});
		}
		function submitCheck() {
			let result = true;
			let brdKeyPrev = $('#brdKeyPrev').val();
			
			let brdKey = $('#brdKey').val();
			let brdKeyHint = $('#brdKeyHint');
			let brdName = $('#brdName').val();
			let brdNameHint = $('#brdNameHint');
			let brdOrder = $('#brdOrder').val();
			let brdOrderHint = $('#brdOrderHint');
			
			// 폼 입력 체크
			//기존 게시판 코드와 다른 경우에만 DB중복조회를 하도록.
			if (brdKeyPrev !== brdKey){
				if (brdKey === '' || brdKey.length !== 4) {
	
					$('#brdKey').focus();
	
					brdKeyHint.css('color', 'red');
					brdKeyHint.data('isUse', false);
					brdKeyHint.html('게시판 코드를 입력해 주세요.');
					result = false;
				} else {
					if (!brdKeyHint.data('isUse')) {
						brdKeyHint.css('color', 'red');
						brdKeyHint.data('isUse', false);
						brdKeyHint.html('올바른 게시판 코드를 입력해 주세요.');
						result = false;
					}
				}
			}
			
			if (brdName === '' || brdName.length === 0) {
				$('#brdName').focus();
				brdNameHint.css('color', 'red');
				brdNameHint.html('게시판 이름을 입력해 주세요.');
				result = false;
			}
			if (brdOrder === '' || brdOrder.length === 0) {
				$('#brdOrder').focus();
				brdOrderHint.css('color', 'red');
				brdOrderHint.html('게시판 우선순위를 입력해 주세요.');
				result = false;
			}
			// 모든 조건이 올바르게 입력되었다면 폼 전송
			if (result) {
				$('#boardForm').submit();
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