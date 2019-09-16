<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	pageContext.setAttribute("path", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h1>정모목록</h1>

		<c:forEach items="${meetList.meetList }" var="list">
			<div class="card mb-3"">
				<div class="row no-gutters"">
					<div class="col-md-4" id="map${list.seq}"></div>
					<div class="col-md-8">
						<div class="card-body">
							<a href="${groupId }/${list.seq }"><h5 class="card-title">${list.title }</h5></a>
							<p class="card-text">${list.content }</p>
							<p class="card-text">${list.payment }</p>
							<a class="${meetList.isAttend[list.seq]? 'btn btn-danger' :'btn btn-primary'}">참석하기</a>
							<p class="card-text">${meetList.countMeetMember[list.seq] }/${list.maxPerson }</p>
							<p class="card-text">
								<small class="text-muted">Last updated 3 mins ago</small>
							</p>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>

	</div>
	<!-- services 라이브러리 불러오기 -->
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6213368344dd87ee3c46139e0d1df7cd&libraries=services,clusterer,drawing"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6213368344dd87ee3c46139e0d1df7cd"></script>
	<script>
		
		window.onload = function() {
			var geocoder = new kakao.maps.services.Geocoder();
			<c:forEach items="${meetList.meetList }" var="list">
			geocoder.addressSearch('${list.area}', function(result, status) {
				if (status === kakao.maps.services.Status.OK) {
					var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				}
				var mapContainer = document.getElementById('map${list.seq}'), // 지도를 표시할 div 
				mapOption = {
					center : coords,
					level : 3
				};
				var map = new kakao.maps.Map(mapContainer, mapOption);
				var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
				console.log('그런 너를 마주칠까 ' + result[0].address.address_name + '을 못가'); //기억용
			});
			</c:forEach>
		}
	</script>
</body>
</html>