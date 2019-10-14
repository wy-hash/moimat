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
    <style>
    	.mt-20{
    		margin-top: 20px;
    	}  
    	.mb-10{
    		margin-bottom: 10px;
    	}   	
    </style>

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
                    <h1 class="page-header text-overflow">이벤트 관리</h1>
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
							<form id="actionForm" class="form-inline pull-right mb-10" action="/admin/event" method="post">
								<div class="form-group">
									<select id="type" name="type" class="form-control">
										<option value="TCW" <c:if test="${pageMaker.cri.type eq 'TCW'}">selected</c:if> >전체</option>
										<option value="T" <c:if test="${pageMaker.cri.type eq 'T'}">selected</c:if> >제목</option>
										<option value="C" <c:if test="${pageMaker.cri.type eq 'C'}">selected</c:if> >내용</option>
										<option value="W" <c:if test="${pageMaker.cri.type eq 'W'}">selected</c:if> >작성자</option>
									</select>
						        	<input type="text" name="keyword" class="form-control" value="${pageMaker.cri.keyword }" placeholder="검색어를 입력해 주세요.">
						        	
									<input type="hidden" name="brdId" value ="${pageMaker.cri.brdId }">
									<input type="hidden" name="pageNum" value ="${pageMaker.cri.pageNum }">
									<input type="hidden" name="amount" value ="${pageMaker.cri.amount }">
							        <button type="submit" class="btn btn-default">검색</button>
						        </div>
							</form>
						<div class="row">
							<table class="table table-bordered">
								<thead>
									<tr>
										<th>No</th>
										<th>썸네일</th>
										<th>제목</th>
<!-- 										<th>내용</th> -->
										<th>작성자</th>
										<th>등록일</th>
										<th>수정일</th>
										<th>조회수</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${empty list}"> 
										<tr>
											<td colspan="7" class="text-center"> 값이 없습니다.</td>
										</tr>
									</c:if>
									<c:forEach items="${list }" var="list" varStatus="status">
										<tr>
											<td>${(pageMaker.cri.pageNum-1)*pageMaker.cri.amount + status.count}</td>
											<td><img src=" ${list.src} " style="width:100px; height:50px;"></td>
											<!-- 게시물 번호 -->
											<td><a href="#" class="view"
												data-id="${list.postId }">${list.postTitle}</a></td>
<%-- 											<td>${list.postContent}</td> --%>
											<td>${list.postNickname}</td>
											<td>${list.postRegdate}</td>
											<td>${list.postUpdate}</td>
											<td>${list.postHit}</td>
										</tr>
									</c:forEach>                                                                                      
								</tbody>
							</table>
							</div>
								<div class="row text-center">
							<nav aria-label="Page navigation">
									
									<ul class="pagination">
									
									<c:if test="${pageMaker.prev}">
										<li><a href="${pageMaker.startPage -1 }" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
									</c:if>	
									
									<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage }">
									
										<li class="${pageMaker.cri.pageNum == num ? 'active': ''}"><a href="${num }">${num }</a></li>
									</c:forEach>
										
										
									<c:if test="${pageMaker.next}">
										<li><a href="${pageMaker.endPage + 1}" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
									</c:if>
									</ul>
									

									
								<button id="newNotice" type="button" class="btn btn-success pull-right mt-20"><i class="demo-pli-plus"></i> 게시판 추가</button>	
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
			$('#newNotice').on('click', function(){
				let url = location.origin+'/admin/event/new';
				location.href = url;
			});
			
			$('.view').on('click', function(){
				let id = this.dataset.id;
				let url = location.origin+'/admin/event/view/'+id;
				location.href = url;
			});

			
			$('.pagination > li > a').on('click', function(e){
				
				const actionForm = $('#actionForm');
				e.preventDefault();
				actionForm.find('input[name="pageNum"]').val($(this).attr("href"));
				actionForm.submit();
			});
		});
	</script>

</body>
</html>