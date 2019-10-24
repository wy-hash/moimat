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
                        <c:if test="${tmem.tmemLevel > 7}">
                        <li>
                            <a href="/groups/${ group.teamId }/settings">설정</a>
                        </li>
                        </c:if>
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
                            <c:if test="${tmem.tmemLevel > 7}">
                            <li class="divider"></li>
                            <li><a href="/groups/${ group.teamId }/settings">설정</a></li>
                            </c:if>
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
                                                        <a id="modBtn" data-action="/groups/${ group.teamId }/posts/${ post.postId }/edit"><button class="btn btn-warning">수정</button></a>
                                                        <a id="delBtn" data-action="/groups/${ group.teamId }/posts/${ post.postId }/delete"><button class="btn btn-danger">삭제</button></a>
                                                    </c:if>
                                                    <button id="listBtn" class="btn btn-default">목록</button>
                                                </div>
                                            </div>
											<form id="actionForm" action="/groups/${ group.teamId }/posts" method="get">
												<input type="hidden" name="pageNum" value="${cri.pageNum}">
												<input type="hidden" name="type" value="${cri.type}">
												<input type="hidden" name="keyword" value="${cri.keyword}">
											</form>

                                            <!-- Comments -->
                                            <div class="mar-top pad-top bord-top">
                                                <div class="media">
                                                    <i class="demo-pli-speech-bubble-3 icon-lg "></i>
                                                    <span class="text-bold" id="cmtCounter">${ fn:length(comments) }</span>
                                                </div>


                                                <div id="comment-input-box" class="media form-group">
                                                    <textarea class="form-control" rows="5" placeholder="댓글을 입력하세요" style="resize: none;"></textarea>
                                                    <div class="mar-top clearfix">
                                                        <button class="btn btn-sm btn-primary pull-right"><i class="demo-psi-right-4 icon-fw"></i> 댓글쓰기</button>
                                                    </div>
                                                </div>


                                                <div id="comment-container">
                                                    <c:forEach var="item" items="${ comments }">
                                                        <div class="media pad-btm" data-cmtid="${ item.cmtId }">
                                                            <a class="media-left" href="#"><img class="img-circle img-xs" alt="Profile Picture" src="${ item.memPhoto }"></a>
                                                            <div class="media-body">
                                                                <div class="user-info">
                                                                    <a href="#" class="btn-link text-semibold media-heading box-inline">${ item.cmtNickname }</a>
                                                                    <small class="text-muted pad-lft"><span>${ item.cmtRegdate }</span>
                                                                        <c:if test="${ loginVO.memId eq item.memId }">
                                                                        <a class="cmtMod"  data-cmtid="${item.cmtId }" style="cursor: pointer;"> 수정 </a>|
                                                                        <a class="cmtDelete" data-cmtid="${item.cmtId }" style="cursor: pointer;"> 삭제</a>
                                                                        </c:if>
                                                                    </small>
                                                                </div>
                                                                <div class="cmt-content">
                                                                        ${ item.cmtContent }
                                                                </div>
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

</div>
<!-- END CONTAINER -->

<!-- modal for 덧글 수정 -->
<div class="modal" id="modalMod" tabindex="-1"  style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <!--Modal header-->
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="pci-cross pci-circle"></i></button>
                <h4 class="modal-title">댓글 수정</h4>
            </div>

            <form id="modalModForm" action="/groups/${ group.teamId }/photos/${ post.postId }/comment/mod" method="post">
                <!--Modal body-->
                <div class="modal-body">
                    <input type="hidden" name="cmtId">
                    <div class="media form-group">
                        <textarea class="form-control" name="cmtContent" rows="5" placeholder="댓글 내용을 입력하세요." style="resize: none;"></textarea>
                    </div>
                    <p class="text-semibold text-main"> 댓글을 수정하시겠습니까?</p>
                </div>

                <!--Modal footer-->
                <div class="modal-footer">
                    <button data-dismiss="modal" class="btn btn-default" type="button">취소</button>
                    <button id="modalModBtn" class="btn btn-warning" type="button">확인</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- //modal for 덧글 수정 -->
<!--Bootbox Modals [ OPTIONAL ]-->
	<script src="/resources/plugins/bootbox/bootbox.min.js"></script>
<script>
    $(document).ready(function() {
		
    	var actionForm = $("#actionForm");
    	
        // 수정 모달창 오픈
        $(document).on('click', '.cmtMod', function(){ //모달창 오픈 이벤트
            const modalMod = $('#modalMod');
            const cmtId = $(this).attr('data-cmtid');

            modalMod.find('input[name=cmtId]').val(cmtId);
            modalMod.modal('show');

        });
        // 파라미터 유지를 위한 버튼 이벤트
        // 목록을 가기위한 이벤트 
        $("#listBtn").on('click',function(){
        	actionForm.submit();
        });
        // 작성자만 사용하는 버튼에대한 이벤트
        $("#modBtn").on('click',function(){
        	actionForm.attr('action',$(this).data('action'));
        	actionForm.submit();
        });
        $("#delBtn").on('click',function(){
        	bootbox.confirm("게시글을 삭제하시겠습니까.", function(result) {
	            if (result) {
	            	actionForm.attr('action',$(delBtn).data('action'));
	            	actionForm.submit();
	            }else{
	                $.niftyNoty({
	                    type: 'danger',
	                    icon : 'pli-cross icon-2x',
	                    message : '취소하였습니다.',
	                    container : 'floating',
	                    timer : 5000
	                });
	            };
	        });
        });

        $('#modalModBtn').on('click', function(){
            const url = $('#modalModForm').attr('action');
            const data = $('#modalModForm').serialize();

            $.ajax({
                type: 'POST',
                url: url,
                data : data,
                dataType: 'json'
            }).done(function(result){

                if(result.cmtId > 0){
                    $('#modalMod').find('textarea').val('');
                    $('div[data-cmtid="' + result.cmtId +'"]').find('.cmt-content').text(result.cmtContent);
                    $('div[data-cmtid="' + result.cmtId +'"]').find('small > span').text(result.cmtUpdate);
                    $('#modalMod').modal('hide');

                } else {
                    alert('수정 실패. 잠시 후 다시 시도해주세요.');
                    $('#modalMod').modal('hide');
                }
            });
        });

        $('#comment-input-box').find('button').on('click', function() {
            var commentDiv = $('#comment-input-box');
            var content = commentDiv.find('textarea');
            var commentContainer = $('#comment-container');
            var message = content.val();

            if (message == null || message == '') {
                return false;
            }

            $.ajax({
                url: '/groups/${ group.teamId }/photos/${ post.postId }/comment',
                type: 'post',
                data: { "postId": ${ post.postId },
                    "brdId" : 22,
                    "cmtContent": message,
                    "tmemId" : ${ tmemId },
                    "cmtNickname": "${ loginVO.memNickname }",
                    "cmtEmail": "${ loginVO.memEmail }"
                },
                dataType: 'json',
                success: function(result) {
                    if (Number(result.postId) != null) {
                        var commentData = '<div class="media pad-btm" data-cmtid="' + result.cmtId + '">'
                            + 	'<a class="media-left" href="#"><img class="img-circle img-xs" alt="Profile Picture" src="' + result.memPhoto + '"></a>'
                            +	'<div class="media-body">'
                            + 		'<div class="user-info">'
                            + 			'<a href="#" class="btn-link text-semibold media-heading box-inline">' + result.cmtNickname + '</a>'
                            + 			'<small class="text-muted pad-lft"><span>' + result.cmtRegdate + '</span>'
                            +				'<a class="cmtMod"  data-cmtid="' + result.cmtId + '" style="cursor: pointer;"> 수정 </a>|'
                            +				'<a class="cmtDelete" data-cmtid="' + result.cmtId + '" style="cursor: pointer;"> 삭제</a>'
                            +			'</small>'
                            + 		'</div>'
                            +		'<div class="cmt-content">'
                            +     		result.cmtContent
                            +		'</div>'
                            + 	'</div>'
                            + '</div>';

                        commentContainer.prepend(commentData);
                        $('#cmtCounter').text(Number($('#cmtCounter').text()) + 1);

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

        $(document).on('click', '.cmtDelete', function() {
            if (confirm('삭제하시겠습니까?')) {
                var delid = $(this).data('cmtid');

                $.ajax({
                    type: 'POST',
                    url: '/groups/${ group.teamId }/photos/${ post.postId }/comment/del',
                    data: {cmtId: delid},
                    dataType: 'json',
                    success: function(result) {
                        if (result) {
                            $('div[data-cmtid="' + delid +'"]').remove();
                            $('#cmtCounter').text(Number($('#cmtCounter').text()) - 1);
                        }
                    },
                    fail: function() {
                        alert('잠시후 다시 작업을 진행해주세요.');
                    }
                });

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