<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">

<!-- HEAD -->
<%@ include file="../includes/head.jsp"%>
<title>내 모임 | moim@</title>
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
					<h1 class="page-header text-overflow">내 모임</h1>
				</div>
				<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
				<!--End page title-->

				<!--Page content-->
				<!--===================================================-->
				<div id="page-content">
					<!-- #################################### -->
					<!-- #### WRITE CODE BELOW THIS LINE #### -->
					<!-- #################################### -->
					
                    	<p class="text-left">
                    	<button id="newGroups" class="btn btn-mint mar-all">모임 생성</button> 
                    	찾으시는 모임이 없으신가요? 직접 만들어 보세요!
						</p>
					
					<div class="row">
						<div class="eq-height">
								<c:if test="${empty groups}">
									<label><strong>"아직 가입한 모임이 없습니다."</strong></label>
								</c:if>
								<c:forEach items="${groups}" var="teamDomain">
									<div class="col-lg-6">
										<div class="panel">
											<div class="pad-all">
												<div class="media mar-btm">
													<div class="media-left">
														<img src="${teamDomain.teamPhoto }"
															class="img-md img-circle" alt="Avatar">
													</div>
													<div class="media-body">
														<a href='<c:out value="/groups/${teamDomain.teamId }" />'>
															<p class="text-lg text-main text-semibold mar-no">${teamDomain.teamName}</p>
														</a>
														<p>${UserInfoVO.intMap[teamDomain.intId] }&nbsp;/&nbsp;${UserInfoVO.areaMap[teamDomain.areaId] }</p>
													</div>
												</div>
												<blockquote class="bq-sm bq-open bq-close">${teamDomain.teamShortContent}</blockquote>
											</div>
										</div>
									</div>
								</c:forEach>
							
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
		<%@ include file="../includes/footer.jsp"%>
		<!-- END FOOTER -->

	</div>
	<!-- END CONTAINER -->
	<script>
	$(document).ready(function(){

		$('#newGroups').on('click',function(){
			
			const url = location.origin+'/groups/new';
			location.href = url;
		});
		
	});
	
	</script>
	
	<%-- for modal --%>
	<c:if test="${ !empty loginVO }">
		<%@ include file="../includes/modals.jsp" %>
	</c:if>
	<%-- for modal --%>
</body>
</html>