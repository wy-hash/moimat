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
							<form id="meetRegForm" class="form-horizontal" action="/groups/${groupId}/meetings/new" method="post">
								<input type="hidden" name="teamId" value="${groupId }">
								<div class="panel-body">
									<div class="form-group">
										<label class="col-lg-2 control-label">모임 글제목</label>
										<div class="col-lg-9">
											<input type="text" class="form-control" name="meetTitle">
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-2 control-label">모임 장소</label>
										<div class="col-lg-9">
											<div class="input-group mar-btm">
												<input type="text" id="getMap" class="form-control"
													name="meetArea" readonly="readonly" placeholder="장소검색을 눌러주세요..">
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
													<input type="text" class="form-control" id="meetDay"
														placeholder="yyyyMMdd 형식으로 작성해 주세요 ex)20190319..">
												</div>
												<div class="col-lg-2 text-lg-right">
													<label class="control-label">시간</label>
												</div>
												<div class="col-lg-2">
													<input type="text" class="form-control" id="meetTime"
														placeholder="시간선택..">
												</div>
												<input type="hidden" id="meetDate" name="meetDate" value="">
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-2 control-label">모임 글내용</label>
										<div class="col-lg-9">
											<textarea rows="9" class="form-control" name="meetContent"
												placeholder="Your content here.."></textarea>
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-2 control-label">모임 회비</label>
										<div class="col-lg-9 pad-no">
											<div class="clearfix">
												<div class="col-lg-4">
													<input type="text" name="meetPay" class="form-control"
														placeholder="모임 회비..">
												</div>
												<div class="col-lg-4 text-lg-right">
													<label class="control-label">모임 인원</label>
												</div>
												<div class="col-lg-4">
													<input type="text" name="meetMax" class="form-control"
														placeholder="모임최대인원..">
												</div>
											</div>
										</div>
									</div>
									<div class="clearfix">
										<div class="col-lg-3"></div>
										<div class="col-lg-6">
											<button type="submit" class="btn btn-dark btn-block"
												id="subbtn">등록하기</button>
										</div>
										<div class="col-lg-3"></div>
									</div>
								</div>
							</form>
						</div>
						<!--===================================================-->
						<!--End Dark Panel-->
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
		$("#meetTime").timepicker({
			timeFormat: 'H:i'
		});
		
		$('#meetDay').keyup(function(){
			var temp = this.value;
			if(isNaN(temp) == true) {
				alert("숫자만 입력 가능합니다.");
				this.value = '';
			}
		});		
		
		$('input[name="meetMax"]').keyup(function(){
			var temp = this.value;
			if(isNaN(temp) == true) {
				alert("숫자만 입력 가능합니다.");
				this.value = '';
			}
		});
		
		$('#subbtn').on('click',function(e){
			e.preventDefault();//submit 버튼 동작안하게만듬
			var meetDay = $('#meetDay').val()
			
			if($("input[name=meetTitle]").val()==""){
				alert("글 제목이 작성되지 않았습니다.")
				return false;
			}else if($("input[name='meetArea']").val()==""){
				alert("장소가 작성되지 않았습니다.")
				return false;
			}else if($("#meetDay").val()==""){
				alert("날짜가 작성되지 않았습니다.")
				return false;
			}else if($("#meetTime").val()==""){
				alert("시간이 선택되지 않았습니다.")
				return false;
			}else if($("textarea[name='meetContent']").val()==""){
				alert("내용이 작성되지 않았습니다.")
				return false;
			}else if($("input[name='meetPay']").val()==""){
				alert("비용이 작성되지 않았습니다.")
				return false;
			}else if($("input[name='meetMax']").val()==""){
				alert("인원이 작성되지 않았습니다.")
				return false;
			}else if(vaildDate(meetDay)){
				$('#meetDate').val(inputDate);
				$('#meetRegForm').submit();
			};
		});
		function vaildDate(meetDay){
			inputDate = new Date();
			nowDate = new Date();
			var yy = Number(meetDay.substring(0,4));
			var MM = Number(meetDay.substring(4,6));
			var dd = Number(meetDay.substring(6,8));
			var hh = $('#meetTime').timepicker("getTime").getHours();
			var mi = $('#meetTime').timepicker("getTime").getMinutes();
			maxDay = new Date(new Date(yy,MM,1) - 86400000).getDate();
			inputDate.setFullYear(yy);
			inputDate.setMonth(MM-1);
			inputDate.setDate(dd);
			inputDate.setHours(hh);
			inputDate.setMinutes(mi);
			function now(){
				var nYear = nowDate.getFullYear();
				var nMounth = nowDate.getMonth()+1;
				var nDay = nowDate.getDate();
				return [nYear,(nMounth > 9 ? '' : '0')+nMounth,(nDay > 9 ? '' : '0')+nDay].join('');
			}
			if(meetDay.length != 8||isNaN(meetDay) == true||MM<1||MM>12||dd<1||dd>maxDay){
				alert("날짜 형식이 맞지 않습니다.");
				$('#meetDay').val('');
				return false;
			}else if(meetDay-now()>10000){
				alert("1년 이내의 날자로 입력해주세요!");
				$('#meetDay').val('');
				return false;
			}else if(inputDate-nowDate<0){
				alert('과거에선 만날 수 없잖아요?')
				return false;
			}
			return true;
		}
		
	})
	</script>
</body>
</html>