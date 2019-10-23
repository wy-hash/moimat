<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<!-- HEAD -->
<%@ include file="../includes/head.jsp"%>
<title>Page Template | moim@</title>
</head>
<!-- END HEAD -->

<body>
	<!--TIPS-->
	<!--You may remove all ID or Class names which contain "demo-", they are only used for demonstration. -->
	<div id="container" class="effect aside-float aside-bright mainnav-lg">

		<!-- HEADER-NAVBAR -->
<%-- 		<%@ include file="../includes/header-navbar.jsp"%> --%>
		<!-- END NAVBAR -->

		<!-- BOXED -->
		<div class="cls-content text-center">

			<!-- MAIN-NAV -->
<%-- 			<%@ include file="../includes/main-nav.jsp"%> --%>
			<!-- END MAIN-NAV -->

			<!-- ASIDE -->
			<%-- <%@ include file="../includes/aside.jsp" %> --%>
			<!-- END ASIDE -->
			



			<!--CONTENT CONTAINER-->
			<!--===================================================-->
<!-- 			<div id="content-container"> -->

				<!--Page Title-->
				<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
				<div id="page-title">
<!-- 					<h1 class="page-header text-overflow">Page Template</h1> -->
				</div>
				<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
				<!--End page title-->

				<!--Page content-->
				<!--===================================================-->
				<div id="page-content">
					<!-- #################################### -->
					<!-- #### WRITE CODE BELOW THIS LINE #### -->
					<!-- #################################### -->
					<div class="cls-content text-center">
					    <h1 class="error-code text-info">500</h1>
					    <p class="text-main text-semibold text-lg text-uppercase">Server error</p>
					    <div class="pad-btm text-muted">
					       	 입력된 정보가 올바지 않습니다.
					    </div>
					    <hr class="new-section-sm bord-no">
					    <div class="pad-top"><a class="btn-link" href="/home">홈 화면</a></div>
					</div>


				</div>
				<!--===================================================-->
				<!--End page content-->


<!-- 			</div> -->
			<!--===================================================-->
			<!--END CONTENT CONTAINER-->



		</div>
		<!-- END BOXED -->

		<!-- FOOTER -->
		<%@ include file="../includes/footer.jsp"%>
		<!-- END FOOTER -->

	</div>
	<!-- END CONTAINER -->
	
	
</body>
</html>