<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 페이지</title>

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
   <!--Magic Checkbox [ OPTIONAL ]-->
    <link href="/resources/plugins/magic-check/css/magic-check.min.css" rel="stylesheet">
     <!--JAVASCRIPT-->
    <!--=================================================-->
    <!--Pace - Page Load Progress Par [OPTIONAL]-->
    <link href="/resources/plugins/pace/pace.min.css" rel="stylesheet">
    <script src="/resources/plugins/pace/pace.min.js"></script>
    <!--jQuery [ REQUIRED ]-->
    <script src="/resources/js/jquery-2.2.4.min.js"></script>
    <!--BootstrapJS [ RECOMMENDED ]-->
    <script src="/resources/js/bootstrap.min.js"></script>
    <!--NiftyJS [ RECOMMENDED ]-->
    <script src="/resources/js/nifty.min.js"></script>
    <!--Background Image [ DEMONSTRATION ]-->
    <script src="/resources/js/demo/bg-images.js"></script>
      

</head>
<body>
	<div id="container" class="cls-container">
		<div id="bg-overlay"></div>
		<div class="cls-content">
		    <div class="cls-content-sm panel">
		        <div class="panel-body">
		            <div class="mar-ver pad-btm">
		                <h3 class="h4 mar-no">Account Login</h3>
		                <p class="text-muted">Sign In to your account</p>
		            </div>
		            <form id="loginForm" action="auth/login" method="post">
		                <div class="form-group">
		                    <input type="text" id="id" name="id" class="form-control" placeholder="아이디 입력" autofocus>
		                </div>
		                <div class="form-group">
		                    <input type="password" id="pwd" name="pwd" class="form-control" placeholder="패스워드 입력">
		                </div>
		                <div class="checkbox pad-btm text-left">
		                    <input id="demo-form-checkbox" class="magic-checkbox" type="checkbox">
		                    <label for="demo-form-checkbox">Remember me</label>
		                </div>
		                <button class="btn btn-primary btn-lg btn-block" onclick="checkValue();" >Sign In</button>
		            </form>
		        </div>
		
		        <div class="pad-all">
		            <a href="findpwd" class="btn-link mar-rgt">비밀번호 찾기</a>
		            <a href="joinPage" class="btn-link mar-lft">회원가입</a>
		
		            <div class="media pad-top bord-top">
		                <div class="pull-right">
		                    <a href="#" class="pad-rgt"><i class="demo-psi-facebook icon-lg text-primary"></i></a>
		                    <a href="#" class="pad-rgt"><i class="demo-psi-twitter icon-lg text-info"></i></a>
		                    <a href="#" class="pad-rgt"><i class="demo-psi-google-plus icon-lg text-danger"></i></a>
		                </div>
		                <div class="media-body text-left">
		                    Login with
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
	</div>
</body>
</html>
