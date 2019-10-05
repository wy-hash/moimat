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
					<h1 class="page-header text-overflow">Page Template</h1>
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
					                <h3 class="panel-title">Basic Form Elements</h3>
					            </div>
					
					
					            <!-- BASIC FORM ELEMENTS -->
					            <!--===================================================-->
					            <form class="panel-body form-horizontal form-padding">
					
					                <!--Static-->
					                <div class="form-group">
					                    <label class="col-md-3 control-label">닉네임</label>
					                    <div class="col-md-9">
					                    	<input type="text" id="memNickname" class="form-control"  readOnly>
					                    </div>
					                </div>
					                
					                <!--Email Input-->
					                <div class="form-group">
					                    <label class="col-md-3 control-label" for="demo-email-input">이메일</label>
					                    <div class="col-md-9">
					                        <input type="email" id="memEmail" class="form-control" readOnly>
					                    </div>
					                </div>
					
					                <!-- 비밀번호 -->
					                <div class="form-group">
					                    <label class="col-md-3 control-label" for="demo-text-input">비밀번호</label>
					                    <div class="col-md-9">
					                        <input type="password" id="memPassword" name="memPassword" class="form-control" placeholder="Text">
					                        <small class="help-block">This is a help text</small>
					                    </div>
					                </div>
					
					                <!--생일-->
					                <div class="form-group">
					                    <label class="col-md-3 control-label" for="demo-readonly-input">생일</label>
					                    <div class="col-md-9">
					                        <input type="text" id="memBirthday" class="form-control" placeholder="숫자 8자리 YYYYMMDD ex)19910215" >
					                    </div>
					                </div>
									
					                <!-- 성별 -->
					             	<div class="form-group pad-ver">
					                    <label class="col-md-3 control-label">성별</label>
					                    <div class="col-md-9">
					                        <div>
					                            <input class="magic-radio" type="radio" name="aaa" id="yyy">
					                            <label for="yyy">남성</label>
					                        </div>
					                        <div>
					                            <input class="magic-radio" type="radio" name="aaa" id="xxxx">
					                            <label for="xxxx">여성</label>
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

$(document).ready(function(){
	 getInterest();
	
});

// 개인정보를 갖고와서 찍기
function getMyInfo(){
	
	let data = null;
	let url = "/auth/codeList";
	let error="에러가발생했습니다. 다시시작해 주세요";
	
	
	
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