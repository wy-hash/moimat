<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="ko">

<!-- HEAD -->
<%@ include file="../includes/head.jsp"%>

<!--Dropzone [ OPTIONAL ]-->
<script src="/resources/plugins/dropzone/dropzone.min.js"></script>

 <!--Select2 [ OPTIONAL ]-->
 <link href="/resources/plugins/select2/css/select2.min.css" rel="stylesheet">

<!--Select2 [ OPTIONAL ]-->
<script src="/resources/plugins/select2/js/select2.min.js"></script>

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
								<div class="form-group">
	
								</div>
									<!--===================================================-->
										
									<!--  사진 -->
								<div class="panel-body form-horizontal form-padding" >	
									<div class="form-group">
										<label class="col-md-3 control-label">사진</label>
										<div class="col-md-9">
					                    	<img id="memPhoto" src="https://picsum.photos/seed/picsum/200/200" alt="샘플사진" />
					                    </div>
										<div class="bord-top pad-ver"
												style="border-top: none; text-align: left; padding: 6px 12px;">
												<!-- The fileinput-button span is used to style the file input field as button -->
												<span class="btn btn-success fileinput-button clickable">
													<i class="fa fa-plus"></i> <span>사진선택</span>
												</span>
										</div>
											<div id="previews"
												style="border-top: none; text-align: left; padding: 6px 12px;">
												<div id="template" class="pad-top bord-top">
													<div class="media">
														<div class="media-body">
															<!--This is used as the file preview template-->
															<div class="media-block">
																<div class="media-left">
																	<img class="img" data-dz-thumbnail>
																</div>
																
																
																<div class="media-body">
																	<p class="text-main text-bold mar-no text-overflow"	data-dz-name></p>
																	<span class="error text-danger text-sm"	data-dz-errormessage></span>
																	<p class="text-sm" data-dz-size></p>
																	
																	<!-- progress 바 -->
																	<div id="total-progress" style="opacity: 0">
																		<div class="progress progress-xs active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0">
																			<div class="progress-bar progress-bar-success"	style="width: 0%;" data-dz-uploadprogress></div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
														<!-- 버튼 -->
														<div class="media-right">
															<button class="btn btn-primary start" style="display:none" >
		          												<i class="glyphicon glyphicon-upload"></i>
		          												<span>Start</span>
		     												</button>
	     												</div> 
														<div class="media-right">
															<button data-dz-remove	class="btn btn-xs btn-danger cancel">
																<i class="demo-pli-cross"></i>
															</button>
														</div>
														<div class="media-right">
															<button data-dz-remove class="btn btn-danger delete"  style="display:none">
														        <i class="glyphicon glyphicon-trash"></i>
														        <span>Delete</span>
		      												</button>
	      												</div>
													</div>
										</div>
									</div>
									</div>
										<form class="panel-body form-horizontal form-padding"
										action="/mypage/edit" method="post"
										enctype="multipart/form-data" id="userForm">	
									
										<!--닉네임-->
										<div class="form-group">
											<label class="col-md-3 control-label">닉네임</label>
											<div class="col-md-9">
												<input type="text" id="memNickname" name="memNickname"
													class="form-control">
											</div>
										</div>

										<!--Email Input-->
										<div class="form-group">
											<label class="col-md-3 control-label" for="demo-email-input">이메일</label>
											<div class="col-md-9">
												<input type="email" id="memEmail" name="memEmail"
													class="form-control" readOnly>
											</div>
										</div>

										<!-- 현재 비밀번호 -->
										<div class="form-group">
											<label class="col-md-3 control-label" for="demo-text-input">기존
												비밀번호</label>
											<div class="col-md-9">
												<input type="password" id="memPassword" class="form-control"
													placeholder="Text"> <small class="help-block"></small>
											</div>
										</div>

										<!-- 신규 비밀번호 -->
										<div class="form-group">
											<label class="col-md-3 control-label" for="demo-text-input">신규비밀
												번호</label>
											<div class="col-md-9">
												<input type="password" id="newPassword" class="form-control"
													placeholder="Text">
											</div>
										</div>

										<!-- 신규 비밀번호 확인 -->
										<div class="form-group">
											<label class="col-md-3 control-label" for="demo-text-input">비밀번호
												다시 입력확인</label>
											<div class="col-md-9">
												<input type="password" id="newPasswordCheck"
													class="form-control" placeholder="Text"> <small
													id="passMsg" class="help-block">This is a help text</small>
												<button class="btn btn-success" type="button"
													onclick="changePassword();">비밀번호 변경</button>
											</div>
										</div>

										<!--생일-->
										<div class="form-group">
											<label class="col-md-3 control-label"
												for="demo-readonly-input">생일</label>
											<div class="col-md-9">
												<input type="text" id="memBirthday" name="memBirthday"
													class="form-control"
													placeholder="숫자 8자리 YYYYMMDD ex)19910215">
											</div>
										</div>

										<!-- 성별 -->
										<div class="form-group pad-ver">
											<label class="col-md-3 control-label">성별</label>
											<div class="col-md-9">
												<div>
													<input class="magic-radio" type="radio" name="memGender"
														value="M" id="mem"> <label for="mem">남성</label>
												</div>
												<div>
													<input class="magic-radio" type="radio" name="memGender"
														value="W" id="women"> <label for="women">여성</label>
												</div>
											</div>
										</div>

										<!-- 지역 -->
										<div class="form-group">
											<label class="col-md-3 control-label"
												for="demo-password-input">관심지역</label>
											<div class="col-md-9">
												<select id="areaId" class="form-control" name="areaId">

												</select>
											</div>
										</div>

										<!-- 관심사1 -->
										<div class="form-group pad-ver">
											<label class="col-md-3 control-label">관심사1</label>
											<div class="col-md-9">
												<select id="intKey" class="form-control" multiple="multiple">

												</select>
											</div>
											<input type="hidden" id="memInt1" name="memInt1" /> <input
												type="hidden" id="memInt2" name="memInt2" /> <input
												type="hidden" id="memInt3" name="memInt3" />
										</div>


										<div class="panel-footer text-right">
											<button class="btn btn-success" type="button"
												onclick="checkAndsubmit();">수정완료</button>
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
	getCodeList();
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
	
	
	let intKeys = $('#intKey').val();
	if(intKeys.length != 3) {alert("관심사는 3개를 선택하셔야 합니다"); return;}
	$('#memInt1').val(intKeys[0]);
	$('#memInt2').val(intKeys[1]);
	$('#memInt3').val(intKeys[2]);
	
	
	
	
	// 전송
	if (confirm("회원정보를 수정하시겠습니까?")) {	
		$('.start').trigger('click');			// 사진업로드
		$('#userForm').submit() 				// 개인정보 수정
		
	}	
	
	
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
	let url = "/mypage/selectUser";
	let error="에러가발생했습니다. 다시시작해 주세요";
	
	let resultData = callAjax(data, url, error);
	
	// 여기서 부터 화면에 찍는로직
	let user = resultData.user;	// user 정보만 갖고오고
	console.log(user);
	var codeList = [] ;		// 관심코드 배열로 받을거
	for (var key in user) {
	      $('#'+key).val(user[key]);	
	      
	      if(key == "memGender"){
	    	  $('input:radio[name="memGender"][value="'+user[key]+'"]').prop('checked', true);
	      }else if(key == "areaId"){
	    	  $('#areaId').val(user[key]).prop("selected", true);
	      }else if(key == "memPhoto"){
	    	  // 자바스크립에서 contextPath(localhost:8080/moimat 구하는 방법 : 위와 동일
	    	 // var ctx = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
	    		//alert(window.location.pathname);
	    	  $('#memPhoto').attr("src", '${pageContext.request.contextPath}' + user[key]);
	      }else if(key == "memInt1"){
	    	  codeList.push(user[key]);	    	 	    	  
	      }else if(key == "memInt2"){
	    	  codeList.push(user[key]);
	      }else if(key == "memInt3"){
	    	  codeList.push(user[key]);
	      }
	}
	$('#intKey').val(codeList).trigger('change')
}
// select List를 갖고온다
function getCodeList(){
	
	let data = null;
	let url = "/mypage/getCodeList";
	let error="에러가발생했습니다. 다시시작해 주세요";
		
	let resultData = callAjax(data, url, error);
	
	// 지역
	let areaList = resultData.areas;
	let areaStr="";	
	// 1차카테고리 : Map에 담아서 지역 중복제거, 2차카테고리: 구군option 추가
	for(let i=0; i<areaList.length; i++){
		// 2차카테고리 문자열 생성
		areaStr += "<option value='"+ areaList[i].areaId +"' >"+areaList[i].areaName+" "+areaList[i].areaRegionName+"</option>";
	}
	
	$('#areaId').append(areaStr);	// 2차 카테고리 추가
	
	// 관심사
	let interList = resultData.interest;
	let interHidden = $('.interest');
	let interStr ='';
	for(let i=0; i<interList.length; i++){
		interStr += "<option value='"+interList[i].intId+"'>"+ interList[i].intName +"</option>"
	}
	$('#intKey').append(interStr);
		
}
// TODO: 메서드 전체적으로 고쳐야함
//			- required upload url.
/***** FILE UPLOAD USING DROPZONE.JS *****/
var previewNode = document.querySelector("#template");
previewNode.id = "";
var previewTemplate = previewNode.parentNode.innerHTML;
previewNode.parentNode.removeChild(previewNode);
var myDropzone = new Dropzone(document.body, { // Make the whole body a dropzone
  url: "/mypage/photoUpload", // Set the url
  thumbnailWidth: 80,
  thumbnailHeight: 80,
  parallelUploads: 20,
  previewTemplate: previewTemplate,
  autoQueue: false, // Make sure the files aren't queued until manually added
  previewsContainer: "#previews", // Define the container to display the previews
  clickable: ".fileinput-button", // Define the element that should be used as click trigger to select files.
  maxFiles: 1,
  acceptedFiles: "image/jpeg,image/png,image/gif",
  dictMaxFilesExceeded: '프로필 사진은 한장만 가능합니다.'	
});
myDropzone.on("addedfile", function(file) {
  // Hookup the start button
 
  file.previewElement.querySelector(".start").onclick = function() {  myDropzone.enqueueFile(file); };
});
// Update the total progress bar
myDropzone.on("totaluploadprogress", function(progress) {
  document.querySelector("#total-progress .progress-bar").style.width = progress + "%";
});
myDropzone.on("sending", function(file) {
	
  // Show the total progress bar when upload starts
  document.querySelector("#total-progress").style.opacity = "1";
  // And disable the start button
  //file.previewElement.querySelector(".start").setAttribute("disabled", "disabled");
});
// Hide the total progress bar when nothing's uploading anymore
myDropzone.on("queuecomplete", function(progress) {
  document.querySelector("#total-progress").style.opacity = "0";
});
/***** END FILE UPLOAD *****/
// SELECTBOX 검색기능
$('#areaId').select2({
	width: '100%'
}).ready(function() {
	$('#areaId').css({'padding-left': '12px', 'text-align': 'left'});
});
//SELECTBOX 멀티 검색기능
$('#intKey').select2({
   	width: '100%',
  	placeholder: '찾아보기',
  	maximumSelectionLength : 3
});
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