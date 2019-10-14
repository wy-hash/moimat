<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">

<!-- HEAD -->
<%@ include file="../includes/head.jsp"%>
<!--Bootbox Modals [ OPTIONAL ]-->
<script src="/resources/plugins/bootbox/bootbox.min.js"></script>
<title>구성원 - ${ team.teamName } | moim@</title>

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
							<li class="active"><a href="${ team.teamId }/member">구성원</a>
							</li>
							<li><a href="${ team.teamId }/schedule">모임일정</a></li>
							<li><a href="${ team.teamId }/photos">사진첩</a></li>
							<li><a href="${ team.teamId }/posts">게시판</a></li>
							<li><a href="${ team.teamId }/chat">채팅</a></li>
							<li><a href="${ team.teamId }/settings">설정</a></li>
						</ul>

						<!--Default Dropdown button-->
						<!--===================================================-->
						<div class="btn-group">
							<button class="btn btn-primary dropdown-toggle"
								data-toggle="dropdown" type="button">
								<i class="fa fa-bars"></i> 구성원
							</button>
							<ul class="dropdown-menu dropdown-menu-left">
								<li><a href="${ team.teamId }">홈</a></li>
								<li class="active"><a href="${ team.teamId }/member">구성원</a></li>
								<li><a href="${ team.teamId }/schedule">모임일정</a></li>
								<li><a href="${ team.teamId }/photos">사진첩</a></li>
								<li><a href="${ team.teamId }/posts">게시판</a></li>
								<li><a href="${ team.teamId }/chat">채팅</a></li>
								<li class="divider"></li>
								<li><a href="${ team.teamId }/settings">설정</a></li>
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
										<h3 class="panel-title">Panel With tabs</h3>
									</div>

									<!--Panel body-->
									<div class="panel-body">
										<div class="tab-content">
											<div class="tab-pane fade active in" id="demo-tabs-box-1">
												<div class="table-toolbar-right pad-no">
													<select id="memberSearchType">
														<option value="">--</option>
														<option value="E">이메일</option>
														<option value="N">별명</option>
													</select>
													<div class="form-group">
														<input type="text" class="form-control"
															id="memberSearchKeyword" />
													</div>
													<button id="memberSearchBtn" type="button"
														class="btn btn-dark">
														<i class="fa fa-search"> </i>
													</button>
												</div>
												<div class="table-responsive">
													<table class="table table-striped">
														<thead>
															<tr>
																<th class="col-md-1 text-center">#</th>
																<th class="col-md-1">Photo</th>
																<th class="col-md-6">information</th>
																<th class="col-md-2 text-center">grade</th>
															</tr>
														</thead>
														<tbody id="memberList">
														</tbody>
													</table>
												</div>
												<div class="paginationBtn" style="height: 32px"></div>
											</div>
											<div class="tab-pane fade" id="demo-tabs-box-2">
												<div class="table-toolbar-right pad-no">
													<select id="adminSearchType">
														<option value="">--</option>
														<option value="E">이메일</option>
														<option value="N">별명</option>
													</select>
													<div class="form-group">
														<input type="text" class="form-control"
															id="adminSearchKeyword" />
													</div>
													<button id="adminSearchBtn" type="button"
														class="btn btn-dark">
														<i class="fa fa-search"> </i>
													</button>
												</div>
												<div>
													<select id="select">
														<option value="member">멤버보기</option>
														<option value="manager">운영진보기</option>
														<option value="waiting">가입대기인원</option>
														<option value="block">차단멤버보기</option>
													</select>
												</div>
												<div class="table-responsive">
													<table class="table table-striped">
														<thead>
															<tr>
																<th class="col-md-1 text-center">
																	<p class="text-xs">전체선택</p> <input type="checkbox"
																	id="chkall">
																</th>
																<th class="col-md-1 text-center">#</th>
																<th class="col-md-1">Photo</th>
																<th class="col-md-6">information</th>
																<th class="col-md-2 text-center">grade</th>
															</tr>
														</thead>
														<tbody id="adminList">

														</tbody>
													</table>
												</div>
												<div id="adminbutton">
													<p>
														선택한 회원을
														<button type="button" id="block-confirm"
															class="btn btn-default btn-hover-warning">차단하기</button>
														<button type="button" id="delete-confirm"
															class="btn btn-default btn-hover-danger">삭제하기</button>
													</p>
												</div>
												<div class="paginationBtn" style="height: 32px"></div>
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
										<div class="col-xs-9">
											<input type="hidden" id="modalTmemId" value="">
											<p id="modalMNickName"></p>
											<p id="modalMId"></p>
											<div id="gradeBox"></div>
										</div>
									</div>
								</div>
								<div class="modal-footer centerm" id="buttonBox"></div>
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
	<%-- for modal --%>
	<script type="text/javascript" src="/resources/js/teammember.js"></script>
	<script>
		$(document).ready(function() {
			var groupId = '<c:out value="${groupId}"/>';
			var memberId = '<c:out value="${sessionScope.loginVO.memId}"/>';
			var teamName = '임시 모임명';
			var pageNum = 1;
			var type = "";
			var keyword = "";
			
			teamMember.isAdmin(groupId,memberId,function(a){
				var test = '';
				if(a){
					test = '<li class="active">'
						 +		'<a href="#demo-tabs-box-1"data-toggle="tab" id="memberTab" aria-expanded="false">모임원 목록</a>'
						 + '</li>'
						 + '<li class="">'
						 + 		'<a href="#demo-tabs-box-2" data-toggle="tab" id="adminonly" aria-expanded="true">'
						 +			'회원관리'
						 +		'</a>'
						 +	'</li>';
				}else{
					test = '<li class="active">'
						 +		'<a href="#demo-tabs-box-1"data-toggle="tab" id="memberTab" aria-expanded="false">모임원 목록</a>'
						 + '</li>'
				}
				$("#moimTab").html(test);
			});
			
			
			function showList(tabid,status,withcheck){
				console.log("showList"+pageNum);
				var param = {"groupId" : groupId,"status" : status, "pageNum" : pageNum,"type":type, "keyword":keyword};
				teamMember.getList(param,function(data){
					var listHtml = '';
					var checkbox = '';
					for(var i = 0, len = data.getMember.length||0; i<len; i++){
						if(withcheck){
							if(data.getMember[i].tmemLevel<7){
								checkbox =	'<td class="text-center" style="vertical-align: middle">'
										 +		'<input type="checkbox" class="chk" data-tid="'+data.getMember[i].tmemId+'">'
										 +	'</td>'
							}else{
								checkbox = '<td></td>'		 
							}
						}
						listHtml += '<tr>'
								 +       checkbox
								 +  	'<td class="text-center" style="vertical-align: middle">'
								 +			'<strong>'+(i+1)+'</strong>'
								 +		'</td>'
								 +		'<td>photo</td>'
								 +   	'<td>'
								 + 			'<a class="memclick" data-tid="'+data.getMember[i].tmemId+'"><p class="mar-no text-2x">'+data.getMember[i].tmemNickName+'</p></a>'
								 + 			'<p class="mar-no text-right text-sm col-lg-12">'+data.getMember[i].tmemEmail+'</p>'
								 +			'<div class="clearfix">'
								 +				'<p class="mar-no text-right text-sm col-lg-6">'
								 + 					'가입한날짜 : ' + teamMember.parseDate(data.getMember[i].tmemRegDate)
								 +				'</p>'
								 +				'<p class="mar-no text-right text-sm col-lg-6">'
								 +					' 마지막 방문일 : ' + teamMember.parseDate(data.getMember[i].tmemLastVisit)
								 +				'</p>'
								 +			'</div>'
								 +		'</td>'
								 + 		'<td class="text-center" style="vertical-align: middle">'
								 +			data.grade[data.getMember[i].tmemLevel]
								 +		'</td>'
								 +	'</tr>'
					}
					$("#"+tabid).html(listHtml);
					$(".paginationBtn").html(memberPageBtn(data.teamMemberCount))
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
				var searchType = $("#adminSearchType").val();
				var searchKeyword = $("#adminSearchKeyword").val();
				if(searchType == ''){
					alert("검색조건을 선택해주세요");
					return;
				}else if(searchKeyword == ''){
					alert("검색어를 입력해주세요");
					return;
				}
				type = searchType;
				keyword = searchKeyword;
				showList('adminList',$('#select').val(),true);
			});
			$("#memberSearchBtn").on('click',function(){
				var searchType = $("#memberSearchType").val();
				var searchKeyword = $("#memberSearchKeyword").val();
				if(searchType == ''){
					alert("검색조건을 선택해주세요");
					return;
				}else if(searchKeyword == ''){
					alert("검색어를 입력해주세요");
					return;
				}
				type = searchType;
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
					$("#modalTmemId").val(e.tmemId);
					$("#modalMNickName").text(e.tmemNickName);
					$("#modalMId").text(e.tmemEmail);
				});
				$("#memberModal").modal('show');
			});
			$('#select').on('change',function(e){
				pageNum = 1;
				showList('adminList',$(this).val(),true);
				var btnhtml = ''
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
				
				var paginationBtn  = "<ul class='pagination pull-right mar-no'>";
				
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