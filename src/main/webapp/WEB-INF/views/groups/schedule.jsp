<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">

<!-- HEAD -->
<%@ include file="../includes/head.jsp"%>
<link href="/resources/plugins/fullcalendar/fullcalendar.min.css"
	rel="stylesheet">
<link
	href="/resources/plugins/fullcalendar/nifty-skin/fullcalendar-nifty.min.css"
	rel="stylesheet">
<link href="/resources/plugins/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="/resources/css/moimat.css" rel="stylesheet">
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
								<div class="container-fluid">
									<div>
										<div class="panel">
											<div class="panel-heading">
												<h3 class="panel-title">Calendar</h3>
											</div>
											<div class="panel-body">
												<!-- Calendar placeholder-->
												<!-- ============================================ -->
												<div id='meet-calendar'></div>
												<!-- ============================================ -->
											</div>
										</div>
									</div>
								</div>
								<!-- end ./panel panel-dafault -->
								<!-- start container-fluid -->
								<!-- meet list -->
								<div class="container-fluid">
									<div class="panel">
										<div class="row panel-heading mar-no">
											<div class="col-xs-8">
												<h3>모임들</h3>
											</div>
											<div class="col-xs-4 btn-group my">
												<button type="button" id="mRegBtn"
													class="btn btn-info pull-right">모임 등록</button>
											</div>
										</div>
										<div class="panel-body" id='meetList'></div>
										<div class="panel-footer" id='meetListFooter'>
											<!-- pagination button 들어갈 공간 -->
											
										</div>
									</div>
								</div>
								
								
					                        
					                       
					            </div>
					            
					        
								<!-- modal -->
								<div class="modal fade" tabindex="-1" style="display: none;"
									id="moimat-modal">
									<div class="modal-dialog modal-lg">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal">
													<i class="pci-cross pci-circle"></i>
												</button>
												<h4 class="modal-title" id="moimat-modal-title">상세보기</h4>
											</div>
											<div class="modal-body" id="moimat-modal-body"></div>
										</div>
									</div>
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
	<script src="/resources/plugins/fullcalendar/lib/moment.min.js"></script>
	<script
		src="/resources/plugins/fullcalendar/lib/jquery-ui.custom.min.js"></script>
	<script src="/resources/plugins/fullcalendar/fullcalendar.min.js"></script>
	<script type="text/javascript" src="/resources/js/meetlist.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6213368344dd87ee3c46139e0d1df7cd&libraries=services"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6213368344dd87ee3c46139e0d1df7cd"></script>
	<script>
		window.onload = function() {
			var meetList = document.getElementById("meetList");
			
			var geocoder = new kakao.maps.services.Geocoder();
			var mRegBtn = document.querySelector("#mRegBtn");
			var groupid = '<c:out value="${groupId}"/>';
			var memberid = '<c:out value="${sessionScope.loginVO.memId}"/>';
			var pageNum = 1;
			
			CalendarEvent.getEvent('#meet-calendar',groupid);
			
			mRegBtn.addEventListener('click',function(e){
				self.location.href = '/groups/'+groupid+'/schedule/new'
			})
			
			function setMap(area, idx) {geocoder.addressSearch(area,
					function(result, status) {
						if (status === kakao.maps.services.Status.OK) {
							var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
						}
						var mapContainer = document.getElementById(idx), mapOption = {
							center : coords,
							level : 3
						};
						var map = new kakao.maps.Map(mapContainer, mapOption);
						var marker = new kakao.maps.Marker({
							map : map,
							position : coords
						});
					});
			}
			
			showMeetList(pageNum);

			function showMeetList(page){
				meetListService.getList(groupid,page,memberid,function(list){
					var meetListStr = '';
					for(var i = 0, len = list.meetList.length||0; i<len; i++){ //일단 3개만(페이징 완성되면 수정할 부분)
						var button = '';
						var mdButton = '';
						if(list.isAttend[list.meetList[i].meetId]){
							button = '<button type="button" class="btn btn-danger pull-right cancelBtn" data-mid="'+list.meetList[i].meetId+'">불참하기</button>'
						}else{
							button = '<button type="button" class="btn btn-warning pull-right attendBtn" data-mid="'+list.meetList[i].meetId+'">참석하기</button>';
						}
						if(list.isWriter[list.meetList[i].meetId]){
							mdButton += '<form id="mdButton'+i+'" method="Post">'
									 +      '<input type="hidden" name="meetId" value="'+list.meetList[i].meetId+'">'
									 + 		'<button id="mod'+i+'" type="button" class="btn btn-primary">수정하기</button>'
								   	 +		'<button id="del'+i+'" type="button" class="btn btn-danger">삭제하기</button>'
								   	 +	'</form>'
						}
						meetListStr +='<div class="row">'
								   +	'<div class="col-lg-4 moimat-m">'
								   +		'<div id="map'+i+'"></div>'
								   +	'</div>'
								   +	'<div class="col-lg-8 moimat-mc">'
								   +		'<div class="panel panel-bordered panel-dark mar-no">'
						           +			'<div class="row panel-heading mar-no">'
						           +				'<div class="col-xs-8 pad-no">'
					               +					'<h3 class="panel-title">'
						           +						'<span class="meetTitle" data-mid="'+list.meetList[i].meetId+'">'
						           +							list.meetList[i].meetTitle
						           +						'</span></h3>'
					               +				'</div>'
					               +				'<div class="col-xs-4 my">'
					               +					'<p class="text-bold mar-no text-overflow">'+list.meetList[i].meetNickName+'님이 작성...</p>'
					               +				'</div>'
					               +			'</div>'
					           	   +			'<div class="panel-body">'
								   +				'<div class="list-group">'
								   +    				'<div class="row list-group-item">'
								   +						'<div class="col-lg-3">'
								   +							'<span style="color:red;">'
								   +								'<i class="fa fa-calendar"></i>'
								   +							'</span>'
								   +							'&ensp;'
								   +							meetListService.parseDate(list.meetList[i].meetDate)
								   +						'</div>'
								   +						'<div class="col-lg-3">'
								   +							'<span style="color:orange;">'
								   +								'<i class="fa fa-map-marker"></i>'
								   +							'</span>'
								   +							'&ensp;'
								   +								list.meetList[i].meetArea
								   +						'</div>'
								   +						'<div class="col-lg-3">'
								   +							'<span style="color:green;">'
								   +								'<i class="fa fa-krw"></i>'
								   +							'</span>'
								   +							'&ensp;'
								   +							list.meetList[i].meetPay
								   +						'</div>'
								   +						'<div class="col-lg-3">'
								   +							'<span style="color:black;">'
								   +								'<i class="fa fa-users"></i>'
								   +							'</span>'
								   +							'<a class="meetMember" data-target="#moimat-modal" data-toggle="modal" data-mid="'
								   +								list.meetList[i].meetId+'"> 참여인원 :'
								   +								list.countMeetMember[list.meetList[i].meetId]+'/'
					               +								list.meetList[i].meetMax
					               +							'</a>'
					               +						'</div>'
								   +					'</div>'
								   +				'</div>'
								   +				'<div class="moimat-ellipsis">'
								   +					'<a class="meetContent" data-target="#moimat-modal" data-toggle="modal">'+list.meetList[i].meetContent+'</a>'
								   +				'</div>'
								   +			'</div>'
						           +		'</div>'
								   +		'<div class="btn-group" style="height:40px;display:block;">'
								   +			'<div class="clearfix">'
								   +				'<div class="col-xs-6 pad-no">'
								   +					mdButton
								   +				'</div>'
								   +				'<div class="col-xs-6 pad-no">'
								   +					button
								   +				'</div>'
								   +			'</div>'
								   +		'</div>'
								   +	'</div>'
								   + '</div>'
						 		   + '<hr>';
					}
					meetListStr += meetPageBtn(list.meetCount);
					meetList.innerHTML = meetListStr;
					for(var i = 0, len = list.meetList.length||0; i<len; i++){
						setMap(list.meetList[i].meetArea,"map"+i)
						dButtonEvent("mdButton"+i,"del"+i);
						mButtonEvent("mdButton"+i,"mod"+i);
					}
					var paginationBtn = document.querySelectorAll(".page-link");
					paginationBtn.forEach(function(e){
						e.addEventListener('click',function(e){
							e.preventDefault();
							var targetPageNum = this.getAttribute('href');
							pageNum = targetPageNum;
							showMeetList(pageNum);
						});
					});
					detailedMeet();
					moimCEvent();
				});
			}
			
			var meetListFooter = document.querySelector("#meetListFooter");
			function meetPageBtn(meetCount){
				var endNum = Math.ceil(pageNum/3.0) * 10;
				var startNum = endNum - 9;
				
				var prev = startNum != 1;
				var next = false;
				
				if(endNum * 10 > meetCount){
					endNum = Math.ceil(meetCount/3.0);
				}
				
				if(endNum * 10 < meetCount){
					next = true;
				}
				
				var paginationBtn  = "<div id='paginationBtn'><ul class='pagination pull-right mar-no'>";
				
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
				
				paginationBtn += "</ul></div>"
				
				return paginationBtn;
			}
			
			function detailedMeet(){
				var meetTitle = document.querySelectorAll(".meetTitle");
				var meetid = '';
				meetTitle.forEach(function(e){
					e.addEventListener('click', function(){
						meetid = this.getAttribute('data-mid');
						meetListService.meetRead(meetid,groupid,memberid,function(data){
							console.log(meetid);
							console.log(memberid);
							console.log(data);
						});
					})
				});
			}
			var mmodal = document.querySelector("#moimat-modal");
			var mmodaltitle = document.querySelector("#moimat-modal-title");
			var mmodalbody = document.querySelector("#moimat-modal-body");
			function moimCEvent(){
				var meetContent = document.querySelectorAll(".meetContent");
				var meetMember = document.querySelectorAll(".meetMember");
				var meetArea = document.querySelectorAll(".meetArea");
				var cancelBtn = document.querySelectorAll(".cancelBtn");
				var attendBtn = document.querySelectorAll(".attendBtn");
				meetContent.forEach(function(e){
					e.addEventListener('click',function(){
						removeMoimatContent(mmodalbody,mmodaltitle);
						mmodaltitle.innerText = '내용 상세 보기';
						mmodalbody.innerText = this.innerText;
					})
				})//end meetContent.forEach
				
				meetMember.forEach(function(e){
					e.addEventListener('click',function(){
						removeMoimatContent(mmodalbody,mmodaltitle);
						var meetid = this.getAttribute('data-mid');
						mmodaltitle.innerText = '참가인원 모두보기!!';
						var mmhtml = '';
						meetListService.meetRead(meetid,groupid,memberid,function(data){
							console.log(data.memberList)
							mmhtml += '<div class="list-group bg-trans">'
							for(var i = 0, len = data.memberList.length||0; i<len; i++){
								mmhtml += '<a href="#" class="list-group-item">'
		                           	   +  	'<div class="media-left pos-rel">'
		                               + 		'<img class="img-circle img-xs" src="/resources/img/profile-photos/2.png" alt="Profile Picture">'
		                               + 		'<i class="badge badge-success badge-stat badge-icon pull-left"></i>'
		                               + 	'</div>'
		                               +	'<div class="media-body">'
		                               +		'<p class="mar-no">'+data.memberList[i].mmemNickName+'</p>'
		                               +		'<small class="text-muted">'+data.memberList[i].mmemEmail+'</small>'
		                               +	'</div>'
	                       		 	   +  '</a>'
							} //추후 유저정보 조회하는 그걸로 올려야함 
							mmhtml += '</div>'
							mmodalbody.innerHTML = mmhtml;
						});
					});
					// 이거 구현방식을 바꿔야함 
					cancelBtn.forEach(function(e){
						e.addEventListener('click',function(){
							var meetid = this.getAttribute("data-mid");
							location.href = '/groups/'+groupid+'/schedule/cancel?meetid='+meetid;
						})
					})
					attendBtn.forEach(function(e){
						e.addEventListener('click',function(){
							var meetid = this.getAttribute("data-mid");
							location.href = '/groups/'+groupid+'/schedule/attend?meetid='+meetid;
						})
					})
				});//end meetMember.forEach
			}
			function dButtonEvent(formid,buttonid){
				var btn = document.querySelector('#'+buttonid);
				btn.addEventListener('click',function(){
					var buttonForm = document.querySelector('#'+formid);
					buttonForm.setAttribute("action","/groups/"+groupid+"/schedule/delete");
					buttonForm.submit();
				});
			}
			function mButtonEvent(formid,buttonid){
				var btn = document.querySelector('#'+buttonid);
				btn.addEventListener('click',function(){
					var buttonForm = document.querySelector('#'+formid);
					buttonForm.setAttribute("action","/groups/"+groupid+"/schedule/modify");
					buttonForm.submit();
				});
			}
			function removeMoimatContent(){ //혹시몰라서 하나의 모달창을 돌려쓰니까... 내용을 다 비우고 넣을려고 제이쿼리면 안만들어도됬음... 더좋은방법?? 몰르르르르르
				for(var i = 0, len = arguments.length||0; i<len; i++){
					while(arguments[i].firstChild) {
						arguments[i].removeChild(arguments[i].firstChild);
					}
				}
			}
			
		}
	</script>
</body>
</html>