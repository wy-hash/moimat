<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">

<!-- HEAD -->
<%@ include file="includes/head.jsp" %>
	<title>Page Template | moim@</title>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<style>

.row {
	margin: 7.5px;
}

.media-left {
	padding-right: 20px;
}

.ui-autocomplete {
	border: 1px solid #42a5f5;
	width: 120px;
	border-radius: 3px;
	overflow: hidden;
	background: #eeeeee;
}

.form-control {
	height: 32px;
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
            	    
  	    		
  	    		<div class="row pad-ver bg-trans-dark">
  	    			<div class="col-xs-12 col-sm-10 col-sm-offset-1 pad-hor">
  	    				<form id="searchForm" action="/home/result" class="form-inline" method="post">
				    	<div class="form-group">
			      			<span>
		      				<select name="type" class="form-control"> 
	      						<option value="R">관심사</option>
      							<option value="M">모임</option>
	      						<option value="A">지역</option> 
   	 	 					</select>
		      	  			</span>
				      		<input type="text" class="form-control" id="searchKeyword" name="keyword" placeholder="Search...">
		      				<button class="btn btn-default" type="submit">
		      					<i class="glyphicon glyphicon-search"></i>
		      				</button>
				    	</div>
						</form>
					</div>
				</div>		
           			
           		<form id="resultForm" action="/home/result" method="post">
	           		<div class="row">
	   					<c:forEach items="${keyword}" var="teamDomain" varStatus="status">
						<c:if test="${status.index eq 0}">
	           			<div class="col-md-6 col-lg-4">
	           				<div class="panel">
	           					<div class="pad-all">
	           						<div class="media mar-btm">
	          							<div class="media-left">
	          								<img src="/resources/img/bg-img/이미지캡처.PNG" class="img-md img-circle" alt="Avatar">
	          							</div>
	          							<div class="media-body">
	          							<p class="text-lg text-main text-semibold mar-no">${teamDomain.teamName}</p>
	          							<p>${teamDomain.teamArea}</p>
	          							</div>
	           						</div>
	       							<blockquote class="bq-sm bq-open bq-close">${teamDomain.teamShortContent}</blockquote>
	           					</div>
	           				</div>
	           			</div>
						</c:if>
						</c:forEach>
	           		</div>
           		
           		
           		
	           		<div class="row">
	  					<c:forEach items="${keyword}" var="teamDomain" varStatus="status">
						<c:if test="${status.index eq 1}">
	           			<div class="col-md-6 col-lg-4">
	           				<div class="panel">
	      						<div class="pad-all">
	           						<div class="media mar-btm">
	          							<div class="media-left">
	          								<img src="/resources/img/bg-img/이미지캡처.PNG" class="img-md img-circle" alt="Avatar">
	          							</div>
	          							<div class="media-body">
	          							<p class="text-lg text-main text-semibold mar-no">${teamDomain.teamName}</p>
	          							<p>${teamDomain.teamArea}</p>
	          							</div>
	       							</div>
	       								<blockquote class="bq-sm bq-open bq-close">${teamDomain.teamShortContent}</blockquote>
	       						</div>
	           				</div>
	           			</div>
						</c:if>
						</c:forEach>
	           		</div>
           		
           		
           		
	           		<div class="row">
	  					<c:forEach items="${keyword}" var="teamDomain" varStatus="status">
						<c:if test="${status.index eq 2}">
	           			<div class="col-md-6 col-lg-4">
	           				<div class="panel">
	           					<div class="pad-all">
	           						<div class="media mar-btm">
	          							<div class="media-left">
	          								<img src="/resources/img/bg-img/이미지캡처.PNG" class="img-md img-circle" alt="Avatar">
	          							</div>
	          							<div class="media-body">
	          							<p class="text-lg text-main text-semibold mar-no">${teamDomain.teamName}</p>
	          							<p>${teamDomain.teamArea}</p>
	          							</div>
	           						</div>
	       							<blockquote class="bq-sm bq-open bq-close">${teamDomain.teamShortContent}</blockquote>
	           					</div>
	           				</div>
	           			</div>
						</c:if>
						</c:forEach>
	  				</div>
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
	 		
	 		$("#searchForm").submit(function(){
	 			
	 			var search = $('#searchKeyword').val();
	 			
	 			if($.trim(search).length < 1) {
	 				
	 				$("#searchKeyword").focus();
	 				
	 				alert("검색어를 입력해주세요.")
	 				return false;
	 			}
 			});
	 		
	 		 $('#searchKeyword').keyup(function(){
	 			 
	 			var value = $('#searchKeyword').val();
	 			 console.log(value.length);
	 		 });
	 		 
	 		
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