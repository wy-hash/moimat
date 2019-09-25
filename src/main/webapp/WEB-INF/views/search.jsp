<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">

<!-- HEAD -->
<%@ include file="includes/head.jsp" %>
	<title>Page Template | moim@</title>
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
            	    
                 <div class="col-xs-12">
                 	<div class="panel">
               		<div class="panel-heading">
               		</div>
           			<div class="panel-body">
               			<div class="bootstrap-table">
           				<table>
           					<thead>
               					<tr>
               						<th>모임명</th>
               						<th>소개글</th>
               					</tr>
               				</thead>
               				<c:forEach items="${list}" var="team">
               				<tr>
               					<td><c:out value="${team.teamName}"/></td>
               					<td><c:out value="${team.teamShortContent}"/></td>
               				</tr>
               				</c:forEach>
               			</table>
               			
               			<ul class="pagination">
               				<c:if test="${pageMaker.prev}">
               					<li class="paginate_button previous"><a href="${pageMaker.startPage -1}">Previous</a>
               				</c:if>
               				
               				<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
               					<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active":""}">
               						<a href="${num}">${num}</a></li>
               				</c:forEach>
               				
               				<c:if test="${pageMaker.next}">
               					<li class="paginate_button next">
               						<a href="${pageMaker.endPage + 1}">Next</a></li>
               				</c:if>
               			</ul>
               			<!-- end Pagination -->
               			<form id="actionForm" action="/home/search" method="get">
            	 			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
            	 			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
            	 			<input type='hidden' name='type' value='<c:out value="${ pageMaker.cri.type }"/>'>
            	 			<input type='hidden' name='keyword' value='<c:out value="${ pageMaker.cri.keyword }"/>'>
           	 			</form>
               			
               			<!-- 검색창 -->
               			<div class="col-xs-12">
               				<form id="searchForm" action="/home/search" method="get">
               					<select name="type">
               						<option value="" <c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
               						<option value="M" <c:out value="${pageMaker.cri.type eq 'M'?'selected':''}"/>>모임</option>
               						<option value="I" <c:out value="${pageMaker.cri.type eq 'I'?'selected':''}"/>>관심사</option>
               					</select>
               					<input type="text" id="searchKeyword" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"/>' />
               					<input type="hidden" name="pageNum" value='${pageMaker.cri.pageNum}'>
               					<input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
               					<button id="autocomplete">검색</button>
               				</form>
               			</div>
               			</div>
               		</div>
				 	</div>
				 </div>
               		
				 
				 			
				
				
					
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
	
	<script src="/resources/js/jquery-ui.min.js"></script>
	
	<script type="text/javascript">
	 	$(document).ready(function() {
	 		
	 		var array = ["test","test1","test2"];
	 		
	 		$('#searchKeyword').autocomplete({
	 			source:array
	 			});
	 		
	 		var searchForm = $("#searchForm");
	 		
	 		$("#searchForm button").on("click", function(e){
	 			
	 			searchForm.find("input[name='pageNum']").val("1");
	 			
	 			console.log('searchForm click')
	 			
	 			e.preventDefault();
	 			searchForm.submit();
	 			
	 		});
	 		
	 		var actionForm = $("#actionForm");
	 		
	 		$('.paginate_button a').on("click", function(e) {
	 			
	 			e.preventDefault();
	 			
	 			console.log('click');
	 			
	 			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
	 			actionForm.submit();
	 		});
	 	});
	 </script>
</body>
</html>