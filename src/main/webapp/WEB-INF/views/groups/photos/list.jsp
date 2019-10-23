<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">

<!-- HEAD -->
<%@ include file="../../includes/head.jsp" %>
	<title>사진첩 - ${ group.teamName } | moim@</title>
	
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
		
		.content-box > .row:first-child {
			display: flex;
			flex-flow: wrap;
			justify-content: normal;
		}
		
		.content-box > .row > .panel {
			padding-left: 0;
			padding-right: 0;
		}  
		
		.img-thumbnail-box {
			padding: 0;
		}
		
		.thumbnail {
			position: relative;
			padding-top: 75%;
			overflow: hidden;
		}
		
		.thumbnail > .centered {
			position: absolute;
			top: 0;
			bottom: 0;
			left: 0;
			right: 0;
			-webkit-transform: translate(50%, 50%);
			-ms-transform: translate(50%, 50%);
			transform: translate(50%, 50%);
		}
				
		.thumbnail > .centered > img {
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
		
		.img-desc-box > ul {
			list-style: none;
			padding-left: 0;
		}
		
		.ellipsis {
			width: 100%;
			white-space: nowrap;
			overflow: hidden;
			text-overflow: ellipsis;
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
			                <li class="active">
			                    <a href="/groups/${ group.teamId }/photos">사진첩</a>
			                </li>
			                <li>
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
								<i class="fa fa-bars"></i> 사진첩
                            </button>
                            <ul class="dropdown-menu dropdown-menu-left">
                                <li><a href="/groups/${ group.teamId }">홈</a></li>
                                <li><a href="/groups/${ group.teamId }/member">구성원</a></li>
                                <li><a href="/groups/${ group.teamId }/schedule">모임일정</a></li>
                                <li class="active"><a href="/groups/${ group.teamId }/photos">사진첩</a></li>
                                <li><a href="/groups/${ group.teamId }/posts">게시판</a></li>
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

									<c:forEach items="${ posts }" var="item">
										<div class="panel col-lg-4 col-xs-6">
											<div class="panel-body img-thumbnail-box">
												<a data-post-id="${ item.postId }">
													<div class="thumbnail">
														<div class="centered">
															<img src="${ item.imgPath }">
														</div>
													</div>
												</a>
											</div>

											<div class="panel-body img-desc-box">
												<div class="ellipsis text-bold"><a href="/groups/${ group.teamId }/photos/${ item.postId }">${ item.postTitle }</a></div>
												<div class="text-right mar-top">${ item.postNickname }</div>
												<div class="text-right mar-btm">${ item.postRegdate }</div>
												<div class="text-right">
													<i class="fa fa-comments">${ item.commentNums }</i>&nbsp;&nbsp;
													<i class="fa fa-eye">${ item.postHit }</i>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>

								<div class="row text-right mar-rgt">
									<a href="/groups/${ group.teamId }/photos/new"><button class="btn btn-default">글쓰기</button></a>
								</div>

								<div class="row text-center">

									<!--Pagination with disabled and active states-->
									<!--===================================================-->
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
									<form id="actionForm" action="/groups/${group.teamId}/photos">
										<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
										<input type="hidden" name="type" value="${pageMaker.cri.type}">
										<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
									</form>
								</div>

								<div class="row text-center">
									<form id="searchForm" class="form-inline" action="/groups/${group.teamId}/photos" method="get">
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




	<script>
		$(document).ready(function() {
			var actionForm = $("#actionForm");
			$(".pagination").on("click","a",function(){
				console.log($(this).data('page-num'));
				actionForm.find("input[name='pageNum']").val($(this).data('page-num'));
				actionForm.submit();
			});
			$(".move").on("click",function(){
				var postId = $(this).data('post-id');
				var actionURL = '/groups/<c:out value="${ group.teamId }"/>/photos/'+postId;
				actionForm.attr('action',actionURL);
				actionForm.submit();
			});
		});
	</script>
</body>
</html>