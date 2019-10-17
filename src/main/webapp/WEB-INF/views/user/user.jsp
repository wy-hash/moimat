<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<!-- HEAD -->
<%@ include file="../includes/head.jsp"%>
<title>마이페이지 | moim@</title>
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
					                <h3 class="panel-title">회원정보</h3>
					            </div>
					
					
					            <!-- BASIC FORM ELEMENTS -->
					            <!--===================================================-->
					            <form class="panel-body form-horizontal form-padding" action="/user/{id}/edit" method="post" id="userForm">
									<!--  사진 -->
									 <div class="form-group">
					                    <label class="col-md-3 control-label">사진</label>
					                    <div class="col-md-9">
					                    	<img id="memPhoto" src="https://picsum.photos/seed/picsum/200/200" alt="샘플사진" />
					                    </div>
					                </div>
					                <!--닉네임-->
					                <div class="form-group">
					                    <label class="col-md-3 control-label">닉네임</label>
					                    <div class="col-md-9">
					                    	<input type="text" id="memNickname" name="memNickname" class="form-control" readOnly>
					                    </div>
					                </div>
					                
					                <!--Email Input-->
					                <div class="form-group">
					                    <label class="col-md-3 control-label" for="demo-email-input">이메일</label>
					                    <div class="col-md-9">
					                        <input type="email" id="memEmail" name="memEmail" class="form-control" readOnly>
					                    </div>
					                </div>
										             		
					                <!--생일-->
					                <div class="form-group">
					                    <label class="col-md-3 control-label" for="demo-readonly-input">생일</label>
					                    <div class="col-md-9">
					                        <input type="text" id="memBirthday" name="memBirthday" class="form-control" placeholder="숫자 8자리 YYYYMMDD ex)19910215" readOnly >
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
					                    	<a class="btn btn-success" href="/mypage/edit/">회원정보수정</a>
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
	
});



// 개인정보를 갖고와서 찍기
function getMyInfo(){
	
	let data = null;
	let url = "/mypage/selectUser";
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
	      }else if(key == "memPhoto"){
	    	  // 자바스크립에서 contextPath(localhost:8080/moimat 구하는 방법 : 위와 동일
		    	 // var ctx = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
		    		//alert(window.location.pathname);
		    	  $('#memPhoto').attr("src", '${pageContext.request.contextPath}' + user[key]);
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

</script>	
	
	
</body>
</html>