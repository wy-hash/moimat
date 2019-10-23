<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">

<!-- HEAD -->
<%@ include file="includes/head.jsp" %>
	<title>함께해서 더 즐거운! moim@ | moim@</title>
	
	<style>
		.panel-body {
			padding: 5px;
		}
		
		.panel-group {
			margin-bottom: 0;
		}
		
		.panel .panel-body .media > .media-body {
			vertical-align: middle;
		}
		
		.panel .panel-body .media > .media-body > p {
			margin: 5px 0;
		}
		
		.tab-base {
			margin-bottom: 0;
		}
		
		.panel-purple .panel-heading, .panel-purple .panel-footer, .panel-purple.panel-colorful {
			background-color: #26a69a;
			border-color: #26a69a;
		}
		
		.media {
			margin-top: 0;
		}
		
		
		@media screen and (min-width: 768px) {
			.jumbotron h1 {
				font-size: 3em;
			}
			
			.search {
				margin: 20% 20% auto 20%;
			}
		}
		
		.carousel-inner .item img {
			max-height: 400px;
			margin-left: auto;
			margin-right: auto;
			
			padding: 30px 50px;
		}
		
		
		@media screen and (min-width: 360px) {
			.search {
				margin: 20% 5% auto 5%;
			}
		}

		.jumbotron {
			position: relative;
			z-index: 1;
		}

		.jumbotron::after {
			content: "";
			position: absolute;
			top: 0;
			left: 0;
			background-image: url('/resources/img/bg-img/home.png');
			width: 100%;
			height: 100%;
			z-index: -1;
			background-repeat: no-repeat;
			background-position: center;
			opacity: 0.8;
		}
		
		.jumbotron p {
			font-weight: 500 !important;
		}
		
		.heading-box {
			display: inline-block;
			opacity: 0.8;
		}
		
	</style>
</head>
<!-- END HEAD -->

<body>

	<!--TIPS-->
	<!--You may remove all ID or Class names which contain "demo-", they are only used for demonstration. -->
	<div id="container" class="effect aside-float aside-bright mainnav-lg">
	
		<!-- HEADER-NAVBAR -->
		<%@ include file="includes/header-navbar.jsp" %>
		<!-- END NAVBAR -->
		
		<!-- BOXED -->
		<div class="boxed">
		
			<!-- MAIN-NAV -->
			<%@ include file="includes/main-nav.jsp" %>
			<!-- END MAIN-NAV -->
			
			<!-- ASIDE -->
			<%-- <%@ include file="includes/aside.jsp" %> --%>
			<!-- END ASIDE -->
			
			
					
           <!--CONTENT CONTAINER-->
            <!--===================================================-->
            <div id="content-container">
                
                <!--Page Title-->
                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->

                <!-- 
                <div id="page-title">
                    <h1 class="page-header text-overflow">moim@ - 함께해서 즐거운 나의 취미생활!</h1>
                </div>
                -->




                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                <!--End page title-->

                <!--Page content-->
                <!--===================================================-->
                <div id="page-content">
                	<!-- #################################### -->
                	<!-- #### WRITE CODE BELOW THIS LINE #### -->
            	    <!-- #################################### -->
            	    
            	    <!-- 메인 타이틀, 검색 -->
            	    <div class="row">
            	                	    
    					<!-- JUMBOTRON -->
						<!--===================================================-->
						<div class="jumbotron text-main text-center clearfix">
							<div class="heading-box bg-light pad-all mar-all text-dark">
							    <h1 class="text-center">모임앳에서 취미활동을 함께하세요!</h1>
							    <p class="text-center">좋아하는 취미활동, 모여서 하면 더 재밌을걸요?</p>
						    </div>
						    <!--Searchbox-->
	                    	<form id="searchForm" action="/result" method="post">
			                    <div class="search">
			                    	<div class="input-group input-group-lg">
				                    		<input type="hidden" name="type" value="RMA" class="form-control" >
				                    		<input type="text" id="searchKeyword" name="keyword" value="" class="form-control" placeholder="좋아하는 취미활동을 검색해보세요!">
				                    		<span class="input-group-btn">
				                    			<button class="btn btn-default" type="submit">
				                    				<i class="fa fa-search"></i>
				                    			</button>
				                    		</span>
			                    	</div>
			                    </div>
							</form>
		                </div>
						<!--===================================================-->
						<!-- END JUMBOTRON -->
            	    
            	    
            	    
            	    </div>
            	    <!-- //메인 타이틀, 검색 -->
            	    
            	    
            	    
            	    
            	    <!-- 모임 큐레이팅 (carousel) -->
            	    <div class="row">

						<div class="panel">
							<div class="panel-heading">
								<h3 class="panel-title">이런 모임은 어떠세요?</h3>
							</div>
							<div class="panel-body">
								<!--Carousel-->
					            <!--===================================================-->
					            <div id="demo-carousel" class="carousel slide" data-ride="carousel">
					
					                <!--Indicators-->
					                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					                <ol class="carousel-indicators out">
					                    <li class="active" data-slide-to="0" data-target="#demo-carousel"></li>
					                    <li data-slide-to="1" data-target="#demo-carousel"></li>
					                    <li data-slide-to="2" data-target="#demo-carousel"></li>
					                </ol>
					                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					
					                <div class="carousel-inner text-center">
					                	
					                	
					                	<c:forEach items="${ randomList }" var="list" varStatus="status">
					                		<c:choose>
					                			<c:when test="${ status.index eq 0 }">
					                				<div class="item active">
					                			</c:when>
					                			<c:otherwise>
					                				<div class="item">
					                			</c:otherwise>
					                		</c:choose>
					                		
					                			<h4 class="text-main">${ list.teamName }</h4>
					                			<p>${ list.teamShortContent }</p>
					                			<img class="img-responsive" src="resources/img/bg-img/bg-img-${ status.count + 1 }.jpg" alt="image">
					                		</div>
					                	</c:forEach>
					                </div>
					
					                <!--carousel-control-->
					                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					                <a class="carousel-control left" data-slide="prev" href="#demo-carousel"><i class="demo-pli-arrow-left icon-2x"></i></a>
					                <a class="carousel-control right" data-slide="next" href="#demo-carousel"><i class="demo-pli-arrow-right icon-2x"></i></a>
					                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					
					            </div>
					            <!--===================================================-->
					            <!--End Carousel-->
					    	</div>
						</div>
						
            	    </div>
            	    <!-- //모임 큐레이팅 (carousel)-->
            	    
            	    
            	    
            	    
            	    <!-- 맞춤추천-관심사 (탭) -->
            	    <div class="row">
            	    
            	    	<div class="panel">
            	    		<div class="panel-heading">
            	    			<h3 class="panel-title">관심사 기반 추천모임</h3>
            	    		</div>
            	    
            	    		
            	    		<!--Purple Accordion-->
					        <!--===================================================-->
					        <div class="panel-group accordion" id="demo-acc-purple">
					            <div class="panel panel-purple">
					                <!-- Accordion title -->
					                <div class="panel-heading">
					                    <h4 class="panel-title">
					                        <a data-parent="#demo-acc-purple" data-toggle="collapse" href="#demo-acd-purple-1">${int1Name}  </a>
					                    </h4>
					                </div>
					                <!-- Accordion content -->
					                <div class="panel-collapse collapse in" id="demo-acd-purple-1">
					                    <div class="panel-body">
					                    	<c:if test="${empty int1List}">
											<div class="media bord-btm">
						                		<div class="media-left pad-all">
						                		<div class="row">개설된 모임이 없습니다.</div>
			                					</div>
			                				</div>
					                    	</c:if>
					                    	<c:forEach items="${int1List }" var="group" end="2">
											<div class="media bord-btm">
						                		<div class="media-left pad-all">
						                			<img class="img-lg" src="${group.teamPhoto }" alt="Sample Image">
						                		</div>
						                		<div class="media-body pad-all text-semibold">
						                			<a href="/groups/${ group.teamId }"><p><i class="fa fa-cube"></i>&nbsp;&nbsp;${group.teamName }</p></a>
						                			<p><i class="fa fa-map-marker"></i>&nbsp;&nbsp;${group.areaRegionName }</p>
						                			<p><i class="fa fa-pencil-square-o"></i>&nbsp;&nbsp;${group.teamShortContent }</p> 
			                					</div>
			                				</div>
			                				</c:forEach>
					                    </div>
					                </div>
					            </div>
					            <div class="panel panel-purple">
					
					                <!-- Accordion title -->
					                <div class="panel-heading">
					                    <h4 class="panel-title">
					                        <a data-parent="#demo-acc-purple" data-toggle="collapse" href="#demo-acd-purple-2">${int2Name}  </a>
					                    </h4>
					                </div>
					
					                <!-- Accordion content -->
					                <div class="panel-collapse collapse" id="demo-acd-purple-2">
					                    <div class="panel-body">
					                    	<c:if test="${empty int2List}">
											<div class="media bord-btm">
						                		<div class="media-left pad-all">
						                		<div class="row">개설된 모임이 없습니다.</div>
			                					</div>
			                				</div>
					                    	</c:if>
					                    	<c:forEach items="${int2List }" var="group" end="2">
											<div class="media bord-btm">
						                		<div class="media-left pad-all">
						                			<img class="img-lg" src="${group.teamPhoto }" alt="Sample Image">
						                		</div>
						                		<div class="media-body pad-all text-semibold">
						                			<a href="/groups/${ group.teamId }"><p><i class="fa fa-cube"></i>&nbsp;&nbsp;${group.teamName }</p></a>
						                			<p><i class="fa fa-map-marker"></i>&nbsp;&nbsp;${group.areaRegionName }</p>
						                			<p><i class="fa fa-pencil-square-o"></i>&nbsp;&nbsp;${group.teamShortContent }</p> 
			                					</div>
			                				</div>
			                				</c:forEach>
					                    </div>
					                </div>
					            </div>
					            <div class="panel panel-purple">
					
					                <!-- Accordion title -->
					                <div class="panel-heading">
					                    <h4 class="panel-title">
					                        <a data-parent="#demo-acc-purple" data-toggle="collapse" href="#demo-acd-purple-3">${int3Name} </a>
					                    </h4>
					                </div>
					
					                <!-- Accordion content -->
					                <div class="panel-collapse collapse" id="demo-acd-purple-3">
					                    <div class="panel-body">
					                    	<c:if test="${empty int3List}">
											<div class="media bord-btm">
						                		<div class="media-left pad-all">
						                		<div class="row">개설된 모임이 없습니다.</div>
			                					</div>
			                				</div>
					                    	</c:if>
					                    	<c:forEach items="${int3List }" var="group" end="2">
											<div class="media bord-btm">
						                		<div class="media-left pad-all">
						                			<img class="img-lg" src="${group.teamPhoto }" alt="Sample Image">
						                		</div>
						                		<div class="media-body pad-all text-semibold">
						                			<a href="/groups/${ group.teamId }"><p><i class="fa fa-cube"></i>&nbsp;&nbsp;${group.teamName }</p></a>
						                			<p><i class="fa fa-map-marker"></i>&nbsp;&nbsp;${group.areaRegionName }</p>
						                			<p><i class="fa fa-pencil-square-o"></i>&nbsp;&nbsp;${group.teamShortContent }</p> 
			                					</div>
			                				</div>
			                				</c:forEach>
					                    </div>
					                </div>
					            </div>
					        </div>
					        <!--===================================================-->
					        <!--End Purple Accordion-->
            	    		
            	    		
 
            	    	</div>
            	    
            	    </div>
            	    <!-- //맞춤추천-관심사 (탭) -->
            	    
            	    
            	    
            	    
            	    <!-- 맞춤추천-지역 -->
            	    <div class="row">
			            <!--Panel with Header-->
			            <!--===================================================-->
			            <div class="panel">
			                <div class="panel-heading">
			                    <h3 class="panel-title">${ areaName } 의 추천모임</h3>
			                </div>
	                    	<c:if test="${empty areaList}">
							<div class="media bord-btm">
		                		<div class="media-left pad-all">
		                		<div class="row">개설된 모임이 없습니다.</div>
               					</div>
               				</div>
	                    	</c:if>
			                <c:forEach items="${areaList }" var="group" end="2">
			                <div class="panel-body bord-btm">
			                	<div class="media">
			                		<div class="media-left pad-all">
			                			<img class="img-lg" src="${group.teamPhoto }" alt="Sample Image">
			                		</div>
			                		<div class="media-body pad-all text-semibold">
			                			<a href="/groups/${ group.teamId }"><p><i class="fa fa-cube"></i>&nbsp;&nbsp;${group.teamName }</p></a>
			                			<p><i class="fa fa-heart"></i>&nbsp;&nbsp;${group.intName } </p>
			                			<p><i class="fa fa-pencil-square-o"></i>&nbsp;&nbsp;${group.teamShortContent }</p> 
			                		</div>
			                	</div>
			                </div>
			                </c:forEach>
			                
			            </div>
			            <!--===================================================-->
			            <!--End Panel with Header-->
            	    </div>
            	    <!-- //맞춤추천-지역 -->
                </div>
                <!--===================================================-->
                <!--End page content-->



            </div>
            <!--===================================================-->
            <!--END CONTENT CONTAINER-->			
			
			
			
		</div>
		<!-- END BOXED -->
		
		<!-- FOOTER -->
		<%@ include file="includes/footer.jsp" %>
		<!-- END FOOTER -->
			
	</div>
	<!-- END CONTAINER -->
	
	<%-- for modal --%>
	<c:if test="${ !empty loginVO }">
		<%@ include file="includes/modals.jsp" %>
	</c:if>
	<%-- for modal --%>
	
<!-- 	검색 확인창 -->
	<div class="modal" id="searchModal" role="dialog" tabindex="-1" style="display:none;">
    <div class="modal-dialog">
        <div class="modal-content">

            <!--Modal header-->
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="pci-cross pci-circle"></i></button>
                <h4 class="modal-title">알림</h4>
            </div>


            <!--Modal body-->
            <div class="modal-body">
                <p class="text-semibold text-main">검색어를 입력해주세요</p>
            </div>

            <!--Modal footer-->
            <div class="modal-footer">
                <button data-dismiss="modal" class="btn btn-default" type="button">확인</button>
            </div>
        </div>
    </div>
</div>
	
	<script>
	$("#searchForm").submit(function(){
		var search = $('#searchKeyword').val();
		console.log(search);
		if($.trim(search).length < 1) {
			$('#searchModal').modal('show');
			$("#searchKeyword").focus();
			return false;
		}
	});
	</script>
</body>
</html>