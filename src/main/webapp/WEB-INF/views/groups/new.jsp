<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<!-- HEAD -->
<%@ include file="../includes/head.jsp"%>
<title>Page Template | moim@</title>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-timepicker/1.10.0/jquery.timepicker.css"
	rel="stylesheet" type="text/css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-timepicker/1.10.0/jquery.timepicker.min.css.map"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-timepicker/1.10.0/jquery.timepicker.js"></script>
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
					<h1 class="page-header text-overflow">Page Template</h1>
				</div>
				<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
				<!--End page title-->

				<!--Page content-->
				<!--===================================================-->
				<div id="page-content">
					<!-- #################################### -->
					<!-- #### WRITE CODE BELOW THIS LINE #### -->
					<!-- #################################### -->
					<div class="container">
						<!--Dark Panel-->
							<!--===================================================-->
							<div class="panel panel-bordered panel-dark">
								<div class="panel-heading">
									<h3 class="panel-title">모임 등록</h3>
								</div>
								<form class="form-horizontal">
									<div class="panel-body">
										<div class="form-group">
											<label class="col-lg-2 control-label">모임 글제목</label>
											<div class="col-lg-9">
												<input type="text" class="form-control" name="title">
											</div>
										</div>
										<div class="form-group">
											<label class="col-lg-2 control-label">모임 장소</label>
											<div class="col-lg-9">
												<div class="input-group mar-btm">
													<input type="text" id="getMap" class="form-control"	name="area" readonly="readonly" placeholder="장소검색을 눌러주세요..">
													<span class="input-group-btn">
														<button class="btn btn-dark" type="button" id="selectmap">장소검색</button>
													</span>
												</div>
											</div>
										</div>
										<div class="form-group">
											<label class="col-lg-2 control-label">만나는날</label>
											<div class="col-lg-9 pad-no">
												<div class="clearfix">
													<div class="col-lg-8">
														<input type="text" class="form-control" name="title" placeholder="yyyyMMdd 형식으로 작성해 주세요 ex)20190319..">
													</div>
													<div class="col-lg-2 text-lg-right">
														<label class="control-label">시간</label>
													</div>
													<div class="col-lg-2">
														<input type="text" class="form-control" id="setTime" value="" placeholder="시간선택..">
													</div>
												</div>
											</div>
										</div>
										<div class="form-group">
											<label class="col-lg-2 control-label">모임 글내용</label>
											<div class="col-lg-9">
												<textarea rows="9" class="form-control" placeholder="Your content here.."></textarea>
											</div>
										</div>
										<div class="form-group">
											<label class="col-lg-2 control-label">모임 회비</label>
											<div class="col-lg-9 pad-no">
												<div class="clearfix">
													<div class="col-lg-4">
														<input type="text" name="payment" class="form-control" placeholder="모임 회비..">
													</div>
													<div class="col-lg-4 text-lg-right">
														<label class="control-label">모임 인원</label>
													</div>
													<div class="col-lg-4">
														<input type="text" name="maxPerson" class="form-control" placeholder="모임최대인원..">
													</div>
												</div>
											</div>
										</div>
										<div class="clearfix">
											<div class="col-lg-3"></div>
											<div class="col-lg-6"><button type="submit" class="btn btn-dark btn-block" id="subbtn">등록하기</button></div>
											<div class="col-lg-3"></div>
										</div>
										
									</div>
								</form>
							</div>
							<!--===================================================-->
							<!--End Dark Panel-->
						<form action="/groups/${groupId}/meetings/new" method="post">
							<input type="hidden" name="teamSeq" value="${groupId }">
							<input type="hidden" name="memberSeq" value="${id }">
							<input type="hidden" id="meetDate" name="meetDate" value="">
							
						</form>	
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
	<script type="text/javascript">
		
		$(document).ready(function(){
			var openWin;
			$('#selectmap').on('click',function(){
				window.name = "/group/${groupId}/meetings/new";
				// window.open("open할 window", "자식창 이름", "팝업창 옵션");
				openWin = window.open("/groups/map", "childForm",
						"width=1200, height=600");
			});
			
			$("#setTime").timepicker({
				timeFormat: 'H:i'
			});
			
			$('#subbtn').on('click',function(e){
				e.preventDefault();
			})

			
		})
	</script>
</body>
</html>