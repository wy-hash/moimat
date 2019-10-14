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
                    <h1 class="page-header text-overflow">회원 관리</h1>
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
                <h3 class="panel-title">회원 상세 보기</h3>
            </div>
            <form id="memForm" name="memForm" class="panel-body form-horizontal form-padding">
				<input type="hidden" id="memId" name="memId" value="${view.memId }" />
				<input type="hidden" id="memLevel" name="memLevel" value="${view.memLevel }" />
				<input type="hidden" id="memStatus" name="memStatus" value="${view.memStatus }" />
				<input type="hidden" name="type" value ="${pageMaker.cri.type }">
	        	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
				<input type="hidden" name="pageNum" value ="${pageMaker.cri.pageNum }">
				<input type="hidden" name="amount" value ="${pageMaker.cri.amount }">
				
                <!--회원 이메일-->
                <div class="form-group">
                    <label class="col-md-2 control-label" for="memEmail"><strong>이메일</strong></label>
                    <div class="col-md-10">
                        	${view.memEmail}
                    </div>
                </div>
                <!-- 회원 이름(닉네임)-->
                <div class="form-group">
                    <label class="col-md-2 control-label" for="memNickname"><strong>이름(닉네임)</strong></label>
                    <div class="col-md-10">
                        <p class="form-control-static">${view.memNickname}</p>
                    </div>
                </div>

                <!--회원 생일-->
                <div class="form-group">
                    <label class="col-md-2 control-label" for="memBirthday"><strong>생일</strong></label>
                    <div class="col-md-10">
						<fmt:parseDate value="${view.memBirthday}" var="birthday"  pattern="yyyy-mm-dd" scope="page"/>
						<fmt:formatDate value="${birthday}" pattern="yyyy년 mm월 dd일"/>
                    </div>
                </div>
                <!--회원 성별-->
                <div class="form-group">
                    <label class="col-md-2 control-label" for="memGender"><strong>회원 성별</strong></label>
                    <div class="col-md-10">
						<c:choose>
							<c:when test="${view.memGender eq 'M'}">남자</c:when>
							<c:when test="${view.memGender eq 'F'}">여자</c:when>
						</c:choose>
                    </div>
                </div>
                
                <!--회원 소개 -->
                <div class="form-group">
                    <label class="col-md-2 control-label" for="memContent"><strong>회원 소개</strong></label>
                    <div class="col-md-10">
                        	${view.memContent}
                    </div>
                </div>
                <!--회원 등급-->
                <div class="form-group">
                    <label class="col-md-2 control-label" for="memLevel"><strong>회원 등급</strong></label>
                    <div class="col-md-10">
						<c:choose>
							<c:when test="${view.memLevel == 1}">사용자</c:when>
							<c:when test="${view.memLevel == 8}">부 관리자</c:when>
							<c:when test="${view.memLevel == 9}">관리자</c:when>
						</c:choose>
                    </div>
                </div>
                
                <!--회원 상태-->
                <div class="form-group">
                    <label class="col-md-2 control-label" for="memStatus"><strong>회원 상태</strong></label>
                    <div class="col-md-10">
						<c:choose>
							<c:when test="${view.memStatus == 1}">일반</c:when>
							<c:when test="${view.memStatus == 0}">탈퇴</c:when>
						</c:choose>
                    </div>
                </div>

           		<div class="row mar-top">
           			<span class="pull-right">
	                	<button type="button" id="edit" class="btn btn-success"> 수정</button>
	                	<button type="button" id="delete" class="btn btn-danger"> 삭제</button>
               		</span>
                </div>
            </form>
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
<%-- 		<%@ include file="../../includes/footer.jsp" %> --%>
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

			
			$('#edit').on('click',   formSubmit);	// 회원 수정
			$('#delete').on('click', formSubmit);	// 회원 삭제
			
		});
		
		function formSubmit(){
			
			const id = $('#memId').val();
			const uri = '/admin/users/'
			
			const action = $(this).attr('id');
			
			if(action === 'edit'){
				$('#memForm').attr('method','get');
				$('#memForm').attr('action',uri+'/'+id+'/'+action);
				$('#memForm').submit();
			}else if(action ==='delete'){
				$('#memForm').attr('method','post');
				$('#memForm').attr('action',uri+action);
				$('#memForm').submit();
			}
		}
	</script>

</body>
</html>