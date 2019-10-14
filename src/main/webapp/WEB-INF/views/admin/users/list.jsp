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
<!--Bootbox Modals [ OPTIONAL ]-->
<script src="/resources/plugins/bootbox/bootbox.min.js"></script>

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
								<!--Nav tabs-->
								<ul class="nav nav-tabs"> </ul>
							</div>
							<h3 class="panel-title">회원 관리</h3>
						</div>
						<!--Panel body-->
						<div class="panel-body">
							<form id="searchForm" class="form-inline pull-right mar-btm" action="/admin/users" method="get">
								<div class="form-group">
									<select id="memLevel" name="memLevel" class="form-control">
										<option value="0" <c:if test="${pageMaker.cri.memLevel == 0}">selected</c:if>
											<c:if test="${empty pageMaker.cri.memLevel}">selected</c:if> >::등급::
										</option>
										<option value="1" <c:if test="${pageMaker.cri.memLevel == 1}">selected</c:if> >사용자</option>
										<option value="8" <c:if test="${pageMaker.cri.memLevel == 8}">selected</c:if> >부관리자</option>
										<option value="9" <c:if test="${pageMaker.cri.memLevel == 9}">selected</c:if> >관리자</option>
									</select>
									<select id="memStatus" name="memStatus" class="form-control">
										<option value="2" <c:if test="${pageMaker.cri.memStatus == 2}">selected</c:if>
											<c:if test="${empty pageMaker.cri.memStatus}">selected</c:if> >::상태::
										</option>
										<option value="1" <c:if test="${pageMaker.cri.memStatus == 1}">selected</c:if> >일반</option>
										<option value="0" <c:if test="${pageMaker.cri.memStatus == 0}">selected</c:if> >탈퇴</option>
									</select>
									<select id="type" name="type" class="form-control">
										<option value="EN" <c:if test="${pageMaker.cri.type eq 'EN'}">selected</c:if>
											<c:if test="${empty pageMaker.cri.type}">selected</c:if> >전체
										</option>
										<option value="E" <c:if test="${pageMaker.cri.type eq 'E'}">selected</c:if> >이메일</option>
										<option value="N" <c:if test="${pageMaker.cri.type eq 'N'}">selected</c:if> >닉네임</option>
									</select>
									<input type="text" name="keyword" class="form-control" value="${pageMaker.cri.keyword }"
										placeholder="검색어를 입력해 주세요.">
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
													<th>회원 닉네임</th>
													<th>회원 이메일</th>
													<th>회원 생일</th>
													<th>성별</th>
													<th>최근 정보 수정일</th>
													<th>최근 로그인 시간</th>
													<th>등급</th>
													<th>상태</th>
												</tr>
											</thead>
											<tbody>
												<c:if test="${empty memList}">
													<tr>
														<td colspan="9" class="text-center"> 값이 없습니다.</td>
													</tr>
												</c:if>
												<c:forEach items="${memList }" var="list" varStatus="status">
													<tr>
														<td>${(pageMaker.cri.pageNum-1)*pageMaker.cri.amount + status.count}</td>
														<td><a href="#" class="view" data-id="${list.memId }">
															${list.memNickname}
														</a></td>
														<td>${list.memEmail }</td>
														<td>
														<fmt:parseDate value="${list.memBirthday}" var="birthday"  pattern="yyyy-mm-dd" scope="page"/>
														<fmt:formatDate value="${birthday}" pattern="yyyy년 mm월 dd일"/>
														</td>
														<td>														
														<c:choose>
															<c:when test="${list.memGender eq 'M'}">남자</c:when>
															<c:when test="${list.memGender eq 'F'}">여자</c:when>
														</c:choose>
														</td>
														<td>${list.memUpdate}</td>
														<td>${list.memLastlogin}</td>
														<td>
														<a href="#" class="modalLevel" data-id="${list.memId }" data-nickname="${list.memNickname}"  data-level="${list.memLevel }">
														<c:choose>
															<c:when test="${list.memLevel == 1}">사용자</c:when>
															<c:when test="${list.memLevel == 8}">부 관리자</c:when>
															<c:when test="${list.memLevel == 9}">관리자</c:when>
															<c:otherwise>-</c:otherwise>
														</c:choose>
														</a>
														</td>
														<td>
														<a href="#" class="modalStatus" data-id="${list.memId }" data-nickname="${list.memNickname}"  data-status="${list.memStatus }">
														<c:choose>
															<c:when test="${list.memStatus == 1}">일반회원</c:when>
															<c:when test="${list.memStatus == 0}">탈퇴회원</c:when>
															<c:otherwise>-</c:otherwise>
														</c:choose>
														</a>
														</td>
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
											<button id="newUser" type="button" class="btn btn-success pull-right mar-top"><i
													class="demo-pli-plus"></i> 회원
												추가</button>
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
	<!-- modal for level -->	
	<div class="modal" id="modalLevel" tabindex="-1"  style="display: none;">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <!--Modal header-->
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal"><i class="pci-cross pci-circle"></i></button>
	                <h4 class="modal-title">등급 변경</h4>
	            </div>
	
				<form id="modalLevelForm" action="/admin/users/change/level" method="post">
	            <!--Modal body-->
	            <div class="modal-body">
	            	<input type="hidden" name="memId">
	                <p class="text-semibold text-main">사용자 명  : <span id="currentNickname"></span></p>
	                <p class="text-semibold text-main">기존 등급  : <span id="currentLevel"></span></p>
	               	<p class="text-semibold text-main">등급 변경  : 
		               	<select id="changeLevel" name="memLevel">
	      					<option value="1">사용자</option>
							<option value="8">부관리자</option>
							<option value="9">관리자</option>
		                </select>
	                </p> 
	            </div>
	
	            <!--Modal footer-->
	            <div class="modal-footer">
	                <button data-dismiss="modal" class="btn btn-default" type="button">취소</button>
	                <button id="modalLevelSubmit" class="btn btn-warning">변경</button>
	            </div>
	            </form>
	        </div>
	    </div>
	</div>
	<!-- //modal for level -->
	<!-- modal for status -->	
	<div class="modal" id="modalStatus" tabindex="-1"  style="display: none;">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <!--Modal header-->
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal"><i class="pci-cross pci-circle"></i></button>
	                <h4 class="modal-title">상태 변경</h4>
	            </div>
	
				<form id="modalLevelForm" action="/admin/users/change/status" method="post">
	            <!--Modal body-->
	            <div class="modal-body">
	            	<input type="hidden" name="memId">
	                <p class="text-semibold text-main">사용자 명  : <span id="currentNickname"></span></p>
	                <p class="text-semibold text-main">기존 상태  : <span id="currentStatus"></span></p>
	               	<p class="text-semibold text-main">상태 변경  : 
		               	<select id="changeStatus" name="memStatus">
	      					<option value="1">일반</option>
							<option value="0">탈퇴</option>
		                </select>
	                </p> 
	            </div>
	
	            <!--Modal footer-->
	            <div class="modal-footer">
	                <button data-dismiss="modal" class="btn btn-default" type="button">취소</button>
	                <button id="modalStatusSubmit" class="btn btn-warning">변경</button>
	            </div>
	            </form>
	        </div>
	    </div>
	</div>
	<!-- //modal for status -->		
	
	
	
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
			
			// 등급 변동시 이벤트	
			$('#modalLevelSubmit').on('click',function(){
				$('#modalLevelForm').submit();					
			});
			
			$('.modalLevel').on('click', function(){ //모달창 오픈 이벤트
				const modalLevel = $('#modalLevel');
				const memLevel = $(this).attr('data-level');
				const memNickname = $(this).attr('data-nickname');
				const memId = $(this).attr('data-id');
				
				let level='-';
				
				if (memLevel === '1' ){
					level = '사용자';
				} else if (memLevel === '8' ){
					level = '부 관리자';
				} else if (memLevel === '9' ){
					level = '관리자';
				}
				
				modalLevel.find('input[name=memId]').val(memId);
				modalLevel.find('#currentNickname').html(memNickname);
				modalLevel.find('#currentLevel').html(level);
				modalLevel.modal('show');
			});

			// 상태 변동시 이벤트	
			$('#modalStatusSubmit').on('click',function(){
				$('#modalStatusForm').submit();					
			});
			
			$('.modalStatus').on('click', function(){ //모달창 오픈 이벤트
				const modalStatus = $('#modalStatus');
				const memStatus = $(this).attr('data-status');
				const memNickname = $(this).attr('data-nickname');
				const memId = $(this).attr('data-id');
				
				let status='-';
				
				if (memStatus === '1' ){
					status = '일반 회원';
				} else if (memStatus === '0' ){
					status = '탈퇴 회원';
				}
				
				modalStatus.find('input[name=memId]').val(memId);
				modalStatus.find('#currentNickname').html(memNickname);
				modalStatus.find('#currentStatus').html(status);
				modalStatus.modal('show');
			});
			
			$('#newUser').on('click', function(){
				const param = $('#searchForm').serialize();
				
				const url = location.origin+'/admin/users/new'+'?'+param;
				location.href = url;
			});
			
			$('.view').on('click', function(){
				const param = $('#searchForm').serialize();
				const id = this.dataset.id;
				const url = location.origin+'/admin/users/'+id +'/view'+'?'+param;
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

</body>
</html>