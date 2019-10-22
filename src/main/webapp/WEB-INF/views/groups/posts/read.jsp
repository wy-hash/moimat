<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">

<!-- HEAD -->
<%@ include file="../../includes/head.jsp" %>
<title>게시판 - ${ group.teamName } | moim@</title>

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

    .content-box > .row {
        display: flex;
        flex-flow: wrap;
        justify-content: center;
    }

    .content-box > .row > .panel {
        padding-left: 0;
        padding-right: 0;
    }

    .img-thumbnail-box {
        padding: 0;
    }

    .thumbnail {
        position: relative;
        padding-top: 75%;
        overflow: hidden;
    }

    .thumbnail > .centered {
        position: absolute;
        top: 0;
        bottom: 0;
        left: 0;
        right: 0;
        -webkit-transform: translate(50%, 50%);
        -ms-transform: translate(50%, 50%);
        transform: translate(50%, 50%);
    }

    .thumbnail > .centered > img {
        position: absolute;
        top: 0;
        left: 0;
        max-width: auto;
        height: 100%;
        -webkit-transform: translate(-50%, -50%);
        -ms-transform: translate(-50%, -50%);
        transform: translate(-50%, -50%);
    }

    .img-desc-box {
        padding: 15px;
    }

    .img-desc-box > ul {
        list-style: none;
        padding-left: 0;
    }

    .ellipsis {
        width: 100%;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }

</style>
</head>
<!-- END HEAD -->

<body>
<!--TIPS-->
<!--You may remove all ID or Class names which contain "demo-", they are only used for demonstration. -->
<div id="container" class="effect aside-float aside-bright mainnav-lg">

    <!-- HEADER-NAVBAR -->
    <%@ include file="../../includes/header-navbar.jsp" %>
    <!-- END NAVBAR -->

    <!-- BOXED -->
    <div class="boxed">

        <!-- MAIN-NAV -->
        <%@ include file="../../includes/main-nav.jsp" %>
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
                <h1 class="page-header text-overflow">${ group.teamName }</h1>
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
                        <li class="active">
                            <a href="/groups/${ group.teamId }/posts">게시판</a>
                        </li>
                        <li>
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
                            <i class="fa fa-bars"></i> 사진첩
                        </button>
                        <ul class="dropdown-menu dropdown-menu-left">
                            <li><a href="/groups/${ group.teamId }">홈</a></li>
                            <li><a href="/groups/${ group.teamId }/member">구성원</a></li>
                            <li><a href="/groups/${ group.teamId }/schedule">모임일정</a></li>
                            <li><a href="/groups/${ group.teamId }/photos">사진첩</a></li>
                            <li class="active"><a href="/groups/${ group.teamId }/posts">게시판</a></li>
                            <li><a href="/groups/${ group.teamId }/chat">채팅</a></li>
                            <li class="divider"></li>
                            <li><a href="/groups/${ group.teamId }/settings">설정</a></li>
                        </ul>
                    </div>
                    <!--===================================================-->

                    <!--Tabs Content-->
                    <div class="tab-content">
                        <div class="content-box">



                            <div class="panel">
                                <div class="panel-body">

                                    <!-- Newsfeed Content -->
                                    <!--===================================================-->
                                    <div class="media-block">
                                        <div class="media-body">
                                            <div class="media media-userinfo">
                                                <a class="media-left" href="#"><img class="img-circle img-sm" alt="Profile Picture" src="${ user.memPhoto }"></a>
                                                <div class="pad-btm">
                                                    <div class="text-semibold media-heading">${ post.postTitle }</div>
                                                    <a href="#" class="btn-link text-semibold box-inline">${ post.postNickname }</a><span class="text-muted text-sm pad-lft"><i class="fa fa-clock-o"></i> ${ post.postRegdate } <i class="fa fa-eye"></i> ${ post.postHit }</span>
                                                </div>
                                            </div>

                                            <div class="media media-content">
                                                <p class="pad-top">${ post.postContent }</p>
                                            </div>

                                            <div class="media media-button">
                                                <div class="media-right">
                                                    <c:if test="${ loginVO.memId eq user.memId }">
                                                        <a href="/groups/${ group.teamId }/posts/${ post.postId }/edit"><button class="btn btn-warning">수정</button></a>
                                                        <a href="/groups/${ group.teamId }/posts/${ post.postId }/delete"><button class="btn btn-danger">삭제</button></a>
                                                    </c:if>
                                                    <a href="/groups/${ group.teamId }/posts"><button class="btn btn-default">목록</button></a>
                                                </div>
                                            </div>


                                            <!-- Comments -->
                                            <div class="mar-top pad-top bord-top">
                                                <div class="media">
                                                    <i class="demo-pli-speech-bubble-3 icon-lg "></i>
                                                    <span class="text-bold">${ fn:length(comments) }</span>
                                                </div>


                                                <div id="comment-input-box" class="media form-group">
                                                    <textarea class="form-control" rows="5" placeholder="댓글을 입력하세요" style="resize: none;"></textarea>
                                                    <div class="mar-top clearfix">
                                                        <button class="btn btn-sm btn-primary pull-right"><i class="demo-psi-right-4 icon-fw"></i> 댓글쓰기</button>
                                                    </div>
                                                </div>


                                                <div id="comment-container">
                                                    <c:forEach var="item" items="${ comments }">
                                                        <div class="media pad-btm">
                                                            <a class="media-left" href="#"><img class="img-circle img-xs" alt="Profile Picture" src="${ item.memPhoto }"></a>
                                                            <div class="media-body">
                                                                <div>
                                                                    <a href="#" class="btn-link text-semibold media-heading box-inline">${ item.cmtNickname }</a>
                                                                    <small class="text-muted pad-lft">${ item.cmtRegdate }</small>
                                                                </div>
                                                                    ${ item.cmtContent }
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                </div>


                                            </div>
                                        </div>
                                    </div>
                                    <!--===================================================-->
                                    <!-- End Newsfeed Content -->

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
    <%@ include file="../../includes/footer.jsp" %>
    <!-- END FOOTER -->

</div>
<!-- END CONTAINER -->

<script>
    $(document).ready(function() {
        $('#comment-input-box').find('button').on('click', function() {
            var commentDiv = $('#comment-input-box');
            var content = commentDiv.find('textarea');
            var commentContainer = $('#comment-container');
            var message = content.val();

            if (message == null || message == '') {
                return false;
            }

            $.ajax({
                url: '/groups/${ group.teamId }/posts/${ post.postId }/comment',
                type: 'post',
                data: { "postId": ${ post.postId },
                    "brdId" : 23,
                    "cmtContent": message,
                    "tmemId" : ${ loginVO.memId },
                    "cmtNickname": "${ loginVO.memNickname }",
                    "cmtEmail": "${ loginVO.memEmail }"
                },
                dataType: 'json',
                success: function(result) {
                    if (Number(result.postId) > 0) {
                        var commentData = '<div class="media pad-btm">'
                            + 	'<a class="media-left" href="#"><img class="img-circle img-xs" alt="Profile Picture" src="' + result.memPhoto + '"></a>'
                            +	'<div class="media-body">'
                            + 		'<div>'
                            + 			'<a href="#" class="btn-link text-semibold media-heading box-inline">' + result.cmtNickname + '</a>'
                            + 			'<small class="text-muted pad-lft">' + result.cmtRegdate + '</small>'
                            + 		'</div>'
                            +     result.cmtContent
                            + 	'</div>'
                            + '</div>';

                        commentContainer.prepend(commentData);

                        content.val('');
                    } else {
                        alert('잠시후 다시 작업을 진행해주세요.');
                    }
                },
                error: function(e) {
                    console.log(e.responseText);
                }
            });
        });

        $('.media-button .btn-danger').on('click', function() {
            if (confirm('삭제하시겠습니까?')) {
                return true;
            }
            return false;
        });
    });
</script>

<%-- for modal --%>
<c:if test="${ !empty loginVO }">
    <%@ include file="../../includes/modals.jsp" %>
</c:if>
<%-- for modal --%>
</body>
</html>