<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인 페이지</title>
	<script
  src="https://code.jquery.com/jquery-3.4.1.js"  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="  crossorigin="anonymous"></script>
</head>
<body>
	<h2>로그인페이지</h2>
	
	<h3 style="color:red;">${msg}</h3>
	
	<form id="loginForm" action="loginAction" method="post">
		아이디 : <input type="text" id="id" name="id" placeholder="아이디 입력" /> <br>
		패스워드 : <input type="password" id="pwd" name="pwd" placeholder="비밀번호" /> <br>
	</form>
	<a href="javascript:void(0)" onclick="checkValue();" >로그인</a>
	<a href="joinPage"  >회원가입</a>
	<a href="findpwd"  >비밀번호 찾기</a> 
</body>
</html>

<script>

// 유효성 검사 이후 전송
function checkValue(){

	var id = document.getElementById("id");
	var pwd = document.getElementById("pwd");
	
	//alert(id.value);	
	
	if(id == null || id == ""){
		alert("id를 입력하세요");
		return;
	}
	if(pwd == null || pwd == ""){
		alert("패스워드를 입력하세요");
		return;
	}
	
	var form = document.getElementById("loginForm");
	form.submit();
	
}

</script>