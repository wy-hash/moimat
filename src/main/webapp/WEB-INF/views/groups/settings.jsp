<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">

<!-- HEAD -->
<%@ include file="../includes/head.jsp"%>
<title>설정 - ${ group.teamName } | moim@</title>

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
.customCenter {
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
							<li><a href="/groups/${ group.teamId }/schedule">모임일정</a></li>
							<li><a href="/groups/${ group.teamId }/photos">사진첩</a></li>
							<li><a href="/groups/${ group.teamId }/posts">게시판</a></li>
							<li><a href="/groups/${ group.teamId }/chat">채팅</a></li>
							<li class="active"><a href="/groups/${ group.teamId }/settings">설정</a>
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
								<li><a href="/groups/${ group.teamId }">홈</a></li>
								<li><a href="/groups/${ group.teamId }/member">구성원</a></li>
								<li><a href="/groups/${ group.teamId }/schedule">모임일정</a></li>
								<li><a href="/groups/${ group.teamId }/photos">사진첩</a></li>
								<li><a href="/groups/${ group.teamId }/posts">게시판</a></li>
								<li><a href="/groups/${ group.teamId }/chat">채팅</a></li>
								<li class="divider"></li>
								<li class="active"><a href="/groups/${ group.teamId }/settings">설정</a></li>
							</ul>
						</div>
						<!--===================================================-->

						<!--Tabs Content-->
						<div class="tab-content">
							<div class="content-box">
								<form id="modform" class="form-horizontal form-padding"
									action="/modGroup" method="post">
									<div class="panel">
										<div class="panel-heading">
											<h3 class="panel-title">모임 설정</h3>
										</div>
										<div class="panel-body">
											<div class="">
												<div class="form-group">
													<label class="col-sm-2 control-label">모임명</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" id="teamName"
															readonly="readonly">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label">최대인원</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" id="teamMax"
															name="teamMax">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label">간단소개</label>
													<div class="col-sm-9">
														<textarea id="teamShortContent" class="form-control"
															rows="3" name="teamShortContent" style="width:100%;resize:none;"></textarea>
													</div>
												</div>

												<div class="form-group">
													<label class="col-sm-2 control-label">관심사 선택</label>
													<div class="col-sm-9">
														<div class="row">
															<div class="col-xs-6">
																<select id="mainInt" tabindex="2">
																</select>
															</div>
															<div class="col-xs-6">
																<select id="subInt" tabindex="2">
																</select>
															</div>
														</div>
													</div>
													<input type="hidden" name="intId">
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label">지역 선택</label>
													<div class="col-sm-9">
														<div class="row">
															<div class="col-xs-6">
																<select id="mainArea" tabindex="2">
																</select>
															</div>
															<div class="col-xs-6">
																<select id="subArea" tabindex="2">
																</select>
															</div>
														</div>
													</div>
													<input type="hidden" name="areaId">
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label">소개글</label>
												</div>
											</div>
												<div class="form-group customCenter">
													<div class="col-xs-10">
														<textarea id="teamContent" name="teamContent"></textarea>
													</div>
													
												</div>
												<div class="form-group text-right">
													<div class="col-xs-11">
														<button type="button" id="cancelBtn" class="btn btn-default btn-hover-danger">취소하기</button>
														<button type="button" id="modBtn" class="btn btn-default btn-hover-warning">수정하기</button></div>
												</div>
										</div>
									</div>
									<input type="hidden" name="teamId">
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
	
	<%-- for modal --%>
	<c:if test="${ !empty loginVO }">
		<%@ include file="../includes/modals.jsp" %>
	</c:if>
	<%-- for modal --%>
	
	
	<script type="text/javascript" src="/resources/js/teamsetting.js"></script>
	<!--Bootbox Modals [ OPTIONAL ]-->
	<script src="/resources/plugins/bootbox/bootbox.min.js"></script>
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
					subIntOption += '<option data-intid='+data.subInterest[i].intId+'>'
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
				//선택된상태
				$('option[data-intkey='+data.selectedMainInt+']').prop("selected", true); 
				$('option[data-intid='+data.teamVO.intId+']').prop("selected", true);
				$('option[data-areakey='+data.selectedMainArea+']').prop("selected", true);
				$('option[data-areaid='+data.teamVO.areaId+']').prop("selected", true);
				//플러그인
				$('#mainInt').chosen({width: "100%"});
				$('#subInt').chosen({width: "100%"});
				$('#mainArea').chosen({width: "100%"});
				$('#subArea').chosen({width: "100%"});
				//select.onchage
				$('#mainInt').on('change',function(){
					var intkey = $('#mainInt option:selected').data('intkey');
					console.log(intkey)
					teamsetting.getSubInt(intkey);
				});
				$('#mainArea').on('change',function(){
					var areakey = $('#mainArea option:selected').data('areakey')
					teamsetting.getRegion(areakey);
				});
				$('#modBtn').on('click',function(e){
					e.preventDefault();
					var intid = $('#subInt option:selected').data('intid');
					var areaid = $('#subArea option:selected').data('areaid');
					$('input[name=intId]').val(intid);
					$('input[name=areaId]').val(areaid);
					$('input[name=teamId]').val(groupId);
					
					if($('#teamMax').val()==''||$('#teamShortContent').val()==''||$('#teamContent').val()==''){
						bootbox.alert("빈 항목이 있습니다.",function(){
				            $.niftyNoty({
				                type: 'info',
				                icon : 'pli-exclamation icon-2x',
				                message : '모든 항목을 작성해 주세요',
				                container : 'floating',
				                timer : 5000
				            });
						});
						return;
					}else if($('#teamMax').val()>100){
						bootbox.alert("모임 최대 인원은 100명 입니다.",function(){
				            $.niftyNoty({
				                type: 'info',
				                icon : 'pli-exclamation icon-2x',
				                message : '100이하의 숫자를 입력해주세요',
				                container : 'floating',
				                timer : 5000
				            });
						});
						return;
					}
					bootbox.confirm("저장하시겠습니까?", function(result) {
			            if (result) {
			            	$('#modform').submit();
			            }else{
			                $.niftyNoty({
			                    type: 'danger',
			                    icon : 'pli-cross icon-2x',
			                    message : '취소하였습니다.',
			                    container : 'floating',
			                    timer : 5000
			                });
			            };
			        });
					
				});
				
				$('#cancelBtn').on('click',function(e){
					bootbox.confirm("작성한 내용이 저장되지 않습니다.", function(result) {
			            if (result) {
			            	location.reload();
			            }else{
			                $.niftyNoty({
			                    type: 'danger',
			                    icon : 'pli-cross icon-2x',
			                    message : '취소하였습니다.',
			                    container : 'floating',
			                    timer : 5000
			                });
			            };
			        });
				});
				
				$("#teamMax").on("keyup", function() {
				    $(this).val($(this).val().replace(/[^0-9]/g,""));
				});

			});
		});
	</script>
</body>
</html>