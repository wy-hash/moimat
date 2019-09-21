<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- <!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 가입 페이지</title>
	<script
  src="https://code.jquery.com/jquery-3.4.1.js"  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="  crossorigin="anonymous"></script>
</head>
<body>
	<h2>joinPage</h2>
	<form id="joinAction" action="" method="post">
		아이디       : <input type="text"	 	id="id" 			name="id" 			onkeydown="fn_press_han(this);" placeholder="아이디 입력" /> <br>
		패스워드    : <input type="password"	id="pwd" 			name="password" 	placeholder="비밀번호" /> <br>
		닉네임       : <input type="text" 		id="name" 			name="name" 		placeholder="" /> <br>
		생년월일    : <input type="date" 		id="birthday" 		name="birthday" 	placeholder="" /> <br>
		성별          : <select id="gender" name="gender"> 
					<option value="">성별선택</option> 
					<option value="M">남자</option> 
					<option value="W">여자</option>
				  </select> <br>
				
		이메일       : <input type="text" 		id="emailId" 		placeholder="" />
				@ <input type="text" 		id="emailDomain" 	placeholder="" />
				  <input type="hidden" 		id="email" 			name="email"/> <br>
		지역          : <input type="text" id="area1" /> - <input type="text" id="area2" /> -<input type="text" id="area3" />
		          <input type="hidden" id="area" name="area" value="테스트지역"/> <br> 
		관심사       : <select id="interest" name="interest">
					
				  </select>
				  <br>
		핸드폰번호 : <input type="text" id="phone1" /> - <input type="text" id="phone2" /> -<input type="text" id="phone3" /> 
		<input type="hidden" id="phone_number" name="phone_number"/> <br>
	</form>
	<a href="javascript:void(0);" onclick="valueCheck();">전송</a>
	

</body>
</html> -->

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
									<form
										action="http://www.themeon.net/nifty/v2.5/pages-login.html">
										<div class="row">
											<div class="col-sm-6">
												<div class="form-group">
													<input type="text" 		class="form-control" 	id="emaiId" 		placeholder="aaa.com" style="display:inline;width:46%;"/>
												  @ <input type="text" 		class="form-control" 	id="emailDomain" 	placeholder="aaa.com" style="display:inline;width:46%;"/>
												    <input type="hidden" 	id="email" 				style="display:inline;width:46%;"/>
												</div>
											</div>
											<div class="col-sm-6">
												<div class="form-group">
													<input	type="text" class="form-control" 	id="emailCod" 		placeholder="인증코드입력" style="display:inline;width:58%;"/>
													<button class="btn btn-primary btn-block" 	type="void(0);" 	style="display:inline;width:40%;">이메일인증</button>
													 <input type="hidden" 	id="checkEmail;" 				style="display:inline;width:46%;"/>
												</div>
											</div>
											<div class="col-sm-6">
												<div class="form-group">
													<input type="text" class="form-control" placeholder="Pwd" name="pwd">
												</div>
											</div>
											<div class="col-sm-6">
												<div class="form-group">
													<input type="text" class="form-control" placeholder="Name"	name="name">
												</div>
											</div>
											<div class="col-sm-6">
												<div class="form-group">
													<input type="password" class="form-control"	placeholder="Birthday" name="birthday">
												</div>
											</div>
											<div class="col-sm-6">
												<div class="form-group">
													<select id="gender" name="gender" class="form-control">
														<option value="">성별선택</option>
														<option value="M">남자</option>
														<option value="W">여자</option>
													</select>
												</div>
											</div>
											<div class="col-sm-6">
												<div class="form-group">
													<input type="text" class="form-control" placeholder="Area"	name="area">
												</div>
											</div>
											<div class="col-sm-6">
												<div class="form-group">
													<input type="password" class="form-control"
														placeholder="Interest" name="interest">
												</div>
											</div>
											<!-- <div class="col-sm-6">
												<div class="form-group">
													<input style="display: inline; width: 30%;" type="text"
														class="form-control" placeholder="phone1" name="phone1">
													- <input style="display: inline; width: 30%;" type="text"
														class="form-control" placeholder="phone2" name="phone2">
													- <input style="display: inline; width: 30%;" type="text"
														class="form-control" placeholder="phone3" name="phone3">
													<input type="hidden" id="phone_number" name="phone_number" />
												</div>
											</div> -->
										</div>
										<div class="checkbox pad-btm text-left">
											<input id="demo-form-checkbox" class="magic-checkbox"
												type="checkbox"> <label for="demo-form-checkbox">I
												agree with the <a href="#" class="btn-link">Terms and
													Conditions</a>
											</label>
										</div>
										<button class="btn btn-primary btn-block" type="submit">회원	가입</button>
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
   
// 여기서 관심사 정보 갖고올거임
   $(document).ready(function(){
   	requestCode();
   	checkId();
   });

   //이메일 중복체크
   function checkMail(){
   	$('#emailId').focusout(function() {
   		 
   		// id 공백체크 모듈
   		if ($('#email').val() == null || $('#id').val() == '') {
   			alert('아이디 항목을 확인해주세요');
   			//$('#id').focus();
   			return;
   		}

   		//id 길이체크
   		if ($('#id').val().length < 5 || $('#id').val().length > 15) {
   			alert('아이디는 최소 5자이상 15자 미만입니다');
   			//$('#id').focus();
   			return;
   		}
   		
   		// 위의 검증이 완료되면 중복체크
   		
   		$.ajax({
   			type : "POST",
   			url : "/reg/checkId",
   			data: $("#id").serialize(),
   			dataType : "json",
   			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
   			async : false,
   			success : function(data, status, xhr) {
   				console.log(data);
   				$('#idMsg').text(data.checkMsg);
   			},
   			error : function(jqXHR, textStatus, errorThrown) {
   				alert(jqXHR.responseText);
   			}
   		});

   	});
   }

   // 관심사 정보를 갖고오는 함수 
   function requestCode(){

   	$.ajax({
   			type : "POST",
   			url : "codeList",
   			dataType : "json",
   			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
   			async : false,
   			success : function(data, status, xhr) {

   				console.log(data);
   				let codeList = data.codeList;
   				for (let i = 0; i < codeList.length; i++) {
   					$('#interest').append("<option value='"+codeList[i].key+"'>"+ codeList[i].value + "</option>");
   				}

   			},
   			// 에러 발생시 여길로 떨어짐
   			error : function(jqXHR, textStatus, errorThrown) {
   				alert("코드리스트르 가져올수 없습니다 관리자에게 문의하세요");
   			}
   		});

   	}

   	// 나중에 ... 기능추가 한글입력방지
   	function fn_press_han(obj) {

   		//좌우 방향키, 백스페이스, 딜리트, 탭키에 대한 예외
   		if (event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37
   				|| event.keyCode == 39 || event.keyCode == 46)
   			return;
   		//obj.value = obj.value.replace(/[\a-zㄱ-ㅎㅏ-ㅣ가-힣]/g, '');
   		obj.value = obj.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, '');
   	}

   	function valueCheck() {

   		// 한글검증 추가 (추후에...)

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

   		//birthday 빈칸 방지
   		if ($('#birthday').val() == null || $('#birthday').val() == '') {
   			alert('생일 항목을 확인해주세요');
   			$('#birthday').focus();
   			return;
   		}

   		//gender 빈칸방지
   		if ($('#gender').val() == null || $('#gender').val() == '') {
   			alert('gender 항목을 확인해주세요');
   			$('#gender').focus();
   			return;
   		}

   		//emailId 빈칸 검증
   		if ($('#emailId').val() == null || $('#emailId').val() == '') {
   			alert('이메일 아이디 항목을 확인해주세요');
   			$('#emailId').focus();
   			return;
   		}

   		//emailId 길이 검증
   		if ($('#emailId').val().length < 5 || $('#emailId').val().length > 15) {
   			alert('이메일 아이디는 최소 8자이상 15자 미만입니다');
   			$('#emailId').focus();
   			return;
   		}

   		//emailDomain 빈간 검증
   		if ($('#emailDomain').val() == null || $('#emailDomain').val() == '') {
   			alert('이메일 도메인 항목을 확인해주세요');
   			$('#emailDomain').focus();
   			return;
   		}

   		//emailId + '@' + emailDomain 합쳐서  email hidden 태그에 넣기
   		var str = ''; // 임시로 받는 변수
   		str += $('#emailId').val() + '@' + $('#emailDomain').val();
   		$('#email').val(str)

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

   		/*
   		//지역1 빈칸 검증
   		if ($('#area1').val() == null || $('#area1').val() == '') {
   			alert('지역1 빈칸 확인해주세요');
   			$('#area1').focus();
   			return;
   		}

   		//지역2 빈칸 검증
   		if ($('#area2').val() == null || $('#area2').val() == '') {
   			alert('지역2 빈칸 확인해주세요');
   			$('#area2').focus();
   			return;
   		}

   		//지역3 빈칸 검증
   		if ($('#area3').val() == null || $('#area3').val() == '') {
   			alert('지역3 빈칸 확인해주세요');
   			$('#area3').focus();
   			return;
   		}

   		//지역1 길이체크
   		if ($('#area1').val().length < 2 || $('#area1').val().length > 5) {
   			alert('지역1 길이체크 최소 2자이상 5자 미만입니다');
   			$('#area1').focus();
   			return;
   		}

   		//지역2 길이체크
   		if ($('#area2').val().length < 2 || $('#area2').val().length > 5) {
   			alert('지역2 길이체크 최소 2자이상 5자 미만입니다');
   			$('#area2').focus();
   			return;
   		}

   		//지역3 길이체크
   		if ($('#area3').val().length < 2 || $('#area3').val().length > 5) {
   			alert('지역3 길이체크 최소 2자이상 5자 미만입니다');
   			$('#area3').focus();
   			return;
   		}
   		
   		*/

   		//관심사 빈칸 검증
   		if ($('#interest').val() == null || $("#interest").val() == '') {
   			alert('interest 항목을 확인해주세요');
   			$('#interest').focus();
   			return;
   		}
		/*
   		//phone1 빈칸 검증
   		if ($('#phone1').val() == null || $('#phone1').val() == '') {
   			alert('핸드폰번호1 빈칸 확인해주세요');
   			$('#phone1').focus();
   			return;
   		}

   		//phone2 빈칸 검증
   		if ($('#phone2').val() == null || $('#phone2').val() == '') {
   			alert('핸드폰번호2 빈칸 확인해주세요');
   			$('#phone2').focus();
   			return;
   		}
   		//phone3 빈칸 검증
   		if ($('#phone3').val() == null || $('#phone3').val() == '') {
   			alert('핸드폰번호3 빈칸 확인해주세요');
   			$('#phone3').focus();
   			return;
   		}
   		
   		// 길이체크 만들어 ... 욕심나면 숫자만
   		
   		// 폰번호1,2,3 합치기
   		$('#phone_number').val($('#phon1').val()+$('#phon2').val()+$('#phon3').val());
	*/
   	}
</script>
</body>
</html>


