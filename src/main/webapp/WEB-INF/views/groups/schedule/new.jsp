<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">

<!-- HEAD -->
<%@ include file="/WEB-INF/views/includes/head.jsp"%>
    <!--Bootstrap Timepicker [ OPTIONAL ]-->
    <link href="/resources/plugins/bootstrap-timepicker/bootstrap-timepicker.min.css" rel="stylesheet">
    <!--Bootstrap Datepicker [ OPTIONAL ]-->
    <link href="/resources/plugins/bootstrap-datepicker/bootstrap-datepicker.min.css" rel="stylesheet">
    <!--Bootstrap Timepicker [ OPTIONAL ]-->
    <script src="/resources/plugins/bootstrap-timepicker/bootstrap-timepicker.min.js"></script>
    <!--Bootstrap Datepicker [ OPTIONAL ]-->
    <script src="/resources/plugins/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>

<title>모임일정 - ${ group.teamName } | moim@</title>

<style>
@media screen and (max-width: 768px) {
	.tab-base>ul {
		display: none;
	}
	.tab-base>.btn-group {
		display: inline-block;
	}
}

@media screen and (min-width: 768px) {
	.tab-base>ul {
		display: block;
	}
	.tab-base>.btn-group {
		display: none;
	}
}
</style>
</head>
<!-- END HEAD -->

<body>
	<!--TIPS-->
	<!--You may remove all ID or Class names which contain "demo-", they are only used for demonstration. -->
	<div id="container" class="effect aside-float aside-bright mainnav-lg">

		<!-- HEADER-NAVBAR -->
		<%@ include file="/WEB-INF/views/includes/header-navbar.jsp"%>
		<!-- END NAVBAR -->

		<!-- BOXED -->
		<div class="boxed">

			<!-- MAIN-NAV -->
			<%@ include file="/WEB-INF/views/includes/main-nav.jsp"%>
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


					<!--Default Tabs (Left Aligned)-->
					<!--===================================================-->
					<div class="tab-base col-lg-12">

						<!--Nav Tabs-->
						<ul class="nav nav-tabs">
							<li><a href="/groups/${ group.teamId }">홈</a></li>
							<li><a href="/groups/${ group.teamId }/member">구성원</a></li>
							<li class="active"><a href="/groups/${ group.teamId }/schedule">모임일정</a>
							</li>
							<li><a href="/groups/${ group.teamId }/photos">사진첩</a></li>
							<li><a href="/groups/${ group.teamId }/posts">게시판</a></li>
							<li><a href="/groups/${ group.teamId }/chat">채팅</a></li>
							<li><a href="/groups/${ group.teamId }/settings">설정</a></li>
						</ul>

						<!--Default Dropdown button-->
						<!--===================================================-->
						<div class="btn-group">
							<button class="btn btn-primary dropdown-toggle"
								data-toggle="dropdown" type="button">
								<i class="fa fa-bars"></i> 모임일정
							</button>
							<ul class="dropdown-menu dropdown-menu-left">
								<li><a href="/groups/${ group.teamId }">홈</a></li>
								<li><a href="/groups/${ group.teamId }/member">구성원</a></li>
								<li class="active"><a href="/groups/${ group.teamId }/schedule">모임일정</a></li>
								<li><a href="/groups/${ group.teamId }/photos">사진첩</a></li>
								<li><a href="/groups/${ group.teamId }/posts">게시판</a></li>
								<li><a href="/groups/${ group.teamId }/chat">채팅</a></li>
								<li class="divider"></li>
								<li><a href="/groups/${ group.teamId }/settings">설정</a></li>
							</ul>
						</div>
						<!--===================================================-->

						<!--Tabs Content-->
						<div class="tab-content">
							<div class="content-box">
								<!--Dark Panel-->
						<!--===================================================-->
						<div class="panel panel-bordered panel-dark">
							<div class="panel-heading">
								<h3 class="panel-title">모임 등록</h3>
							</div>
							<form id="meetRegForm" class="form-horizontal" action="/groups/${groupId}/schedule/new" method="post">
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
												<input type="text" id="getAreaName" class="form-control"
													name="meetAreaName" readonly="readonly" placeholder="장소검색을 눌러주세요..">
												<input type="hidden" id="getArea" name="meetArea">
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
													<input type="text" class="form-control" id="meetDay">
												</div>
												<div class="col-lg-2 text-lg-right">
													<label class="control-label">시간</label>
												</div>
												<div class="col-lg-2">
													<input type="text" class="form-control" id="meetTime">
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
					</div>
					<!--===================================================-->
					<!--End Default Tabs (Left Aligned)-->


				</div>
				<!--===================================================-->
				<!--End page content-->


			</div>
			<!--===================================================-->
			<!--END CONTENT CONTAINER-->



		</div>
		<!-- END BOXED -->

		<!-- FOOTER -->
		<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
		<!-- END FOOTER -->

	</div>
	<!-- END CONTAINER -->
	<script type="text/javascript">
	$(document).ready(function(){
		var openWin;
		
		var sysDate = new Date();
		
		$('#selectmap').on('click',function(){
			window.name = "/group/${groupId}/schedule/new";
			// window.open("open할 window", "자식창 이름", "팝업창 옵션");
			openWin = window.open("/groups/${groupId}/schedule/map", "childForm",
					"width=1200, height=600");
		});
		$('#meetDay').datepicker({
			startDate: new Date(),
			endDate: new Date(sysDate.getFullYear()+1,(sysDate.getMonth() - 1), sysDate.getDate()),
			format: "yyyymmdd",
	        autoclose: true,
	        todayHighlight: true,
	        
	    });
		$("#meetTime").timepicker({
			disableFocus: true,
			showMeridian: false
		});
		
		$('input[name=meetMax]').keyup(function(){
			$(this).val($(this).val().replace(/[^0-9]/g,""));
		});
		
		$('#subbtn').on('click',function(e){
			e.preventDefault();//submit 버튼 동작안하게만듬
			var meetDay = $('#meetDay').val()
			setDate(meetDay);
			if($("input[name=meetTitle]").val()==""){
				alert("글 제목이 작성되지 않았습니다.")
				return false;
			}else if($("input[name='meetArea']").val()==""){
				alert("장소가 작성되지 않았습니다.")
				return false;
			}else if($("#meetDay").val()==""){
				alert("날짜가 선택되지 않았습니다.")
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
			}else{
				$('#meetRegForm').submit();
			};
		});
		function setDate(meetDay){
			var inputDate = new Date();
			var yy = Number(meetDay.substring(0,4));
			var MM = Number(meetDay.substring(4,6));
			var dd = Number(meetDay.substring(6,8));
			var hh = $('#meetTime').data("timepicker").hour;
			var mi = $('#meetTime').data("timepicker").minute;
			inputDate.setFullYear(yy);
			inputDate.setMonth(MM-1);
			inputDate.setDate(dd);
			inputDate.setHours(hh);
			inputDate.setMinutes(mi);
			$('#meetDate').val(inputDate);
		}
		
	})
	</script>
</body>
</html>