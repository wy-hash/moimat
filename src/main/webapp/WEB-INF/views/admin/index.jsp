<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<!-- HEAD -->
<%@ include file="../includes/head.jsp" %>

    <!--Bootstrap Table [ OPTIONAL ]-->
    <link href="/resources/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">


    <!--X-editable [ OPTIONAL ]-->
    <link href="/resources/plugins/x-editable/css/bootstrap-editable.css" rel="stylesheet">
    
    <!-- Material Design Bootstrap Chart-->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.8.10/css/mdb.min.css" rel="stylesheet">

	<title>Page Template | moim@</title>
</head>
<!-- END HEAD -->

<body>
	<!--TIPS-->
	<!--You may remove all ID or Class names which contain "demo-", they are only used for demonstration. -->
	<div id="container" class="effect aside-float aside-bright mainnav-lg">
	
		<!-- HEADER-NAVBAR -->
		<%@ include file="../includes/header-navbar.jsp" %>
		<!-- END NAVBAR -->
		
		<!-- BOXED -->
		<div class="boxed">
		
			<!-- MAIN-NAV -->
			<%@ include file="../includes/main-nav.jsp" %>
			<!-- END MAIN-NAV -->
			
			<!-- ASIDE -->
			<%-- <%@ include file="../includes/aside.jsp" %> --%>
			<!-- END ASIDE -->
			
			
					
           <!--CONTENT CONTAINER-->
            <!--===================================================-->
            <div id="content-container">
		                
		        <!--Page Title-->
		        <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
		        <div id="page-title">
<!-- 					<div class="panel panel-bordered panel-dark"> -->
			            <div class="panel-heading">
			            </div>
<!-- 			        </div> -->
                </div>
                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                <!--End page title-->
                <!--Page content-->
                <!--===================================================-->
                <div id="page-content">
                	<!-- #################################### -->
                	<!-- #### WRITE CODE BELOW THIS LINE #### -->
            	    <!-- #################################### -->
					<!--  관리자 인덱스 -->
					<!--===================================================-->
				    <div class="eq-height">
			            <div class="panel col-sm-12">
			                <div class="panel-heading">
			                    <h4 class="panel-title">최근 가입자 수</h4>
			                </div>
			                <div class="panel-body">
			            		<canvas id="regdateCount" ></canvas>
			                </div>
			            </div>
					</div>
					<div class="eq-height">
			            <div class="panel col-sm-6">
			            	<div class="panel-heading">
			                    <h4 class="panel-title">회원이 가장 선호하는 관심사</h4>
			                </div>
			                <div class="panel-body">
			            		<canvas id="userInterest" ></canvas>
			                </div>
			            </div>
			            <div class="panel col-sm-6">
			            	<div class="panel-heading">
			                    <h4 class="panel-title">회원이 가장 선호하는 활동지역</h4>
			                </div>
			                <div class="panel-body">
			            		<canvas id="userArea" ></canvas>
			                </div>
			            </div>
					</div>
					<div class="eq-height">
			            <div class="panel col-sm-6">
			            	<div class="panel-heading">
			                    <h4 class="panel-title">모임에서 인기 많은 지역</h4>
			                </div>
			                <div class="panel-body">
			            		<canvas id="groupArea" ></canvas>
			                </div>
			            </div>
			            <div class="panel col-sm-6">
			            	<div class="panel-heading">
			                    <h4 class="panel-title">모임에서 인기 많은 관심사</h4>
			                </div>
			                <div class="panel-body">
			            		<canvas id="groupInterest" ></canvas>
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
		<%@ include file="../includes/footer.jsp" %>
		<!-- END FOOTER -->
		
			
	</div>
	<!-- END CONTAINER -->
  
    <!--Bootstrap Table Sample [ SAMPLE ]-->
    <script src="/resources/js/demo/tables-bs-table.js"></script>


    <!--X-editable [ OPTIONAL ]-->
    <script src="/resources/plugins/x-editable/js/bootstrap-editable.min.js"></script>


    <!--Bootstrap Table [ OPTIONAL ]-->
    <script src="/resources/plugins/bootstrap-table/bootstrap-table.min.js"></script>


    <!--Bootstrap Table Extension [ OPTIONAL ]-->
    <script src="/resources/plugins/bootstrap-table/extensions/editable/bootstrap-table-editable.js"></script>

    <!--Flot Chart [ OPTIONAL ]-->
<!--     <script src="/resources/plugins/flot-charts/jquery.flot.min.js"></script> -->
<!-- 	<script src="/resources/plugins/flot-charts/jquery.flot.resize.min.js"></script> -->

	<!-- MDB core JavaScript -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.8.10/js/mdb.min.js"> </script>
	<script src="/resources/js/admin/chart.js"></script>
	
<script>
$(document).ready(function(){
	lineChartAjax('regdateCount', '/admin/index/users/regdate');
	pieChartAjax('groupInterest', '/admin/index/groups/interest', 'pie');
	pieChartAjax('groupArea', '/admin/index/groups/area', 'pie');
	pieChartAjax('userArea', '/admin/index/users/area', 'doughnut');
	pieChartAjax('userInterest', '/admin/index/users/interest', 'doughnut');
});


function lineChartAjax(canvasId, url){//캔버스에 출력하고자 사용
	$.ajax({
		method : 'POST',
		url : url,
		dataType : 'JSON',
		data : {}
	}).done(function(result) {
		// 값 5개 까지만 사용.
		let regdate = [];	//하단 라벨
		let count 	= [];	//그래프 표시 될 수치 값
		for (let i=0; i<result.length && i<5 ;i++){
			regdate[i] = result[i].value;
			count[i] = result[i].count;
		}
		//function lineChart(canvasId, labelName, labelList, dataList)// canvas영역의 id값, 출력할 데이터의 이름, 항목, 값
		lineChart(canvasId,'가입자 수',regdate.reverse(), count.reverse());
	});
}

function pieChartAjax(canvasId, url, type){//캔버스에 출력하고자 사용 -- >type : pie, doughnut
	$.ajax({
		method : 'POST',
		url : url,
		dataType : 'JSON',
		data : {}
	}).done(function(result) {
		const backgroundColor = ["#F7464A", "#46BFBD", "#FDB45C", "#949FB1", "#4D5360"];
		const hoverBackgroundColor = ["#FF5A5E", "#5AD3D1", "#FFC870", "#A8B3C5", "#616774"];
		
		// 값 5개 까지만 사용.
		let value = [];		//하단 라벨
		let count 	= [];	//그래프 표시 될 수치 값
		let bgColor = [];	//파이색상
		let hbgColor = [];	//마우스올릴 때 파이색상
				
		for (let i=0; i<result.length && i<5 ;i++){
			value[i] = result[i].value;
			count[i] = result[i].count;
			bgColor[i] = backgroundColor[i];
			hbgColor[i] = hoverBackgroundColor[i];
		}
		//function pieChart(canvasId, labelList, dataList, bgColorList, hbgColorList)// canvas영역의 id값, 항목, 값, 항목색상, 항목hover 색상
		pieChart(canvasId, type, value, count, bgColor, hbgColor);
	});
}
	
</script>
	
</body>
</html>