<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">

<!-- HEAD -->
<%@ include file="includes/head.jsp" %>
	<title>Page Template | moim@</title>
	<link rel="stylesheet" href="/resources/css/jquery.flexdatalist.css">
	
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
           	    		<form id="searchForm" action="/home/result" method="post">
       	    				<div class="col-sm-2">
           	    				<select id="selectInterest" name="type" class="form-control"> 
			      					<option value="R">관심사</option>
		      						<option value="M">모임</option>
			      					<option value="A">지역</option> 
		   	 	 				</select>
       	    				</div>
            	    		<div class="col-xs-9">
	    						<input type="text" class="form-control" id="searchKeyword" name="keyword" placeholder="Search...">
	    					</div>
	    					<div class="col-sm-1">
	    						<button class="btn btn-default btn-icon" type="submit">
			      				<i class="glyphicon glyphicon-search"></i>
		      					</button>
		      				</div>
						</form>
						</div>
					</div>
					
					<div class="row">
						<div class="col-sm-6 eq-box-sm">
					            <div class="panel">
					                <div class="panel-heading">
					                    <h3 class="panel-title">카테고리</h3>
					                </div>
					                <div class="panel-body demo-nifty-btn">
					                    <!--Disabled Buttons-->
					                    <!--===================================================-->
					                    <button class="btn btn-default" id="sports">스포츠</button>
					                    <button class="btn btn-primary" >Primary</button>
					                    <button class="btn btn-info" >Info</button>
					                    <button class="btn btn-success" >Success</button>
					                    <button class="btn btn-mint" >Mint</button>
					                    <button class="btn btn-warning" >Warning</button>
					                    <button class="btn btn-danger" >Danger</button>
					                    <button class="btn btn-pink" >Pink</button>
					                    <button class="btn btn-purple" >Purple</button>
					                    <button class="btn btn-dark">Dark</button>
					                    <!--===================================================-->
									<div id="dictionary"></div>
					             </div>
					          </div>
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
	<script type="text/javascript" src="/resources/js/jquery-ui.js"></script>
	<script type="text/javascript" src="/resources/js/jquery.flexdatalist.js"></script>
	 
	<script type="text/javascript">
	 	$(document).ready(function() {
	 		
	 		var searchForm = $("#searchForm");
	 		
	 		 $("#sports").on("click", function(){
	 			 $("#dictionary").load("/resources/btn.html", function(){
	 				 
	 				 var array = [];
	 				 for(var i =0; i<array.length; )
	 					 
	 				 $("#do[text1]").on("click", function(){
	 					 var ttt = $("#do").text();
	 					 
	 					$("#searchKeyword").attr("value", ttt);
	 					searchForm.submit();
	 				 });
	 			 });
	 		    return false;
	 		 });
	 		 
	 		$("#searchForm").submit(function(){
	 			
	 			var search = $('#searchKeyword').val();
	 			
	 			if($.trim(search).length < 1) {
	 				
	 				$("#searchKeyword").focus();
	 				
	 				alert("검색어를 입력해주세요.")
	 				return false;
	 			}
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
	 		 		})
	 			},
	 			
	 			open: function () {
	 	            $(this).data("autocomplete").flexdatalist;
	 	        }
	 			
	 		});
	 	});
	 	
	 	
	 	
	 	$("#selectInterest").change(function(){
	 		
	 		var text = $("#selectInterest option:selected").text();
	 		
	 		alert(text);

	 		$('#searchKeyword').autocomplete({
	 			
	 			source:	function(request, response) {
	 				
	 				$.ajax({
	 		 			url:		"/home/searchInterest",
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
	 		 		})
	 			},
	 			
	 			open: function () {
	 	            $(this).data("autocomplete").flexdatalist;
	 	        }
	 			
	 		});
	 	});
			
	 	
	 </script>
	 
</body>
</html>