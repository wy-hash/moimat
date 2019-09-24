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
                                    <div class="profile-wrap">
                                        <div class="pad-btm">
                                            <span class="label label-success pull-right">New</span>
                                            <img class="img-circle img-sm img-border" src="/resources/img/profile-photos/1.png" alt="Profile Picture">
                                        </div>
                                        <a href="#profile-nav" class="box-block" data-toggle="collapse" aria-expanded="false">
                                            <p class="mnp-name">이모임</p>
                                            <span class="mnp-desc">@서울특별시 서초구</span>
                                        </a>
                                    </div>
                                </div>


                                <ul id="mainnav-menu" class="list-group">
						
						            <!--Menu list item-->
						            <li class="active-link">
						                <a href="<c:url value='/'/>">
						                    <i class="demo-psi-home"></i>
						                    <span class="menu-title">
												<strong>홈</strong>
											</span>
						                </a>
						            </li>
						            
						            <!--Menu list item-->
						            <li>
						                <a href="#">
						                    <i class="fa fa-envelope"></i>
						                    <span class="menu-title">
												<strong>받은 메시지</strong>
											</span>
						                </a>
						            </li>

						            <!--Menu list item-->
						            <li>
						                <a href="#">
						                    <i class="fa fa-search"></i>
						                    <span class="menu-title">
												<strong>모임찾기</strong>
											</span>
						                </a>
						            </li>
						            
						            <!--Menu list item-->
						            <li>
						                <a href="#">
						                    <i class="fa fa-group"></i>
						                    <span class="menu-title">
												<strong>나의 모임</strong>
											</span>
											<i class="arrow"></i>
						                </a>
						                
						                <!-- Submenu -->
						                <ul class="collapse">
						                	<li><a href="#">이런모임</a></li>
						                	<li><a href="#">저런모임</a></li>
						                	<li><a href="#">그런모임</a></li>
						                	<li><a href="#">이상한모임</a></li>
						                	<li><a href="#">재밌는모임</a></li>
						                </ul>
						            </li>
						            
						            <!-- Category name -->
						            <li class="list-header">마이페이지</li>
						            
						            <!-- Menu list item -->
						            <li>
						            	<a href="#">
						            		<i class="fa fa-user"></i>
						            		<span class="menu-title">
						            			<strong>내 정보</strong>
						            		</span>
						            	</a>
						            </li>
						            
						            <!-- Menu list item -->
						            <li>
						            	<a href="#">
						            		<i class="fa fa-pencil-square-o"></i>
						            		<span class="menu-title">
						            			<strong>내 문의내역</strong>
						            		</span>
						            	</a>
						            
						            <!-- Category name -->
						            <li class="list-header">인포</li>
						            
						            <li>
						            	<a href="#">
						            		<i class="fa fa-bullhorn"></i>
						            		<span class="menu-title">
						            			<strong>공지사항</strong>
						            		</span>
						            	</a>
						            </li>
						            
						            <!-- Menu list item -->
						            <li>
						            	<a href="#">
						            		<i class="fa fa-gift"></i>
						            		<span class="menu-title">
						            			<strong>이벤트</strong>
						            		</span>
						            	</a>
						            </li>
						            
						            <!-- Menu list item -->
						            <li>
						            	<a href="#">
						            		<i class="fa fa-quote-right"></i>
						            		<span class="menu-title">
						            			<strong>자주묻는질문</strong>
						            		</span>
						            	</a>
						            </li>
						            
						            <!-- Menu list item -->
						            <li>
						            	<a href="#">
						            		<i class="fa fa-pencil-square-o"></i>
						            		<span class="menu-title">
						            			<strong>문의하기</strong>
						            		</span>
						            	</a>
						            </li>
						            
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