<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">

<!-- HEAD -->
<%@ include file="../includes/head.jsp"%>
<title>설정 - ${ team.teamName } | moim@</title>

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
.centerm {
	display: flex;
	align-items: center;
	justify-content: center;
}
</style>
<!--Chosen [ OPTIONAL ]-->
    <link href="/resources/plugins/chosen/chosen.min.css" rel="stylesheet">
<!-- 썸머노트 css-->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css"
	rel="stylesheet">
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
					<h1 class="page-header text-overflow">{ _team.teamName_ }</h1>
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
							<li><a href="${ team.teamId }">홈</a></li>
							<li><a href="${ team.teamId }/member">구성원</a></li>
							<li><a href="${ team.teamId }/schedule">모임일정</a></li>
							<li><a href="${ team.teamId }/photos">사진첩</a></li>
							<li><a href="${ team.teamId }/posts">게시판</a></li>
							<li><a href="${ team.teamId }/chat">채팅</a></li>
							<li class="active"><a href="${ team.teamId }/settings">설정</a>
							</li>
						</ul>

						<!--Default Dropdown button-->
						<!--===================================================-->
						<div class="btn-group">
							<button class="btn btn-primary dropdown-toggle"
								data-toggle="dropdown" type="button">
								<i class="fa fa-bars"></i> 설정
							</button>
							<ul class="dropdown-menu dropdown-menu-left">
								<li><a href="${ team.teamId }">홈</a></li>
								<li><a href="${ team.teamId }/member">구성원</a></li>
								<li><a href="${ team.teamId }/schedule">모임일정</a></li>
								<li><a href="${ team.teamId }/photos">사진첩</a></li>
								<li><a href="${ team.teamId }/posts">게시판</a></li>
								<li><a href="${ team.teamId }/chat">채팅</a></li>
								<li class="divider"></li>
								<li class="active"><a href="${ team.teamId }/settings">설정</a></li>
							</ul>
						</div>
						<!--===================================================-->

						<!--Tabs Content-->
						<div class="tab-content">
							<div class="content-box">
								<form class="form-horizontal form-padding">
									<div class="panel">
										<div class="panel-heading">
											<h3 class="panel-title">모임 설정</h3>
										</div>
										<div class="panel-body">
											<div class="form-group">
												<label class="col-sm-1 control-label">모임명</label>
												<div class="col-sm-10">
													<div class="clearfix">
														<div class="col-xs-10">
															<input type="text" class="form-control" id="teamName">
														</div>
														<div class="col-xs-2">
															<button data-toggle="button" type="button" class="btn btn-default btn-active-warning">수정</button>
														</div>
													</div>
												</div>
											</div>
											<div class="form-group">
												<div class="row">
													<label class="col-sm-1 control-label">간단소개</label>
												</div>
												<div class="row centerm">
													<div class="col-xs-11">
														<textarea id="teamShortContent" class="form-control" rows="3"></textarea>
													</div>
												</div>
											</div>
											<div>
										관심사 <select id="mainInt" tabindex="2" style="width:300px">
											<option>관심사대분류</option>
										</select> <select id="subInt" style="width:300px">
											<option>관심사소분류</option>
										</select>
									</div>
									<div>
										지역 <select id="mainArea" style="width:300px">
											<option>지역대분류</option>
										</select> <select id="subArea" style="width:300px">
											<option>지역소분류</option>
										</select>
									</div>
										</div>
									</div>
									<h3>모임 소개</h3>
									<textarea id="teamContent"></textarea>
									
									팀원숫자<input type="text" id="teamMax"><br>
									<button type="button" class="btn btn-info">취소</button>
									<button type="button" class="btn btn-warning">수정</button>

								</form>
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
		<%@ include file="../includes/footer.jsp"%>
		<!-- END FOOTER -->

	</div>
	<!-- END CONTAINER -->
	<script type="text/javascript" src="/resources/js/teamsetting.js"></script>
	<!--Chosen [ OPTIONAL ]-->
    <script src="/resources/plugins/chosen/chosen.jquery.min.js"></script>
	<!-- 썸머노트 JS -->
	<script
		src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
	<script>
		$(document).ready(function() {
			
			var groupId = '<c:out value="${groupId}"/>';
			teamsetting.getPage(groupId,function(data){
				//첫 화면 시작
				$('#teamName').val(data.teamVO.teamName);
				$('#teamShortContent').val(data.teamVO.teamShortContent);
				$('#teamContent').val(data.teamVO.teamContent);
				$('#teamMax').val(data.teamVO.teamMax);
				//선택창
				$('#teamContent').summernote({
		        	placeholder: '내용을 입력해 주세요.',
		        	tabsize: 2,
		       	 	height: 400
				});
				var mainIntOption = '';
				var subIntOption = '';
				var mainAreaOption = '';
				var subAreaOption = '';
				//옵션태그
				for(var i = 0, len = data.mainInterest.length||0; i<len; i++){
					mainIntOption += '<option data-intkey='+data.mainInterest[i].intKey+'>'
								  + 	data.mainInterest[i].intName
								  +  '</option>'
				}
				for(var i = 0, len = data.subInterest.length||0; i<len; i++){
					subIntOption += '<option data-intid='+data.subInterest[i].intid+'>'
								 + 		data.subInterest[i].intName
								 +  '</option>'
				}
				for(var i = 0, len = data.areaKey.length||0; i<len; i++){
					mainAreaOption += '<option data-areakey='+data.areaKey[i].areaKey+'>'
								   +   		data.areaKey[i].areaName
								   +  '</option>'
				}
				for(var i = 0, len = data.areaRegionKey.length||0; i<len; i++){
					subAreaOption += '<option data-areaid='+data.areaRegionKey[i].areaId+'>'
								  +   	data.areaRegionKey[i].areaRegionName
								  +  '</option>'
				}
				
				$("#mainInt").html(mainIntOption);
				$("#subInt").html(subIntOption);
				$("#mainArea").html(mainAreaOption);
				$("#subArea").html(subAreaOption);
				$('#mainInt').chosen();
				$('#subInt').chosen();
				$('#mainArea').chosen();
				$('#subArea').chosen();
				//선택된상태
				$('option[data-intkey='+data.selectedMainInt+']').prop("selected", true); 
				$('option[data-intid='+data.teamVO.intId+']').prop("selected", true);
				$('option[data-areakey='+data.selectedMainArea+']').prop("selected", true);
				$('option[data-areaid='+data.teamVO.areaId+']').prop("selected", true);
				//끝
				//select.onchage
				$('#mainInt').on('change',function(){
					var intkey = $('#mainInt option:selected').data('intkey')
					console.log(intkey);
					teamsetting.getSubInt(intkey);
				});
				$('#mainArea').on('change',function(){
					var areakey = $('#mainArea option:selected').data('areakey')
					teamsetting.getRegion(areakey);
				});
				
			});
		});
	</script>
</body>
</html>