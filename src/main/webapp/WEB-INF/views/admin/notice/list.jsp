<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<!-- HEAD -->
<%@ include file="../../includes/head.jsp" %>
	<title>Page Template | moim@</title>
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
			<%-- <%@ include file="../../includes/aside.jsp" %> --%>
			<!-- END ASIDE -->
			
			
					
           <!--CONTENT CONTAINER-->
            <!--===================================================-->
            <div id="content-container">
                
                <!--Page Title-->
                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                <div id="page-title">
                    <h1 class="page-header text-overflow">공지사항 관리</h1>
                </div>
                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                <!--End page title-->

                <!--Page content-->
                <!--===================================================-->
                <div id="page-content">
                	<!-- #################################### -->
                	<!-- #### WRITE CODE BELOW THIS LINE #### -->
            	    <!-- #################################### -->
           		<!--Basic Columns-->
					<!--===================================================-->
					<div class="panel">
					    <div class="panel-heading">
					        <h3 class="panel-title">목록</h3>
					    </div>
					    <div class="panel-body">
					        <table class="table table-bordered">
					            <thead>
					                <tr>
					                    <th >No</th>
					                    <th >제목</th>
					                    <th >작성자</th>
					                    <th >등록일</th>
					                    <th >조회수</th>
					                </tr>
					            </thead>
					            <tbody>
					            <c:forEach items="${list }" var="list" varStatus="status">
					            	<tr>
					            		<td>${status.count}</td><!-- 게시물 번호 -->
					            		<td><a href="#" class="view-js" data-seq="${list.seq }" >${list.title }</a></td>
					            		<td>${list.name}</td>
					            		<td>${list.regdate}</td>
					            		<td>${list.count}</td>
					            	</tr>
					            </c:forEach>
					            </tbody>
					        </table>
					        
									<nav aria-label="Page navigation">
									<div class="row justify-content-md-center">
									  <ul class="pagination">
									    <li>
									      <a href="#" aria-label="Previous">
									        <span aria-hidden="true">&laquo;</span>
									      </a>
									    </li>
									    <li><a href="#">1</a></li>
									    <li><a href="#">2</a></li>
									    <li><a href="#">3</a></li>
									    <li><a href="#">4</a></li>
									    <li><a href="#">5</a></li>
									    <li><a href="#">6</a></li>
									    <li><a href="#">7</a></li>
									    <li><a href="#">8</a></li>
									    <li><a href="#">9</a></li>
									    <li><a href="#">10</a></li>
									    <li>
									      <a href="#" aria-label="Next">
									        <span aria-hidden="true">&raquo;</span>
									      </a>
									    </li> 
									  </ul>
					        </div>
									</nav>

					    </div>
					</div>
					<!--===================================================-->    
                
					
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
		const viewJS = $('.viewJS');

		viewJS.on('click',view(this.data('seq')));

		function view(seq){
		location.href = `/admin/notice/view/${seq}`;
	}
	</script>	


</body>
</html>