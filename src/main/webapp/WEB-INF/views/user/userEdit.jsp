<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="ko">

<!-- HEAD -->
<%@ include file="../includes/head.jsp"%>

<!--Dropzone [ OPTIONAL ]-->
<script src="/resources/plugins/dropzone/dropzone.min.js"></script>

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
                           <form class="panel-body form-horizontal form-padding dropzone" action="/mypage/edit" method="post" enctype="multipart/form-data" id="userForm">
                            <!--  사진 -->
                           <div class="form-group">
                              <label class="col-md-3 control-label">사진</label>
                              <div class="col-md-9">
                                 <!--Dropzonejs using Bootstrap theme-->
                                 <!--===================================================-->
                                 <p style="text-align: left; margin-bottom: 0; padding: 6px 12px;">프로필에 쓰일 사진을 선택해주세요.</p>
                                 
                                 <div class="bord-top pad-ver"
                                    style="border-top: none; text-align: left; padding: 6px 12px;">
                                    <!-- The fileinput-button span is used to style the file input field as button -->
                                    <span class="btn btn-success fileinput-button dz-clickable">
                                       <i class="fa fa-plus"></i> <span>사진선택</span>
                                    </span>
                                 </div>
                                 <div id="dz-previews"
                                    style="border-top: none; text-align: left; padding: 6px 12px;">
                                    <div id="dz-template" class="pad-top bord-top">
                                       <div class="media">
                                          <div class="media-body">
                                             <!--This is used as the file preview template-->
                                             <div class="media-block">
                                                <div class="media-left">
                                                   <img class="dz-img" data-dz-thumbnail>
                                                </div>
                                                <div class="media-body">
                                                   <p class="text-main text-bold mar-no text-overflow"
                                                      data-dz-name></p>
                                                   <span class="dz-error text-danger text-sm"
                                                      data-dz-errormessage></span>
                                                   <p class="text-sm" data-dz-size></p>
                                                   <div id="dz-total-progress" style="opacity: 0">
                                                      <div class="progress progress-xs active"
                                                         role="progressbar" aria-valuemin="0"
                                                         aria-valuemax="100" aria-valuenow="0">
                                                         <div class="progress-bar progress-bar-success"
                                                            style="width: 0%;" data-dz-uploadprogress></div>
                                                      </div>
                                                   </div>
                                                </div>
                                             </div>
                                          </div>
                                          <div class="media-right">
                                             <button data-dz-remove
                                                class="btn btn-xs btn-danger dz-cancel">
                                                <i class="demo-pli-cross"></i>
                                             </button>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                                 <!--===================================================-->
                                 <!--End Dropzonejs using Bootstrap theme-->
                              </div>
                           </div>

                           <!--닉네임-->
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
                                       <div class="col-md-4">
                                          <select id="area" class="form-control" >
                                          <option value="" selected>선택하세요</option>
                                          </select>
                                       </div>
                                       <div class="col-md-5">
                                          <select id="areaId" class="form-control" name="areaId" >
                                          </select>
                                       </div>
                                    </div>
                               </div>
                               
                               <!-- 관심사1 -->
                               <div class="form-group pad-ver" >
                                   <label class="col-md-3 control-label">관심사1</label>
                                   <select id="int" class="form-control" name="intKey">
                                      
                                      
                                  </select>
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
         <button type="button" id="btnUpload">클릭 </button>


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
   
   $('#newPassword').blur(newPasswordCheck);      // 이벤트등록 (신규비밀 번호)
   $('#newPasswordCheck').blur(rePasswordCheck);   // 이벤트등록 (비밀번호 다시 입력확인)
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
   if (confirm("회원정보를 수정하시겠습니까?")) {   $('#userForm').submit() }   
   
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
   if(nul_chk($('#newPassword'), 8,15)){   // 빈문자,길이체크:  nul_chk("검사할 객체, 최소길이, 최대길이") 리턴 true and false
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
   let user = resultData.user;   // user 정보만 갖고오고
   
   var array = new Array();   // arrayList생성 (키만 담을ㄹ고)
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
         }else if(key == "memPhoto"){
            // 자바스크립에서 contextPath(localhost:8080/moimat 구하는 방법 : 위와 동일
           // var ctx = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
             //alert(window.location.pathname);
            $('#memPhoto').attr("src", '${pageContext.request.contextPath}' + user[key]);
         }
   }
}

// select List를 갖고온다
function getCodeList(){
   
   let data = null;
   let url = "/mypage/getCodeList";
   let error="에러가발생했습니다. 다시시작해 주세요";
   
   let resultData = callAjax(data, url, error);
   let interests = $('.interest');
   
   // 지역
   let areaList = resultData.areas;
   let areas = new Map();   // 지역 1차 카테고리 담을 Map
   let cityStr='';         // 지역 2차 카테고리 담을 문자열
   
   // 1차카테고리 : Map에 담아서 지역 중복제거 + 구군option 추가
   for(let i=0; i<areaList.length; i++){
      areas.set(areaList[i].areaKey,areaList[i].areaName)
      //차카테고리
      cityStr += "<option value='"+ areaList[i].areaRegionKey +"' hidden>"+areaList[i].areaRegionName+"</option>";
   }
   console.log(areas);
   
   // 1차 카테고리 담을 문자열 생성
   let areaStr='';
   areas.forEach((value, key, map) => {
      areaStr += "<option value='"+ key +"' >"+value+"</option>"
   });
   
   $('#area').append(areaStr);   // 1차 카테고리 추가
   $('#areaId').append(cityStr);   // 2차 카테고리 추가
   
   
   /* // 관심사
   for(let i=0; i<interests.length; i++){
      let str='';
      for(let j=0; j<codeList.length; j++){
         str += '<input  class="magic-radio" type="radio" name="memInt'+(i+1)+'" value="'+codeList[j].intId+'"'
               +'id="interest'+(i+1)+'_'+(j+1)+'"' +'checked>'
               + '<label for="interest'+(i+1)+'_'+(j+1)+'">'+codeList[j].intName+'</label>';   
      }
      console.log(str);
      
      $('#interest'+(i+1)).append(str);
   } */
   
}

$('#area').change(function() {
   
   let city = $(this).val();
   let optionList = $('#areaId').children('option');
   for(let i=0; i<optionList.length; i++){
      if(city.substring(0,1) == optionList[i].value.substring(0,1)){
         optionList[i].hidden=false;
      }else{
         optionList[i].hidden=true;
      }
   }
});

// TODO: 메서드 전체적으로 고쳐야함
//         - required upload url.
/***** FILE UPLOAD USING DROPZONE.JS *****/

var previewNode = document.querySelector("#dz-template");
previewNode.id = "";
var previewTemplate = previewNode.parentNode.innerHTML;
previewNode.parentNode.removeChild(previewNode);

var uplodaBtn = $('#dz-upload-btn'); //TODO : 필요없음
var removeBtn = $('#dz-remove-btn'); //TODO : 필요없음
var myDropzone = new Dropzone(document.body, { // Make the whole body a dropzone
   url: "/target-url", // Set the url
    thumbnailWidth: 50,
    thumbnailHeight: 50,
    parallelUploads: 20,
    previewTemplate: previewTemplate,
    autoQueue: false, // Make sure the files aren't queued until manually added
    previewsContainer: "#dz-previews", // Define the container to display the previews
    clickable: ".fileinput-button", // Define the element that should be used as click trigger to select files.
    maxFiles: 1,
    acceptedFiles: "image/jpeg,image/png,image/gif",
    dictMaxFilesExceeded: '프로필 사진은 한장만 가능합니다.',
    init: function() {
       var submitButton = document.querySelector("#btnUpload")
        myDropzone = this;
        
        submitButton.addEventListener("click", function() {
                 
          /* Check if file is selected for upload */
          if (myDropzone.getUploadingFiles().length === 0 && myDropzone.getQueuedFiles().length === 0) {      
            alert('No file selected for upload');  
            return false;
          }
          else {
            /* Remove event listener and start processing */ 
            myDropzone.removeEventListeners();
            
          }
        });
    }
});
            
myDropzone.on("addedfile", function(file) {
   
    uplodaBtn.prop('disabled', true);    //TODO: 필요없음
    removeBtn.prop('disabled', false);    //TODO: 필요없음
    myDropzone.processQueue();
   console.log(myDropzone.getUploadingFiles())
   console.log(Dropzone.QUEUED);
   console.log(Dropzone.options.parallelUploads)
   console.log($(this).get(0))
   var dropzone = $(this).get(0);
    dropzone.processQueue();
});

// Update the total progress bar
myDropzone.on("totaluploadprogress", function(progress) {
   
    $("#dz-total-progress .progress-bar").css({'width' : progress + "%"});
    alert(2)
});

myDropzone.on("sending", function(file) {
    alert(3)
    // Show the total progress bar when upload starts
    document.querySelector("#dz-total-progress").style.opacity = "1";
});

// Hide the total progress bar when nothing's uploading anymore
myDropzone.on("queuecomplete", function(progress) {
    alert(4)
    document.querySelector("#dz-total-progress").style.opacity = "0";
});


// Setup the buttons for all transfers
uplodaBtn.on('click', function() {
    alert(5)
    //Upload all files
    //myDropzone.enqueueFiles(myDropzone.getFilesWithStatus(Dropzone.ADDED));
});

removeBtn.on('click', function() {
    alert(6)
    myDropzone.removeAllFiles(true);
    uplodaBtn.prop('disabled', true);
    removeBtn.prop('disabled', true);
});

/***** END FILE UPLOAD *****/


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