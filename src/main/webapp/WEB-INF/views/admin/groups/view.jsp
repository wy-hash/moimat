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

	<title> 모임 관리 - Admin | moim@</title>
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
                    <h1 class="page-header text-overflow">모임 관리</h1>
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
                <h3 class="panel-title">모임 상세 보기</h3>
            </div>
            <form id="teamForm" name="teamForm" class="panel-body form-horizontal form-padding">
				<input type="hidden" id="teamId" name="teamId" value="${view.teamId }" />
				<input type="hidden" id="intId" name="intId" value="${view.intId }" />
				<input type="hidden" id="memId" name="memId" value="${view.memId }" />
				<input type="hidden" name="type" value ="${pageMaker.cri.type }">
	        	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
				<input type="hidden" name="pageNum" value ="${pageMaker.cri.pageNum }">
				<input type="hidden" name="amount" value ="${pageMaker.cri.amount }">
				
                <!--모임 명-->
                <div class="form-group">
                    <label class="col-md-2 control-label" for="teamName"><strong>모임 명</strong></label>
                    <div class="col-md-10">
                        	${view.teamName}
                    </div>
                </div>
                <!--모임 생성일-->
                <div class="form-group">
                    <label class="col-md-2 control-label" for="teamRegdate"><strong>모임 생성일</strong></label>
                    <div class="col-md-10">
							<fmt:formatDate value="${view.teamRegdate}" pattern="yyyy년 MM월 dd일"/>
                    </div>
                </div>
                <!-- 모임 짧은 소개글-->
                <div class="form-group">
                    <label class="col-md-2 control-label" for="teamShortContent"><strong>모임 짧은 소개글</strong></label>
                    <div class="col-md-10">
                        ${view.teamShortContent}
                    </div>
                </div>
                <!-- 모임 소개글-->
                <div class="form-group">
                    <label class="col-md-2 control-label" for="teamContent"><strong>모임 소개글</strong></label>
                    <div class="col-md-10">
                        ${view.teamContent}
                    </div>
                </div>

                <!--모임의 관심사-->
                <div class="form-group">
                    <label class="col-md-2 control-label" for="intName"><strong>관심사</strong></label>
                    <div class="col-md-10">
						${view.intName }
                    </div>
                </div>
                
                <!--모임의 활동지역-->
                <div class="form-group">
                    <label class="col-md-2 control-label" for="memContent"><strong>활동지역</strong></label>
                    <div class="col-md-10">
                        	${view.areaRegionName}
                    </div>
                </div>
                
                <!--모임 생성자-->
                <div class="form-group">
                    <label class="col-md-2 control-label" for="memContent"><strong>모임 생성자명</strong></label>
                    <div class="col-md-10">
                        	${view.memNickName}
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
<!-- modal for delete -->	
	<div class="modal" id="modalDelete" tabindex="-1"  style="display: none;">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <!--Modal header-->
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal"><i class="pci-cross pci-circle"></i></button>
	                <h4 class="modal-title">삭제</h4>
	            </div>
	            <!--Modal body-->
	            <div class="modal-body">
	                <p class="text-semibold text-main">삭제 하시겠습니까?</p>
	            </div>
	            <!--Modal footer-->
	            <div class="modal-footer">
	                <button data-dismiss="modal" class="btn btn-default" type="button">취소</button>
	               	<button id="modalDeleteSubmit" class="btn btn-warning" type="button">확인</button>
	            </div>
	        </div>
	    </div>
	</div>
<!-- //modal for delete -->
	<script>
		$(document).ready(function(){

			
			$('#edit').on('click',   formSubmit);	// 모임 수정
			
			$('#delete').on('click', function(){// 모임 삭제
				$('#modalDelete').modal('show');
			});

			$('#modalDeleteSubmit').on('click', formSubmit);
			
		});
		
		function formSubmit(){
			
			const id = $('#memId').val();
			const uri = '/admin/groups/';
			
			const action = $(this).attr('id');
			
			if(action === 'edit'){
				$('#teamForm').attr('method','get');
				$('#teamForm').attr('action',uri+'/'+id+'/'+action);
				$('#teamForm').submit();
			}else if(action ==='modalDeleteSubmit'){
				$('#teamForm').attr('method','post');
				$('#teamForm').attr('action',uri+'delete');
				$('#teamForm').submit();
			}
		}
	</script>

	 <%-- for modal --%>
	<c:if test="${ !empty loginVO }">
		<%@ include file="../../includes/modals.jsp" %>
	</c:if>
	<%-- for modal --%>
</body>
</html>