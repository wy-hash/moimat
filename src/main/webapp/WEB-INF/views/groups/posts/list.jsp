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
		.move{
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
															<a class="move" data-post-id="${ item.postId }">
																<span class="text-main text-bold">${ item.postTitle }</span>
															</a>
															<span class="label label-default">${ item.commentNums }</span>
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
									<a href="/groups/${ group.teamId }/posts/new"><button class="btn btn-default">글쓰기</button></a>
								</div>

								<div class="row text-center">
									<!--Pagination with disabled and active states-->
									<!--===================================================-->
									<!-- data-pNum = pageNum href안쓰고 a태그에 이벤트걸어서 할것이라 data태그씀 -->
									<ul class="pagination">
										<c:if test="${pageMaker.prev}">
											<li><a data-page-num="${pageMaker.startPage - 1}" class="demo-pli-arrow-left"></a></li>
										</c:if>
										<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
											<li class="${pageMaker.cri.pageNum == num ? 'active': '' }"><a data-page-num="${num}">${num}</a></li>
										</c:forEach>
										<c:if test="${pageMaker.next }">
											<li><a data-page-num="${pageMaker.endPage + 1}" class="demo-pli-arrow-right"></a></li>
										</c:if>
										<!--  일부로 주석해놓은거 <li><span>...</span></li>
										<li><a href="#">20</a></li> -->
									</ul>
									<!--===================================================-->
									<!--End Pagination with disabled and active states-->
									<form id="actionForm" action="/groups/${group.teamId}/posts">
										<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
										<input type="hidden" name="type" value="${pageMaker.cri.type}">
										<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
									</form>
								</div>
								
								<div class="row text-center">
									<form id="searchForm" class="form-inline" action="/groups/${group.teamId}/posts" method="get">
										<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
										<div class="searchbox input-group mar-btm">
											<div class="input-group-btn">
												<select id="searchOption" class="form-control bord-no" name="type">
													<option value="T" <c:out value="${pageMaker.cri.type eq 'T' ? 'selected' : ''}"/>>제목</option>
													<option value="C" <c:out value="${pageMaker.cri.type eq 'C' ? 'selected' : ''}"/>>내용</option>
													<option value="W" <c:out value="${pageMaker.cri.type eq 'W' ? 'selected' : ''}"/>>작성자</option>
												</select>
											</div>
											<div class="input-group custom-search-form">
												<input type="text" class="form-control" placeholder="검색어를 입력하세요" 
													name="keyword" value='<c:out value="${pageMaker.cri.keyword }"/>'>
												<span class="input-group-btn">
                                					<button id="searchBtn" class="text-muted" type="button"><i class="demo-pli-magnifi-glass"></i></button>
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
	<!--Bootbox Modals [ OPTIONAL ]-->
	<script src="/resources/plugins/bootbox/bootbox.min.js"></script>
	<script>
		$(document).ready(function() {
			var actionForm = $("#actionForm");
			var searchForm = $("#searchForm");
			$(".pagination").on("click","a",function(){
				console.log($(this).data('page-num'));
				actionForm.find("input[name='pageNum']").val($(this).data('page-num'));
				actionForm.submit();
			});
			$(".move").on("click",function(){
				var postId = $(this).data('post-id');
				var actionURL = '/groups/<c:out value="${ group.teamId }"/>/posts/'+postId;
				actionForm.attr('action',actionURL);
				actionForm.submit();
			});
			$("#searchBtn").on('click',function(){
				if(!searchForm.find("input[name='keyword']").val()){
					bootbox.alert("키워드를 입력해 주세요.");
				}
				searchForm.find("input[name='pageNum']").val("1");
				
				searchForm.submit();
			});
			
			
		});
	</script>
</body>
</html>