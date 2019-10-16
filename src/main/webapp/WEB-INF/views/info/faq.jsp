<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<!-- HEAD -->
<%@ include file="../includes/head.jsp" %>
	<title>Page Template | moim@</title>
</head>
<!-- END HEAD -->

<body>
	<!--TIPS-->
	<!--You may remove all ID or Class names which contain "demo-", they are only used for demonstration. -->
	<div id="container" class="effect aside-float aside-bright mainnav-lg">
	
		<!-- HEADER-NAVBAR -->
		<%@ include file="../includes/header-navbar.jsp" %>
		<!-- END NAVBAR -->
		
		<!-- BOXED -->
		<div class="boxed">
		
			<!-- MAIN-NAV -->
			<%@ include file="../includes/main-nav.jsp" %>
			<!-- END MAIN-NAV -->
			
			<!-- ASIDE -->
			<%-- <%@ include file="../includes/aside.jsp" %> --%>
			<!-- END ASIDE -->
			
			
					
           <!--CONTENT CONTAINER-->
            <!--===================================================-->
            <div id="content-container">
                
                <!--Page Title-->
                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                <div id="page-title">
                    <h1 class="page-header text-overflow">F A Q</h1>
                </div>
                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                <!--End page title-->

                <!--Page content-->
                <!--===================================================-->
                <div id="page-content">
                	<!-- #################################### -->
                	<!-- #### WRITE CODE BELOW THIS LINE #### -->
            	    <!-- #################################### -->
          <p class="lead">회원님들이 자주 묻는 질문 들입니다.</p>
          <hr>
          <div class="panel panel-default">
            <div class="panel-heading mt-3">
              <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">▶ 모임은 누구나 가입할 수 있나요?</a>
              </h4>
            </div>
            <div id="collapse1" class="panel-collapse collapse">
              <div class="panel-body">
                	저희 웹 사이트의 모임은 <strong>누구나</strong> 만들고 가입 할 수 있습니다.
              </div>
            </div>
            <div class="panel-heading mt-3">
              <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">▶ 고객센터 전화번호가 궁금해요.</a>
              </h4>
            </div>
            <div id="collapse2" class="panel-collapse collapse" aria-expanded="false">
              <div class="panel-body">
                	고객센터의 전화번호는 <strong>02)000-0000</strong> 입니다.
              </div>
            </div>
            <div class="panel-heading mt-3">
              <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">▶ 한 번 지워진 게시물은 복구가 불가능한가요?</a>
              </h4>
            </div>
            <div id="collapse3" class="panel-collapse collapse">
              <div class="panel-body">
                	한 번 지워진 게시물은 복구가 <strong>불가능</strong> 합니다. 
              </div>
            </div>
            <div class="panel-heading mt-3">
              <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion" href="#collapse4">▶ 회원 정보 수정은 어디에서 할 수 있나요?</a>
              </h4>
            </div>
            <div id="collapse4" class="panel-collapse collapse">
              <div class="panel-body">
                	회원 정보는 좌측 메뉴에서 마이페이지 > 내 정보 페이지에서 수정하실 수 있습니다.
              </div>
            </div>
            <div class="panel-heading mt-3">
              <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion" href="#collapse5">▶ 고객센터의 영업시간은 언제인가요?</a>
              </h4>
            </div>
            <div id="collapse5" class="panel-collapse collapse">
              <div class="panel-body">
                	고객센터의 영업시간은 <strong>09:00 ~ 18:00</strong> 입니다.
              </div>
            </div>
          </div>
          <div class="alert alert-warning alert-dismissible mt-3" role="alert">
            	이외의 사항은 고객센터로 1대1 문의해주시면 친절히 답해드리겠습니다.
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
		<%@ include file="../includes/footer.jsp" %>
		<!-- END FOOTER -->
			
	</div>
	<!-- END CONTAINER -->
</body>
</html>