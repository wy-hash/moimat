<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <!--STYLESHEET-->
    <!--=================================================-->

    <!--Open Sans Font [ OPTIONAL ]-->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700' rel='stylesheet' type='text/css'>


    <!--Bootstrap Stylesheet [ REQUIRED ]-->
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">


    <!--Nifty Stylesheet [ REQUIRED ]-->
    <link href="/resources/css/nifty.min.css" rel="stylesheet">


    <!--Nifty Premium Icon [ DEMONSTRATION ]-->
    <link href="/resources/css/demo/nifty-demo-icons.min.css" rel="stylesheet">


        
    <!--Demo [ DEMONSTRATION ]-->
    <link href="/resources/css/demo/nifty-demo.min.css" rel="stylesheet">

    
    <!--JAVASCRIPT-->
    <!--=================================================-->

    <!--jQuery [ REQUIRED ]-->
    <script src="/resources/js/jquery-2.2.4.min.js"></script>


    <!--BootstrapJS [ RECOMMENDED ]-->
    <script src="/resources/js/bootstrap.min.js"></script>


    <!--NiftyJS [ RECOMMENDED ]-->
    <script src="/resources/js/nifty.min.js"></script>


    <!--=================================================-->
</head>
<body>
	<div id="container" class="cls-container">
		
		<!-- BACKGROUND IMAGE -->
		<!--===================================================-->
		<div id="bg-overlay"></div>
		
		<!-- LOCK SCREEN -->
		<!--===================================================-->
		<div class="cls-content">
		    <div class="cls-content-sm panel">
		        <div class="panel-body">
		            <div class="mar-ver pad-btm">
		                <h3 class="h4 mar-no">${sessionScope.loginVO.memNickname }</h3>
		            </div>
		            <div class="pad-btm mar-btm">
		                <img alt="Profile Picture" class="img-lg img-circle img-border-light" src="${sessionScope.loginVO.memPhoto }">
		            </div>
		             <c:if test="${ ErrorMsg != null }">
		                <!-- Danger Alert -->
		                <div class="alert alert-danger">
		                    <strong>로그인 실패: </strong> ${ ErrorMsg }
		                </div>
		                <!-- //Danger Alert -->
	                </c:if>
	                <c:if test="${ ErrorMsg == null }">
		                <p>비밀번호를 입력해 주세요.</p>
	                </c:if>
		            <form action="/mypage/usercheck" method="Post">
		                <div class="form-group">
		                    <input type="password" name="memPassword" class="form-control" placeholder="Password">
		                </div>
		                <div class="form-group text-right">
		                    <button class="btn btn-block btn-success" type="submit">비밀번호 확인</button>
		                </div>
		            </form>
		             <div class="pad-ver">
		                <a href="/mypage" class="btn-link mar-rgt">돌아가기</a>
		            </div>
		        </div>
		    </div>
		</div>
		<!--===================================================-->
		
	</div>
	<!--===================================================-->
	<!-- END OF CONTAINER -->
</body>
</html>