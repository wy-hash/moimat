<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">

<!-- HEAD -->
<%@ include file="../includes/head.jsp"%>


<title>구성원 - ${ team.teamName } | moim@</title>


<style>
@media screen and (max-width: 768px) {
	.tab-base>ul {
		display: none;
	}
	.tab-base>.btn-group {
		display: inline-block;
	}
	#adminList>div:nth-child(1)>div.col-xs-5.col-sm-6.col-md-6.col-lg-7>p:nth-child(2)
		{
		display: none;
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
<!--Bootbox Modals [ OPTIONAL ]-->
<script src="/resources/plugins/bootbox/bootbox.min.js"></script>
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
							<li class="active"><a
								href="/groups/${ group.teamId }/member">구성원</a></li>
							<li><a href="/groups/${ group.teamId }/schedule">모임일정</a></li>
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
								<i class="fa fa-bars"></i> 구성원
							</button>
							<ul class="dropdown-menu dropdown-menu-left">
								<li><a href="/groups/${ group.teamId }">홈</a></li>
								<li class="active"><a
									href="/groups/${ group.teamId }/member">구성원</a></li>
								<li><a href="/groups/${ group.teamId }/schedule">모임일정</a></li>
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
								<div class="panel">

									<!--Panel heading-->
									<div class="panel-heading">
										<div class="panel-control">
											<ul class="nav nav-tabs" id="moimTab">

											</ul>
										</div>
										<h3 class="panel-title">모임원 관리</h3>
									</div>

									<!--Panel body-->
									<div class="panel-body">
										<div class="tab-content">
											<!-- 유저 -->
											<div class="tab-pane fade active in" id="member-tabs-box">
												<div class="row">
													<div class="col-xs-6 col-sm-7 col-md-7 col-lg-8 text-left">
														<label class="numberOfPeople mar-ver"></label>
													</div>
													<div class="col-xs-6 col-sm-5 col-md-5 col-lg-4 text-right">
														<div class="input-group">
															<input type="text" class="form-control"
																id="memberSearchKeyword" /> <span id="memberSearchBtn"
																class="btn btn-dark input-group-addon"> <i
																class="fa fa-search"> </i>
															</span>
														</div>
													</div>
												</div>
												<div id="memberList"></div>
												<div class="paginationBtn text-right mar-top"></div>
											</div>
											<!-- 관리자용 -->
											<div class="tab-pane fade" id="admin-tabs-box">
												<div class="row">
													<div class="col-xs-6 col-sm-7 col-md-7 col-lg-8 text-left">
														<div class="input-group">
															<select id="select" class="form-control">
																<option value="member">멤버보기</option>
																<option value="manager">운영진보기</option>
																<option value="waiting">가입대기인원</option>
																<option value="block">차단멤버보기</option>
															</select>
														</div>
													</div>
													<div class="col-xs-6 col-sm-5 col-md-5 col-lg-4 text-right">
														<div class="input-group">
															<input type="text" class="form-control"
																id="adminSearchKeyword" /> <span id="adminSearchBtn"
																class="btn btn-dark input-group-addon"> <i
																class="fa fa-search"> </i>
															</span>
														</div>
													</div>
												</div>

												<div>
													<label class="numberOfPeople mar-ver"></label>
												</div>
												<div class="row mar-ver">
													<div class="col-xs-1 text-center" id="chkdiv">
														<input type="checkbox" id="chkall">
													</div>
													<div class="col-xs-11"></div>
												</div>
												<div id="adminList"></div>
												<div id="adminbutton" class="mar-top">
													<p>
														선택한 회원을
														<button type="button" id="block-confirm"
															class="btn btn-default btn-hover-warning">차단하기</button>
														<button type="button" id="delete-confirm"
															class="btn btn-default btn-hover-danger">삭제하기</button>
													</p>
												</div>
												<div class="paginationBtn text-right mar-top"></div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!--===================================================-->
					<!--End Default Tabs (Left Aligned)-->
					<!-- modal -->
					<div class="modal" id="memberModal" tabindex="-1"
						style="display: none;" id="moimat-modal">
						<div class="modal-dialog modal-sm">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">
										<i class="pci-cross pci-circle"></i>
									</button>
									<h4 class="modal-title" id="moimat-modal-title">멤버보기</h4>
								</div>
								<div class="modal-body" id="moimat-modal-body">
									<div class="clearfix">
										<div class="col-xs-3" id="modalMPhoto">Photo</div>
										<div class="col-xs-9 text-center">
											<input type="hidden" id="modalTmemId" value="">
											<p id="modalMNickName"></p>
											<p id="modalMId"></p>
											<div id="gradeBox"></div>
										</div>
									</div>
								</div>
								<div class="modal-footer customCenter" id="buttonBox"></div>
							</div>
						</div>
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
	<%-- for modal --%>
	<c:if test="${ !empty loginVO }">
		<%@ include file="../includes/modals.jsp"%>
	</c:if>
	<!--Bootbox Modals [ OPTIONAL ]-->
	<script src="/resources/plugins/bootbox/bootbox.min.js"></script>
	<%-- for modal --%>
	<script type="text/javascript" src="/resources/js/teammember.js"></script>
	<script>
		$(document).ready(function() {
			var groupId = '<c:out value="${groupId}"/>';
			var memberId = '<c:out value="${sessionScope.loginVO.memId}"/>';
			var teamName = '<c:out value="${group.teamName}"/>';
			var pageNum = 1;
			var type = "";
			var keyword = "";
			
			teamMember.isAdmin(groupId,memberId,function(result){
				var tab = '';
				if(result){
					tab = '<li class="active">'
						+		'<a href="#member-tabs-box" data-toggle="tab" id="memberTab" aria-expanded="false">모임원 목록</a>'
						+ '</li>'
					    + '<li class="">'
						+ 	'<a href="#admin-tabs-box" data-toggle="tab" id="adminonly" aria-expanded="true">'
						+		'회원관리'
						+	'</a>'
						+ '</li>';
				}else{
					tab = '<li class="active">'
						+     '<a href="#demo-tabs-box-1"data-toggle="tab" id="memberTab" aria-expanded="false">모임원 목록</a>'
						+ '</li>'
				}
				$("#moimTab").html(tab);
			});
			
			
			function showList(tabid,status,withcheck){
				var param = {"groupId" : groupId,"status" : status, "pageNum" : pageNum,"type":type, "keyword":keyword};
				teamMember.getList(param,function(data){
					var listHtml = '';
					var checkbox = '';
					for(var i = 0, len = data.getMember.length||0; i<len; i++){
						if(withcheck){
							if(data.getMember[i].tmemLevel<7){
								checkbox =	'<div class="col-xs-1 customCenter" style="min-height:48px;">'
										 +		'<input type="checkbox" class="chk" data-tid="'+data.getMember[i].tmemId+'">'
										 +	'</div>'
							}else{
								checkbox = '<div class="col-xs-1" style="min-height:48px;"></div>'		 
							}
							listHtml +=     '<div class="row pad-ver '+(i%2==0 ? '' : 'bg-trans-dark')+'">'
									 + 			checkbox
									 +		'<div class="col-xs-8 col-sm-9 clearfix">'
									 +		'<div class="text-center mar-rgt" style="width:63px !important; display:inline-block;">'
									 +			'<img class="img-sm img-circle" src="/resources/img/profile-photos/'+data.getMember[i].tmemPhoto+'" alt="Profile Picture">'
									 +		'</div>'
									 +   	'<div style="vertical-align: middle; display:inline-block;">'
									 + 			'<a class="memclick" data-tid="'+data.getMember[i].tmemId+'"><h4 class="mar-no text-main">'+data.getMember[i].tmemNickName+'</h4></a>'
									 +		'<small> 마지막 방문일 : '+teamMember.parseDate(data.getMember[i].tmemLastVisit)+'</small>'
									 +		'</div>'			
									 +		'</div>'
									 + 		'<div class="col-xs-3 col-sm-2 customCenter" style="min-height:46px;">'
									 +			'<strong>'+data.grade[data.getMember[i].tmemLevel]+'</strong>'
									 +		'</div>'
									 +		'</div>'
						}else{
							listHtml +=     '<div class="row pad-ver '+(i%2==0 ? '' : 'bg-trans-dark')+'">'
									 +		'<div class="col-xs-9 col-sm-10 clearfix">'
									 +		'<div class="text-center mar-rgt" style="width:63px !important; display:inline-block;">'
									 +			'<img class="img-sm img-circle" src="/resources/img/profile-photos/'+data.getMember[i].tmemPhoto+'" alt="Profile Picture">'
									 +		'</div>'
									 +   	'<div style="vertical-align: middle; display:inline-block;">'
									 + 			'<a class="memclick" data-tid="'+data.getMember[i].tmemId+'"><h4 class="mar-no text-main">'+data.getMember[i].tmemNickName+'</h4></a>'
									 +		'<small> 마지막 방문일 : '+teamMember.parseDate(data.getMember[i].tmemLastVisit)+'</small>'
									 +		'</div>'			
									 +		'</div>'
									 + 		'<div class="col-xs-3 col-sm-2 customCenter" style="min-height:46px;">'
									 +			'<strong>'+data.grade[data.getMember[i].tmemLevel]+'</strong>'
									 +		'</div>'
									 +		'</div>'
						}
					}
					$("#"+tabid).html(listHtml);
					var numberOfPeople = "";
					if(status == "manager"){
						numberOfPeople = "운영진 : " + data.teamMemberCount + "명";
					}else if(status == "block"){
						numberOfPeople = "차단한 모임원 : " + data.teamMemberCount + "명";
					}else if(status == "waiting"){
						numberOfPeople = "가입 대기 : " + data.teamMemberCount + "명";
					}else if(status == "member"){
						numberOfPeople = "모임원 : " + data.teamMemberCount + "명";
					}
					
					$(".numberOfPeople").text(numberOfPeople);
					$(".paginationBtn").html(memberPageBtn(data.teamMemberCount));
					$(".paginationBtn").on('click','.page-link', function(e){
						e.preventDefault();
						var targetPageNum = $(this).attr("href");
						pageNum = targetPageNum;
						console.log(pageNum);
						showList(tabid,$('#select').val(),(tabid=='adminList'));
					});
					
				});
			}
			
			showList('memberList','member',false);
			
			$("#adminSearchBtn").on('click',function(){
				var searchKeyword = $("#adminSearchKeyword").val();
				if(searchKeyword == ''){
					alert("검색어를 입력해주세요");
					return;
				}
				type = 'S';
				keyword = searchKeyword;
				showList('adminList',$('#select').val(),true);
			});
			$("#memberSearchBtn").on('click',function(){
				var searchKeyword = $("#memberSearchKeyword").val();
				if(searchKeyword == ''){
					alert("검색어를 입력해주세요");
					return;
				}
				type = 'S';
				keyword = searchKeyword;
				showList('memberList',$('#select').val(),false);
			});
			
			$("#moimTab").on('show.bs.tab','#memberTab',function(){ // 다시 멤버탭으로 돌아왔을때 갱신이 필요함 .. 흠 ...
				showList('memberList','member',false);
			});
			$("#moimTab").on('hide.bs.tab','#memberTab',function(){ // 탭에서 벗어날때 초기화해야한다.
				pageNum = 1;
				type = '';
				keyword = '';
				$("#memberSearchType").val('');
				$("#memberSearchKeyword").val('');
			});
			
			$("#moimTab").on('shown.bs.tab','#adminonly',function(){
				var selected = $("#select").val();
				showList('adminList',selected,true);
			});
			$("#moimTab").on('hide.bs.tab','#adminonly',function(){
				pageNum = 1;
				type = '';
				keyword = '';
				$("#select").val('member');
				$("#adminSearchType").val('');
				$("#adminSearchKeyword").val('');
			});
			
			$("#adminList").on("click",".memclick",function(){
				var gradeBox = '';
				var buttonBox = '';
				teamMember.getMember($(this).data("tid"),function(e){
					var photo = '<img class="img-sm img-circle" src="/resources/img/profile-photos/'+e.tmemPhoto+'" alt="Profile Picture">';
					teamMember.isMaster(groupId,memberId,function(b){
						if(e.tmemLevel == 9){
							gradeBox = '<button type="button"'
								 +		'class="btn btn-dark">모임장</button>';
						}else if(e.tmemLevel == 7){
							if(b){
								gradeBox = '회원 등급 : '
										 + '<select id="modalSelect">'
										 + 		'<option value="2" name="일반회원">일반회원</option>'	
										 +		'<option value="3" name="우수회원">우수회원</option>'
										 +		'<option value="7" name="운영진">운영진</option>'
										 +		'<option value="9" name="모임장">모임장</option>'
									 	 + '</select>';
								buttonBox = '<button id="modalUpdateBtn" type="button"'
										  +		'class="btn btn-default btn-hover-info">등급조정</button>'
										  +	'<button id="modalBlockBtn" type="button"'
										  +	'class="btn btn-default btn-hover-warning">차단하기</button>'
										  + '<button id="modalDeleteBtn" type="button"'
										  + 	'class="btn btn-default btn-hover-danger">삭제하기</button>';
							}else{
								gradeBox = '<button type="button"'
									 +		'class="btn btn-pink">운영진</button>';
							}
						}else if(e.tmemLevel == 0){
							gradeBox = '<button id="modalReleseBtn" type="button"'
									 +		'class="btn btn-default btn-hover-dark">차단해제하기</button>';
							buttonBox = '<button id="modalDeleteBtn" type="button"'
								 	  + 		'class="btn btn-default btn-hover-danger">삭제하기</button>';
						}else if(e.tmemLevel == 1){
							gradeBox = '<button id="modalAdmissionBtn" type="button"'
								     +		'class="btn btn-default btn-hover-pink">가입승인하기</button>';
							buttonBox = '<button id="modalDeleteBtn" type="button"'
							 	  	  + 	'class="btn btn-default btn-hover-danger">삭제하기</button>';
						}else{
							if(b){
								gradeBox = '회원 등급 : '
									 + '<select id="modalSelect">'
									 + 		'<option value="2" name="일반회원">일반회원</option>'	
									 +		'<option value="3" name="우수회원">우수회원</option>'
									 +		'<option value="7" name="운영진">운영진</option>'
									 +		'<option value="9" name="모임장">모임장</option>'
									 + '</select>';
							}else{
								gradeBox = '회원 등급 : '
									 + '<select id="modalSelect">'
									 + 		'<option value="2" name="일반회원">일반회원</option>'	
									 +		'<option value="3" name="우수회원">우수회원</option>'
									 + '</select>';
							}
							buttonBox = '<button id="modalUpdateBtn" type="button"'
									  +		'class="btn btn-default btn-hover-info">등급조정</button>'
									  +	'<button id="modalBlockBtn" type="button"'
									  +		'class="btn btn-default btn-hover-warning">차단하기</button>'
									  + '<button id="modalDeleteBtn" type="button"'
									  + 	'class="btn btn-default btn-hover-danger">삭제하기</button>';
						}
						$("#gradeBox").html(gradeBox);
						$("#buttonBox").html(buttonBox);
						$("#modalSelect").val(e.tmemLevel);
					});
					// 여기에 사진 추가해야함 ..
					$("#modalMPhoto").html(photo);
					$("#modalTmemId").val(e.tmemId);
					$("#modalMNickName").text(e.tmemNickName);
					$("#modalMId").text(e.tmemEmail);
				});
				$("#memberModal").modal('show');
			});
			$('#select').on('change',function(e){
				pageNum = 1;
				var btnhtml = ''
					// 운영진 등급은 체크박스를통한 설정을 할 수 없음 
					// (네이버같은데 보니까 매니저 등록하면 하나하나 클릭해야했어서 이렇게 함)
				if($(this).val()=='manager'){ 
					$('#chkdiv').addClass("hidden");
				}else{
					if($('#chkdiv').hasClass("hidden")){
						$('#chkdiv').removeClass("hidden");
					}
				}
				if($(this).val()=='member'){
					btnhtml = '<p> 선택한 회원을'
							+	 '<button type="button" id="block-confirm" class="btn btn-default btn-hover-warning">차단하기</button>'
							+	 '<button type="button" id="delete-confirm" class="btn btn-default btn-hover-danger">삭제하기</button>'
							+ '</p>'
				}else if($(this).val()=='block'){
					btnhtml = '<p> 선택한 회원을'
							+	 '<button type="button" id="block-relese" class="btn btn-default btn-hover-warning">차단해제하기</button>'
							+	 '<button type="button" id="delete-confirm" class="btn btn-default btn-hover-danger">삭제하기</button>'
							+ '</p>'
				}else if($(this).val()=='waiting'){
					btnhtml = '<p> 선택한 회원을'
						+	 '<button type="button" id="admission" class="btn btn-default btn-hover-info">승인하기</button>'
						+	 '<button type="button" id="delete-confirm" class="btn btn-default btn-hover-danger">삭제하기</button>'
						+ '</p>'
				}
				$('#adminbutton').html(btnhtml);
				showList('adminList',$(this).val(),true);
			});
			
			$('#chkall').on('click',function(){
				if($("#chkall").prop("checked")){
		            $(".chk").prop("checked",true);
		        }else{
		            $(".chk").prop("checked",false);
		        }
			});
			
			$('#adminbutton').on('click','#block-confirm', function(){
				 var tmemIds = [];
				 $('.chk').each(function(){
					if(this.checked){
						tmemIds.push($(this).data('tid'));
					}
				 });
				 
				 var teamData = {"tmemIds" : tmemIds, "teamName" : teamName, "memberId" : memberId, "tmemLevel" : 0};
				 	
				 if(tmemIds.length != 0){
					 bootbox.confirm("선택한 회원을 차단 하시겠습니까?", function(result) {
				            if (result) {
				            	$.ajax({
				            		type : 'put',
				            		url : '/changelevel',
				            		datatype : "json",
				            		data : JSON.stringify(teamData),
				            		contentType : "application/json; charset=utf-8",
				            		success : function(result){
				            			showList('adminList',$('#select').val(),true);
				            		}
				            	});
				            	$.niftyNoty({
				                    type: 'success',
				                    icon : 'pli-like-2 icon-2x',
				                    message : '선택한 회원을 차단 하였습니다.',
				                    container : 'floating',
				                    timer : 5000
				                });
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
				 }else{
					 bootbox.alert("선택한 회원이 없습니다.")
				 }
			 });
			
			 $('#adminbutton').on('click','#delete-confirm',function(){
				 var tmemIds = [];
				 $('.chk').each(function(){
					if(this.checked){
						tmemIds.push($(this).data('tid'));
					}
				 })
				 var teamData = {"tmemIds" : tmemIds, "teamName" : teamName, "memberId" : memberId};
				 if(tmemIds.length != 0){
					 bootbox.confirm("선택한 회원을 삭제 하시겠습니까?", function(result) {
				            if (result) {
				            	$.ajax({
				            		type : 'delete',
				            		url : '/deletemember',
				            		datatype : "json",
				            		data : JSON.stringify(teamData),
				            		contentType : "application/json; charset=utf-8",
				            		success : function(result){
				            			showList('adminList',$('#select').val(),true);
				            		}
				            	});
				            	$.niftyNoty({
				                    type: 'success',
				                    icon : 'pli-like-2 icon-2x',
				                    message : '선택한 회원을 삭제 하였습니다.',
				                    container : 'floating',
				                    timer : 5000
				                });
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
				 }else{
					 bootbox.alert("선택한 회원이 없습니다.")
				 }
			 });
			 
			 $('#adminbutton').on('click','#block-relese', function(){
				 var tmemIds = [];
				 $('.chk').each(function(){
					if(this.checked){
						tmemIds.push($(this).data('tid'));
					}
				 })
				 var teamData = {"tmemIds" : tmemIds, "teamName" : teamName, "memberId" : memberId, "tmemLevel" : 2};	
				 if(tmemIds.length != 0){
					 bootbox.confirm("선택한 회원을 차단해제 하시겠습니까?", function(result) {
				            if (result) {
				            	$.ajax({
				            		type : 'put',
				            		url : '/relesemember',
				            		datatype : "json",
				            		data : JSON.stringify(teamData),
				            		contentType : "application/json; charset=utf-8",
				            		success : function(result){
				            			showList('adminList',$('#select').val(),true);
				            		}
				            	});
				            	$.niftyNoty({
				                    type: 'success',
				                    icon : 'pli-like-2 icon-2x',
				                    message : '선택한 회원을 차단해제 하였습니다.',
				                    container : 'floating',
				                    timer : 5000
				                });
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
				 }else{
					 bootbox.alert("선택한 회원이 없습니다.")
				 }
			 });
			 $('#adminbutton').on('click','#admission', function(){
				 var tmemIds = [];
				 $('.chk').each(function(){
					if(this.checked){
						tmemIds.push($(this).data('tid'));
					}
				 });
				 var teamData = {"tmemIds" : tmemIds, "teamName" : teamName, "memberId" : memberId, "tmemLevel" : 2};	
				 if(tmemIds.length != 0){
					 bootbox.confirm("선택한 회원을 가입승인 하시겠습니까?", function(result) {
				            if (result) {
				            	$.ajax({
				            		type : 'put',
				            		url : '/admission',
				            		datatype : "json",
				            		data : JSON.stringify(teamData),
				            		contentType : "application/json; charset=utf-8",
				            		success : function(result){
				            			showList('adminList',$('#select').val(),true);
				            		}
				            	});
				            	$.niftyNoty({
				                    type: 'success',
				                    icon : 'pli-like-2 icon-2x',
				                    message : '선택한 회원을 가입승인 하였습니다.',
				                    container : 'floating',
				                    timer : 5000
				                });
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
				 }else{
					 bootbox.alert("선택한 회원이 없습니다.")
				 }
				 
			 });
			 
			
			$("#buttonBox").on("click","#modalUpdateBtn",function(){
				$("#memberModal").modal("hide");
				var mNickName = $("#modalMNickName").text();
				var mGrade = $("#modalSelect option:selected").attr("name");
				var modalData = {};
				var confirmText = ''
				if($('#modalSelect').val()==9){//5는 운영진 등급 
					modalData = {"tmemIds" : [$('#modalTmemId').val()],"teamName" : teamName, "memberId" : memberId, "tmemLevel" : $('#modalSelect').val(),"teamId":groupId};
					confirmText = '모임장을 위임 하시겠습니까? 위임시 회원님의 해당 모임에서 일반회원이 됩니다.'
					bootbox.confirm(confirmText, function(result) {
				       		 if (result) {
				            	$.ajax({
				            		type : 'put',
				            		url : '/changeMaster',
				            		data : JSON.stringify(modalData),
				            		contentType : "application/json; charset=utf-8",
				            		success : function(result){
				            			location.reload(); //성공하면 새로고침
				            		}
				            	});
				            	$.niftyNoty({
				                    type: 'success',
				                    icon : 'pli-like-2 icon-2x',
				                    message : '모임장을 위임하였습니다.',
				                    container : 'floating',
				                    timer : 5000
				                });
				            }else{
				                $.niftyNoty({
				                    type: 'danger',
				                    icon : 'pli-cross icon-2x',
				                    message : '취소하였습니다.',
				                    container : 'floating',
				                    timer : 5000
				                });
				                $("#memberModal").modal("show");
				            };

				        });
				}else{
					modalData = {"tmemIds" : [$('#modalTmemId').val()],"teamName" : teamName, "memberId" : memberId, "tmemLevel" : $('#modalSelect').val()};
					confirmText = mNickName +"님의 등급을 " + mGrade + "로 변경하시겠습니까?";
					bootbox.confirm(confirmText, function(result) {
				            if (result) {
				            	$.ajax({
				            		type : 'put',
				            		url : '/changelevel',
				            		data : JSON.stringify(modalData),
				            		contentType : "application/json; charset=utf-8",
				            		success : function(result){
						            	showList('adminList',$('#select').val(),true);
				            		}
				            	});
				            	$.niftyNoty({
				                    type: 'success',
				                    icon : 'pli-like-2 icon-2x',
				                    message : '선택한 회원정보를 변경 하였습니다.',
				                    container : 'floating',
				                    timer : 5000
				                });
				            	$("#memberModal").modal("show"); //왠진 모르겠지만 여기 말고 success에 넣으면 이상하게 작동함??
				            }else{
				                $.niftyNoty({
				                    type: 'danger',
				                    icon : 'pli-cross icon-2x',
				                    message : '취소하였습니다.',
				                    container : 'floating',
				                    timer : 5000
				                });
				                $("#memberModal").modal("show");
				            };

				        });
				}
			});
			
			$('#buttonBox').on('click','#modalBlockBtn',function(){
				$("#memberModal").modal("hide");
				var mNickName = $("#modalMNickName").text();
				var confirmText = mNickName + " 님을 차단하시겠습니까?";
				var modalData = {"tmemIds" : [$('#modalTmemId').val()], "teamName" : teamName, "memberId" : memberId, "tmemLevel" : 0 };
				bootbox.confirm(confirmText,function(result){
					if (result) {
		            	$.ajax({
		            		type : 'put',
		            		url : '/changelevel',
		            		datatype : "json",
		            		data : JSON.stringify(modalData),
		            		contentType : "application/json; charset=utf-8",
		            		success : function(result){
		            			showList('adminList',$('#select').val(),true);
		            		}
		            	});
		            	$.niftyNoty({
		                    type: 'success',
		                    icon : 'pli-like-2 icon-2x',
		                    message : mNickName + '님을 차단 하였습니다.',
		                    container : 'floating',
		                    timer : 5000
		                });
		            	  
		            }else{
		                $.niftyNoty({
		                    type: 'danger',
		                    icon : 'pli-cross icon-2x',
		                    message : '취소하였습니다.',
		                    container : 'floating',
		                    timer : 5000
		                });
		                
		                $("#memberModal").modal("show");
		            };
				})
			});
			
			$('#buttonBox').on('click','#modalDeleteBtn',function(){
				$("#memberModal").modal("hide");
				var mNickName = $("#modalMNickName").text();
				var confirmText = mNickName + " 님을 강제탈퇴 하시겠습니까?";
				var modalData = {"tmemIds" : [$('#modalTmemId').val()], "teamName" : teamName, "memberId" : memberId};
				bootbox.confirm(confirmText,function(result){
					if (result) {
		            	$.ajax({
		            		type : 'delete',
		            		url : '/deletemember',
		            		datatype : "json",
		            		data : JSON.stringify(modalData),
		            		contentType : "application/json; charset=utf-8",
		            		success : function(result){
		            			showList('adminList',$('#select').val(),true);
		            		}
		            	});
		            	$.niftyNoty({
		                    type: 'success',
		                    icon : 'pli-like-2 icon-2x',
		                    message : mNickName + '님을 강제탈퇴 하였습니다.',
		                    container : 'floating',
		                    timer : 5000
		                });
		            	  
		            }else{
		                $.niftyNoty({
		                    type: 'danger',
		                    icon : 'pli-cross icon-2x',
		                    message : '취소하였습니다.',
		                    container : 'floating',
		                    timer : 5000
		                });
		                $("#memberModal").modal("show");
		            };
				})
			});
			$('#gradeBox').on('click','#modalReleseBtn',function(){
				$("#memberModal").modal("hide");
				var mNickName = $("#modalMNickName").text();
				var confirmText = mNickName + " 님을 차단해제 하시겠습니까?";
				var modalData = {"tmemIds" : [$('#modalTmemId').val()], "teamName" : teamName, "memberId" : memberId,"tmemLevel" : 2};
				bootbox.confirm(confirmText,function(result){
					if (result) {
		            	$.ajax({
		            		type : 'put',
		            		url : '/relesemember',
		            		datatype : "json",
		            		data : JSON.stringify(modalData),
		            		contentType : "application/json; charset=utf-8",
		            		success : function(result){
		            			showList('adminList',$('#select').val(),true);
		            		}
		            	});
		            	$.niftyNoty({
		                    type: 'success',
		                    icon : 'pli-like-2 icon-2x',
		                    message : mNickName + '님을 차단해제 하였습니다.',
		                    container : 'floating',
		                    timer : 5000
		                });
		            }else{
		                $.niftyNoty({
		                    type: 'danger',
		                    icon : 'pli-cross icon-2x',
		                    message : '취소하였습니다.',
		                    container : 'floating',
		                    timer : 5000
		                });
		                $("#memberModal").modal("show");
		            };
				})
			});
			
			$('#gradeBox').on('click','#modalAdmissionBtn',function(){
				$("#memberModal").modal("hide");
				var mNickName = $("#modalMNickName").text();
				var confirmText = mNickName + " 님을 가입승인 하시겠습니까?";
				var modalData = {"tmemIds" : [$('#modalTmemId').val()], "teamName" : teamName, "memberId" : memberId,"tmemLevel" : 2};
				bootbox.confirm(confirmText,function(result){
					if (result) {
		            	$.ajax({
		            		type : 'put',
		            		url : '/admission',
		            		datatype : "json",
		            		data : JSON.stringify(modalData),
		            		contentType : "application/json; charset=utf-8",
		            		success : function(result){
		            			showList('adminList',$('#select').val(),true);
		            		}
		            	});
		            	$.niftyNoty({
		                    type: 'success',
		                    icon : 'pli-like-2 icon-2x',
		                    message : mNickName + '님을 가입승인 하였습니다.',
		                    container : 'floating',
		                    timer : 5000
		                });
		            	  
		            }else{
		                $.niftyNoty({
		                    type: 'danger',
		                    icon : 'pli-cross icon-2x',
		                    message : '취소하였습니다.',
		                    container : 'floating',
		                    timer : 5000
		                });
		                $("#memberModal").modal("show");
		            };
				});
			});
			
			function memberPageBtn(memberCount){
				var endNum = Math.ceil(pageNum/10.0) * 10;
				var startNum = endNum - 9;
				
				var prev = startNum != 1;
				var next = false;
				
				if(endNum * 10 > memberCount){
					endNum = Math.ceil(memberCount/10.0);
				}
				
				if(endNum * 10 < memberCount){
					next = true;
				}
				
				var paginationBtn  = "<ul class='pagination mar-no'>";
				
				if(prev){
					paginationBtn += "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
				}
				
				for(var i = startNum ; i <= endNum; i++){
					var active = pageNum == i ? "active" : "";
					
					paginationBtn += "<li class='page-item "+active+"'><a class='page-link' href='"+i+"'>"+i+"</a></li>";
				}
				
				if(next){
					paginationBtn += "<li class='page-item'><a class='page-link' href='" + (endNum + 1) +"'>Next</a></li>'";
				}
				
				paginationBtn += "</ul>"
				
				return paginationBtn;
			}
		});
	</script>
</body>
</html>