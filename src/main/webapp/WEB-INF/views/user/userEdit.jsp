<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<!-- HEAD -->
<%@ include file="../includes/head.jsp"%>
<title>Page Template | moim@</title>
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
					<h1 class="page-header text-overflow">마이페이지</h1>
				</div>
				<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
				<!--End page title-->

				<!--Page content-->
				<!--===================================================-->
				<div id="page-content">
						<div class="row">
					    <div class="col-lg-6">
					        <div class="panel">
					            <div class="panel-heading">
					                <h3 class="panel-title">회원정보수정</h3>
					            </div>
					
					
					            <!-- BASIC FORM ELEMENTS -->
					            <!--===================================================-->
					            <form class="panel-body form-horizontal form-padding" action="/myPage/edit" method="post" enctype="multipart/form-data" id="userForm">
									 
									 <div class="form-group">
					                    <label class="col-md-3 control-label">사진</label>
					                    <div class="col-md-9">
					                    	<img src="https://picsum.photos/seed/picsum/200/200" alt="샘플사진" />
					                    	<input type="file" name="photoFile">
					                    </div>
					                </div>
					                
					                <!--Static-->
					                <div class="form-group">
					                    <label class="col-md-3 control-label">닉네임</label>
					                    <div class="col-md-9">
					                    	<input type="text" id="memNickname" name="memNickname" class="form-control" >
					                    </div>
					                </div>
					                
					                <!--Email Input-->
					                <div class="form-group">
					                    <label class="col-md-3 control-label" for="demo-email-input">이메일</label>
					                    <div class="col-md-9">
					                        <input type="email" id="memEmail" name="memEmail" class="form-control" readOnly>
					                    </div>
					                </div>
					
					                <!-- 현재 비밀번호 -->
					                <div class="form-group">
					                    <label class="col-md-3 control-label" for="demo-text-input">기존 비밀번호</label>
					                    <div class="col-md-9">
					                        <input type="password" id="memPassword" class="form-control" placeholder="Text" >
					                        <small class="help-block"></small>
					                    </div>
					                </div>
					                
					                 <!-- 신규 비밀번호 -->
					                <div class="form-group">
					                    <label class="col-md-3 control-label" for="demo-text-input">신규비밀 번호</label>
					                    <div class="col-md-9">
					                        <input type="password" id="newPassword" class="form-control" placeholder="Text" >
					                    </div>
					                </div>
					                
					                 <!-- 신규 비밀번호 확인 -->
					                <div class="form-group">
					                    <label class="col-md-3 control-label" for="demo-text-input">비밀번호 다시 입력확인</label>
					                    <div class="col-md-9">
					                        <input type="password" id="newPasswordCheck" class="form-control" placeholder="Text" >
					                        <small id="passMsg" class="help-block">This is a help text</small>
					                        <button class="btn btn-success" type="button" onclick="changePassword();">비밀번호 변경</button>
					                    </div>
					                </div>
					
					                <!--생일-->
					                <div class="form-group">
					                    <label class="col-md-3 control-label" for="demo-readonly-input">생일</label>
					                    <div class="col-md-9">
					                        <input type="text" id="memBirthday" name="memBirthday" class="form-control" placeholder="숫자 8자리 YYYYMMDD ex)19910215"  >
					                    </div>
					                </div>
									
					                <!-- 성별 -->
					             	<div class="form-group pad-ver">
					                    <label class="col-md-3 control-label">성별</label>
					                    <div class="col-md-9">
					                        <div>
					                            <input class="magic-radio" type="radio" name="memGender" value="M" id="mem">
					                            <label for="mem">남성</label>
					                        </div>
					                        <div>
					                            <input class="magic-radio" type="radio" name="memGender" value="W" id="women">
					                            <label for="women">여성</label>
					                        </div>
					                    </div>
					                </div>
									
									<!-- 지역 -->
					                <div class="form-group">
					                    <label class="col-md-3 control-label" for="demo-password-input">관심지역</label>
					                    <div class="col-md-9">
					                        <input type="text" id="memArea" name="memArea" class="form-control" >
					                    </div>
					                </div>
					                
					                <!-- 관심사1 -->
					             	<div class="form-group pad-ver" >
					                    <label class="col-md-3 control-label">관심사1</label>
					                    <div class="col-md-9">
					                       <div class="radio interest" id="interest1">
					                           
					                        </div>
					                    </div> 
					                </div>
					                
					                <!-- 관심사2 -->
					             	<div class="form-group pad-ver">
					                    <label class="col-md-3 control-label">관심사2</label>
					                    <div class="col-md-9">
					                        <div class="radio interest" id="interest2">
					                            
					                        </div>
					                    </div> 
					                </div>
									
									<!-- 관심사3 -->
					             	<div class="form-group pad-ver">
					                    <label class="col-md-3 control-label">관심사3</label>
					                    <div class="col-md-9">
					                        <div class="radio interest" id="interest3">
					                          
					                        </div>
					                    </div>
					                </div>
					                
					               <div class="panel-footer text-right">
					                    	<button class="btn btn-success" type="button" onclick="checkAndsubmit();">수정완료</button>
					               </div>
					            </form>
					            <!--===================================================-->
					            <!-- END BASIC FORM ELEMENTS -->
					
					
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

$(document).ready(function(){  //onload 함수
	// getInterest();
	 getMyInfo();
	
	 $('#newPassword').blur(newPasswordCheck);		// 이벤트등록 (신규비밀 번호)
	 $('#newPasswordCheck').blur(rePasswordCheck);	// 이벤트등록 (비밀번호 다시 입력확인)
});

function changePassword(){
	
	// 유효성 검사 : 신규비밀번호, 비밀번호 확인
	if(newPasswordCheck()){ return; }
	if(rePasswordCheck()){ return; }
	
	// 기존비밀번호 검사
	if(passwordCheck()){ return; }
	
	// 기존비밀번호 서버로 보내서 비밀번호가 맞는지 확인
	let memPassword = $('#memPassword').val();
	let memEmail = $('#memEmail').val()
	
	let url = '/user/checkPassword';
	let data = { memPassword : memPassword, 
				memEmail : memEmail   
				};
	let error= "에러가 발생하였습니다. 관리자에게 문의하세요"

	// ajax로 데이터 전송
	let resultData = callAjax(data, url, error)
	
	// 결과값 확인
	if(resultData.msgCode == 0){
		$('#passMsg').text("비밀번호가 다름니다.").css('color','red');
		return;
	}
	
	// 비밀번호 변경
	memPassword = $('#newPassword').val()
	url = '/user/changePassword';
	data = { memPassword : memPassword, 
				memEmail : memEmail   
		};
	
	// ajax로 데이터 전송 - 비밀번호 변경
	resultData = callAjax(data, url, error);
	
	// 결과값 확인
	alert(resultData.msg);
	
	// 기존 신규 다 비우기
	$('#memPassword').val('');
	$('#newPasswordCheck').val('');
	$('#newPassword').val('');

}

function checkAndsubmit(){
	// 정규식(길이,패턴) 체크 ~ 이것도 나중에
	// 1) 생일 유효성 체크(길이, 숫자만)
	
	// 전송
	if (confirm("회원정보를 수정하시겠습니까?")) {	$('#userForm').submit() }	
	
}

//기존 비밀번호 유효성 검사
function passwordCheck(){
	if(nul_chk($('#memPassword'),8,15)){
		$('#passMsg').text("기존 패스워드는 8자이상 15자 미만입니다").css('color','red');
		alert("dfu")
		return true;
	}else{
		$('#passMsg').text("").css('color','black');
	}
}

// 신규 패스워드 검사
function newPasswordCheck(){
	if(nul_chk($('#newPassword'), 8,15)){	// 빈문자,길이체크:  nul_chk("검사할 객체, 최소길이, 최대길이") 리턴 true and false
		$('#passMsg').text("신규 패스워드는 8자이상 15자 미만입니다").css('color','red');
		return true;
	}else{
		$('#passMsg').text("").css('color','black');
		return false;
	}
}

//신규 패스워드 확인 검사
function rePasswordCheck(){
	 let newPassword = $('#newPassword').val()
	 let rePassword = $('#newPasswordCheck').val()
	 
	 if(newPasswordCheck()){ return false; }
	 
	 if(newPassword != rePassword){
		 $('#passMsg').text("신규 비밀번호가 일치하지 않습니다.").css('color','red');
		 return true;
	 }else{
		 $('#passMsg').text("").css('color','black');
	 }
}

// 개인정보를 갖고와서 찍기
function getMyInfo(){
	
	let data = null;
	let url = "/user/selectUser";
	let error="에러가발생했습니다. 다시시작해 주세요";
	
	let resultData = callAjax(data, url, error);
	
	console.log(resultData);
	
	// 여기서 부터 화면에 찍는로직
	let user = resultData.user;	// user 정보만 갖고오고
	
	var array = new Array();	// arrayList생성 (키만 담을ㄹ고)
	for (var key in user) {
	      $('#'+key).val(user[key]);	
	      
	      if(key == "memGender"){
	    	  $('input:radio[name="memGender"][value="'+user[key]+'"]').prop('checked', true);
	      
	      }else if(key == "memInt1"){
	    	  $('input:radio[name="memInt1"][value="'+user[key]+'"]').prop('checked', true);
	    	  
	      }else if(key == "memInt2"){
	    	  $('input:radio[name="memInt2"][value="'+user[key]+'"]').prop('checked', true);
	    	  
	      }else if(key == "memInt3"){
	    	  $('input:radio[name="memInt3"][value="'+user[key]+'"]').prop('checked', true);
	      }
	}
}

// 관심사 코드를 갖고온다(문항 동적으로 생성)
function getInterest(){
	
	let data = null;
	let url = "/auth/codeList";
	let error="에러가발생했습니다. 다시시작해 주세요";
	
	let resultData = callAjax(data, url, error);
	let codeList = resultData.codeList
	let interests = $('.interest');
	
	for(let i=0; i<interests.length; i++){
		let str='';
		for(let j=0; j<codeList.length; j++){
			str += '<input  class="magic-radio" type="radio" name="memInt'+(i+1)+'" value="'+codeList[j].intId+'"'
					+'id="interest'+(i+1)+'_'+(j+1)+'"' +'checked>'
					+ '<label for="interest'+(i+1)+'_'+(j+1)+'">'+codeList[j].intName+'</label>';	
		}
		console.log(str);
		
		$('#interest'+(i+1)).append(str);
	}
	
}

//ajax 호출 코드
function callAjax(data, url, error) {

	let resultData = null;

	$.ajax({
		type : "POST",
		url : url,
		data : data,
		dataType : "json",
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		async : false,
		success : function(data, status, xhr) {
			console.log(data);
			resultData = data;
		},
		error : function(jqXHR, textStatus, errorThrown) {
			alert(error);
		}
	});

	return resultData
}

//문자 공백 없애기
function is_trim(str){
	var strValue = new String(str)
	return strValue.replace(/(^ +)|( +$)/g,'')
}

//널 또는 빈문자열 및 길이 체크
function nul_chk(obj, start,end){
	if(is_trim(obj.val()) == '' )
	{
		//obj.focus();
		return true;
	}else if(obj.val().length <start || obj.val().length > end ){
		//obj.focus();
		return true;
	}
	return false;
}



</script>	
	
	
</body>
</html>