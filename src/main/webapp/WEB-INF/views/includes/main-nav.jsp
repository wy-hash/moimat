<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

            <!--MAIN NAVIGATION-->
            <!--===================================================-->
            <nav id="mainnav-container">
                <div id="mainnav">

                    <!--Menu-->
                    <!--================================-->
                    <div id="mainnav-menu-wrap">
                        <div class="nano">
                            <div class="nano-content">

                                <!--Profile Widget-->
                                <!--================================-->
                                <div id="mainnav-profile" class="mainnav-profile"> 
	                                <c:choose>
	                                	<c:when test="${ empty loginVO }">
	                                		<div class="profile-wrap">
	                                			<a href="/auth/login"><button class="btn btn-block btn-success">로그인하기</button></a>
	                               			</div>
	                               		</c:when>
	                               		<c:otherwise>
	                               			<div class="profile-wrap">
	                                   			<div class="pad-btm">
	                                       			<img class="img-circle img-sm img-border" src="${ loginVO.memPhoto }" alt="Profile Picture">
	                                   			</div>
	
	                                  			<a href="#profile-nav" class="box-block" data-toggle="collapse" aria-expanded="false">
	                                      			<span class="pull-right dropdown-toggle">
	                                          			<i class="dropdown-caret"></i>
	                                      			</span>
	                                      			<p class="mnp-name">${ loginVO.memNickname }</p>
	                                    			<span class="mnp-desc">@ ${ areaVO.areaName } ${ areaVO.areaRegionName }</span>
	                                  			</a>
	                              			</div>
	                              			<div id="profile-nav" class="collapse list-group bg-trans">
	                                  			<button data-target="#demo-modal-wo-anim" data-toggle="modal" class="btn btn-block btn-success">로그아웃</button>
	                              			</div>
	                               		</c:otherwise>
	                                </c:choose>
                                </div>


                                <ul id="mainnav-menu" class="list-group">
						
						            <!--Menu list item-->
						            <li class="active-link">
						                <a href="<c:url value='/home'/>">
						                    <i class="demo-psi-home"></i>
						                    <span class="menu-title">
												<strong>홈</strong>
											</span>
						                </a>
						            </li>

						            <!--Menu list item-->
						            <li>
						                <a href="<c:url value='/search'/>">
						                    <i class="fa fa-search"></i>
						                    <span class="menu-title">
												<strong>모임찾기</strong>
											</span>
						                </a>
						            </li>
						            
						            <!--Menu list item-->
						            <li>
						                <a href="/groups">
						                    <i class="fa fa-group"></i>
						                    <span class="menu-title">
												<strong>내 모임</strong>
											</span>
						                </a>
						            </li>
						            
						            <!-- Category name -->
						            <li class="list-header">마이페이지</li>
						            
						            <!-- Menu list item -->
						            <li>
						            	<a href="/mypage">
						            		<i class="fa fa-user"></i>
						            		<span class="menu-title">
						            			<strong>내 정보</strong>
						            		</span>
						            	</a>
						            </li>
						            
						            <!-- Menu list item -->
						            <li>
						            <c:choose>
						            	<c:when test="${sessionScope.loginVO.memId >0}">
						            	<a href="<c:url value='/users/${sessionScope.loginVO.memId}/qna'/>">
						            	<i class="fa fa-pencil-square-o"></i>
						            		<span class="menu-title">
						            			<strong>내 문의내역</strong>
						            		</span>
						            	</a>
						            	</c:when>
						            	<c:otherwise>
						            	<a href="<c:url value='/users/0/qna'/>">
						            		<i class="fa fa-pencil-square-o"></i>
						            		<span class="menu-title">
						            			<strong>내 문의내역</strong>
						            		</span>
						            	</a>
						            	</c:otherwise>
						            </c:choose>
						            </li>
						            <!-- Category name -->
						            <li class="list-header">인포</li>
						            
						            <li>
						            	<a href="<c:url value='/info/notice'/>">
						            		<i class="fa fa-bullhorn"></i>
						            		<span class="menu-title">
						            			<strong>공지사항</strong>
						            		</span>
						            	</a>
						            </li>
						            
						            <!-- Menu list item -->
						            <li>
						            	<a href="<c:url value='/info/event'/>">
						            		<i class="fa fa-gift"></i>
						            		<span class="menu-title">
						            			<strong>이벤트</strong>
						            		</span>
						            	</a>
						            </li>
						            
						            <!-- Menu list item -->
						            <li>
						            	<a href="/info/faq">
						            		<i class="fa fa-quote-right"></i>
						            		<span class="menu-title">
						            			<strong>자주묻는질문</strong>
						            		</span>
						            	</a>
						            </li>
						            
						            <!-- Menu list item -->
						            <li>
						            	<a href="<c:url value='/info/qna'/>">
						            		<i class="fa fa-pencil-square-o"></i>
						            		<span class="menu-title">
						            			<strong>문의하기</strong>
						            		</span>
						            	</a>
						            </li>
						            
						            <c:if test="${sessionScope.loginVO.memLevel >7}">
						             <!-- Category name -->
						            <li class="list-header">관리자</li>
						            <li>
						            	<a href="<c:url value='/admin'/>">
						            		<i class="fa fa-pie-chart"></i>
						            		<span class="menu-title">
						            			<strong>대쉬보드</strong>
						            		</span>
						            	</a>
						            </li>
						            
						            <!-- Menu list item -->
						            <li>
						            	<a href="<c:url value='/admin/interest'/>">
						            		<i class="fa fa-cog"></i>
						            		<span class="menu-title">
						            			<strong>관심사 코드 관리</strong>
						            		</span>
						            	</a>
						            </li>
						            
						            <!-- Menu list item -->
						            <li>
						            	<a href="<c:url value='/admin/board'/>">
						            		<i class="fa fa-cog"></i>
						            		<span class="menu-title">
						            			<strong>게시판 코드 관리</strong>
						            		</span>
						            	</a>
						            </li>
						            
						            <!-- Menu list item -->
						            <li>
						            	<a href="<c:url value='/admin/post'/>">
						            		<i class="fa fa-cogs"></i>
						            		<span class="menu-title">
						            			<strong>게시글 통합 관리</strong>
						            		</span>
						            	</a>
						            </li>
						            <!-- Menu list item -->
						            <li>
						            	<a href="<c:url value='/admin/users'/>">
						            		<i class="fa fa-user"></i>
						            		<span class="menu-title">
						            			<strong>회원 관리</strong>
						            		</span>
						            	</a>
						            </li>
						            <!-- Menu list item -->
						            <li>
						            	<a href="<c:url value='/admin/groups'/>">
						            		<i class="fa fa-users"></i>
						            		<span class="menu-title">
						            			<strong>모임 관리</strong>
						            		</span>
						            	</a>
						            </li>
						            </c:if>
                                </ul>


                            </div>
                        </div>
                    </div>
                    <!--================================-->
                    <!--End menu-->

                </div>
            </nav>
            <!--===================================================-->
            <!--END MAIN NAVIGATION-->