<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">

<!-- HEAD -->
<%@ include file="../includes/head.jsp" %>
	<title>채팅 - ${ group.teamName } | moim@</title>
	
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
	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>

	<!-- Momoent.js -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

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
                    <h1 class="page-header text-overflow"> ${ group.teamName }</h1>
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
			                    <a href="/groups/${ group.teamId }">홈</a>
			                </li>
			                <li>
			                    <a href="/groups/${ group.teamId }/member">구성원</a>
			                </li>
			                <li>
			                    <a href="/groups/${ group.teamId }/schedule">모임일정</a>
			                </li>
			                <li>
			                    <a href="/groups/${ group.teamId }/photos">사진첩</a>
			                </li>
			                <li>
			                    <a href="/groups/${ group.teamId }/posts">게시판</a>
			                </li>
			                <li class="active">
			                    <a href="/groups/${ group.teamId }/chat">채팅</a>
			                </li>
			                <li>
			                    <a href="/groups/${ group.teamId }/settings">설정</a>
			                </li>
			            </ul>
			            
                        <!--Default Dropdown button-->
                        <!--===================================================-->
                        <div class="btn-group">
                            <button class="btn btn-primary dropdown-toggle" data-toggle="dropdown" type="button">
								<i class="fa fa-bars"></i> 채팅
                            </button>
                            <ul class="dropdown-menu dropdown-menu-left">
                                <li><a href="/groups/${ group.teamId }">홈</a></li>
                                <li><a href="/groups/${ group.teamId }/member">구성원</a></li>
                                <li><a href="/groups/${ group.teamId }/schedule">모임일정</a></li>
                                <li><a href="/groups/${ group.teamId }/photos">사진첩</a></li>
                                <li><a href="/groups/${ group.teamId }/posts">게시판</a></li>
                                <li class="active"><a href="/groups/${ group.teamId }/chat">채팅</a></li>
                                <li class="divider"></li>
                                <li><a href="/groups/${ group.teamId }/settings">설정</a></li>
                            </ul>
                        </div>
                        <!--===================================================-->
			
			            <!--Tabs Content-->
			            <div class="tab-content">
			                <div class="content-box">



										<div class="nano" style="height:70vh">
											<div class="nano-content pad-all">
												<ul class="list-unstyled media-block">

													<c:forEach items="${ messages }" var="list">
														<c:set var="mediaWay" value="media-left"/>
														<c:set var="speechWay" value=""/>

														<c:if test="${ list.senderId eq loginVO.memId }">
															<c:set var="mediaWay" value="media-right"/>
															<c:set var="speechWay" value="speech-right"/>
														</c:if>

														<li class="mar-btm">
															<div class="${ mediaWay }">
																<img src="${ list.profilePhoto }" class="img-circle img-sm" alt="Profile Pricture"/>
															</div>
															<div class="media-body pad-hor ${ speechWay }">
																<div class="speech">
																	<a href="#" class="media-heading">${ list.sender }</a>
																	<p>${ list.message }</p>
																	<p class="speech-time">
																		<i class="demo-pli-clock icon-fw"></i>${ list.sendTime }
																	</p>
																</div>
															</div>
														</li>

													</c:forEach>


												</ul>
											</div>
										</div>

										<!--Widget footer-->
										<div class="panel-footer">
											<div class="row">
												<div class="col-xs-9">
													<input type="text" placeholder="Enter your text" class="form-control chat-input">
												</div>
												<div class="col-xs-3">
													<button class="btn btn-primary btn-block" type="submit">Send</button>
												</div>
											</div>
										</div>

			                    
			                    
			                    
			                    
			                    
			                    
			                    
			                    
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

	<script>

		$(document).ready(function() {

			/** set **/
			var chatWindow = $('.list-unstyled');
			var message = $('.chat-input');
			var initDiffY = 0;

			var sock = new SockJS('/groupchat');
			sock.onopen = function() {
				sock.send(JSON.stringify({messageType: 'ENTER', groupId: ${ group.teamId }, sender: '${ loginVO.memNickname }', senderId: ${ loginVO.memId }}));
				$('.content-box .nano-content').scrollTop($('.content-box .nano-content')[0].scrollHeight);
				initDiffY = $('.content-box .nano-content')[0].scrollHeight - $('.content-box .nano-content').scrollTop();
			};

			sock.onmessage = function(e) {
				var content = JSON.parse(e.data);
				var mediaWay = 'media-left';
				var speechWay = '';

				if (content.sender == '${ loginVO.memNickname }') {
					mediaWay = 'media-right';
					speechWay = 'speech-right';
				}

				var messageDiv = ''
						+ '<li class="mar-btm">'
						+ 	'<div class="' + mediaWay + '">'
						+		'<img src="' + content.profilePhoto + '" class="img-circle img-sm" alt="Profile Picture">'
						+ 	'</div>'
						+	'<div class="media-body pad-hor ' + speechWay + '">'
						+		'<div class="speech">'
						+			'<a href="#" class="media-heading">' + content.sender + '</a>'
						+			'<p>' + content.message + '</p>'
						+			'<p class="speech-time">'
						+				'<i class="demo-pli-clock icon-fw"></i>' + content.sendTime
						+			'</p>'
						+		'</div>'
						+	'</div>'
						+ '</li>';

				var currentDiffY = $('.content-box .nano-content')[0].scrollHeight - $('.content-box .nano-content').scrollTop();

				chatWindow.append(messageDiv);

				if (content.sender == '${ loginVO.memNickname }' || currentDiffY == initDiffY) {
					$('.content-box .nano-content').scrollTop($('.content-box .nano-content')[0].scrollHeight);
					return;
				}
			};

			window.onbeforeunload = function() {
				sock.send(JSON.stringify({messageType: 'LEAVE', groupId: ${ group.teamId }, sender: '${ loginVO.memNickname }', senderId: ${ loginVO.memId }}));
				sock.close();
			};

			$('button[type="submit"]').on('click', submitEvent);

			message.keyup(function(e) {
				if (e.keyCode == 13) {
					submitEvent();
				}
			});

			function submitEvent() {
				var thisMessage = message.val();

				var byteLength = (function getByteLength(s,b,i,c){
					for(b=i=0;c=s.charCodeAt(i++);b+=c>>11?3:c>>7?2:1);
					return b;
				})(thisMessage);

				if (thisMessage == '' || thisMessage == null || byteLength >= 400) {
					return false;
				}
				sock.send(JSON.stringify({messageType:'ON', groupId: ${ group.teamId }, message: thisMessage, sender: '${ loginVO.memNickname }', sendTime: moment().format('YYYY-MM-DD HH:mm:ss'), profilePhoto: '${ loginVO.memPhoto }', senderId: ${ loginVO.memId }}));
				message.val('');
			}
		});

	</script>
</body>
</html>