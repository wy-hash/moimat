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

	                <div id="regdateChart" style="height:212px"></div>
		
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
    <script src="/resources/plugins/flot-charts/jquery.flot.min.js"></script>
	<script src="/resources/plugins/flot-charts/jquery.flot.resize.min.js"></script>
<script>
$(document).ready(function(){

//  등록일 차트용
var pageviews = [[1, 1700], [2, 1200], [3, 1090], [4, 1550], [5, 1700], [6, 1850], [7, 2736], [8, 3045], [9, 3779], [10, 4895], [11, 5209], [12, 5100]],
    visitor = [[1, 456], [2, 589], [3, 354], [4, 558], [5, 254], [6, 656], [7, 124], [8, 523], [9, 256], [10, 987], [11, 854], [12, 965]];

 var plot = $.plot("#regdateChart", [
     {
         label: 'Pageviews',
         data: pageviews,
         lines: {
             show: true,
             lineWidth:2,
             fill: true,
             fillColor: {
                 colors: [{opacity: 0.5}, {opacity: 0.5}]
             }
         },
         points: {
             show: true,
             radius: 4
         }
     },
     {
         label: 'Visitors',
         data: visitor,
         lines: {
             show: true,
             lineWidth:2,
             fill: true,
             fillColor: {
                 colors: [{opacity: 0.5}, {opacity: 0.5}]
             }
         },
         points: {
             show: true,
             radius: 4
         }
     }
 ],{
 series: {
     lines: {
         show: true
     },
     points: {
         show: true
     },
     shadowSize: 0	// Drawing is faster without shadows
 },
 colors: ['#177bbb', '#177bbb'],
 legend: {
     show: true,
     position: 'nw',
     margin: [15, 0]
 },
 grid: {
     borderWidth: 0,
     hoverable: true,
     clickable: true
 },
 yaxis: {
     ticks: 4, tickColor: '#eeeeee'
 },
 xaxis: {
     ticks: 12,
     tickColor: '#ffffff'
 }
});
});
</script>
	
</body>
</html>