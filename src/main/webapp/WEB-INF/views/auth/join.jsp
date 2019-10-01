<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">

<!-- HEAD -->
<%@ include file="../includes/head.jsp"%>
<title>회원가입</title>
</head>
<!-- END HEAD -->
<body>
	<!--TIPS-->
	<!--You may remove all ID or Class names which contain "demo-", they are only used for demonstration. -->
	<div id="container" class="effect aside-float aside-bright mainnav-lg">

		<!-- HEADER-NAVBAR -->
		<!-- END NAVBAR -->

		<!-- BOXED -->
		<div class="boxed">

			<!-- MAIN-NAV -->
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
					<h1 class="page-header text-overflow">Page Template</h1>
				</div>
				<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
				<!--End page title-->

				<!--Page content-->
				<!--===================================================-->
				<div id="page-content">
					<div id="container" class="cls-container">
						<div id="bg-overlay"></div>
						<div class="cls-content">
							<div class="cls-content-lg panel">
								<div class="panel-body">
									<div class="mar-ver pad-btm">
										<h3 class="h4 mar-no">회원가입 페이지</h3>
										<p class="text-muted"></p>
									</div>
									<form id="regForm" action="/auth/join" method="post">
										<div class="row">
											<div class="col-sm-6">
												<div class="form-group">
													<input type="text" class="form-control" id="emailId" name= "memEmail"
														placeholder="emailId" style="display: inline; width: 46%;" />
													@ <input type="text" class="form-control" id="emailDomain"
														placeholder="aaa.com" style="display: inline; width: 46%;" />
													<input type="hidden" id="memEmail" name="memEmail"
														style="display: inline; width: 46%;" />
												</div>
											</div>
											<div class="col-sm-6">
												<div class="form-group">
													<input type="text" class="form-control" id="emailCode"
														placeholder="인증코드입력" style="display: inline; width: 58%;" />
													<button class="btn btn-primary btn-block" type="button" id="emailCheck"
													  onclick="checkEmail();" style="display: inline; width: 40%;">이메일인증</button>
													 <input type="checkBox" id="checkEmailBox" hidden
														style="display: inline; width: 46%;"  /> 
												</div>
											</div>
											<div class="col-sm-6">
												<div class="form-group">
													<input type="text" class="form-control" placeholder="Pwd" id="pwd"	name="memPassword">
												</div>
											</div>
											<div class="col-sm-6">
												<div class="form-group">
													<input type="text" class="form-control" placeholder="Name"	id="name" name="memNickname"  >
												</div>
											</div>
											<div class="col-sm-6">
												<div class="form-group">
													<input type="text" class="form-control"
														placeholder="Birthday" id="birthday" name="memBirthday">
												</div>
											</div>
											<div class="col-sm-6">
												<div class="form-group">
													<select id="gender" name="memGender" class="form-control">
														<option value="">성별선택</option>
														<option value="M">남자</option>
														<option value="F">여자</option>
													</select>
												</div>
											</div>
											<div class="col-sm-6">
												<div class="form-group">
													<input type="text" class="form-control"  id="area" name="memArea" placeholder="Area"
														>
												</div>
											</div>
 											<div class="col-sm-6">
												<div class="form-group">
													<select class="form-control" id="interest1"	name="memInt1" placeholder="Interest">
														<option value="" default>관심사1 선택</option>
													</select>
												</div>
											</div>

											<div class="col-sm-6">
												<div class="form-group">
													<select class="form-control" id="interest2"
														name="memInt2" placeholder="Interest">
														<option default>관심사2 선택</option>
													</select>
												</div>
											</div>
											
											<div class="col-sm-6">
												<div class="form-group">
													<select class="form-control" id="interest3"
														name="memInt3" placeholder="Interest">
														<option default>관심사3 선택</option>
													</select>
												</div>
											</div> 
											
										</div>
										<div class="checkbox pad-btm text-left">
											<input type="checkbox" id="demo-form-checkbox" class="magic-checkbox" > 
												<label for="demo-form-checkbox">I
													agree with the <a href="#" class="btn-link">Terms and Conditions</a>
											</label>
										</div>
										<button class="btn btn-primary btn-block" type="button" onclick="checkAndSubmit();">회원가입</button>
										<div class="checkbox pad-btm text-center">
											<h3 id="checkMsg"></h3>
										</div>
									</form>
								</div>
								<div class="pad-all">
									이미 가입되 있나요?<a href="pages-login.html" class="btn-link mar-rgt">로그인</a>

									<div class="media pad-top bord-top">
										<div class="pull-right">
											<a href="#" class="pad-rgt"><i
												class="demo-psi-facebook icon-lg text-primary"></i></a> <a
												href="#" class="pad-rgt"><i
												class="demo-psi-twitter icon-lg text-info"></i></a> <a href="#"
												class="pad-rgt"><i
												class="demo-psi-google-plus icon-lg text-danger"></i></a>
										</div>
										<div class="media-body text-left text-muted">Sign Up
											with</div>
									</div>
								</div>
							</div>
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
			<%@ include file="../includes/footer.jsp"%>
			<!-- END FOOTER -->

		</div>
		<!-- END CONTAINER -->
		
<script>
   
	//여기서 관심사 정보 갖고올거임
   $(document).ready(function(){
   		requestCode();
  
   });
	


   //이메일 중복체크
   function checkEmail(){
      	
	   	let emailId = $('#emailId').val();
		//정규식...  han => 한글입력 패턴
       	var isHan = /[ㄱ-ㅎ가-힣]/g;
     
	   
   		// 이메일 id 공백 체크!
   		if (emailId == null || emailId == '') {
   			alert('이메일 id 항목을 확인해주세요');
   			$('#emaiId').focus();
   			return;
   		}

   		//이메일 id 길이체크
   		if ( (emailId.length < 5) || (emailId.length >= 15)) {
   			alert('이메일 id는 최소 5자이상 15자 미만입니다');
   			$('#emaiId').focus();
   			return;
   		}
   		// 이메일 id 한글체크
        if (isHan.test(emailId)) {
            alert("이메일 주소를 다시 확인해주세요.");
            return;
        }
    	
   		let emailDomain = $('#emailDomain').val();
   		
     // 이메일 도메인 공백 체크!
   		if (emailDomain == null || emailDomain == '') {
   			alert('이메일 도메인 항목을 확인해주세요');
   			$('#emailDomain').focus();
   			return;
   		}
      //이메일 도메인 길이체크
   		if ((emailDomain.length < 8) || (emailDomain.length >= 15)) {
   			alert('이메일 도메인 최소 8자이상 15자 미만입니다');
   			$('#emailDomain').focus();
   			return;
   		}
   		// 이메일 도메인 한글체크
        if (isHan.test(emailDomain)) {
            alert("이메일 주소를 다시 확인해주세요.");
            return;
        }
   		
   		//검증된 id와 도메인을 이메일 주소형식으로 생성
   		let email = emailId + '@'+emailDomain;
   		
   		//정규식...isEmail=>email형식이 맞는지 확인
   		var isEmail = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
   		
   	  	if (!isEmail.test(email)) {
          alert("이메일 주소 형식 다시 확인해주세요.");
          return;
      	}
   		
   		// 위의 검증이 완료되면 중복체크
   		$.ajax({
   			type : "POST",
   			url : "/auth/checkEmailJoin",
   			data: {email:email},
   			dataType : "json",
   			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
   			async : false,
   			success : function(data, status, xhr) {
   				console.log(data);
   				alert(data.msg);
   				
   				if(data.msgCode == 1){
   					
   					$('#emailCheck').html('인증코드확인');             // 버튼이름 변경(색상 변경하기)
   					$('#emailCheck').removeAttr("onclick");			// 온클릭 속성 삭제
   					$('#emailCheck').attr('onclick',"checkCode();") // 새로운 온클릭 속성 부여
   				 	$("#emailId").attr("readonly",true);			// 이메일 아이디 readOnly
   					$("#emailDomain").attr("readonly",true);		// 이메일 도메인 readOnly
   					
   				}
   										
   			},
   			error : function(jqXHR, textStatus, errorThrown) {
   				alert(jqXHR.responseText);
   			}
   		}); 
   	
   }
   
   function checkCode(){	// 인증코드 입력확인
	   	let code = $('#emailCode').val() 								// 이메일 인증 코드
	   	let email = $('#emailId').val() + '@' + $('#emailDomain').val(); //이메일 주소갖고온다
	   
	   	// 인증코드 유효성 검사(오로직 숫자만)
	   	var regType1 = /^[0-9]{9}$/;
		
	   	if(!regType1.test(code)){
	   		alert("인증코드형식이 맞지않습니다(숫자만)")
	   		return;
	   	}
	   	
	   	// 인증코드 검증
	   	$.ajax({
   			type : "POST",
   			url : "/auth/checkAuthCodeJoin",
   			data: {certCode:code, certEmail:email },
   			dataType : "json",
   			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
   			async : false,
   			success : function(data, status, xhr) {
   				console.log(data);
   				alert(data.msg);
   				
   				if(data.msgCode == 1){// 인증이 성공한경우
   					// 인증코드 입력칸 닫아야됨
   					$('#emailCode').attr("readOnly", true);
   					// 인증코드 버튼기능 제거
   					$('#emailCheck').removeAttr("onclick");	
   					// 히든필드 인증체크 확인
   					$("#checkEmailBox").attr("checked", true);
   					// 히든필드에 메일 삽입
   					$('#memEmail').val(email);
   				}
   				
   										
   			},
   			error : function(jqXHR, textStatus, errorThrown) {
   				alert(jqXHR.responseText);
   			}
   		}); 
	   	
		
	   	
				   
   }

   // 관심사 정보를 갖고오는 함수 
   function requestCode(){

   	$.ajax({
   			type : "POST",
   			url : "/auth/codeList",
   			dataType : "json",
   			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
   			async : false,
   			success : function(data, status, xhr) {

   				console.log(data);
   				let codeList = data.codeList;
   				let option = "";
   				
   				for (let i = 0; i < codeList.length; i++) {
   					option += "<option value='"+codeList[i].intId+"'>"+ codeList[i].intName + "</option>"					
   				}
   				
   				$('#interest1').append(option);
   				$('#interest2').append(option);
   				$('#interest3').append(option);

   			},
   			// 에러 발생시 여길로 떨어짐
   			error : function(jqXHR, textStatus, errorThrown) {
   				alert("codeList를 가져올수 없습니다. 관리자에게 문의하세요");
   			}
   		});

   	}

   	// 최종 유효성 검사후 전송기능 함수
   	function checkAndSubmit() {
   		   		  		
   		//emailId + '@' + emailDomain 합쳐서  email hidden 태그에 넣기
   		var str = ''; // 임시로 받는 변수
   		str += $('#emailId').val() + '@' + $('#emailDomain').val();
   		$('#email').val(str)

   		//인증코드 
   		if($("#checkEmailBox").is(":checked") != true){
   			alert("이메일 인증을 확인하세요");
   			return;
   		}
   		
   		//pwd 빈칸
   		if ($('#pwd').val() == null || $('#pwd').val() == '') {
   			alert('패스워드 항목을 확인해주세요');
   			$('#pwd').focus();
   			return;
   		}

   		//pwd길이체크
   		if ($('#pwd').val().length < 8 || $('#pwd').val().length > 15) {
   			alert('비밀번호 최소 8자이상 15자 미만입니다');
   			$('#pwd').focus();
   			return;
   		}

   		//PWD연속성 금지(추후에...)
   		//PWD중복 숫자 금지(추후에...)

   		//name 빈칸 방지
   		if ($('#name').val() == null || $('#name').val() == '') {
   			alert('이름 항목을 확인해주세요');
   			$('#name').focus();
   			return;
   		}

   		//name 길이 제한
   		if ($('#name').val().length <= 2 || $('#name').val().length > 8) {
   			alert('이름 최소 2자이상 8자 미만입니다');
   			$('#name').focus();
   			return;
   		}
   		
   		// name 특수문자 필터링

   		//birthday 빈칸 방지
   		if ($('#birthday').val() == null || $('#birthday').val() == '') {
   			alert('생일 항목을 확인해주세요');
   			$('#birthday').focus();
   			return;
   		}
   		
   		// 생일 유효성 검사(오로직 숫자만)
	   	var regType1 = /^[0-9]{8}$/; //{8} :8자리
	   	
	 	if(!regType1.test($('#birthday').val())){
	   		alert("생일 형식이 맞지않습니다(숫자만)")
	   		return;
	   	}
		
   		//gender 빈칸방지
   		if ($('#gender').val() == null || $('#gender').val() == '') {
   			alert('gender 항목을 확인해주세요');
   			$('#gender').focus();
   			return;
   		}

   		// 이름 체크
   		if ($('#name').val() == null || $('#name').val() == '') {
   			alert('이름 항목을 확인해주세요');
   			$('#name').focus();
   			return;
   		}
   		if ($('#name').val() == null || $('#name').val() == '') {
   			alert('이름 항목을 확인해주세요');
   			$('#name').focus();
   			return;
   		}
   		
   		// 지역 빈칸 검증
   		if ($('#area').val() == null || $('#area').val() == '') {
   			alert('지역 빈칸 확인해주세요');
   			$('#area').focus();
   			return;
   		}

   		// 지역 길이체크
   		if ($('#area').val().length < 2 || $('#area').val().length > 5) {
   			alert('지역 길이체크 최소 2자이상 5자 미만입니다');
   			$('#area').focus();
   			return;
   		}

   		//관심사1 빈칸 검증
   		if ($('#interest1').val() == null || $("#interest1").val() == '') {
   			alert('interest 항목을 확인해주세요');
   			$('#interest1').focus();
   			return;
   		}
   		
   		if($("#demo-form-checkbox").is(":checked") != true){
   			alert("가입동의에 체크해주세요");
   			return;
   		}
		
   		// 최종적으로 submit()
   		if(confirm("가입하시겠습니까?")){
   			$('#regForm').submit()   			
   			
   		}		
		
   	}
</script>
</body>
</html>


