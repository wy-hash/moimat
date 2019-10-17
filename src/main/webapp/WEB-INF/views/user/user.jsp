<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<!-- HEAD -->
<%@ include file="../includes/head.jsp"%>

<!--Select2 [ OPTIONAL ]-->
 <link href="/resources/plugins/select2/css/select2.min.css" rel="stylesheet">

<!--Select2 [ OPTIONAL ]-->
<script src="/resources/plugins/select2/js/select2.min.js"></script>

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
					                            <input class="magic-radio" type="radio" name="memGender" value="M" id="mem"  onclick="return(false);"/>
					                            <label for="mem">남성</label>
					                        </div>
					                        <div>
					                            <input class="magic-radio" type="radio" name="memGender" value="W" id="women" onclick="return(false);"/>
					                            <label for="women">여성</label>
					                        </div>
					                    </div>
					                </div>
									
									<!-- 지역 -->
					                <div class="form-group">
					                    <label class="col-md-3 control-label" for="demo-password-input">관심지역</label>
					                    <div class="col-md-9">
                                      	 	<select id="areaId" class="form-control" name="areaId" disabled>
                                      	 	
                                       		</select>
                                    </div>
					                </div>
					                
					                <!-- 관심사 -->
					             	<div class="form-group pad-ver" >
					                    <label class="col-md-3 control-label">관심사1</label>
					                    <div class="col-md-9">
                                      		<select id="intKey" class="form-control" multiple="multiple" disabled>
                                                                     
                                     		</select>
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
	 getInterest();
	 getMyInfo();
	
});



// 개인정보를 갖고와서 찍기
function getMyInfo(){
	   
	   let data = null;
	   let url = "/mypage/selectUser";
	   let error="에러가발생했습니다. 다시시작해 주세요";
	   
	   let resultData = callAjax(data, url, error);
	   
	   // 여기서 부터 화면에 찍는로직
	   let user = resultData.user;   // user 정보만 갖고오고
	   console.log(user);
	   var codeList = [] ;      // 관심코드 배열로 받을거
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

// 관심사 코드를 갖고온다(문항 동적으로 생성)
function getInterest(){
	

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
	   
	   $('#areaId').append(areaStr);   // 2차 카테고리 추가
	   
	   
	   // 관심사
	   let interList = resultData.interest;
	   let interHidden = $('.interest');
	   let interStr ='';

	   for(let i=0; i<interList.length; i++){
	      interStr += "<option value='"+interList[i].intId+"'>"+ interList[i].intName +"</option>"
	   }
	   $('#intKey').append(interStr);

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
	//SELECTBOX 검색기능
	$('#areaId').select2({
		width : '100%'
	}).ready(function() {
		$('#areaId').css({
			'padding-left' : '12px',
			'text-align' : 'left'
		});
	});

	//SELECTBOX 멀티 검색기능
	$('#intKey').select2({
		width : '100%',
		placeholder : '찾아보기',
		maximumSelectionLength : 3
	});
</script>	
	
	
</body>
</html>