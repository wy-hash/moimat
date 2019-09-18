<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<!-- HEAD -->
<%@ include file="includes/head.jsp"%>
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
						<!-- temporary use img -->
						<div class="mar-btm">
							<img src="/resources/img/bg-img/bg-img-2.jpg"
								class="img-responsive" alt="Responsive image"
								style="max-height: 250px; width: 100%">
						</div>
						<!-- temporary use panel -->
						<div class="panel panel-dark">
							<div class="panel-heading">
								<h3 class="panel-title">(대충 모임 명인 것)</h3>
							</div>
							<div class="panel-body" style="height: 600px">
								<p>(대충 모임 소개내용인 것)
								<p>
							</div>

						</div>
					</div>
					<!-- end ./panel panel-dafault -->
					<!-- start container-fluid -->
					<!-- meet list -->
					<div class="container-fluid">
						<div class="panel">
							<div class="panel-body">
								<div class="row">
									<div class="col-md-4 visible-md visible-lg"
										style="min-width: 200px; height: 300px;">
										<div id="map" style="height: 100%"></div>
										<!-- map div -->
										<!-- style width height 설정하지 않으면 지도가 정상적으로 안나옴-->
									</div>
									<div class="col-md-8"><!-- 정모 내용 들어갈 공간 --></div>
								</div>
								<hr>
								<!-- 이하 화면 테스트용  -->
								<div class="row">
									<div class="col-md-4 visible-md visible-lg"
										style="min-width: 200px; height: 300px;">
										<div id="map2" style="height: 100%"></div>
										<!-- map div -->
									</div>
									<div class="col-md-8"><!-- 정모 내용 들어갈 공간 --></div>
								</div>
								<hr>
								<div class="row">
									<div class="col-md-4 visible-md visible-lg"
										style="min-width: 200px; height: 300px;">
										<div id="map3" style="height: 100%"></div>
									</div>
									<div class="col-md-8"><!-- 정모 내용 들어갈 공간 --></div>
								</div>
							</div>
							<div class="panel-footer">
								<!-- pagination button 들어갈 공간 -->
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
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6213368344dd87ee3c46139e0d1df7cd&libraries=services"></script>
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6213368344dd87ee3c46139e0d1df7cd"></script>
		<script>
			window.onload = function() {
				
				var attend = document.getElementById("attend");
				var geocoder = new kakao.maps.services.Geocoder();
				setMap('서초구','map');
				setMap('서초구','map2');
				setMap('서초구','map3');
				//map id와 meetVO에 있는 area 어떻게 가져올까 다시 생각하기
				
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
			}
		</script>
</body>
</html>