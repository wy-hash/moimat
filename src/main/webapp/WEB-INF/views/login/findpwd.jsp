<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<!-- HEAD -->
<%@ include file="../includes/head.jsp"%>
<title>비밀번호 찾기</title>
</head>
<!-- END HEAD -->

<body>
	<!--TIPS-->
	<!--You may remove all ID or Class names which contain "demo-", they are only used for demonstration. -->
	<div id="container" class="effect aside-float aside-bright mainnav-lg">

		<!-- HEADER-NAVBAR -->
		<%@ include file="../includes/header-navbar.jsp"%>
		<!-- END NAVBAR -->

		<!-- BOXED -->
		<div class="boxed">

			<!-- MAIN-NAV -->
			<%@ include file="../includes/main-nav.jsp"%>
			<!-- END MAIN-NAV -->

			<!-- ASIDE -->
			<%-- <%@ include file="includes/aside.jsp" %> --%>
			<!-- END ASIDE -->



			<!--CONTENT CONTAINER-->
			<!--===================================================-->
			<div id="content-container">

				<!--Page Title-->
				<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
				<div id="page-title">
					<h1 class="page-header text-overflow">Find Password</h1>
				</div>
				<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
				<!--End page title-->

				<!--Page content-->
				<!--===================================================-->
				<div id="page-content">
					<!-- BACKGROUND IMAGE -->
					<!--===================================================-->
					<div id="bg-overlay"></div>


					<!-- PASSWORD RESETTING FORM -->
					<!--===================================================-->
					<div class="cls-content">
						<div class="cls-content-sm panel">
							<div class="panel-body">
								<div class="pad-ver">
									<i class="pli-mail icon-3x"></i>
								</div>
								<p class="text-muted pad-btm">Enter your email address to
									recover your password.</p>
								<form
									action="http://www.themeon.net/nifty/v2.5/pages-login.html">
									<div class="form-group">
										<input type="email" id="email" name="memEmail" class="form-control" placeholder="Email">
										<input type="text" id="certCode" name="certCode" class="form-control" placeholder="인증코드입력" >
									</div>
									<div class="form-group text-right">
										<button class="btn btn-success btn-block" id="resetButton" type="button" onclick="checkAndSubmit();">Reset Password</button>
									</div>
								</form>
								<div class="pad-top">
									<a href="login" class="btn-link mar-rgt">Back to Login</a>
								</div>
							</div>
						</div>
					</div>
					<!--===================================================-->

					<!--===================================================-->
					<!--End page content-->


				</div>
				<!--===================================================-->
				<!--END CONTENT CONTAINER-->



			</div>
			<!-- END BOXED -->

			<!-- FOOTER -->
			<%@ include file="../includes/footer.jsp"%>
			<!-- END FOOTER -->

		</div>
		<!-- END CONTAINER -->
		
<script>

	$(document).ready(function(){
		
		$('#certCode').hide();
		
	});

	function checkAndSubmit(){
		
		let email = $('#email').val();
		
		// 2. 공백 체크
		if(email == null || email == '') {
			alert('이메일아이디 항목을 확인해주세요');
			$('#memEmail').focus();
			return;
		}
		// 3. 길이체크
		if(email.length < 8 || email.length > 30) {
			alert('아이디는 최소 8자이상 30자 미만입니다');
			$('#memEmail').focus();
			return;
		}
	
		var isEmail = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        
   	  	if (!isEmail.test(email)) {
          alert("이메일 주소 형식 다시 확인해주세요.");
          $('#email').focus();
          return;
      	}
   	  	
   	  // 메일 확인 후 인증번호 발송	
   	 $.ajax({
			type : "POST",
			url : "/auth/checkEmail",
			data: {memEmail:email},
			dataType : "json",
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			async : false,
			success : function(data, status, xhr) {
				console.log(data);
				alert(data.msg);
				
				if(data.msgCode == 1){
					$('#email').hide();
					$('#certCode').show();
					
					$('#resetButton').removeAttr("onclick");			// 온클릭 속성 삭제
   					$('#resetButton').attr('onclick',"checkCertCode();") 	// 새로운 온클릭 속성 부여
					   					
				}
										
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert(jqXHR.responseText);
			}
		}); 
   	  	
		
		
	}

	function checkCertCode(){
		let code = $('#certCode').val() 			 // 이메일 인증 코드
	   	
		// 인증코드 유효성 검사(오로직 숫자만)
	   	var regType1 = /^[0-9]{9}$/;
		
	   	if(!regType1.test(code)){
	   		alert("인증코드형식이 맞지않습니다(숫자만)")
	   		return;
	   	}
	   	
	   	alert(code);
	   	
	   	// 인증코드 검증
	   	$.ajax({
   			type : "POST",
   			url : "/auth/checkAuthCode",
   			data: {certCode:code},
   			dataType : "json",
   			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
   			async : false,
   			success : function(data, status, xhr) {
   				console.log(data);
   				alert(data.msg);
   				
   				if(data.msgCode == 1){// 인증이 성공한경우
   					// 인증코드 입력칸 닫아야됨
   					$('#certCode').attr("readOnly", true);
   					// 인증코드 버튼기능 제거
   					$('#resetButton').removeAttr("onclick");	
   				}
   				
   										
   			},
   			error : function(jqXHR, textStatus, errorThrown) {
   				alert(jqXHR.responseText);
   			}
   		}); 
		
		
		
	}

</script>
		
		
		
</body>
</html>