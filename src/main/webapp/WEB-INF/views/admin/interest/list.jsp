<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<!-- HEAD -->
<%@ include file="../../includes/head.jsp" %>

    <!--Bootstrap Table [ OPTIONAL ]-->
    <link href="/resources/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">


    <!--X-editable [ OPTIONAL ]-->
    <link href="/resources/plugins/x-editable/css/bootstrap-editable.css" rel="stylesheet">

	<title> 관심사 코드 관리 - Admin | moim@</title>

<style>
@media screen and (max-width: 768px) {
	.input-group {
		margin-top : 15px;
	}
}

@media screen and (min-width: 768px) {
	.input-group {
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
                    <h1 class="page-header text-overflow">관심사 코드 관리</h1>
                </div>
                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                <!--End page title-->

                <!--Page content-->
                <!--===================================================-->
                <div id="page-content">
                	<!-- #################################### -->
                	<!-- #### WRITE CODE BELOW THIS LINE #### -->
            	    <!-- #################################### -->
           		<!--목록 뷰-->
					<!--===================================================-->
					<div class="panel">
						<div class="panel-heading text-center">
							<h3 class="panel-title">목록</h3>
						</div>
						<div class="panel-body">
						<div class="row">
							<form id="searchForm" class="form-inline pull-right mar-btm" action="/admin/interest" method="get">
								<div class="form-group">
									<select id="type" name="type" class="form-control">
										<option value="KN" <c:if test="${pageMaker.cri.type eq 'KN'}">selected</c:if>
											<c:if test="${empty pageMaker.cri.type}">selected</c:if> >전체
										</option>
										<option value="K" <c:if test="${pageMaker.cri.type eq 'K'}">selected</c:if> >코드</option>
										<option value="N" <c:if test="${pageMaker.cri.type eq 'N'}">selected</c:if> >이름</option>
									</select>
									<div class="input-group">
									<input type="text" name="keyword" class="form-control" value="${pageMaker.cri.keyword }"
										placeholder="검색어를 입력해 주세요.">
									<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
									<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
										<span class="input-group-btn">
				    						<button class="btn btn-default btn-icon" type="submit">
						      					<i class="glyphicon glyphicon-search"></i>
					      					</button>
										</span>
									</div>
								</div>
							</form>
							<table class="table table-bordered">
								<thead>
									<tr>
										<th>No</th>
										<th>관심사 코드</th>
										<th>관심사 이름</th>
										<th>정렬 순서</th>
										<th>사용 유무</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${empty list}">
										<tr>
											<td colspan="5" class="text-center"> 등록된 코드가 없습니다.</td>
										</tr>
									</c:if>
									<c:forEach items="${list }" var="list" varStatus="status">
										<tr>
											<td>${status.count}</td>
											<!-- 게시물 번호 -->
											<td><a href="#" class="view"
												data-seq="${list.intId }">${list.intKey}</a></td>
											<td>${list.intName}</td>
											<td>${list.intOrder}</td>
											<td>${list.intUse}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							</div>
							<div class="row text-center">
								<nav aria-label="Page navigation">
									<ul class="pagination">
										<c:if test="${pageMaker.prev}">
											<li><a href="${pageMaker.startPage -1 }" aria-label="Previous"><span
														aria-hidden="true">&laquo;</span></a></li>
										</c:if>
										<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage }">
											<li class="${pageMaker.cri.pageNum == num ? 'active': ''}"><a href="${num }">${num }</a></li>
										</c:forEach>

										<c:if test="${pageMaker.next}">
											<li><a href="${pageMaker.endPage + 1}" aria-label="Next"><span
														aria-hidden="true">&raquo;</span></a></li>
										</c:if>
									</ul>
									<button id="newInterest" type="button" class="btn btn-success pull-right mar-top"><i
											class="demo-pli-plus"></i> 관심사 추가</button>
								</nav>
							</div>
							 
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
  
    <!--Bootstrap Table Sample [ SAMPLE ]-->
    <script src="/resources/js/demo/tables-bs-table.js"></script>


    <!--X-editable [ OPTIONAL ]-->
    <script src="/resources/plugins/x-editable/js/bootstrap-editable.min.js"></script>


    <!--Bootstrap Table [ OPTIONAL ]-->
    <script src="/resources/plugins/bootstrap-table/bootstrap-table.min.js"></script>


    <!--Bootstrap Table Extension [ OPTIONAL ]-->
    <script src="/resources/plugins/bootstrap-table/extensions/editable/bootstrap-table-editable.js"></script>

	<script>
		$(document).ready(function(){
			$('#newInterest').on('click', function(){
				let url = location.origin+'/admin/interest/new';
				location.href = url;
			});
			
			$('.view').on('click', function(){
				let seq = this.dataset.seq;
				let url = location.origin+'/admin/interest/view/'+seq;
				location.href = url;
			});

			$('.pagination > li > a').on('click', function(e){
				const searchForm = $('#searchForm');
				e.preventDefault();
				searchForm.find('input[name="pageNum"]').val($(this).attr("href"));
				searchForm.submit();
			});
		});
	</script>

	 <%-- for modal --%>
	<c:if test="${ !empty loginVO }">
		<%@ include file="../../includes/modals.jsp" %>
	</c:if>
	<%-- for modal --%>
</body>
</html>