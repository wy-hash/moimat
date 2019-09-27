<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">

<!-- HEAD -->
<%@ include file="includes/head.jsp" %>
	<title>Page Template | moim@</title>
</head>
<!-- END HEAD -->

<body>
	<!--TIPS-->
	<!--You may remove all ID or Class names which contain "demo-", they are only used for demonstration. -->
	 <div id="container" class="effect aside-float aside-bright mainnav-lg">
	
		<!-- HEADER-NAVBAR -->
		<%@ include file="includes/header-navbar.jsp" %>
		<!-- END NAVBAR -->
		
		<!-- BOXED -->
		 <div class="boxed">
		
			<!-- MAIN-NAV -->
			<%@ include file="includes/main-nav.jsp" %>
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
                	<!-- #################################### -->
                	<!-- #### WRITE CODE BELOW THIS LINE #### -->
            	    <!-- #################################### -->
            	    
            	    
            	    
            	    
            	    
            	    <div class="row">
            	    
            	    	<div class="panel">
            	    		<div class="panel-heading">
            	    			<h3 class="panel-title">관심사 기반 추천모임</h3>
            	    		</div>
            	    
            	    		
            	    		<!--Purple Accordion-->
					        <!--===================================================-->
					        <div class="panel-group accordion" id="demo-acc-purple">
					            <div class="panel panel-purple">
					
					                <!-- Accordion title -->
					                <div class="panel-heading">
					                    <h4 class="panel-title">
					                        <a data-parent="#demo-acc-purple" data-toggle="collapse" href="#demo-acd-purple-1">{ _첫번째 관심사_ }</a>
					                    </h4>
					                </div>
					
					                <!-- Accordion content -->
					                <div class="panel-collapse collapse in" id="demo-acd-purple-1">
					                    <div class="panel-body">
					                    
					                    
											<div class="media bord-btm">
						                		<div class="media-left pad-all">
						                			<img class="img-lg" src="resources/img/profile-photos/1.png" alt="Sample Image">
						                		</div>
						                		<div class="media-body pad-all text-semibold">
						                			<p>{ _모임이름_ }</p>
						                			<p>{ _모임위치_ }</p>
						                			<p>{ _모임인원_ }</p> 
						                		 
						                			     
			                					</div>
			                					
			                				</div>
			                				
			                				
			                				 
			                				
			                				<div class="media bord-btm">
						                		<div class="media-left pad-all">
						                			<img class="img-lg" src="resources/img/profile-photos/1.png" alt="Sample Image">
						                		</div>
						                		<div class="media-body pad-all text-semibold">
						                			<p>{ _모임이름_ }</p>
						                			<p>{ _모임위치_ }</p>
						                			<p>{ _모임인원_ }</p>
						                			
						                			
			                					</div>
			                				</div>
						                	
						                	
						                	
						                	
						                	<div class="media bord-btm">
						                		<div class="media-left pad-all">
						                			<img class="img-lg" src="resources/img/profile-photos/1.png" alt="Sample Image">
						                		</div>
						                		<div class="media-body pad-all text-semibold">
						                			<p>{ _모임이름_ }</p>
						                			<p>{ _모임위치_ }</p>
						                			<p>{ _모임인원_ }</p>
			                					</div>
			                				</div>
						                	
						                	
					                    </div>
					                </div>
					            </div>
					            <div class="panel panel-purple">
					
					                <!-- Accordion title -->
					                <div class="panel-heading">
					                    <h4 class="panel-title">
					                        <a data-parent="#demo-acc-purple" data-toggle="collapse" href="#demo-acd-purple-2">{ _두번째 관심사_ }</a>
					                    </h4>
					                </div>
					
					                <!-- Accordion content -->
					                <div class="panel-collapse collapse" id="demo-acd-purple-2">
					                    <div class="panel-body">
											
											<div class="media bord-btm">
						                		<div class="media-left pad-all">
						                			<img class="img-lg" src="resources/img/profile-photos/1.png" alt="Sample Image">
						                		</div>
						                		<div class="media-body pad-all text-semibold">
						                			<p>{ _모임이름_ }</p>
						                			<p>{ _모임위치_ }</p>
						                			<p>{ _모임인원_ }</p>
			                					</div>
			                				</div>
			                				
			                				
			                				 
			                				
			                				<div class="media bord-btm">
						                		<div class="media-left pad-all">
						                			<img class="img-lg" src="resources/img/profile-photos/1.png" alt="Sample Image">
						                		</div>
						                		<div class="media-body pad-all text-semibold">
						                			<p>{ _모임이름_ }</p>
						                			<p>{ _모임위치_ }</p>
						                			<p>{ _모임인원_ }</p>
			                					</div>
			                				</div>
						                	
						                	
						                	
						                	
						                	<div class="media bord-btm">
						                		<div class="media-left pad-all">
						                			<img class="img-lg" src="resources/img/profile-photos/1.png" alt="Sample Image">
						                		</div>
						                		<div class="media-body pad-all text-semibold">
						                			<p>{ _모임이름_ }</p>
						                			<p>{ _모임위치_ }</p>
						                			<p>{ _모임인원_ }</p>
			                					</div>
			                				</div>
											
											
											
											
					                    </div>
					                </div>
					            </div>
					            <div class="panel panel-purple">
					
					                <!-- Accordion title -->
					                <div class="panel-heading">
					                    <h4 class="panel-title">
					                        <a data-parent="#demo-acc-purple" data-toggle="collapse" href="#demo-acd-purple-3">{ _세번째 관심사_ }</a>
					                    </h4>
					                </div>
					
					                <!-- Accordion content -->
					                <div class="panel-collapse collapse" id="demo-acd-purple-3">
					                    <div class="panel-body">
											<div class="media bord-btm">
						                		<div class="media-left pad-all">
						                			<img class="img-lg" src="resources/img/profile-photos/1.png" alt="Sample Image">
						                		</div>
						                		<div class="media-body pad-all text-semibold">
						                			<p>{ _모임이름_ }</p>
						                			<p>{ _모임위치_ }</p>
						                			<p>{ _모임인원_ }</p>
			                					</div>
			                				</div>
			                				
			                				
			                				 
			                				
			                				<div class="media bord-btm">
						                		<div class="media-left pad-all">
						                			<img class="img-lg" src="resources/img/profile-photos/1.png" alt="Sample Image">
						                		</div>
						                		<div class="media-body pad-all text-semibold">
						                			<p>{ _모임이름_ }</p>
						                			<p>{ _모임위치_ }</p>
						                			<p>{ _모임인원_ }</p>
			                					</div>
			                				</div>
						                	
						                	
						                	
						                	
						                	<div class="media bord-btm">
						                		<div class="media-left pad-all">
						                			<img class="img-lg" src="resources/img/profile-photos/1.png" alt="Sample Image">
						                		</div>
						                		<div class="media-body pad-all text-semibold">
						                			<p>{ _모임이름_ }</p>
						                			<p>{ _모임위치_ }</p>
						                			<p>{ _모임인원_ }</p>
			                					</div>
			                				</div>
					                    </div>
					                </div>
					            </div>
					        </div>
					        <!--===================================================-->
					        <!--End Purple Accordion-->
            	    		
            	    		
 
            	    	</div>
            	    
            	    </div>
            	    
            	    
            	    
            	    
            	    
            	    
            	    
            	    
            	    
            	    
            	    
                 <div class="col-xs-12">
                 	<div class="col-sm-6">
                 		<div class="panel-body">
                 		
               			<!-- 추천 관심사 -->
          					<table>
           						<tr>
             						<c:forEach items="${recom}" var="recommend">
									<h3><input type="button"  readonly="readonly" class ="btn btn-purple btn-rounded btn-labeled demo-psi-heart-2" value="${recommend.intName}"/></h3>
									</c:forEach>
								</tr>
               			<!-- 추천 관심사에 따른 모임명 출력. -->
               					<tr>
               						<c:forEach items="${result}" var="recomResult">
               						<h4><c:out value="${recomResult.teamName}"/></h4>
               						<h5><c:out value="${recomResult.teamShortContent}"/></h5>
           							</c:forEach>
           						</tr>
							</table>
						</div>
					</div>
                 	<div class="panel">
           			<div class="panel-body">
               			<div class="bootstrap-table">
           				<table>
           					<thead>
               					<tr>
               						<th>모임명</th>
               						<th>소개글</th>
               					</tr>
               				</thead>
               				<c:forEach items="${list}" var="team">
               				<tr>
               					<td><c:out value="${team.teamName}"/></td>
               					<td><c:out value="${team.teamShortContent}"/></td>
               				</tr>
               				</c:forEach>
               			</table>
               			
               			<ul class="pagination">
               				<c:if test="${pageMaker.prev}">
               					<li class="paginate_button previous"><a href="${pageMaker.startPage -1}">Previous</a>
               				</c:if>
               				
               				<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
               					<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active":""}">
               						<a href="${num}">${num}</a></li>
               				</c:forEach>
               				
               				<c:if test="${pageMaker.next}">
               					<li class="paginate_button next">
               						<a href="${pageMaker.endPage + 1}">Next</a></li>
               				</c:if>
               			</ul>
               			<!-- end Pagination -->
               			<form id="actionForm" action="/home/search" method="get">
            	 			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
            	 			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
            	 			<input type='hidden' name='type' value='<c:out value="${ pageMaker.cri.type }"/>'>
            	 			<input type='hidden' name='keyword' value='<c:out value="${ pageMaker.cri.keyword }"/>'>
           	 			</form>
               			
               			<!-- 검색창 -->
               			<div class="col-xs-12">
               				<form id="searchForm" action="/home/search" method="get">
               					<select name="type">
               						<option value="M" <c:out value="${pageMaker.cri.type eq 'M'?'selected':''}"/>>모임</option>
               						<option value="I" <c:out value="${pageMaker.cri.type eq 'I'?'selected':''}"/>>관심사</option>
               					</select>
               					<input type="text" id="searchKeyword" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"/>' />
               					<input type="hidden" name="pageNum" value='${pageMaker.cri.pageNum}'>
               					<input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
               					<button type="submit">검색</button>
               				</form>
               			</div>
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
		<%@ include file="includes/footer.jsp" %>
		<!-- END FOOTER -->
			
	</div>
	<!-- END CONTAINER -->
	
	<script src="/resources/js/jquery-ui.min.js"></script>
	
	<script type="text/javascript">
	 	$(document).ready(function() {
	 		
	 		var array = ["test","test1","test2"];
	 		
	 		$('#searchKeyword').autocomplete({
	 			
	 			source:	function(request, response) {
	 				
	 				$.ajax({
	 		 			url:		"/home/search",
	 	 				type:		"POST",
	 	 				dataType:	"json",
	 		 			data:		request,
	 		 			success:	function(data) {
	 		 				console.log(data);
	 		 				
	 		 				var result = data;
	 		 				response(result);
	 		 			},
	 		 			error: function(request, status, error) {
	 		 				var msg = "ERROR : " + request.status + "<br>"
	 		 			      msg +=  + "내용 : " + request.responseText + "<br>" + error;
	 		 			      console.log(msg);
	 		 			}
	 		 		});
	 			}
 			});
	 		
	 		var searchForm = $("#searchForm");
	 		
	 		$("#searchForm button").on("click", function(e){
	 			
	 			searchForm.find("input[name='pageNum']").val("1");
	 			
	 			console.log('searchForm click')
	 			
	 			e.preventDefault();
	 			searchForm.submit();
	 			
	 		});
	 		
	 		var actionForm = $("#actionForm");
	 		
	 		$('.paginate_button a').on("click", function(e) {
	 			
	 			e.preventDefault();
	 			
	 			console.log('click');
	 			
	 			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
	 			actionForm.submit();
	 		});
	 	});
	 </script>
	 
</body>
</html>