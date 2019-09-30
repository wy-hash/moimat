<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<!-- HEAD -->
<%
	String path = request.getContextPath();
	pageContext.setAttribute("path", path);
%>


<%@ include file="includes/head.jsp"%>
<title>Page Template | moim@</title>
<!--Bootstrap Stylesheet [ REQUIRED ]-->

<!-- include libraries(jQuery, bootstrap) -->
<!--Open Sans Font [ OPTIONAL ]-->
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700'
	rel='stylesheet' type='text/css'>


<!--Bootstrap Stylesheet [ REQUIRED ]-->
<link href="css/bootstrap.min.css" rel="stylesheet">


<!--Nifty Stylesheet [ REQUIRED ]-->
<link href="css/nifty.min.css" rel="stylesheet">


<!--Nifty Premium Icon [ DEMONSTRATION ]-->
<link href="css/demo/nifty-demo-icons.min.css" rel="stylesheet">


<!--Demo [ DEMONSTRATION ]-->
<link href="css/demo/nifty-demo.min.css" rel="stylesheet">


<!--JAVASCRIPT-->
<!--=================================================-->

<!--Pace - Page Load Progress Par [OPTIONAL]-->
<link href="plugins/pace/pace.min.css" rel="stylesheet">
<script src="plugins/pace/pace.min.js"></script>


<!--jQuery [ REQUIRED ]-->
<script src="js/jquery-2.2.4.min.js"></script>


<!--BootstrapJS [ RECOMMENDED ]-->
<script src="js/bootstrap.min.js"></script>


<!--NiftyJS [ RECOMMENDED ]-->
<script src="js/nifty.min.js"></script>



<!--=================================================-->

<!--Demo script [ DEMONSTRATION ]-->
<script src="js/demo/nifty-demo.min.js"></script>

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
					<h1 class="page-header text-overflow">사진 게시판</h1>
				</div>
				<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
				<!--End page title-->

				<!--Page content-->
				<!--===================================================-->
				<!-- #################################### -->
				<!-- #### WRITE CODE BELOW THIS LINE #### -->
				<!-- #################################### -->
				<div class="row">
					<div class="col-lg-3">

						<!--Default Accordion-->
						<!--===================================================-->
						<div class="panel-group accordion" id="accordion">
							<div class="panel">

								<!--Accordion title-->
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-parent="#accordion" data-toggle="collapse"
											href="#collapseOne">${title}</a>
										<!--참고해서 페이지 이동  <a href="이동할 페이지의 주소(URL)#jangmi">장미 구경하세요</a> -->
									</h4>
								</div>

								<!--Accordion c ontent-->
								<div class="panel-collapse collapse in" id="collapseOne">
									<div class="panel-body">
									<img src="${path}/resources/img/test.jpg">
										
									</div>
									<span class="m-tcol-p num">
									[
									<strong>1</strong>
									]
									</span>
								</div>
							</div>

						</div>
						<!--===================================================-->
						<!--End Default Accordion-->

					</div>

					<div class="col-lg-3">
						<!--Default Accordion-->
						<!--===================================================-->
						<div class="panel-group accordion" id="accordion">
							<div class="panel">

								<!--Accordion title-->
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-parent="#accordion" data-toggle="collapse"
											href="#collapseOne">Collapsible Group Item #1</a>
									</h4>
								</div>

								<!--Accordion content-->
								<div class="panel-collapse collapse in" id="collapseOne">
									<div class="panel-body">Anim pariatur cliche
										reprehenderit, enim eiusmod high life accusamus terry
										richardson ad squid. 3 wolf moon officia aute, non cupidatat
										skateboard dolor brunch. Food truck quinoa nesciunt laborum
										eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on
										it squid single-origin coffee nulla assumenda shoreditch et.
										Nihil anim keffiyeh helvetica, craft beer labore wes anderson
										cred nesciunt sapiente ea proident. Ad vegan excepteur butcher
										vice lomo. Leggings occaecat craft beer farm-to-table, raw
										denim aesthetic synth nesciunt you probably haven\'t heard of
										them accusamus labore sustainable VHS.</div>
								</div>
							</div>

						</div>
						<!--===================================================-->
						<!--End Default Accordion-->

					</div>
					<div class="col-lg-3">

						<!--Default Accordion-->
						<!--===================================================-->
						<div class="panel-group accordion" id="accordion">
							<div class="panel">

								<!--Accordion title-->
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-parent="#accordion" data-toggle="collapse"
											href="#collapseOne">Collapsible Group Item #1</a>
									</h4>
								</div>

								<!--Accordion content-->
								<div class="panel-collapse collapse in" id="collapseOne">
									<div class="panel-body">Anim pariatur cliche
										reprehenderit, enim eiusmod high life accusamus terry
										richardson ad squid. 3 wolf moon officia aute, non cupidatat
										skateboard dolor brunch. Food truck quinoa nesciunt laborum
										eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on
										it squid single-origin coffee nulla assumenda shoreditch et.
										Nihil anim keffiyeh helvetica, craft beer labore wes anderson
										cred nesciunt sapiente ea proident. Ad vegan excepteur butcher
										vice lomo. Leggings occaecat craft beer farm-to-table, raw
										denim aesthetic synth nesciunt you probably haven\'t heard of
										them accusamus labore sustainable VHS.</div>
								</div>
							</div>

						</div>
						<!--===================================================-->
						<!--End Default Accordion-->

					</div>
					<div class="col-lg-3">

						<!--Default Accordion-->
						<!--===================================================-->
						<div class="panel-group accordion" id="accordion">
							<div class="panel">

								<!--Accordion title-->
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-parent="#accordion" data-toggle="collapse"
											href="#collapseOne">Collapsible Group Item #1</a>
									</h4>
								</div>

								<!--Accordion content-->
								<div class="panel-collapse collapse in" id="collapseOne">
									<div class="panel-body">Anim pariatur cliche
										reprehenderit, enim eiusmod high life accusamus terry
										richardson ad squid. 3 wolf moon officia aute, non cupidatat
										skateboard dolor brunch. Food truck quinoa nesciunt laborum
										eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on
										it squid single-origin coffee nulla assumenda shoreditch et.
										Nihil anim keffiyeh helvetica, craft beer labore wes anderson
										cred nesciunt sapiente ea proident. Ad vegan excepteur butcher
										vice lomo. Leggings occaecat craft beer farm-to-table, raw
										denim aesthetic synth nesciunt you probably haven\'t heard of
										them accusamus labore sustainable VHS.</div>
								</div>
							</div>

						</div>
						<!--===================================================-->
						<!--End Default Accordion-->

					</div>
					<div class="row"></div>

					<!--===================================================-->
					<!--End page content-->


				</div>
				<div class="row">
					<div class="col-lg-3">

						<!--Default Accordion-->
						<!--===================================================-->
						<div class="panel-group accordion" id="accordion">
							<div class="panel">

								<!--Accordion title-->
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-parent="#accordion" data-toggle="collapse"
											href="#collapseOne">Collapsible Group Item #1</a>
									</h4>
								</div>

								<!--Accordion content-->
								<div class="panel-collapse collapse in" id="collapseOne">
									<div class="panel-body">Anim pariatur cliche
										reprehenderit, enim eiusmod high life accusamus terry
										richardson ad squid. 3 wolf moon officia aute, non cupidatat
										skateboard dolor brunch. Food truck quinoa nesciunt laborum
										eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on
										it squid single-origin coffee nulla assumenda shoreditch et.
										Nihil anim keffiyeh helvetica, craft beer labore wes anderson
										cred nesciunt sapiente ea proident. Ad vegan excepteur butcher
										vice lomo. Leggings occaecat craft beer farm-to-table, raw
										denim aesthetic synth nesciunt you probably haven\'t heard of
										them accusamus labore sustainable VHS.</div>
								</div>
							</div>

						</div>
						<!--===================================================-->
						<!--End Default Accordion-->

					</div>

					<div class="col-lg-3">

						<!--Default Accordion-->
						<!--===================================================-->
						<div class="panel-group accordion" id="accordion">
							<div class="panel">

								<!--Accordion title-->
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-parent="#accordion" data-toggle="collapse"
											href="#collapseOne">Collapsible Group Item #1</a>
									</h4>
								</div>

								<!--Accordion content-->
								<div class="panel-collapse collapse in" id="collapseOne">
									<div class="panel-body">Anim pariatur cliche
										reprehenderit, enim eiusmod high life accusamus terry
										richardson ad squid. 3 wolf moon officia aute, non cupidatat
										skateboard dolor brunch. Food truck quinoa nesciunt laborum
										eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on
										it squid single-origin coffee nulla assumenda shoreditch et.
										Nihil anim keffiyeh helvetica, craft beer labore wes anderson
										cred nesciunt sapiente ea proident. Ad vegan excepteur butcher
										vice lomo. Leggings occaecat craft beer farm-to-table, raw
										denim aesthetic synth nesciunt you probably haven\'t heard of
										them accusamus labore sustainable VHS.</div>
								</div>
							</div>

						</div>
						<!--===================================================-->
						<!--End Default Accordion-->

					</div>
					<div class="col-lg-3">

						<!--Default Accordion-->
						<!--===================================================-->
						<div class="panel-group accordion" id="accordion">
							<div class="panel">

								<!--Accordion title-->
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-parent="#accordion" data-toggle="collapse"
											href="#collapseOne">Collapsible Group Item #1</a>
									</h4>
								</div>

								<!--Accordion content-->
								<div class="panel-collapse collapse in" id="collapseOne">
									<div class="panel-body">Anim pariatur cliche
										reprehenderit, enim eiusmod high life accusamus terry
										richardson ad squid. 3 wolf moon officia aute, non cupidatat
										skateboard dolor brunch. Food truck quinoa nesciunt laborum
										eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on
										it squid single-origin coffee nulla assumenda shoreditch et.
										Nihil anim keffiyeh helvetica, craft beer labore wes anderson
										cred nesciunt sapiente ea proident. Ad vegan excepteur butcher
										vice lomo. Leggings occaecat craft beer farm-to-table, raw
										denim aesthetic synth nesciunt you probably haven\'t heard of
										them accusamus labore sustainable VHS.</div>
								</div>
							</div>

						</div>
						<!--===================================================-->
						<!--End Default Accordion-->

					</div>
					<div class="col-lg-3">

						<!--Default Accordion-->
						<!--===================================================-->
						<div class="panel-group accordion" id="accordion">
							<div class="panel">

								<!--Accordion title-->
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-parent="#accordion" data-toggle="collapse"
											href="#collapseOne">Collapsible Group Item #1</a>
									</h4>
								</div>

								<!--Accordion content-->
								<div class="panel-collapse collapse in" id="collapseOne">
									<div class="panel-body">Anim pariatur cliche
										reprehenderit, enim eiusmod high life accusamus terry
										richardson ad squid. 3 wolf moon officia aute, non cupidatat
										skateboard dolor brunch. Food truck quinoa nesciunt laborum
										eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on
										it squid single-origin coffee nulla assumenda shoreditch et.
										Nihil anim keffiyeh helvetica, craft beer labore wes anderson
										cred nesciunt sapiente ea proident. Ad vegan excepteur butcher
										vice lomo. Leggings occaecat craft beer farm-to-table, raw
										denim aesthetic synth nesciunt you probably haven\'t heard of
										them accusamus labore sustainable VHS.</div>
								</div>
							</div>

						</div>
						<!--===================================================-->
						<!--End Default Accordion-->

					</div>
					<div class="row"></div>
					<!--===================================================-->
					<!--End Default Accordion-->

				</div>
				<div class="col-lg-3">

					<!--Default Accordion-->
					<!--===================================================-->
					<div class="panel-group accordion" id="accordion">
						<div class="panel">

							<!--Accordion title-->
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-parent="#accordion" data-toggle="collapse"
										href="#collapseOne">Collapsible Group Item #1</a>
								</h4>
							</div>

							<!--Accordion content-->
							<div class="panel-collapse collapse in" id="collapseOne">
								<div class="panel-body">Anim pariatur cliche
									reprehenderit, enim eiusmod high life accusamus terry
									richardson ad squid. 3 wolf moon officia aute, non cupidatat
									skateboard dolor brunch. Food truck quinoa nesciunt laborum
									eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on
									it squid single-origin coffee nulla assumenda shoreditch et.
									Nihil anim keffiyeh helvetica, craft beer labore wes anderson
									cred nesciunt sapiente ea proident. Ad vegan excepteur butcher
									vice lomo. Leggings occaecat craft beer farm-to-table, raw
									denim aesthetic synth nesciunt you probably haven\'t heard of
									them accusamus labore sustainable VHS.</div>
							</div>
						</div>

					</div>
					<!--===================================================-->
					<!--End Default Accordion-->

				</div>

				<div class="col-lg-3">

					<!--Default Accordion-->
					<!--===================================================-->
					<div class="panel-group accordion" id="accordion">
						<div class="panel">

							<!--Accordion title-->
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-parent="#accordion" data-toggle="collapse"
										href="#collapseOne">Collapsible Group Item #1</a>
								</h4>
							</div>

							<!--Accordion content-->
							<div class="panel-collapse collapse in" id="collapseOne">
								<div class="panel-body">Anim pariatur cliche
									reprehenderit, enim eiusmod high life accusamus terry
									richardson ad squid. 3 wolf moon officia aute, non cupidatat
									skateboard dolor brunch. Food truck quinoa nesciunt laborum
									eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on
									it squid single-origin coffee nulla assumenda shoreditch et.
									Nihil anim keffiyeh helvetica, craft beer labore wes anderson
									cred nesciunt sapiente ea proident. Ad vegan excepteur butcher
									vice lomo. Leggings occaecat craft beer farm-to-table, raw
									denim aesthetic synth nesciunt you probably haven\'t heard of
									them accusamus labore sustainable VHS.</div>
							</div>
						</div>

					</div>
					<!--===================================================-->
					<!--End Default Accordion-->

				</div>
				<div class="col-lg-3">

					<!--Default Accordion-->
					<!--===================================================-->
					<div class="panel-group accordion" id="accordion">
						<div class="panel">

							<!--Accordion title-->
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-parent="#accordion" data-toggle="collapse"
										href="#collapseOne">Collapsible Group Item #1</a>
								</h4>
							</div>

							<!--Accordion content-->
							<div class="panel-collapse collapse in" id="collapseOne">
								<div class="panel-body">Anim pariatur cliche
									reprehenderit, enim eiusmod high life accusamus terry
									richardson ad squid. 3 wolf moon officia aute, non cupidatat
									skateboard dolor brunch. Food truck quinoa nesciunt laborum
									eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on
									it squid single-origin coffee nulla assumenda shoreditch et.
									Nihil anim keffiyeh helvetica, craft beer labore wes anderson
									cred nesciunt sapiente ea proident. Ad vegan excepteur butcher
									vice lomo. Leggings occaecat craft beer farm-to-table, raw
									denim aesthetic synth nesciunt you probably haven\'t heard of
									them accusamus labore sustainable VHS.</div>
							</div>
						</div>

					</div>
					<!--===================================================-->
					<!--End Default Accordion-->

				</div>
				<div class="col-lg-3">

					<!--Default Accordion-->
					<!--===================================================-->
					<div class="panel-group accordion" id="accordion">
						<div class="panel">

							<!--Accordion title-->
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-parent="#accordion" data-toggle="collapse"
										href="#collapseOne">Collapsible Group Item #1</a>
								</h4>
							</div>

							<!--Accordion content-->
							<div class="panel-collapse collapse in" id="collapseOne">
								<div class="panel-body">Anim pariatur cliche
									reprehenderit, enim eiusmod high life accusamus terry
									richardson ad squid. 3 wolf moon officia aute, non cupidatat
									skateboard dolor brunch. Food truck quinoa nesciunt laborum
									eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on
									it squid single-origin coffee nulla assumenda shoreditch et.
									Nihil anim keffiyeh helvetica, craft beer labore wes anderson
									cred nesciunt sapiente ea proident. Ad vegan excepteur butcher
									vice lomo. Leggings occaecat craft beer farm-to-table, raw
									denim aesthetic synth nesciunt you probably haven\'t heard of
									them accusamus labore sustainable VHS.</div>
							</div>
						</div>

					</div>
					<!--===================================================-->
					<!--End Default Accordion-->

				</div>
				<div class="row"></div>
				<div class="col-lg-3">

					<!--Default Accordion-->
					<!--===================================================-->
					<div class="panel-group accordion" id="accordion">
						<div class="panel">

							<!--Accordion title-->
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-parent="#accordion" data-toggle="collapse"
										href="#collapseOne">Collapsible Group Item #1</a>
								</h4>
							</div>

							<!--Accordion content-->
							<div class="panel-collapse collapse in" id="collapseOne">
								<div class="panel-body">Anim pariatur cliche
									reprehenderit, enim eiusmod high life accusamus terry
									richardson ad squid. 3 wolf moon officia aute, non cupidatat
									skateboard dolor brunch. Food truck quinoa nesciunt laborum
									eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on
									it squid single-origin coffee nulla assumenda shoreditch et.
									Nihil anim keffiyeh helvetica, craft beer labore wes anderson
									cred nesciunt sapiente ea proident. Ad vegan excepteur butcher
									vice lomo. Leggings occaecat craft beer farm-to-table, raw
									denim aesthetic synth nesciunt you probably haven\'t heard of
									them accusamus labore sustainable VHS.</div>
							</div>
						</div>

					</div>
					<!--===================================================-->
					<!--End Default Accordion-->

				</div>

				<div class="col-lg-3">

					<!--Default Accordion-->
					<!--===================================================-->
					<div class="panel-group accordion" id="accordion">
						<div class="panel">

							<!--Accordion title-->
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-parent="#accordion" data-toggle="collapse"
										href="#collapseOne">Collapsible Group Item #1</a>
								</h4>
							</div>

							<!--Accordion content-->
							<div class="panel-collapse collapse in" id="collapseOne">
								<div class="panel-body">Anim pariatur cliche
									reprehenderit, enim eiusmod high life accusamus terry
									richardson ad squid. 3 wolf moon officia aute, non cupidatat
									skateboard dolor brunch. Food truck quinoa nesciunt laborum
									eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on
									it squid single-origin coffee nulla assumenda shoreditch et.
									Nihil anim keffiyeh helvetica, craft beer labore wes anderson
									cred nesciunt sapiente ea proident. Ad vegan excepteur butcher
									vice lomo. Leggings occaecat craft beer farm-to-table, raw
									denim aesthetic synth nesciunt you probably haven\'t heard of
									them accusamus labore sustainable VHS.</div>
							</div>
						</div>

					</div>
					<!--===================================================-->
					<!--End Default Accordion-->

				</div>
				<div class="col-lg-3">

					<!--Default Accordion-->
					<!--===================================================-->
					<div class="panel-group accordion" id="accordion">
						<div class="panel">

							<!--Accordion title-->
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-parent="#accordion" data-toggle="collapse"
										href="#collapseOne">Collapsible Group Item #1</a>
								</h4>
							</div>

							<!--Accordion content-->
							<div class="panel-collapse collapse in" id="collapseOne">
								<div class="panel-body">Anim pariatur cliche
									reprehenderit, enim eiusmod high life accusamus terry
									richardson ad squid. 3 wolf moon officia aute, non cupidatat
									skateboard dolor brunch. Food truck quinoa nesciunt laborum
									eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on
									it squid single-origin coffee nulla assumenda shoreditch et.
									Nihil anim keffiyeh helvetica, craft beer labore wes anderson
									cred nesciunt sapiente ea proident. Ad vegan excepteur butcher
									vice lomo. Leggings occaecat craft beer farm-to-table, raw
									denim aesthetic synth nesciunt you probably haven\'t heard of
									them accusamus labore sustainable VHS.</div>
							</div>
						</div>

					</div>
					<!--===================================================-->
					<!--End Default Accordion-->

				</div>
				<div class="col-lg-3">

					<!--Default Accordion-->
					<!--===================================================-->
					<div class="panel-group accordion" id="accordion">
						<div class="panel">

							<!--Accordion title-->
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-parent="#accordion" data-toggle="collapse"
										href="#collapseOne">Collapsible Group Item #1</a>
								</h4>
							</div>

							<!--Accordion content-->
							<div class="panel-collapse collapse in" id="collapseOne">
								<div class="panel-body">Anim pariatur cliche
									reprehenderit, enim eiusmod high life accusamus terry
									richardson ad squid. 3 wolf moon officia aute, non cupidatat
									skateboard dolor brunch. Food truck quinoa nesciunt laborum
									eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on
									it squid single-origin coffee nulla assumenda shoreditch et.
									Nihil anim keffiyeh helvetica, craft beer labore wes anderson
									cred nesciunt sapiente ea proident. Ad vegan excepteur butcher
									vice lomo. Leggings occaecat craft beer farm-to-table, raw
									denim aesthetic synth nesciunt you probably haven\'t heard of
									them accusamus labore sustainable VHS.</div>
							</div>
						</div>

					</div>
					<!--===================================================-->
					<!--End Default Accordion-->

				</div>
				<div class="row"></div>
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


</body>
</html>