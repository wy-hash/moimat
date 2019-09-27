<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">

<!-- HEAD -->
<%@ include file="includes/head.jsp"%>
<link href="../resources/plugins/fullcalendar/fullcalendar.min.css"
	rel="stylesheet">
<link
	href="../resources/plugins/fullcalendar/nifty-skin/fullcalendar-nifty.min.css"
	rel="stylesheet">
<link href="../resources/plugins/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="../resources/css/moimat.css" rel="stylesheet">
<title>Page Template | moim@</title>

</head>
<!-- END HEAD -->

<body>
	<!--TIPS-->
	<!--You may remove all ID or Class names which contain "demo-", they are only used for demonstration. -->
	<div id="container" class="effect aside-float aside-bright mainnav-lg">

		<!-- HEADER-NAVBAR -->
		<%@ include file="includes/header-navbar.jsp"%>
		<!-- END NAVBAR -->

		<!-- BOXED -->
		<div class="boxed">

			<!-- MAIN-NAV -->
			<%@ include file="includes/main-nav.jsp"%>
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

					<div class="container-fluid">
						<div>
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title">Calendar</h3>
								</div>
								<div class="panel-body">
									<!-- Calendar placeholder-->
									<!-- ============================================ -->
									<div id='demo-calendar'></div>
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
							<div class="panel-body" id='meetList'></div>
							<div class="panel-footer">
								<!-- pagination button 들어갈 공간 -->
								<button data-target="#moimat-modal" data-toggle="modal"
									class="btn btn-warning">Large modal</button>
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
								<div class="modal-body" id="moimat-modal-body">
									
								</div>
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
		<%@ include file="includes/footer.jsp"%>
		<!-- END FOOTER -->

	</div>
	<!-- END CONTAINER -->
	<script src="../resources/plugins/fullcalendar/lib/moment.min.js"></script>
	<script
		src="../resources/plugins/fullcalendar/lib/jquery-ui.custom.min.js"></script>
	<script src="../resources/plugins/fullcalendar/fullcalendar.min.js"></script>
	<script type="text/javascript" src="/resources/js/meetlist.js"></script>
	<!--Full Calendar [ SAMPLE ]-->
	<script src="../resources/js/demo/misc-fullcalendar.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6213368344dd87ee3c46139e0d1df7cd&libraries=services"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6213368344dd87ee3c46139e0d1df7cd"></script>
	<script>
		window.onload = function() {
			var meetList = document.getElementById("meetList");
			var meetListStr = '';
			var geocoder = new kakao.maps.services.Geocoder();
			
			
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
			var groupid = '<c:out value="${groupid}"/>'
			var memberid = '<c:out value="${id}"/>'
			
			meetListService.getList(groupid,memberid,function(list){
				//meetList,countMeetMember, isAttend	
				for(var i = 0, len = list.meetList.length||0; i<len; i++){
					/*var button = '';
					if(list.isAttend[list.meetList[i].meetId]){
						button = '<button type="button" class="btn btn-danger" value="'+list.meetList[i].meetId+'">불참하기</button>';
					}else{
						button = '<button type="button" class="btn btn-warning" value="'+list.meetList[i].meetId+'">참석하기</button>';
					}  이건 나중에 다시 쓸거임 일단 없앰*/
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
							   +							'&ensp;'+list.meetList[i].meetArea
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
							   +							'<a class="meetMember" data-target="#moimat-modal" data-toggle="modal" data-mid="'+list.meetList[i].meetId+'"> 참여인원 :'
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
							   +		'<div class="btn-group"style="height:40px;">'
							   +			'<button type="button" class="btn btn-primary"/><button type="button" class="btn btn-primary"/><button type="button" class="btn btn-primary"/>'
							   +		'</div>'
							   +	'</div>'
							   + '</div>'
					 		   + '<hr>';
				}
				meetList.innerHTML = meetListStr;
				for(var i = 0, len = list.meetList.length||0; i<len; i++){
					setMap(list.meetList[i].meetArea,"map"+i)
				}
				detailedMeet();
				moimCEvent();
			})
			
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
				meetContent.forEach(function(e){
					e.addEventListener('click',function(){
						removeMoimatContent(mmodalbody,mmodaltitle);
						mmodaltitle.innerText = '내용 상세 보기';
						mmodalbody.innerText = this.innerText;
						console.log(e);
					})
				})
				meetMember.forEach(function(e){
					e.addEventListener('click',function(){
						removeMoimatContent(mmodalbody,mmodaltitle);
						var meetid = this.getAttribute('data-mid');
						mmodaltitle.innerText = '참가인원 모두보기!!';
						let mmhtml = '';
						meetListService.meetRead(meetid,groupid,memberid,function(data){
							console.log(data.memberList)
							for(var i = 0, len = data.memberList.length||0; i<len; i++){
								mmhtml += '<p>'+data.memberList[i].mmemId+'</p>'
									   +  '<p>'+data.memberList[i].meetId+'</p>'
								       +  '<p>'+data.memberList[i].tmemId+'</p>'
								       +  '<p>'+data.memberList[i].mmemNickName+'</p>'
								       +  '<p>'+data.memberList[i].mmemEmail+'</p>'
								
							}
							console.log(mmhtml);
							mmodalbody.innerHTML = mmhtml;
						});
						
					})
				})
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