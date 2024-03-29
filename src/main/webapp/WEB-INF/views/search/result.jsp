<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">

<!-- HEAD -->
<%@ include file="../includes/head.jsp" %>
	<title> 모임 찾기  | moim@</title>
<style>

.row {
	margin: 7.5px;
}

.media-left {
	padding-right: 20px;
}

.ui-autocomplete {
    position: absolute;
    z-index: 1000;
    cursor: default;
    padding: 0;
    margin-top: 2px;
    list-style: none;
    background-color: #ffffff;
    border: 1px solid #ccc
    -webkit-border-radius: 5px;
       -moz-border-radius: 5px;
            border-radius: 5px;
    -webkit-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
       -moz-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
}

.ui-autocomplete > li {
  padding: 3px 20px;
}

.form-control {
	height: 32px;
}
	
@media screen and (max-width: 768px) {
	.btn-search {
		display: none;
	}
	
	.col-sm-10 > .input-group {
		margin-top : 10px;
	}
	
	.bg-trans-dark {
		margin-bottom : 20px;
	}
}

@media screen and (min-width: 768px) {
	.btn-search {
		display: block;
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
		<%@ include file="../includes/header-navbar.jsp" %>
		<!-- END NAVBAR -->
		
		<!-- BOXED -->
		 <div class="boxed">
		
			<!-- MAIN-NAV -->
			<%@ include file="../includes/main-nav.jsp" %>
			<!-- END MAIN-NAV -->
			
			<!-- ASIDE -->
			<%-- <%@ include file="../includes/aside.jsp" %> --%>
			<!-- END ASIDE -->
			
			
					
           <!--CONTENT CONTAINER-->
            <!--===================================================-->
             <div id="content-container">
                
                <!--Page Title-->
                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                 <div id="page-title">
                    <h1 class="page-header text-overflow">모임 찾기</h1>
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
  	    			<div class="row pad-ver bg-trans-dark">
           	    		<div class="col-xs-12 col-sm-10 col-sm-offset-1 pad-hor">
           	    		<form id="searchForm" action="/result" method="post">
       	    				<div class="col-sm-2">
           	    				<select id="selectType" name="type" class="form-control"> 
			      					<option value="RMA" <c:if test="${cri.type eq 'RMA'}">selected</c:if>>전체</option>
			      					<option value="R"  <c:if test="${cri.type eq 'R'}">selected</c:if>>관심사</option>
		      						<option value="M" <c:if test="${cri.type eq 'M'}">selected</c:if>>모임명</option>
			      					<option value="A" <c:if test="${cri.type eq 'A'}">selected</c:if>>지역</option> 
		   	 	 				</select>
       	    				</div>
            	    		<div class="col-sm-10">
            	    		<div class="input-group">
		    					<input type="text" class="form-control" id="searchKeyword" name="keyword" value="${cri.keyword }" placeholder="Search..."  autocomplete="off">
								<small class="help-block" id="searchHint"></small>
									<span class="input-group-btn">
		    						<button class="btn btn-default btn-icon" type="submit">
				      					<i class="glyphicon glyphicon-search"></i>
			      					</button>
									</span>
							</div>
	    					</div>
						</form>
						</div>
					</div> 
					
					<form action="/result" method="post">
					
					<div class="row btn-search">
					<div class="eq-height">
						<div class="col-sm-6 eq-box-sm">
			            	<div class="panel">
				                <div class="panel-heading">
				                    <h3 class="panel-title">관심사 카테고리</h3>
					                </div>
					                <div class="panel-body demo-nifty-btn">
				                    <div id="upperInner"></div>
				                    <hr></hr>
				                    <div id="lowerInner"></div>
					             	</div>
					          </div>
					     </div>	
						<div class="col-sm-6 eq-box-sm">
			            	<div class="panel">
				                <div class="panel-heading">
				                    <h3 class="panel-title">지역 카테고리</h3>
					                </div>
					                <div class="panel-body demo-nifty-btn">
				                    <div id="upperInner2"></div>
				                    <hr></hr>
				                    <div id="lowerInner2"></div>
					             	</div>
					          </div>
					     </div>	
					     </div>
					 </div>
					 
   					<c:forEach items="${keyword}" var="searchVO" varStatus="status" end="2">
	           		 <div class="row">
						<div class="col-lg-12">
	           				<div class="panel">
	      						<div class="pad-all">
	           						<div class="media mar-btm">
	          							<div class="media-left">
	          								<img src="${searchVO.teamPhoto}" class="img-md img-circle" alt="Avatar">
	          							</div>
	          							<div class="media-body">
	          							<a href='<c:out value="/groups/${searchVO.teamId }" />'> <p class="text-lg text-main text-semibold mar-no">${searchVO.teamName}</p></a>
	          							<p>${searchVO.intName}&nbsp;/&nbsp;${searchVO.areaRegionName}</p>
	          							</div>
	       							</div>
	       								<blockquote class="bq-sm bq-open bq-close">${searchVO.teamShortContent}</blockquote>
	       						</div>
	           				</div>
	           			</div>
	           		 </div>
					 </c:forEach>
           		          		
					 </form>
					 
					 <script type="text/javascript" src="/resources/js/jquery-ui.min.js"></script>
					 <script type="text/javascript" src="/resources/js/search.js"></script>
	  				
                </div>
                <!--===================================================-->
                <!--End page content-->


            </div>
            <!--===================================================-->
            <!--END CONTENT CONTAINER-->			
			
			
			
		</div>
		<!-- END BOXED -->
		
		<!-- FOOTER -->
		<%@ include file="../includes/footer.jsp" %>
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