<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">

<!-- HEAD -->
<%@ include file="../includes/head.jsp"%>
<title>회원탈퇴 | moim@</title>
</head>
<!-- END HEAD -->
<body>
	<div id="container" class="cls-container">
		
		
		<!-- LOGIN FORM -->
		<!--===================================================-->
		<div class="cls-content">
		    <div class="cls-content-sm panel">
		        <div class="panel-body">
		            <div class="mar-ver pad-btm">
		                <h2 class="h4 mar-no">회원탈퇴</h2>
		                <p class="text-muted"></p>
		            </div>
		            
		            <div class="pad-all">
		            	<span>
		            		탈퇴 후에는 아이디와 데이터는 복구할 수 없습니다.
							게시판형 서비스에 남아 있는 게시글은 탈퇴 후 삭제할 수 없습니다.
		            	</span>
		            </div>
		            <div class="pad-all">
		           		 <input type="checkbox" id="check" /> <strong> 안내 사항을 모두 확인하였으며, 이에 동의합니다. </strong> <br> 	
		            	 <button class="btn btn-primary btn-lg btn-red" type="button" onclick="withdraw();">회원탈퇴</button>
		            	 
		            </div>
		            <div class="pad-all">
	           			<h1 style="color:red">${msg}</h1>
		            </div>
		            
		        </div>
		    </div>
		</div>
		<!--===================================================-->
	</div>
	<!--===================================================-->
	<!-- END OF CONTAINER -->
	
	<script>
	
	$(document).ready(function(){
	    
	});
	
	function withdraw(){
		if($("input:checkbox[id='check']").is(":checked")){
			var form = $('<form></form>');
			
			form.attr('action', "/myPage/withdraw");
			form.attr('method', 'post');
			form.appendTo('body');
			form.submit();
			
		}else{
			alert("위의사항에 동의해주셔야 회원탈퇴가 가능합니다.")
		}
	}
	
	
	
	</script>

</body>
</html>