<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">

<!-- HEAD -->
<%@ include file="../../includes/head.jsp" %>
	<title>게시판 - ${ group.teamName } | moim@</title>
	
	<style>
		@media screen and (max-width: 768px) {
			.tab-base > ul {
				display: none;
			}
			
			.tab-base > .btn-group {
				display: inline-block;
			}
		}
		
		@media screen and (min-width: 768px) {
			.tab-base > ul {
				display: block;
			}
			
			.tab-base > .btn-group {
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
		<%@ include file="../../includes/header-navbar.jsp" %>
		<!-- END NAVBAR -->
		
		<!-- BOXED -->
		<div class="boxed">
		
			<!-- MAIN-NAV -->
			<%@ include file="../../includes/main-nav.jsp" %>
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
			                <li>
			                    <a href="/groups/${ group.teamId }">홈</a>
			                </li>
			                <li>
			                    <a href="/groups/${ group.teamId }/member">구성원</a>
			                </li>
			                <li>
			                    <a href="/groups/${ group.teamId }/schedule">모임일정</a>
			                </li>
			                <li>
			                    <a href="/groups/${ group.teamId }/photos">사진첩</a>
			                </li>
			                <li class="active">
			                    <a href="/groups/${ group.teamId }/posts">게시판</a>
			                </li>
			                <li>
			                    <a href="/groups/${ group.teamId }/chat">채팅</a>
			                </li>
			                <li>
			                    <a href="/groups/${ group.teamId }/settings">설정</a>
			                </li>
			            </ul>
			            
                        <!--Default Dropdown button-->
                        <!--===================================================-->
                        <div class="btn-group">
                            <button class="btn btn-primary dropdown-toggle" data-toggle="dropdown" type="button">
								<i class="fa fa-bars"></i> 게시판
                            </button>
                            <ul class="dropdown-menu dropdown-menu-left">
                                <li><a href="/groups/${ group.teamId }">홈</a></li>
                                <li><a href="/groups/${ group.teamId }/member">구성원</a></li>
                                <li><a href="/groups/${ group.teamId }/schedule">모임일정</a></li>
                                <li><a href="/groups/${ group.teamId }/photos">사진첩</a></li>
                                <li class="active"><a href="/groups/${ group.teamId }/posts">게시판</a></li>
                                <li><a href="/groups/${ group.teamId }/chat">채팅</a></li>
                                <li class="divider"></li>
                                <li><a href="/groups/${ group.teamId }/settings">설정</a></li>
                            </ul>
                        </div>
                        <!--===================================================-->
			
			            <!--Tabs Content-->
			            <div class="tab-content">
			                <div class="content-box">

								<div class="row">
									<!--Hover Rows-->
									<!--===================================================-->
									<div class="panel-body">
										<table class="table table-hover table-vcenter">
											<thead>
											<tr>
												<th>제목</th>
												<th class="text-center">작성자</th>
											</tr>
											</thead>
											<tbody>
												<c:forEach var="item" items="${ posts }">
													<tr>
														<td>
															<span class="text-main text-bold">${ item.postTitle }</span> <span class="label label-default">${ item.commentNums }</span>
															<br>
															<small class="text-muted">
																<i class="fa fa-pencil"> ${ item.postRegdate } </i> | <i class="fa fa-eye"> ${ item.postHit } </i>
															</small>
														</td>
														<td class="text-center"><span class="text-semibold">${ item.postNickname }</span></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
									<!--===================================================-->
									<!--End Hover Rows-->
								</div>

								<div class="row text-right mar-rgt">
									<a href="/groups/${ group.teamId }/photos/new"><button class="btn btn-default">글쓰기</button></a>
								</div>

								<div class="row text-center">

									<!--Pagination with disabled and active states-->
									<!--===================================================-->
									<ul class="pagination">
										<li class="disabled"><a href="#" class="demo-pli-arrow-left"></a></li>
										<li class="active"><a href="#">1</a></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><span>...</span></li>
										<li><a href="#">20</a></li>
										<li><a href="#" class="demo-pli-arrow-right"></a></li>
									</ul>
									<!--===================================================-->
									<!--End Pagination with disabled and active states-->

								</div>

								<div class="row text-center">
									<form class="form-inline" action="/${ group.teamId }/posts/search" method="get">
										<div class="searchbox input-group mar-btm">
											<div class="input-group-btn">
												<select id="demo-foo-filter-status" class="form-control bord-no">
													<option value="title">제목</option>
													<option value="content">내용</option>
													<option value="nickname">작성자</option>
												</select>
											</div>
											<div class="input-group custom-search-form">
												<input type="text" class="form-control" placeholder="검색어를 입력하세요">
												<span class="input-group-btn">
                                					<button class="text-muted" type="button"><i class="demo-pli-magnifi-glass"></i></button>
												</span>
											</div>
										</div>
									</form>
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
		<%@ include file="../../includes/footer.jsp" %>
		<!-- END FOOTER -->
			
	</div>
	<!-- END CONTAINER -->
	
	<script>
		$(document).ready(function() {
			
		});
	</script>
</body>
</html>