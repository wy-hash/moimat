<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">

<!-- HEAD -->
<%@ include file="../includes/head.jsp"%>
<title>마이페이지 | moim@</title>
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
					<h1 class="page-header text-overflow">마이페이지</h1>
				</div>
				<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
				<!--End page title-->

				<!--Page content-->
				<!--===================================================-->
				<div id="page-content">
					<div class="panel">
						<div class="panel-heading">
							<h3 class="panel-title">회원정보</h3>
						</div>
						<!-- BASIC FORM ELEMENTS -->
						<!--===================================================-->
						<div class="panel-body">

							<div class="row">
								<div class="col-md-3"></div>
								<div class="col-md-6">
									<div class="row">

										<div class="col-md-4 mar-btm text-center">
											<img class="img-lg img-border img-circle" id="memPhoto"
												src='${UserInfoVO.memberDomain.memPhoto}'
												alt="Profile Picture" />
										</div>
										<div class="col-md-8">
											<div class="mar-lft">
												<p>
													<strong>닉네임 : </strong>${UserInfoVO.memberDomain.memNickname }</p>
												<p>
													<strong>이메일 : </strong>${UserInfoVO.memberDomain.memEmail }</p>
												<p>
													<strong>생일 : </strong>${UserInfoVO.memberDomain.memBirthday }</p>
												<p>
													<strong>성별 : </strong>${UserInfoVO.memberDomain.memGender == 'M' ? '남성' : '여성' }
												</p>
												<p>
													<strong>지역 : </strong>${UserInfoVO.areaMap[UserInfoVO.memberDomain.areaId] }
												</p>
												<p>
													<strong>관심사 : </strong>${UserInfoVO.intMap[UserInfoVO.memberDomain.memInt1]}
													, ${UserInfoVO.intMap[UserInfoVO.memberDomain.memInt2] } ,
													${UserInfoVO.intMap[UserInfoVO.memberDomain.memInt3]}
												</p>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-xs-1 col-sm-2"></div>
										<div class="col-xs-10 col-sm-8 text-center">
											<button id="modBtn" class="btn btn-default btn-hover-warning">정보
												수정</button>
										</div>
										<div class="col-xs-1 col-sm-2"></div>
									</div>
								</div>
								<div class="col-md-3"></div>
							</div>
						</div>
					</div>
					<div class="panel">
						<div class="panel-heading">
							<h3 class="panel-title">최근 활동한 모임</h3>
						</div>
						<!-- BASIC FORM ELEMENTS -->
						<!--===================================================-->
						<div class="panel-body">
							<div class="row">
								<c:if test="${empty UserInfoVO.teamDomain}">
									<label><strong>"아직 가입한 모임이 없습니다."</strong></label>
								</c:if>
								<c:forEach items="${UserInfoVO.teamDomain }" var="teamDomain">
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
					<div class="panel">
						<div class="panel-heading">
							<h3 class="panel-title">최근 작성한 글</h3>
						</div>
						<!-- BASIC FORM ELEMENTS -->
						<!--===================================================-->
						<div class="panel-body">
							<div class="row">
								<c:if test="${empty UserInfoVO.postDomain}">
									<label><strong>"아직 작성한 글이 없습니다."</strong></label>
								</c:if>
								<div class="col-md-1"></div>
								<div class="col-md-10">
									<c:if test="${not empty UserInfoVO.postDomain}">
										<table class="table table-hover table-vcenter">
											<thead>
												<tr>
													<th class="min-width text-center"></th>
													<th class="col-xs-8">제목</th>
													<th class="col-xs-3 col-sm-2 text-center">작성일</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${UserInfoVO.postDomain}" var="postDomain">
													<tr>
														<td class="text-center">${postDomain.postId }</td>
														<td class="text-overflow"><span class="text-main text-semibold"><a href="#">${postDomain.postTitle }</a></span>
														</td>
														<td class="text-center"><span class="text-semibold text-sm">
																${postDomain.postUpdate } </span></td>
													</tr>
												</c:forEach>

											</tbody>
										</table>

									</c:if>
								</div>
								<div class="col-md-1"></div>
							</div>



						</div>
					</div>
					<!--===================================================-->
					<!-- END BASIC FORM ELEMENTS -->
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


		<%-- for modal --%>
		<c:if test="${ !empty loginVO }">
			<%@ include file="../includes/modals.jsp"%>
		</c:if>
		<%-- for modal --%>

	</div>
	<!-- END CONTAINER -->
	<script>
		$(document).ready(function() {
			$('#modBtn').on('click',function(){
				location.href = "/mypage/usercheck"
			});
		});	
	</script>
</body>
</html>