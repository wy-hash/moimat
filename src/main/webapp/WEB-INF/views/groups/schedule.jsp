<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">

<!-- HEAD -->
<%@ include file="../includes/head.jsp"%>


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

.gray{
	background-color: #848484 !important;
	border-color: #6E6E6E !important;	
}
.page-link {
	cursor: pointer;
}
</style>
<link href="/resources/plugins/fullcalendar/fullcalendar.min.css"
	rel="stylesheet">
<link
	href="/resources/plugins/fullcalendar/nifty-skin/fullcalendar-nifty.min.css"
	rel="stylesheet">
<link href="/resources/plugins/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="/resources/css/moimat.css" rel="stylesheet">
<link href="/resources/css/map.css" rel="stylesheet">
<!--Bootbox Modals [ OPTIONAL ]-->
<script src="/resources/plugins/bootbox/bootbox.min.js"></script>
<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2365b9f150bd99dbbe53ea0054d4e89b&libraries=services"></script>
		
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
							<c:if test="${tmem.tmemLevel > 7}">
							<li><a href="/groups/${ group.teamId }/settings">설정</a></li>
							</c:if>
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
								<c:if test="${tmem.tmemLevel > 7}">
								<li class="divider"></li>
								<li><a href="/groups/${ group.teamId }/settings">설정</a></li>
								</c:if>
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
													class="btn btn-info pull-right mar-top mar-rgt">모임 등록</button>
											</div>
										</div>
										<div class="panel-body" id='meetList'></div>
									</div>
								</div>
					            </div>
								<!-- modal -->
								<div class="modal fade" tabindex="-1" style="display: none;"
									id="moimat-modal">
									<div class="modal-dialog">
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
	<script src="/resources/plugins/fullcalendar/lib/moment.min.js"></script>
	<script
		src="/resources/plugins/fullcalendar/lib/jquery-ui.custom.min.js"></script>
	<script src="/resources/plugins/fullcalendar/fullcalendar.min.js"></script>
	<script type="text/javascript" src="/resources/js/meetlist.js"></script>
	<script>
		window.onload = function() {
			
			var meetList = document.getElementById("meetList");
			var geocoder = new kakao.maps.services.Geocoder();
			var mRegBtn = document.querySelector("#mRegBtn");
			var groupid = '<c:out value="${groupId}"/>';
			var memberid = '<c:out value="${sessionScope.loginVO.memId}"/>';
			var pageNum = 1;
			var map1 = '';
			CalendarEvent.getEvent('#meet-calendar',groupid);
			
			mRegBtn.addEventListener('click',function(e){
				self.location.href = '/groups/'+groupid+'/schedule/new'
			})
			function setMap(area,areaName, idx) {
				var areaXY = area.split(',')
				var coords = new kakao.maps.LatLng(areaXY[0],areaXY[1]);
				
				var mapContainer = document.getElementById(idx), mapOption = {
					center : coords,
					level : 3
				};
				var map = new kakao.maps.Map(mapContainer, mapOption);
				var marker = new kakao.maps.Marker({
					map : map,
					position : coords
				});
				var places = new kakao.maps.services.Places();
				
				places.keywordSearch(areaName,function(data){
					for(var i = 0, len=data.length||0;i<len;i++){
						if(data[i].y == areaXY[0] && data[i].x == areaXY[1]){
							setOvelay(data[i],map,marker)
						}
					}
				});
			}
			showMeetList();
			function showMeetList(){
				meetListService.getList(groupid,pageNum,memberid,function(list){
					var meetListStr = '';
					for(var i = 0, len = list.meetList.length||0; i<len; i++){ //일단 3개만(페이징 완성되면 수정할 부분)
						var button = '';
						var mdButton = '';
						if(list.isAttend[list.meetList[i].meetId]){
							button = '<button type="button" class="btn btn-sm btn-hover-danger pull-right cancelBtn" data-mid="'+list.meetList[i].meetId+'">불참</button>'
						}else{
							button = '<button type="button" class="btn btn-sm btn-hover-warning pull-right attendBtn" data-mid="'+list.meetList[i].meetId+'">참석</button>';
						}
						if(list.isWriter[list.meetList[i].meetId]){
							mdButton += '<button id="mod'+i+'" type="button" class="btn btn-sm btn-hover-primary" data-mid="'+list.meetList[i].meetId+'">수정</button>'
								   	  +	'<button id="del'+i+'" type="button" class="btn btn-sm btn-hover-danger" data-mid="'+list.meetList[i].meetId+'">삭제</button>'
						}
						meetListStr +='<div class="row">'
								   +	'<div class="col-lg-4 moimat-m">'
								   +		'<div id="map'+i+'"></div>'
								   +	'</div>'
								   +	'<div class="col-lg-8">'
								   +		'<div class="moimat-mc">'
								   +		'<div class="panel panel-bordered panel-dark mar-no">'
						           +			'<div class="row panel-heading mar-no">'
						           +				'<div class="col-xs-8 pad-no">'
					               +					'<h3 class="panel-title">'
						           +						'<span class="meetTitle">'
						           +							list.meetList[i].meetTitle
						           +						'</span></h3>'
					               +				'</div>'
					               +				'<div class="col-xs-4 my">'
					               +					'<p class="text-bold mar-no pad-rgt mar-rgt text-sm text-overflow">'+list.meetList[i].meetNickName+'</p>'
					               +				'</div>'
					               +			'</div>'
					           	   +			'<div class="panel-body">'
								   +				'<div class="list-group">'
								   +    				'<div class="row list-group-item">'
								   +						'<div class="col-lg-6">'
								   +							'<span style="color:red;">'
								   +								'<i class="fa fa-calendar"></i>'
								   +							'</span>'
								   +							'&ensp;'
								   +							meetListService.parseDate(list.meetList[i].meetDate)
								   +						'</div>'
								   +						'<div class="col-lg-6">'
								   +							'<span style="color:orange;">'
								   +								'<i class="fa fa-map-marker"></i>'
								   +							'</span>'
								   +							'&ensp;'
								   +								list.meetList[i].meetAreaName
								   +						'</div>'
								   +						'<div class="col-lg-6">'
								   +							'<span style="color:green;">'
								   +								'<i class="fa fa-krw"></i>'
								   +							'</span>'
								   +							'&ensp;'
								   +							list.meetList[i].meetPay
								   +						'</div>'
								   +						'<div class="col-lg-6">'
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
								   +			'<div class="panel-footer bg-trans-dark">'
								   +				mdButton
								   +				button
								   +			'</div>'
								   +			'</div>'
								   +		'</div>'
								   +	'</div>'
								   + '</div>'
						 		   + '<hr>';
					}
					meetListStr += meetPageBtn(list.meetCount);
					meetList.innerHTML = meetListStr;
					for(var i = 0, len = list.meetList.length||0; i<len; i++){
						setMap(list.meetList[i].meetArea,list.meetList[i].meetAreaName,"map"+i)
						dButtonEvent("del"+i);
						mButtonEvent("mod"+i);
					}
					var paginationBtn = document.querySelectorAll(".page-link");
					paginationBtn.forEach(function(e){
						e.addEventListener('click',function(e){
							e.preventDefault();
							var targetPageNum = this.getAttribute('data-pageNum');
							pageNum = targetPageNum;
							showMeetList();
						});
					});
					moimCEvent();
				});
			}
			
			var meetListFooter = document.querySelector("#meetListFooter");
			function meetPageBtn(meetCount){
				var endNum = Math.ceil(pageNum/2.0) * 2;
				var realEndNum = Math.ceil(meetCount/3.0);
				var startNum = endNum - 1;
				var prev = startNum != 1;
				var next = false;
				if(endNum * 3 > meetCount){ // endNum과 곱해지는건 한 페이지당 들어가는 갯수
					endNum = Math.ceil(meetCount/3.0);
				}
				if(endNum * 3 < meetCount){ 
					next = true;
				}
				
				var paginationBtn  = "<div id='paginationBtn'><ul class='pagination pull-right mar-no'>";
				
				if(prev){
					paginationBtn += "<li class='page-item'><a class='page-link' data-pageNum='"+(startNum -1)+"'>이전</a></li>";
					if(next == false){
						paginationBtn += "<li class='page-item'><a class='page-link' data-pageNum='1'>1</a></li>" +
										 "<li class='page-item'><span>...</span></li>";
					}
				}
				
				for(var i = startNum ; i <= endNum; i++){
					var active = pageNum == i ? "active" : "";
					
					paginationBtn += "<li class='page-item "+active+"'><a class='page-link' data-pageNum='"+i+"'>"+i+"</a></li>";
				}
				
				if(next){
					paginationBtn += "<li class='page-item'><span>...</span></li>"+
									 "<li class='page-item'><a class='page-link' data-pageNum='" + realEndNum +"'>"+realEndNum+"</a></li>"+
						             "<li class='page-item'><a class='page-link' data-pageNum='" + (endNum + 1) +"'>다음</a></li>";
				}
				
				paginationBtn += "</ul></div>"
				
				return paginationBtn;
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
		                               + 		'<img class="img-circle img-xs" src="'+data.memberList[i].mmemPhoto+'" alt="Profile Picture">'
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
				});//end meetMember.forEach
				//ajax를 이용 
				cancelBtn.forEach(function(e){
					e.addEventListener('click',function(){
						console.log(e)
						var meetId = this.getAttribute("data-mid");
						var data = {'meetId' : meetId,'teamId' : groupid};
						bootbox.confirm("참여하지 않으시겠습니까?",function(result){
							if(result){
								$.ajax({
				            		type : 'delete',
				            		url : '/meet/cancelMeet',
				            		datatype : "json",
				            		data : JSON.stringify(data),
				            		contentType : "application/json; charset=utf-8",
				            		success : function(result){
				            			showMeetList();
				            		}
				            	});
								$.niftyNoty({
				                    type: 'success',
				                    icon : 'pli-like-2 icon-2x',
				                    message :'이 만남에 참여하지 않습니다.',
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
							}
						});
					})
				})
				attendBtn.forEach(function(e){
					e.addEventListener('click',function(){
						var meetId = this.getAttribute("data-mid");
						var data = {'meetId' : meetId,'teamId' : groupid};
						bootbox.confirm("만남에 참여하시겠습니까?",function(result){
							if(result){
								$.ajax({
				            		type : 'post',
				            		url : '/meet/attendMeet',
				            		datatype : "json",
				            		data : JSON.stringify(data),
				            		contentType : "application/json; charset=utf-8",
				            		success : function(result){
				            			showMeetList();
				            		}
				            	});
								$.niftyNoty({
				                    type: 'success',
				                    icon : 'pli-like-2 icon-2x',
				                    message :'이 만남에 참여합니다.',
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
							}
						});
					})
				})
			}
			function dButtonEvent(buttonid){
				var btn = document.querySelector('#'+buttonid);
				if(btn){
					btn.addEventListener('click',function(){
						var meetId = this.getAttribute("data-mid");
						var data = {'meetId' : meetId };
						bootbox.confirm("삭제하시겠습니까?",function(result){
							if(result){
								$.ajax({
				            		type : 'delete',
				            		url : '/meet/deleteMeet',
				            		datatype : "json",
				            		data : JSON.stringify(data),
				            		contentType : "application/json; charset=utf-8",
				            		success : function(result){
				            			showMeetList();
				            		}
				            	});
								$.niftyNoty({
				                    type: 'success',
				                    icon : 'pli-like-2 icon-2x',
				                    message :'삭제해였습니다.',
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
							}
						});
					});
				}
			}
			function mButtonEvent(buttonid){
				var btn = document.querySelector('#'+buttonid);
				if(btn){
					btn.addEventListener('click',function(){
						var meetId = this.getAttribute("data-mid");
						bootbox.confirm("수정하시겠습니까?",function(result){
							if(result){
								location.href = "/groups/"+groupid+"/schedule/modify?meetid="+meetId;
							}else{
								 $.niftyNoty({
					                    type: 'danger',
					                    icon : 'pli-cross icon-2x',
					                    message : '취소하였습니다.',
					                    container : 'floating',
					                    timer : 5000
					                });
							}
						})
						
					});
				}
				
			}
			function setOvelay(place,map,marker){
				var address = '';
				if(place.road_address_name){
					address = place.road_address_name;
				}else{
					address = place.address_name;
				}
				var content = '<div class="wrap">' + 
	           				  '    <div class="info">' + 
	                          '        <div class="title">' +
	                          '            <div class="clearfix">' +
	                          '                <div class="col-xs-10 ellipsis">' + place.place_name +
	                          '                </div>' +
	                          '                <div class="col-xs-2" style="height:17px">' + 
	                          '                </div>' +
	                          '            </div>' +
	            			  '        </div>' + 
	                          '            <div class="desc">' + 
	                          '                <div class="ellipsis">'+place.category_group_name+'</div>' + 
	                          '                <div class="ellipsis">'+address+'</div>' + 
	                          '                <div class="ellipsis">'+place.phone+'<a href="'+place.place_url+'" target="_blank" class="link pull-right">자세히보기</a></div>' + 
	                          '            </div>' + 
	                          '    </div>' +    
	                          '</div>';
	                          
				var overlay = new kakao.maps.CustomOverlay({
				    content: content,
				    map: map,
				    position: marker.getPosition()       
				});
				
			}
			
			
			
		function removeMoimatContent(){ //혹시몰라서 하나의 모달창을 돌려쓰니까..
			for(var i = 0, len = arguments.length||0; i<len; i++){
				while(arguments[i].firstChild) {
					arguments[i].removeChild(arguments[i].firstChild);
				}
			}
		}
			
	}
	</script>
	<%-- for modal --%>
	<c:if test="${ !empty loginVO }">
		<%@ include file="../includes/modals.jsp" %>
	</c:if>
	<%-- for modal --%>
</body>
</html>