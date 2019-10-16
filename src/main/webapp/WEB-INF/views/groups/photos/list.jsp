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
		
		.content-box > .row {
			display: flex;
			flex-flow: wrap;
			justify-content: center;	
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
			                    <a href="/groups${ group.teamId }/chat">채팅</a>
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
			                    
			                    
			                    	<div class="panel col-lg-4 col-xs-6">
			                    		<div class="panel-body img-thumbnail-box">
			                    			<div class="thumbnail">
			                    				<div class="centered">
					                    			<img src="/resources/img/thumbs/img1.jpg">			                    				
			                    				</div>
			                    			</div>
			                    		</div>
			                    		<div class="panel-body img-desc-box">
			                    			<div class="ellipsis text-bold">제목제목제목제목제목제목제목</div>
			                    			<div class="text-right mar-top">담배아저씨</div>
			                    			<div class="text-right mar-btm">2019-10-02</div>
			                    			<div class="text-right">
			                    				<i class="fa fa-comments">12</i>&nbsp;
			                    				<i class="fa fa-heart">123</i>&nbsp;
			                    				<i class="fa fa-eye">1234</i>
			                    			</div>
			                    		</div>
			                    	</div>
			                    	<div class="panel col-lg-4 col-xs-6">
			                    		<div class="panel-body img-thumbnail-box">
			                    			<div class="thumbnail">
			                    				<div class="centered">
					                    			<img src="/resources/img/thumbs/img3.jpg">
			                    				</div>
			                    			</div>
			                    		</div>
			                    		<div class="panel-body img-desc-box">
			                    			<div class="ellipsis text-bold">제목제목제목제목제목제목제목</div>
			                    			<div class="text-right mar-top">담배아저씨</div>
			                    			<div class="text-right mar-btm">2019-10-02</div>
			                    			<div class="text-right">
			                    				<i class="fa fa-comments">12</i>&nbsp;
			                    				<i class="fa fa-heart">123</i>&nbsp;
			                    				<i class="fa fa-eye">1234</i>
			                    			</div>
			                    		</div>
			                    	</div>
			                    	<div class="panel col-lg-4 col-xs-6">
			                    		<div class="panel-body img-thumbnail-box">
			                    			<div class="thumbnail">
			                    				<div class="centered">
					                    			<img src="/resources/img/thumbs/mega-menu-6.jpg">
			                    				</div>
			                    			</div>
			                    		</div>
			                    		<div class="panel-body img-desc-box">
			                    			<div class="ellipsis text-bold">제목제목제목제목제목제목제목</div>
			                    			<div class="text-right mar-top">담배아저씨</div>
			                    			<div class="text-right mar-btm">2019-10-02</div>
			                    			<div class="text-right">
			                    				<i class="fa fa-comments">12</i>&nbsp;
			                    				<i class="fa fa-heart">123</i>&nbsp;
			                    				<i class="fa fa-eye">1234</i>
			                    			</div>
			                    		</div>
			                    	</div>
			                    	<div class="panel col-lg-4 col-xs-6">
			                    		<div class="panel-body img-thumbnail-box">
			                    			<div class="thumbnail">
			                    				<div class="centered">
					                    			<img src="/resources/img/thumbs/img1.jpg">
			                    				</div>
			                    			</div>
			                    		</div>
			                    		<div class="panel-body img-desc-box">
			                    			<div class="ellipsis text-bold">제목제목제목제목제목제목제목</div>
			                    			<div class="text-right mar-top">담배아저씨</div>
			                    			<div class="text-right mar-btm">2019-10-02</div>
			                    			<div class="text-right">
			                    				<i class="fa fa-comments">12</i>&nbsp;
			                    				<i class="fa fa-heart">123</i>&nbsp;
			                    				<i class="fa fa-eye">1234</i>
			                    			</div>
			                    		</div>
			                    	</div>
			                    	<div class="panel col-lg-4 col-xs-6">
			                    		<div class="panel-body img-thumbnail-box">
			                    			<div class="thumbnail">
			                    				<div class="centered">
					                    			<img src="/resources/img/profile-photos/1.png">
			                    				</div>
			                    			</div>
			                    		</div>
			                    		<div class="panel-body img-desc-box">
			                    			<div class="ellipsis text-bold">제목제목제목제목제목제목제목</div>
			                    			<div class="text-right mar-top">담배아저씨</div>
			                    			<div class="text-right mar-btm">2019-10-02</div>
			                    			<div class="text-right">
			                    				<i class="fa fa-comments">12</i>&nbsp;
			                    				<i class="fa fa-heart">123</i>&nbsp;
			                    				<i class="fa fa-eye">1234</i>
			                    			</div>
			                    		</div>
			                    	</div>
			                    	<div class="panel col-lg-4 col-xs-6">
			                    		<div class="panel-body img-thumbnail-box">
			                    			<div class="thumbnail">
			                    				<div class="centered">
					                    			<img src="/resources/img/bg-img/1.jpg">
			                    				</div>
			                    			</div>
			                    		</div>
			                    		<div class="panel-body img-desc-box">
			                    			<div class="ellipsis text-bold">제목제목제목제목제목제목제목</div>
			                    			<div class="text-right mar-top">담배아저씨</div>
			                    			<div class="text-right mar-btm">2019-10-02</div>
			                    			<div class="text-right">
			                    				<i class="fa fa-comments">12</i>&nbsp;
			                    				<i class="fa fa-heart">123</i>&nbsp;
			                    				<i class="fa fa-eye">1234</i>
			                    			</div>
			                    		</div>
			                    	</div>
			                    	<div class="panel col-lg-4 col-xs-6">
			                    		<div class="panel-body img-thumbnail-box">
			                    			<div class="thumbnail">
			                    				<div class="centered">
					                    			<img src="/resources/img/bg-img/bg-img-2.jpg">
			                    				</div>
			                    			</div>
			                    		</div>
			                    		<div class="panel-body img-desc-box">
			                    			<div class="ellipsis text-bold">제목제목제목제목제목제목제목</div>
			                    			<div class="text-right mar-top">담배아저씨</div>
			                    			<div class="text-right mar-btm">2019-10-02</div>
			                    			<div class="text-right">
			                    				<i class="fa fa-comments">12</i>&nbsp;
			                    				<i class="fa fa-heart">123</i>&nbsp;
			                    				<i class="fa fa-eye">1234</i>
			                    			</div>
			                    		</div>
			                    	</div>
			                    	<div class="panel col-lg-4 col-xs-6">
			                    		<div class="panel-body img-thumbnail-box">
			                    			<div class="thumbnail">
			                    				<div class="centered">
					                    			<img src="/resources/img/profile-photos/5.png">
			                    				</div>
			                    			</div>
			                    		</div>
			                    		<div class="panel-body img-desc-box">
			                    			<div class="ellipsis text-bold">제목제목제목제목제목제목제목</div>
			                    			<div class="text-right mar-top">담배아저씨</div>
			                    			<div class="text-right mar-btm">2019-10-02</div>
			                    			<div class="text-right">
			                    				<i class="fa fa-comments">12</i>&nbsp;
			                    				<i class="fa fa-heart">123</i>&nbsp;
			                    				<i class="fa fa-eye">1234</i>
			                    			</div>
			                    		</div>
			                    	</div>
			                    	<div class="panel col-lg-4 col-xs-6">
			                    		<div class="panel-body img-thumbnail-box">
			                    			<div class="thumbnail">
			                    				<div class="centered">
					                    			<img src="/resources/img/thumbs/img3.jpg">
			                    				</div>
			                    			</div>
			                    		</div>
			                    		<div class="panel-body img-desc-box">
			                    			<div class="ellipsis text-bold">제목제목제목제목제목제목제목</div>
			                    			<div class="text-right mar-top">담배아저씨</div>
			                    			<div class="text-right mar-btm">2019-10-02</div>
			                    			<div class="text-right">
			                    				<i class="fa fa-comments">12</i>&nbsp;
			                    				<i class="fa fa-heart">123</i>&nbsp;
			                    				<i class="fa fa-eye">1234</i>
			                    			</div>
			                    		</div>
			                    	</div>
			                    	<div class="panel col-lg-4 col-xs-6">
			                    		<div class="panel-body img-thumbnail-box">
			                    			<div class="thumbnail">
			                    				<div class="centered">
					                    			<img src="/resources/img/thumbs/mega-menu-5.jpg">
			                    				</div>
			                    			</div>
			                    		</div>
			                    		<div class="panel-body img-desc-box">
			                    			<div class="ellipsis text-bold">제목제목제목제목제목제목제목</div>
			                    			<div class="text-right mar-top">담배아저씨</div>
			                    			<div class="text-right mar-btm">2019-10-02</div>
			                    			<div class="text-right">
			                    				<i class="fa fa-comments">12</i>&nbsp;
			                    				<i class="fa fa-heart">123</i>&nbsp;
			                    				<i class="fa fa-eye">1234</i>
			                    			</div>
			                    		</div>
			                    	</div>
			                    	<div class="panel col-lg-4 col-xs-6">
			                    		<div class="panel-body img-thumbnail-box">
			                    			<div class="thumbnail">
			                    				<div class="centered">
					                    			<img src="/resources/img/thumbs/img2.jpg">
			                    				</div>
			                    			</div>
			                    		</div>
			                    		<div class="panel-body img-desc-box">
			                    			<div class="ellipsis text-bold">제목제목제목제목제목제목제목</div>
			                    			<div class="text-right mar-top">담배아저씨</div>
			                    			<div class="text-right mar-btm">2019-10-02</div>
			                    			<div class="text-right">
			                    				<i class="fa fa-comments">12</i>&nbsp;
			                    				<i class="fa fa-heart">123</i>&nbsp;
			                    				<i class="fa fa-eye">1234</i>
			                    			</div>
			                    		</div>
			                    	</div>
			                    	<div class="panel col-lg-4 col-xs-6">
			                    		<div class="panel-body img-thumbnail-box">
			                    			<div class="thumbnail">
			                    				<div class="centered">
					                    			<img src="/resources/img/thumbs/img1.jpg">
			                    				</div>
			                    			</div>
			                    		</div>
			                    		<div class="panel-body img-desc-box">
			                    			<div class="ellipsis text-bold">제목제목제목제목제목제목제목</div>
			                    			<div class="text-right mar-top">담배아저씨</div>
			                    			<div class="text-right mar-btm">2019-10-02</div>
			                    			<div class="text-right">
			                    				<i class="fa fa-comments">12</i>&nbsp;
			                    				<i class="fa fa-heart">123</i>&nbsp;
			                    				<i class="fa fa-eye">1234</i>
			                    			</div>
			                    		</div>
			                    	</div>
			                    </div>
			                    
			                    
			                    <div class="row">
			                    	<!--Pagination-->
					                <!--===================================================-->
					                <ul class="pagination">
					                    <li><a href="#" class="demo-pli-arrow-left"></a></li>
					                    <li><a href="#">1</a></li>
					                    <li><a href="#">2</a></li>
					                    <li><a href="#">3</a></li>
					                    <li><a href="#">4</a></li>
					                    <li><span>...</span></li>
					                    <li><a href="#">20</a></li>
					                    <li><a href="#" class="demo-pli-arrow-right"></a></li>
					                </ul>
					                <!--===================================================-->
					                <!--End Default Pagination-->
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