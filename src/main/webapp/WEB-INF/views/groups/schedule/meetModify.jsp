<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">

<!-- HEAD -->
<%@ include file="/WEB-INF/views/includes/head.jsp"%>
<!--Bootstrap Timepicker [ OPTIONAL ]-->
<link
	href="/resources/plugins/bootstrap-timepicker/bootstrap-timepicker.min.css"
	rel="stylesheet">
<!--Bootstrap Datepicker [ OPTIONAL ]-->
<link
	href="/resources/plugins/bootstrap-datepicker/bootstrap-datepicker.min.css"
	rel="stylesheet">
<link href="/resources/css/map.css" rel="stylesheet">
<!--noUiSlider [ OPTIONAL ]-->
    <link href="/resources/plugins/noUiSlider/nouislider.min.css" rel="stylesheet">
<!--Bootstrap Timepicker [ OPTIONAL ]-->
<script
	src="/resources/plugins/bootstrap-timepicker/bootstrap-timepicker.min.js"></script>
<!--Bootstrap Datepicker [ OPTIONAL ]-->
<script
	src="/resources/plugins/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
<!--noUiSlider [ OPTIONAL ]-->
    <script src="/resources/plugins/noUiSlider/nouislider.min.js"></script>	
<!-- services 라이브러리 불러오기 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6213368344dd87ee3c46139e0d1df7cd&libraries=services,clusterer,drawing"></script>

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
									<form id="meetRegForm" class="form-horizontal"
										action="/groups/${groupId}/schedule/meetmodify" method="post">
										<input type="hidden" name="teamId" value="${groupId }">
										<input type="hidden" name="meetId" value="${MeetVO.meetVO.meetId}">
										<div class="panel-body">
											<div class="row">
											<div class="col-xs-1"></div>
											<div class="col-xs-10">
											<div class="form-group">
												<label class="col-lg-2 control-label">모임 글제목</label>
												<div class="col-lg-10">
													<input type="text" class="form-control" name="meetTitle"  value="${MeetVO.meetVO.meetTitle }">
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-2 control-label">모임 장소</label>
												<div class="col-lg-10">
													<div class="input-group mar-btm">
														<input type="text" id="keyword" class="form-control" value="${MeetVO.meetVO.meetAreaName }">
														<input type="hidden" id="areaName" name="meetAreaName" value="${MeetVO.meetVO.meetAreaName }">
														<input type="hidden" id="area" name="meetArea" value="${MeetVO.meetVO.meetArea }">
														<span class="input-group-btn">
															<button class="btn btn-dark" type="button" id="mapSearchBtn">장소검색</button>
														</span>
													</div>	
												</div>
  											</div>
											<!--  지도 -->
											<div class="hidden" id="mapBox">
												<div class="form-group">
													<div class="clearfix">
														<div class="col-lg-8 col-lg-push-4">
															<div class="map_wrap">
																<div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
															</div>
														</div>
														<div class="col-lg-4 col-lg-pull-8">
															<div id="menu_wrap" class="bg-trans-dark">
																<ul id="placesList" class="pad-no"></ul>
																<div id="pagination"></div>
															</div>
														</div>
													</div>		
												</div>
											</div>
											<!--  지도끝 -->
											<div class="form-group">
												<label class="col-lg-2 control-label">만나는날</label>
												<div class="col-lg-10 pad-no">
													<div class="clearfix">
														<div class="col-lg-5">
															<input type="text" class="form-control" id="meetDay" value="<fmt:formatDate value="${MeetVO.meetVO.meetDate}" pattern="yyyyMMdd"/>">
														</div>
														<div class="col-lg-2 text-lg-right">
															<label class="control-label">시간</label>
														</div>
														<div class="col-lg-5">
															<input type="text" class="form-control" id="meetTime" value="<fmt:formatDate value="${MeetVO.meetVO.meetDate}" pattern="HH:mm"/>">
														</div>
														<input type="hidden" id="meetDate" name="meetDate"  value="${MeetVO.meetVO.meetDate }">
													</div>
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-2 control-label">모임 글내용</label>
												<div class="col-lg-10">
													<textarea rows="9" class="form-control" name="meetContent"
														placeholder="Your content here.." style="resize: none;">${MeetVO.meetVO.meetContent }</textarea>
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-2 control-label">모임 회비</label>
												<div class="col-lg-10 pad-no">
													<div class="clearfix">
														<div class="col-lg-5">
															<input type="text" name="meetPay" class="form-control" value="${MeetVO.meetVO.meetPay }">
														</div>
														<div class="col-lg-2 text-lg-right">
															<label class="control-label">모임 인원</label>
														</div>
														<div class="col-lg-5">
					                                   			<div id="meetMaxBar" class="mar-top">
					                                    		</div>
														</div>
													</div>
													<div class="text-right mar-rgt">
														 <label class="control-label" id="meetMax">2</label>
					                                     <strong>명 </strong>
													</div>
													<input type="hidden" name="meetMax" class="form-control" value="${MeetVO.meetVO.meetMax }">
												</div>
											</div>
											<div class="form-group text-right">
												<div class="col-xs-12">
													<button type="button" class="btn btn-default btn-hover-warning" id="cnlbtn" onclick="location.href='/groups/${ group.teamId }/schedule'">
														&ensp;&ensp;목록&ensp;&ensp;</button>
													<button type="submit" class="btn btn-default btn-hover-info" id="subbtn">등록하기</button>
												</div>
											</div>
											</div>
											<div class="col-xs-1"></div>
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
	<!--Bootbox Modals [ OPTIONAL ]-->
	<script src="/resources/plugins/bootbox/bootbox.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		
		/*========= 지도 =========*/
		//장소명을 저장할 input태그
		var areaName = document.querySelector('#areaName');
		//장소를 저장할 input태그
		var area = document.querySelector('#area');
		//검색에 사용되는 input태그
		var inputKeyword = document.querySelector('#keyword');
		//검색 버튼
		var msb = document.getElementById('mapSearchBtn');
		// 마커를 담을 배열입니다
		
		var markers = [];
		// 활성화된 overlay를 저장해 두는 변수입니다.
		var overlay = '';
		//검색 이벤트
		msb.addEventListener('click',function(){
			var keyword = document.getElementById('keyword').value;
			
			if (!keyword.replace(/^\s+|\s+$/g, '')) {
				alert('키워드를 입력해주세요!');
				return false;
			}
			ps.keywordSearch(keyword, placesSearchCB);
		});
		
		$('input[type="text"]').keydown(function(event) {
  			if (event.keyCode === 13) {
   				 event.preventDefault();
  			};
		});
		
		inputKeyword.addEventListener('keydown',function(key){
			 if (key.keyCode == 13) {
				 var keyword = document.getElementById('keyword').value;
					if (!keyword.replace(/^\s+|\s+$/g, '')) {
						alert('키워드를 입력해주세요!');
						return false;
					}
					// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
					ps.keywordSearch(keyword, placesSearchCB);
            }
		});
		
		// 지도 생성시의 설정입니다.(여기있는 mapOption은 hidden상태의 옵션입니다. 검색 이후 나타나는 지도 설정은 다른곳에서 변경!)
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div태그의 id
		mapOption = {
			center : new kakao.maps.LatLng(37.566826, 126.9786567), 
			level : 3
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places();

		// 키워드 검색을 요청하는 함수입니다
		function searchPlaces() {
			var keyword = document.getElementById('keyword').value;
			if (!keyword.replace(/^\s+|\s+$/g, '')) {
				alert('키워드를 입력해주세요!');
				return false;
			}
			// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
			ps.keywordSearch(keyword, placesSearchCB);
		}

		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
			if (status === kakao.maps.services.Status.OK) {
				//검색 성공시 검색결과목록창과 지도를 보여줍니다. 
				$('#mapBox').removeClass('hidden');
				//지도의 위치를 재설정하기 위한 함수입니다. 보여진상태(지도크기가 변경된 상태) 이후 사용해야합니다.
				map.relayout();
				displayPlaces(data);
				displayPagination(pagination);
			} else if (status === kakao.maps.services.Status.ZERO_RESULT) {
				alert('검색 결과가 존재하지 않습니다.');
				return;

			} else if (status === kakao.maps.services.Status.ERROR) {
				alert('검색 결과 중 오류가 발생했습니다.');
				return;
			}
		}
		
		//overlay[마커위에 생성되는 정보창] 태그 생성과 보여주는 함수입니다.
		function setOverlay(place,map,marker){
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
                          '                    <div class="close" id="closeOverlay" title="닫기"></div>' + 
                          '                </div>' +
                          '            </div>' +
            			  '        </div>' + 
            			  '        <div class="body">' + 
                          '            <div class="desc">' + 
                          '                <div class="ellipsis">'+place.category_group_name+'</div>' + 
                          '                <div class="ellipsis">'+address+'</div>' + 
                          '                <div class="ellipsis">'+place.phone +
                          '                    <a href="'+place.place_url+'" target="_blank" class="link pull-right">자세히보기</a>' +
                          '                </div>' + 
                          '            </div>' + 
                          '        </div>' + 
                          '    </div>' +    
                          '</div>';
                          
			overlay = new kakao.maps.CustomOverlay({
			    content: content,
			    map: map,
			    position: marker.getPosition()       
			});
			
		}
		//오버레이 닫기 이벤트입니다. (기능상 문제 없는거 같아보이나 시간나면 고칠 예정)
		$("#mapBox").on("click","#closeOverlay",function(){
			overlay.setMap(null);
		});
		// 검색 결과 목록과 마커를 표출하는 함수입니다
		function displayPlaces(places) {
			var listEl = document.getElementById('placesList'), menuEl = document
					.getElementById('menu_wrap'), fragment = document
					.createDocumentFragment(), bounds = new kakao.maps.LatLngBounds(), listStr = '';

			// 검색 결과 목록에 추가된 항목들을 제거합니다
			removeAllChildNods(listEl);
			// 지도에 표시되고 있는 마커를 제거합니다
			removeMarker();
			
			for (var i = 0; i < places.length; i++) {
				// 마커를 생성하고 지도에 표시합니다
				var placePosition = new kakao.maps.LatLng(places[i].y,
						places[i].x), marker = addMarker(placePosition, i,places[i]), itemEl = getListItem(
						i, places[i],marker); // 검색 결과 항목 Element를 생성합니다
					
				// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				// LatLngBounds 객체에 좌표를 추가합니다
				bounds.extend(placePosition);
				fragment.appendChild(itemEl);
			}

			// 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
			listEl.appendChild(fragment);
			menuEl.scrollTop = 0;
			
			// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			map.setBounds(bounds);
		}
		

		// 검색결과 항목을 Element로 반환하는 함수입니다
		function getListItem(index, places,marker) {

			var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
					+ (index + 1)
					+ '"></span>'
					+ '<div class="info">'
					+ '   <h5>' + places.place_name + '</h5>';

			if (places.road_address_name) {
				itemStr += '    <span>' + places.road_address_name + '</span>'
						+ '   <span class="jibun gray">' + places.address_name
						+ '</span>';
			} else {
				itemStr += '    <span>' + places.address_name + '</span>';
			}

			itemStr += '  <span class="tel">' + places.phone + '</span>'
					+ '</div>';

			el.innerHTML = itemStr;
			el.className = 'item';
			//검색창 눌렀을때 저장되는 그것임 ..
			el.addEventListener('click', function() {
				var coordList = new kakao.maps.LatLng(places.y, places.x);
				map.setCenter(coordList);
				map.setLevel(3);
				// 네모창에 네모네모 저장저장 네모네모 
				if(overlay){ //overlay!='';
					overlay.setMap(null);
				}
				setOverlay(places,map,marker);
				inputKeyword.value = places.place_name;
				areaName.value = places.place_name;
				area.value = places.y+","+places.x;
				
				$.niftyNoty({
                    type: 'success',
                    icon : 'pli-like-2 icon-2x',
                    message :'장소 ('+places.place_name+')가 선택 되었습니다.',
                    container : 'floating',
                    timer : 5000
                });
				
			});
			return el;
		}

		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, idx, title) {
			var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
			imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
			imgOptions = {
				spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
				spriteOrigin : new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
				offset : new kakao.maps.Point(13, 37)
			// 마커 좌표에 일치시킬 이미지 내에서의 좌표
			}, markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
					imgOptions), marker = new kakao.maps.Marker({
				position : position, // 마커의 위치
				image : markerImage
			});
			//마커 클릭이벤트
			kakao.maps.event.addListener(marker,'click',function() {
				//내생각에는 이걸 계속 호출하게 되는 상황이 문제인데 어절수없음
				map.setCenter(position);
				map.setLevel(3);
				//새로운 오버레이 생성전에 기존 오버레이를 닫습니다.
				if(overlay){
					overlay.setMap(null);
				}
				//오버레이 셋팅
				setOverlay(title,map,marker)
				inputKeyword.value = title.place_name;
				areaName.value = title.place_name;
				area.value = title.y+","+title.x;
				
				$.niftyNoty({
                    type: 'success',
                    icon : 'pli-like-2 icon-2x',
                    message :'장소 ('+title.place_name+')가 선택 되었습니다.',
                    container : 'floating',
                    timer : 5000
                });
			});
			marker.setMap(map); // 지도 위에 마커를 표출합니다
			markers.push(marker); // 배열에 생성된 마커를 추가합니다

			return marker;
		}

		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(null);
			}
			markers = [];
			if(overlay){ //overlay!='';
				overlay.setMap(null);
			}
		}

		// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
		function displayPagination(pagination) {
			var paginationEl = document.getElementById('pagination'), fragment = document
					.createDocumentFragment(), i;

			// 기존에 추가된 페이지번호를 삭제합니다
			while (paginationEl.hasChildNodes()) {
				paginationEl.removeChild(paginationEl.lastChild);
			}

			for (i = 1; i <= pagination.last; i++) {
				var el = document.createElement('a');
				el.href = "#";
				el.innerHTML = i;

				if (i === pagination.current) {
					el.className = 'on';
				} else {
					el.onclick = (function(i) {
						return function() {
							pagination.gotoPage(i);
						}
					})(i);
				}

				fragment.appendChild(el);
			}
			paginationEl.appendChild(fragment);
		}

		// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
		// 인포윈도우에 장소명을 표시합니다

		// 검색결과 목록의 자식 Element를 제거하는 함수입니다
		function removeAllChildNods(el) {
			while (el.hasChildNodes()) {
				el.removeChild(el.lastChild);
			}
		}
		
		/*==================*/
		var sysDate = new Date();
		var setmemberBar = '<c:out value="${MeetVO.meetVO.meetMax}"/>'
		
		
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
		
		// RANGE SLIDER - SLIDER STEP BY STEP
	    // =================================================================
	    // Require noUiSlider
	    // http://refreshless.com/nouislider/
	    // =================================================================

	    var rs_step = document.querySelector("#meetMaxBar");
	    var rs_step_value = document.querySelector("#meetMax");

	    noUiSlider.create(rs_step,{
	        start   : [ setmemberBar ],
	        connect : 'lower',
	        step    : 1,
	        range   : {
	            'min': [ 2 ],
	            'max': [ 100 ]
	        }
	    });

	    rs_step.noUiSlider.on('update', function( values, handle ) {
	    	var person = values[handle].split('.')
	    	$('input[name=meetMax]').val(person[0]);
	        rs_step_value.innerHTML = person[0];
	    });
		
		$('#subbtn').on('click',function(e){
			e.preventDefault();//submit 버튼 동작안하게만듬
			var meetDay = $('#meetDay').val()
			setDate(meetDay);
			if($("input[name=meetTitle]").val()==""){
				bootbox.alert("글 제목이 작성되지 않았습니다.")
				return false;
			}else if($("input[name='meetArea']").val()==""){
				bootbox.alert("장소가 작성되지 않았습니다.")
				return false;
			}else if($("#meetDay").val()==""){
				bootbox.alert("날짜가 선택되지 않았습니다.")
				return false;
			}else if($("#meetTime").val()==""){
				bootbox.alert("시간이 선택되지 않았습니다.")
				return false;
			}else if($("textarea[name='meetContent']").val()==""){
				bootbox.alert("내용이 작성되지 않았습니다.")
				return false;
			}else if($("input[name='meetPay']").val()==""){
				bootbox.alert("비용이 작성되지 않았습니다.")
				return false;
			}else if($("input[name='meetMax']").val()==""){
				bootbox.alert("인원이 작성되지 않았습니다.")
				return false;
			}
			bootbox.confirm("모임을 수정하시겠습니까?",function(result){
				if (result) {
					$('#meetRegForm').submit();
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
	 <%-- for modal --%>
	<c:if test="${ !empty loginVO }">
		<%@ include file="../../includes/modals.jsp" %>
	</c:if>
	<%-- for modal --%>
</body>
</html>