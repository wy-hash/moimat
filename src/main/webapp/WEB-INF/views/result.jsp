<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">

<!-- HEAD -->
<%@ include file="includes/head.jsp" %>
	<title>Page Template | moim@</title>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
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
                 <div id="page-title">
                    <h1 class="page-header text-overflow">Page Template</h1>
                </div>
                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                <!--End page title-->

                <!--Page content-->
                <!--===================================================-->
                 <div id="page-content">
                	<!-- #################################### -->
                	<!-- #### WRITE CODE BELOW THIS LINE #### -->
            	    <!-- #################################### -->
            	    
            	    
            	    
            	    
             			<%-- <c:forEach items="${last}" var="teamDomain" varStatus="status">
             			<c:if test="${status.index eq 0}">
             				<p><c:out value="${teamDomain.teamName}"/></p>
              			<p><c:out value="${teamDomain.teamArea}"/></p>
              			<p><c:out value="${teamDomain.teamShortContent}"/></p> 
            				</c:if>
						</c:forEach> --%>
						                			
				<div class="row pad-ver bg-trans-dark">     			
					<div class="col-xs-12 col-sm-10 col-sm-offset-1 pad-hor">
						<form id="searchForm" action="/home/result" method="post">
						<input type="text" class="form-control input-sm" id="searchKeyword" name="keyword" placeholder="Search.."/>
						</form>
					</div>	                		 
           	    </div>
           			
           		
           		<form id="searchResult" action="/home/result" method="post">
           		<c:forEach items="${keyword}" var="teamDomain" varStatus="status" begin="0" end="2">
           		<c:if test="${status.index eq 0}"/>
           			<div class="col-xs-12">
           			<div class="col-md-6 col-lg-4" style="margin-top:15px;">
           				<div class="panel">
       						<div class="pad-all">
				                <div class="media mar-btm">
				                    <div class="media-left">
				                       <img src="/resources/img/bg-img/이미지캡처.PNG" class="img-md img-circle" alt="Avatar">
				                    </div>
				                    <div class="media-body">
			                        	<p class="text-lg text-main text-semibold mar-no">${teamDomain.teamName}</p>
				                        <p style="padding-top:10px;">${teamDomain.teamArea}</p>
				                    </div>
				                </div>
				                	<blockquote class="bq-sm bq-open bq-close">${teamDomain.teamShortContent}</blockquote>
				            </div>
			            </div>
		            </div>
		            </div>
	            <c:if test="${status.end eq 2}"/>
	            </c:forEach> 
           		</form>
           		
								
					
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
	<script type="text/javascript" src="/resources/js/jquery-ui.min.js"></script>
	 
	<script type="text/javascript">
	 	$(document).ready(function() {
	 		
	 		$('#searchKeyword').autocomplete({
	 			
	 			source:	function(request, response) {
	 				
	 				$.ajax({
	 		 			url:		"/home/search",
	 	 				type:		"POST",
	 	 				dataType:	"json",
	 		 			data:		request,
	 		 			success:	function(data) {
	 		 				console.log(data);
	 		 				
	 		 				var result = data;
	 		 				response(result);
	 		 			},
	 		 			error: function(request, status, error) {
	 		 				var msg = "ERROR : " + request.status + "<br>"
	 		 			      msg +=  + "내용 : " + request.responseText + "<br>" + error;
	 		 			      console.log(msg);
	 		 			}
	 		 		});
	 			}
 			});
	 	});
	 </script>
	 
</body>
</html>