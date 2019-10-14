<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">

<!-- HEAD -->
<%@ include file="../includes/head.jsp" %>
	<title>설정 - ${ team.teamName } | moim@</title>
	
	<style>
		@media screen and (max-width: 768px) {
			.tab-base > ul {
				display: none;
			}
			
			.tab-base > .btn-group {
				display: inline-block;
			}
		}
		
		@media screen and (min-width: 768px) {
			.tab-base > ul {
				display: block;
			}
			
			.tab-base > .btn-group {
				display: none;
			}
		}
	
	</style>
</head>
<!-- END HEAD -->

<body>
	<!--TIPS-->
	<!--You may remove all ID or Class names which contain "demo-", they are only used for demonstration. -->
	<div id="container" class="effect aside-float aside-bright mainnav-lg">
	
		<!-- HEADER-NAVBAR -->
		<%@ include file="../includes/header-navbar.jsp" %>
		<!-- END NAVBAR -->
		
		<!-- BOXED -->
		<div class="boxed">
		
			<!-- MAIN-NAV -->
			<%@ include file="../includes/main-nav.jsp" %>
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
                    <h1 class="page-header text-overflow">{ _team.teamName_ }</h1>
                </div>
                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                <!--End page title-->

                <!--Page content-->
                <!--===================================================-->
                <div id="page-content">
                	<!-- #################################### -->
                	<!-- #### WRITE CODE BELOW THIS LINE #### -->
            	    <!-- #################################### -->
            	    

            	    <!--Default Tabs (Left Aligned)-->
			        <!--===================================================-->
			        <div class="tab-base col-lg-12">
			
			            <!--Nav Tabs-->
			            <ul class="nav nav-tabs">
			                <li>
			                    <a href="${ team.teamId }">홈</a>
			                </li>
			                <li>
			                    <a href="${ team.teamId }/member">구성원</a>
			                </li>
			                <li>
			                    <a href="${ team.teamId }/schedule">모임일정</a>
			                </li>
			                <li>
			                    <a href="${ team.teamId }/photos">사진첩</a>
			                </li>
			                <li>
			                    <a href="${ team.teamId }/posts">게시판</a>
			                </li>
			                <li>
			                    <a href="${ team.teamId }/chat">채팅</a>
			                </li>
			                <li class="active">
			                    <a href="${ team.teamId }/settings">설정</a>
			                </li>
			            </ul>
			            
                        <!--Default Dropdown button-->
                        <!--===================================================-->
                        <div class="btn-group">
                            <button class="btn btn-primary dropdown-toggle" data-toggle="dropdown" type="button">
								<i class="fa fa-bars"></i> 설정
                            </button>
                            <ul class="dropdown-menu dropdown-menu-left">
                                <li><a href="${ team.teamId }">홈</a></li>
                                <li><a href="${ team.teamId }/member">구성원</a></li>
                                <li><a href="${ team.teamId }/schedule">모임일정</a></li>
                                <li><a href="${ team.teamId }/photos">사진첩</a></li>
                                <li><a href="${ team.teamId }/posts">게시판</a></li>
                                <li><a href="${ team.teamId }/chat">채팅</a></li>
                                <li class="divider"></li>
                                <li class="active"><a href="${ team.teamId }/settings">설정</a></li>
                            </ul>
                        </div>
                        <!--===================================================-->
			
			            <!--Tabs Content-->
			            <div class="tab-content">
			                <div class="content-box">
			                    <p class="text-main text-semibold">First Tab Content</p>
			                    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</p>
			             	      일단 !!@# 선택창 먼저 !@# 만들건데 일단 일단 일단 일단 일단 일단 ..ㅁ 흠 .. .ㅁㄴㅇ 
			             	      <form>
			             	     	 팀이름<input type="text" id="teamName"><br>
			             	     	 팀짧은소개<input type="text" id="teamShortContent"><br>
			             	     	  팀긴글소개<textarea id="teamContent" rows="10" cols="100"></textarea>
			             	     	  <div>
			             	     	  관심사
			             	     	  	<select id="mainInt">
			             	     	  	<option>관심사대분류</option>
			             	     	  	</select>
			             	     	  	<select id="subInt">
			             	     	  	<option>관심사소분류</option>
			             	     	  	</select>
			             	     	  </div>
			             	     	  <div>
			             	     	  지역
			             	     	  	<select id="mainArea">
			             	     	  	<option>지역대분류</option>
			             	     	  	</select>
			             	     	  	<select id="subArea">
			             	     	  	<option>지역소분류</option>
			             	     	  	</select>
			             	     	  </div>
			             	     	  팀원숫자<input type="text" id="teamMax"><br>
			             	     	   <button type="button" class="btn btn-info">취소</button>
			             	     	   <button type="button" class="btn btn-warning">수정</button>
			             	      </form>
			                </div>
			            </div>
			        </div>
			        <!--===================================================-->
			        <!--End Default Tabs (Left Aligned)-->

					
                </div>
                <!--===================================================-->
                <!--End page content-->


            </div>
            <!--===================================================-->
            <!--END CONTENT CONTAINER-->			
			
			
			
		</div>
		<!-- END BOXED -->
		
		<!-- FOOTER -->
		<%@ include file="../includes/footer.jsp" %>
		<!-- END FOOTER -->
			
	</div>
	<!-- END CONTAINER -->
	<script type="text/javascript" src="/resources/js/teamsetting.js"></script>
	<script>
		$(document).ready(function() {
			var groupId = '<c:out value="${groupId}"/>';
			teamsetting.getPage(groupId,function(data){
				
				//단순 화면에 뿌려주는 스크립트 시작
				$('#teamName').val(data.teamVO.teamName);
				$('#teamShortContent').val(data.teamVO.teamShortContent);
				$('#teamContent').val(data.teamVO.teamContent);
				$('#teamMax').val(data.teamVO.teamMax);
				var mainIntOption = '';
				for(var i = 0, len = data.mainInterest.length||0; i<len; i++){
					mainIntOption += '<option data-intkey='+data.mainInterest[i].intKey+'>'
								  + 	data.mainInterest[i].intName
								  +  '</option>'
				}
				$("#mainInt").html(mainIntOption);
				
				var subIntOption = '';
				for(var i = 0, len = data.subInterest.length||0; i<len; i++){
					subIntOption += '<option data-intid='+data.subInterest[i].intid+'>'
								 + 		data.subInterest[i].intName
								 +  '</option>'
				}
				$("#subInt").html(subIntOption);
				$('option[data-intkey='+data.selectedMainInt+']').prop("selected", true); //선택된걸 선택한상태?
				$('option[data-intid='+data.teamVO.intId+']').prop("selected", true);
				
				var mainAreaOption = '';
				for(var i = 0, len = data.areaKey.length||0; i<len; i++){
					mainAreaOption += '<option data-areakey='+data.areaKey[i].areaKey+'>'
								   +   		data.areaKey[i].areaName
								   +  '</option>'
				}
				$("#mainArea").html(mainAreaOption);
				var subAreaOption = '';
				for(var i = 0, len = data.areaRegionKey.length||0; i<len; i++){
					subAreaOption += '<option data-areaid='+data.areaRegionKey[i].areaId+'>'
								  +   	data.areaRegionKey[i].areaRegionName
								  +  '</option>'
				}
				$("#subArea").html(subAreaOption);
				console.log(data.selectedMainArea);
				$('option[data-areakey='+data.selectedMainArea+']').prop("selected", true);
				$('option[data-areaid='+data.teamVO.areaId+']').prop("selected", true);
				//단순 화면에 뿌려주는 스크립트 끝.
				//select onChange
				
			});
		});
	</script>
</body>
</html>