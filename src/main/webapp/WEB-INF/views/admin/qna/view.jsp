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
                    <h1 class="page-header text-overflow">QNA 관리</h1>
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
                <h3 class="panel-title">게시글 상세 보기</h3>
            </div>
            <form id="qnaForm" name="qnaForm" class="panel-body form-horizontal form-padding">
				<input type="hidden" id="postId" name="postId" value="${view.postId }" />
				<input type="hidden" name="type" value ="${pageMaker.cri.brdId }">
	        	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
				<input type="hidden" name="brdId" value ="${pageMaker.cri.brdId }">
				<input type="hidden" name="pageNum" value ="${pageMaker.cri.pageNum }">
				<input type="hidden" name="amount" value ="${pageMaker.cri.amount }">
				
                <!-- QNA 이름-->
                <div class="form-group">
                    <label class="col-md-2 control-label" for="postTitle"><strong>게시글 제목</strong></label>
                    <div class="col-md-10">
                        <p class="form-control-static">${view.postTitle}</p>
                    </div>
                </div>

                <!--QNA 내용-->
                <div class="form-group">
                    <label class="col-md-2 control-label" for="postContent"><strong>게시글 내용</strong></label>
                    <div class="col-md-10">

                        	${view.postContent}
                    </div>
                </div>

    

<!--                         <small class="help-block">Please enter password</small> -->
           		<div class="row pull-right mar-top">
                	<button type="button" id="edit" class="btn btn-success"> 수정</button>
                	<button type="button" id="delete" class="btn btn-danger"> 삭제</button>
                </div>
    
            </form>
            </div>

            <!--===================================================-->
            <!-- END BASIC FORM ELEMENTS -->


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

			
			$('#edit').on('click',   formSubmit);
			$('#delete').on('click', formSubmit);
			
		});
		
		function formSubmit(){
			
			const id = $('#postId').val();
			const uri = '/admin/qna/'
			
			const action = $(this).attr('id');
			
			if(action === 'edit'){
				$('#qnaForm').attr('method','get');
				$('#qnaForm').attr('action',uri+action+'/'+id);
				$('#qnaForm').submit();
			}else if(action ==='delete'){
				$('#qnaForm').attr('method','post');
				$('#qnaForm').attr('action',uri+action);
				$('#qnaForm').submit();
			}
		}
	</script>

</body>
</html>