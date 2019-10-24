<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">

<!-- HEAD -->
<%@ include file="../includes/head.jsp"%>
<title>모임홈 - ${ group.teamName } | moim@</title>

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

a {
	cursor: pointer;
}

.img-thumbnail-box {
	padding: 0;
}

.thumbnail {
	position: relative;
	padding-top: 75%;
	overflow: hidden;
}

.thumbnail>.centered {
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	-webkit-transform: translate(50%, 50%);
	-ms-transform: translate(50%, 50%);
	transform: translate(50%, 50%);
}

.thumbnail>.centered>img {
	position: absolute;
	top: 0;
	left: 0;
	max-width: auto;
	height: 100%;
	-webkit-transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
}

.img-desc-box {
	padding: 15px;
}

.img-desc-box>ul {
	list-style: none;
	padding-left: 0;
}

.ellipsis {
	width: 100%;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.move {
	cursor: pointer;
}
</style>
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
							<li class="active"><a href="/groups/${ group.teamId }">홈</a>
							</li>
							<li><a href="/groups/${ group.teamId }/member">구성원</a></li>
							<li><a href="/groups/${ group.teamId }/schedule">모임일정</a></li>
							<li><a href="/groups/${ group.teamId }/photos">사진첩</a></li>
							<li><a href="/groups/${ group.teamId }/posts">게시판</a></li>
							<li><a href="/groups/${ group.teamId }/chat">채팅</a></li>
							<c:if test="${tmem.tmemLevel > 7}">
								<li><a href="/groups/${ group.teamId }/settings">설정</a></li>
							</c:if>
						</ul>

						<!--Default Dropdown button-->
						<!--===================================================-->
						<div class="btn-group">
							<button class="btn btn-primary dropdown-toggle"
								data-toggle="dropdown" type="button">
								<i class="fa fa-bars"></i> 홈
							</button>
							<ul class="dropdown-menu dropdown-menu-left">
								<li class="active"><a href="/groups/${ group.teamId }">홈</a></li>
								<li><a href="/groups/${ group.teamId }/member">구성원</a></li>
								<li><a href="/groups/${ group.teamId }/schedule">모임일정</a></li>
								<li><a href="/groups/${ group.teamId }/photos">사진첩</a></li>
								<li><a href="/groups/${ group.teamId }/posts">게시판</a></li>
								<li><a href="/groups/${ group.teamId }/chat">채팅</a></li>
								<c:if test="${tmem.tmemLevel > 6}">
									<li class="divider"></li>
									<li><a href="/groups/${ group.teamId }/settings">설정</a></li>
								</c:if>
							</ul>
						</div>
						<!--===================================================-->

						<!--Tabs Content-->
						<div class="tab-content">
							<div class="content-box">

								<div class="row">
									<div class="imgbox">
										<img class="img-responsive"
											src="/resources/img/bg-img/bg-img-2.jpg">
									</div>
									<div class="info-container">
										<div class="row">
											<div class="col-lg-6 pad-top">
												<label class="text-2x text-bold mar-lft">${group.teamName}</label>
											</div>
											<div class="col-lg-6 text-right">
												<c:choose>
													<c:when
														test="${group.memId eq sessionScope.loginVO.memId }">
														<div class="text pad-top mar-top">
															<c:out value="${teamInfo.interest}" />
															|
															<c:out value="${teamInfo.area}" />
															|
															<c:out value="${teamInfo.countMember}" />
															명 참여중
														</div>
													</c:when>
													<c:otherwise>
														<div class="text pad-top mar-top mar-rgt">
															<c:out value="${teamInfo.interest}" />
															|
															<c:out value="${teamInfo.area}" />
															|
															<c:out value="${teamInfo.countMember}" />
															명 참여중 | <a id="joinBtn">가입탈퇴버튼</a>
														</div>
													</c:otherwise>
												</c:choose>
											</div>
										</div>
										<hr>

										<div class="group-shot-desc pad-var">
											<textarea class="form-group form-control"
												style="resize: none; background-color: white; cursor: default;"
												disabled>${group.teamShortContent }</textarea>
										</div>
										<div class="text bord-btm">
											<label class="text-bold mar-lft" style="font-size: 18px;">모임소개</label>
										</div>

										<div class="group-desc pad-btm">
											<div class="textbox pad-all bord-all">${group.teamContent }</div>
										</div>
										<div class="text bord-btm">
											<label class="text-bold mar-lft" style="font-size: 18px;">최근활동</label>
										</div>
										<div class="group-desc pad-btm">
											<div class="textbox pad-all bord-all">
												<div class="row">
													<div class="col-lg-6 bord-hor">
														<div class="text bord-btm">
															<label class="text-bold mar-lft" style="font-size: 14px;">최근
																게시글</label>
														</div>
														<div class="row pad-all">
															<div class="col-xs-9 bord-btm">
																<label class="text-bold">제목</label>
															</div>
															<div class="col-xs-3 bord-btm">
																<label class="text-bold">작성자</label>
															</div>

															<c:forEach items="${teamInfo.postList }" var="postList">
																<div class="col-xs-9 bord-btm">
																	<a class="move"
																		href="/groups/${group.teamId }/posts/${postList.postId}">${postList.postTitle }</a>
																</div>
																<div class="col-xs-3 bord-btm ">${postList.postNickname }</div>
															</c:forEach>

														</div>
													</div>
													<div class="col-lg-6 bord-hor">
														<div class="text bord-btm">
															<label class="text-bold mar-lft" style="font-size: 14px;">최근
																사진</label>
														</div>
														<div class="row pad-all">

															<c:forEach items="${teamInfo.postPhotoList}" var="list">
																<div class="panel col-sm-4">
																	<div class="panel-body img-thumbnail-box">
																		<a class="move"
																			href="/groups/${group.teamId}/photos/${list.postId}">
																			<div class="thumbnail">
																				<div class="centered">
																					<img src='${ list.src }'>
																				</div>
																			</div>
																		</a>
																	</div>

																	<div class="panel-body img-desc-box">
																		<div class="ellipsis text-bold">
																			<a class="move"
																				href="/groups/${group.teamId}/photos/${list.postId}">${ list.postTitle }</a>
																		</div>
																	</div>
																</div>
															</c:forEach>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
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
		<%@ include file="../includes/footer.jsp"%>
		<!-- END FOOTER -->

	</div>
	<!-- END CONTAINER -->
	<%-- for modal --%>
	<c:if test="${ !empty loginVO }">
		<%@ include file="../includes/modals.jsp"%>
	</c:if>
	<%-- for modal --%>
	<!--Bootbox Modals [ OPTIONAL ]-->
	<script src="/resources/plugins/bootbox/bootbox.min.js"></script>
	<script type="text/javascript" src="/resources/js/teammember.js"></script>
	<script>
	$(document).ready(function() {
		var groupId = '<c:out value="${groupId}"/>';
		var memberId = '<c:out value="${sessionScope.loginVO.memId}"/>';
		//가입탈퇴버튼 내의 문구(alert창 포함)를 바꾸려면 teammember.js 에서 
		teamMember.joinbutton($('#joinBtn'),groupId,memberId);
		var msg = "<c:out value='${msg}'/>"
			if(msg){
				bootbox.alert(msg);
			}
	});		
	</script>
</body>
</html>