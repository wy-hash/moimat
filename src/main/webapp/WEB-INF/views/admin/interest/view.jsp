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
                    <h1 class="page-header text-overflow">관심사 관리</h1>
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
                <h3 class="panel-title">관심사 코드 상세보기</h3>
            </div>

 
            <form id="interestForm" name="interestForm" class="panel-body form-horizontal form-padding" action="/admin/interest/delete" method="post">
				<input type="hidden" id="intId" name="intId" value="${view.intId }" />
                <!-- 관심사 코드-->
                <div class="form-group">
                    <label class="col-md-2 control-label" for="intKey"><strong>관심사 코드</strong></label>
                    <div class="col-md-10">
                        <p class="form-control-static">${view.intKey}</p>
                    </div>
                </div>

                <!--관심사 이름-->
                <div class="form-group">
                    <label class="col-md-2 control-label" for="intName"><strong>관심사 이름</strong></label>
                    <div class="col-md-10">
                        <p class="form-control-static">${view.intName}</p>
                    </div>
                </div>

                <!--관심사 정렬순서-->
                <div class="form-group">
                    <label class="col-md-2 control-label" for="intOrder"><strong>관심사 정렬순서</strong></label>
                    <div class="col-md-10">
                        <p class="form-control-static">${view.intOrder}</p>
                    </div>
                </div>

                <!--관심사 사용 여부-->
                <div class="form-group">
                    <label class="col-md-2 control-label" for="intUse"><strong>관심사 사용 여부</strong></label>
                    <div class="col-md-10">
                 <p class="form-control-static">
                 	<c:choose>
                 		<c:when test="${'Y' eq view.intUse }">
                 			사용
                 		</c:when>
          		        <c:when test="${'N' eq view.intUse }">
                 			미사용
                 		</c:when> 
                 	</c:choose>
                 </p>

<!--                         <small class="help-block">Please enter password</small> -->
                    </div>
                </div>
                <div class="row pull-right">
                	<button type="button" id="edit" class="btn btn-success  mt-20"> 수정</button>
                	<button type="button" id="delete" class="btn btn-danger  mt-20"> 삭제</button>
                </div>
            </form>
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
			
			let id = $('#intId').val();
			
			$('#delete').on('click', formSubmit);
			
			$('#edit').on('click', function(){
				let url = location.origin+'/admin/interest/edit/'+id;
				location.href = url;
			});
		});
		
		function formSubmit(){
			$('#interestForm').submit();
		}
	</script>

</body>
</html>