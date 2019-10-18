<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">

<!-- HEAD -->
<%@ include file="../includes/head.jsp"%>
<title>로그인 | moim@</title>
</head>
<!-- END HEAD -->
<body>
	<div id="container" class="cls-container">
		
		
		<!-- LOGIN FORM -->
		<!--===================================================-->
		<div class="cls-content">
		    <div class="cls-content-sm panel">
		        <div class="panel-body">
		            <div class="mar-ver pad-btm">
		                <h3 class="h4 mar-no">로그인</h3>
		                <p class="text-muted">등록하신 메일주소로 로그인하세요</p>
		            </div>
		            
		            <c:if test="${ loginErrorMsg != null }">
		                <!-- Danger Alert -->
		                <div class="alert alert-danger">
		                    <strong>로그인 실패: </strong> ${ loginErrorMsg }
		                </div>
		                <!-- //Danger Alert -->
	                </c:if>
	                
		            <form id="loginForm" action="login" method="post">
		                <div class="form-group">
		                    <input type="text" id="memEmail" name="memEmail" class="form-control" placeholder="이메일" autofocus>
		                </div>
		                <div class="form-group">
		                    <input type="password" id="memPassword" name="memPassword" class="form-control" placeholder="비밀번호" onkeypress="javascript:if(event.keyCode == 13) checkValue();">
		                </div>
		                <div class="checkbox pad-btm text-left">
		                    <input id="demo-form-checkbox" class="magic-checkbox" type="checkbox">
		                    <label for="demo-form-checkbox">아이디 기억하기</label>
		                </div>
		                <button class="btn btn-primary btn-lg btn-block" type="button" onclick="checkValue();">로그인</button>
		            </form>
		        </div>
		
		        <div class="pad-all">
		            <a href="/auth/findPwd" class="btn-link mar-rgt">비밀번호를 잊으셨나요?</a>
		            <a href="/auth/join" class="btn-link mar-lft">계정 만들기</a>
		
		        </div>
		    </div>
		</div>
		<!--===================================================-->
		
		
	</div>
	<!--===================================================-->
	<!-- END OF CONTAINER -->
	
	<script>
	
	$(document).ready(function(){
	    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
	    var key = getCookie("userInputId");
	    if(key != null && key != ""){
	    	$('#memEmail').val(key)
	    	$("#demo-form-checkbox").prop("checked", true); /* by ID */
	    }
	});
	
	// 유효성 체크후 전송
	function checkValue(){
		let id="";
		// id의 체크
		// 1. id필드의 값을 갖고온다
		let memEmail = $('#memEmail').val();
		
		// 2. 공백 체크
		if ($('#memEmail').val() == null || $('#memEmail').val() == '') {
			alert('아이디를 확인해주세요');
			$('#memEmail').focus();
			return false;
		}
		// 3. 길이체크
		if(memEmail.length < 8 || memEmail.length > 30) {
			alert('아이디는 8자 이상 30자 미만입니다');
			$('#memEmail').focus();
			return false;
		}
	
		// 4. 이메일 형식체크	
		//정규식...isEmail=>email형식이 맞는지 확인
   		var isEmail = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        
   	  	if (!isEmail.test(memEmail)) {
          alert("로그인은 이메일로 가능합니다. 아이디를 확인해주세요.");
          $('#memEmail').focus();
          return false;
      	}
   	  	
   	  	//비밀번호 체크
   	  	//1. 비밀번호 값을 가져온다
   	  	let memPassword = $('#memPassword').val();
   	  	
   	  	// 2. 공백 체크
		if ($('#memPassword').val() == null || $('#memPassword').val() == '') {
			alert('비밀번호를 확인해주세요');
			$('#memPassword').focus();
			return false;
		}
		// 3. 길이체크
		if(memPassword.length < 3 || memPassword.length > 15) {
			alert('비밀번호는 3자 이상 15자 미만입니다');
			$('#memPassword').focus();
			return false;
		}
		
		// 아이디 저장
		if($("#demo-form-checkbox").is(":checked")){
	        setCookie("userInputId", memEmail, 7); // 7일 동안 쿠키 보관
	    }else{
	    	deleteCookie("userInputId", "", 7); // 쿠키삭제
	    }
		
		// 전송
		$('#loginForm').submit();
	}
	
	// 쿠키 관련 (나중에 공통 js로 통합해서 쓸 예정)
	function setCookie(cookieName, value, exdays){
	    var exdate = new Date();
	    exdate.setDate(exdate.getDate() + exdays);
	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	    document.cookie = cookieName + "=" + cookieValue;
	}
	 
	function deleteCookie(cookieName){
	    var expireDate = new Date();
	    expireDate.setDate(expireDate.getDate() - 1);
	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	}
	 
	function getCookie(cookieName) {
	    cookieName = cookieName + '=';
	    var cookieData = document.cookie;
	    var start = cookieData.indexOf(cookieName);
	    var cookieValue = '';
	    if(start != -1){
	        start += cookieName.length;
	        var end = cookieData.indexOf(';', start);
	        if(end == -1)end = cookieData.length;
	        cookieValue = cookieData.substring(start, end);
	    }
	    return unescape(cookieValue);
	}
	
	</script>

</body>
</html>