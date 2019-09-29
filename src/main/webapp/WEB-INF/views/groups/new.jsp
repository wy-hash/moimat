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
								<input type="hidden" name="memberSeq" value="${id }"> 
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
		
		$('#subbtn').on('click',function(e){
			e.preventDefault();//submit 버튼 동작안하게만듬
			var meetDay = $('#meetDay').val()
			var hh = $('#meetTime').timepicker("getTime").getHours();
			var mi = $('#meetTime').timepicker("getTime").getMinutes();
			
			
			
			if(vaildDate(meetDay)){
				inputDate = new Date();
				nowDate = new Date();
				var yy = meetDay.substring(0,4);
				var MM = meetDay.substring(4,6)-1;
				var dd = meetDay.substring(6,8);
				inputDate.setFullYear(yy);
				inputDate.setMonth(MM);
				inputDate.setDate(dd);
				inputDate.setHours(hh);
				inputDate.setMinutes(mi);
				if(inputDate-nowDate<0){
					alert('no')
					return false;
				}
				$('#meetDate').val(inputDate);
			};
			$('#meetRegForm').submit();
		});
		function vaildDate(meetDay){
			function now(){
				var date = new Date();
				var yy = date.getFullYear();
				var mm = date.getMonth()+1;
				var dd = date.getHours();
				
				return [yy,(mm > 9 ? '' : '0')+mm,(dd > 9 ? '' : '0')+dd].join('');
			}
			if(meetDay.length != 8){
				alert("날짜 형식이 맞지 않습니다.");
				$('#meetDay').val('');
				return false;
			}else if(isNaN(meetDay) == true){
				alert("날짜 형식이 맞지 않습니다.");
				$('#meetDay').val('');
				return false;
			}else if(meetDay-now()>10000){
				alert("1년 이내의 날자로 입력해주세요!");
				$('#meetDay').val('');
				return false;
			}
			return true;
		}
		
		$('#meetDay').keypress(function(){
			//키보드입력시 문자입력 자체를 못하게
			 if(event.keyCode<48 || event.keyCode>57){
		           event.returnValue=false;
		        }
		});
		$('#meetDay').keyup(function(){
			//복사붙여넣기로 입력 시도시
			var temp = this.value;
			if(isNaN(temp) == true) {
				alert("숫자만 입력 가능합니다.");
				this.value = '';
			}
		});
		
	})
	</script>
</body>
</html>