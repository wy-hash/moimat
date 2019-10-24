<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<!-- HEAD -->
<%@ include file="../../includes/head.jsp" %>
<!--Bootstrap Table [ OPTIONAL ]-->
<link href="/resources/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">

<!--X-editable [ OPTIONAL ]-->
<link href="/resources/plugins/x-editable/css/bootstrap-editable.css" rel="stylesheet">
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
					<!-- 					페이지 타이틀 -->
				</div>
				<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
				<!--End page title-->
				<!--Page content-->
				<!--===================================================-->
				<div id="page-content">
					<!-- #################################### -->
					<!-- #### WRITE CODE BELOW THIS LINE #### -->
					<!-- #################################### -->
					<!--  관리자 인덱스 -->
					<!--===================================================-->
					<!--Panel with Tabs-->
					<!--===================================================-->
					<div class="panel panel-mint">
						<!--Panel heading-->
						<div class="panel-heading">
							<div class="panel-control">
							</div>
							<h3 class="panel-title">QNA</h3>
						</div>
						<!--Panel body-->
						<div class="panel-body">
							<form id="searchForm" class="form-inline pull-right mar-btm" action="/info/qna" method="get">
									<input type="hidden" id="memId" name="memId" value="${sessionScope.loginVO.memId }">
								<div class="form-group">
									<select id="type" name="type" class="form-control">
										<option value="TCW" <c:if test="${pageMaker.cri.type eq 'TCW'}">selected</c:if>
											<c:if test="${empty pageMaker.cri.type}">selected</c:if> >전체
										</option>
										<option value="T" <c:if test="${pageMaker.cri.type eq 'T'}">selected</c:if> >제목</option>
										<option value="C" <c:if test="${pageMaker.cri.type eq 'C'}">selected</c:if> >내용</option>
										<option value="W" <c:if test="${pageMaker.cri.type eq 'W'}">selected</c:if> >작성자</option>
									</select>
									<input type="text" name="keyword" class="form-control" value="${pageMaker.cri.keyword }"
										placeholder="검색어를 입력해 주세요.">
									<input type="hidden" name="brdId" value="${pageMaker.cri.brdId }">
									<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
									<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
									<button type="submit" class="btn btn-default">검색</button>
								</div>
							</form>

							<!--Tabs content-->
							<div class="tab-content">
								<div id="tab-content-box" class="tab-pane in active">
									<div class="row">
										<table class="table table-bordered">
											<thead>
												<tr>
													<th>No</th>
													<th>제목</th>
													<th>작성자</th>
													<th>등록일</th>
<!-- 													<th>수정일</th> -->
													<th>조회수</th>
												</tr>
											</thead>
											<tbody>
												<c:if test="${empty postList}">
													<tr>
														<td colspan="6" class="text-center"> 값이 없습니다.</td>
													</tr>
												</c:if>
												<c:forEach items="${postList }" var="list" varStatus="status">
													<tr>
														<td>${(pageMaker.cri.pageNum-1)*pageMaker.cri.amount + status.count}</td>
														<!-- 게시글 번호 -->
														<td><a href="#" class="view" data-id="${list.postId }">
														<c:choose>
															<c:when test="${list.postReply eq 'Q'}">[질문]</c:when>
															<c:when test="${list.postReply eq 'A' and list.postDepth == 0}">[질문]</c:when>
															<c:when test="${list.postReply eq 'A' and list.postDepth == 1}"> -->[답변]</c:when>
														</c:choose>
															${list.postTitle}
															</a></td>
														<td>${list.postNickname}</td>
														<td>
														<fmt:parseDate value="${list.postRegdate}" var="postRegdate"  pattern="yyyy-mm-dd" scope="page"/>
														<fmt:formatDate value="${postRegdate}" pattern="yyyy년 mm월 dd일"/>
														</td>
<%-- 														<td>${list.postUpdate}</td> --%>
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
											<button id="newPost" type="button" class="btn btn-success pull-right mar-top"> 문의하기</button>
										</nav>
									</div>
								</div>
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

			$('.view').on('click', function(){
				const param = $('#searchForm').serialize();
				const postId = this.dataset.id;
				const memId = $('#memId').val();
				const url = location.origin+'/users/'+memId +'/qna/'+postId +'/view'+'?'+param;
				location.href = url;
			});

			
			$('#newPost').on('click', function(){
				const param = $('#searchForm').serialize();
				const memId = $('#memId').val();
				const url = location.origin+'/users/'+memId +'/qna/new'+'?'+param;
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