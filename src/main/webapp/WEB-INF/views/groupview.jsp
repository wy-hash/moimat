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
						<div class="row">
							<div class="col-md-4 col-lg-3">
								<div class="panel">
									<div class="panel-heading">
										<h3 class="panel-title">Events</h3>
									</div>
									<div class="panel-body">
										<div class="form-group">
											<input type="text" id="event_title"
												placeholder="Event Title..." class="form-control" value="">
										</div>
										<button class="btn btn-block btn-purple">Add New
											Event</button>
										<hr>

										<!-- Draggable Events -->
										<!-- ============================================ -->
										<p class="text-semibold">Draggable Events</p>
										<div id="demo-external-events">
											<div class="fc-event fc-list" data-class="warning">All
												Day Event</div>
											<div class="fc-event fc-list" data-class="success">Meeting</div>
											<div class="fc-event fc-list" data-class="mint">Birthday
												Party</div>
											<div class="fc-event fc-list" data-class="purple">Happy
												Hour</div>
											<div class="fc-event fc-list">Lunch</div>
											<hr>
											<div>
												<label class="form-checkbox form-normal form-primary">
													<input type="checkbox" id="drop-remove"> Remove
													after drop
												</label>
											</div>
											<hr>
											<div class="fc-event" data-class="warning">All Day
												Event</div>
											<div class="fc-event" data-class="success">Meeting</div>
											<div class="fc-event" data-class="mint">Birthday Party</div>
											<div class="fc-event" data-class="purple">Happy Hour</div>
											<div class="fc-event">Lunch</div>
										</div>
										<!-- ============================================ -->

									</div>
								</div>
							</div>
							<div class="col-md-8 col-lg-9">
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
					</div>
					<!-- end ./panel panel-dafault -->
					<!-- start container-fluid -->
					<!-- meet list -->
					<div class="container-fluid">
						<div class="panel">
							<div class="panel-body" id='meetList'></div>
							<div class="panel-footer">
								<!-- pagination button 들어갈 공간 -->
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
	<script src="../resources/plugins/fullcalendar/lib/jquery-ui.custom.min.js"></script>
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
					meetListStr +='<div class="row">'
							   +	'<div class="col-lg-4"'
							   +	'style="min-width: 200px; height: 300px;">'
							   +		'<div id="map'+i+'" style="height: 100%"></div>'
							   +	'</div>'
							   +	'<div class="col-lg-8" style="height: 300px;">'
							   +		'<div class="panel panel-bordered panel-dark">'
					           +			'<div class="panel-heading">'
				               +				'<h3 class="panel-title">'+list.meetList[i].title+'</h3>'
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
							   +							'&ensp;'+list.meetList[i].area
							   +						'</div>'
							   +						'<div class="col-lg-3">'
							   +							'<span style="color:green;">'
							   +								'<i class="fa fa-krw"></i>'
							   +							'</span>'
							   +							'&ensp;'
							   +							list.meetList[i].payment
							   +						'</div>'
							   +						'<div class="col-lg-3">'
							   +							'<span style="color:black;">'
							   +								'<i class="fa fa-users"></i>'
							   +							'</span>'
							   +							'&ensp;참여인원 : '
							   +							list.countMeetMember[list.meetList[i].seq]+'/'
				               +							list.meetList[i].maxPerson
				               +						'</div>'
							   +					'</div>'
							   +				'</div>'
							   +				'<div>'+list.meetList[i].content+'</div>'
							   +			'</div>'
					           +		'</div>'
							   +	'</div>'
							   + '</div>'
					 		   + '<hr>';
				}
				meetList.innerHTML = meetListStr;
				for(var i = 0, len = list.meetList.length||0; i<len; i++){
					setMap(list.meetList[i].area,"map"+i)
				}
			})
		}
	</script>
</body>
</html>