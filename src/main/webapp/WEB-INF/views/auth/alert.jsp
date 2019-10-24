<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<!-- HEAD -->
<%@ include file="../includes/head.jsp"%>
<title>Page Template | moim@</title>
<link href="/resources/plugins/transactional-email-templates/templates/styles.css" media="all" rel="stylesheet" type="text/css" />
</head>

<body>

<table class="body-wrap">
    <tr>
        <td></td>
        <td class="container" width="600">
            <div class="content">
                <table class="main" width="100%" cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="alert alert-good text-center">
                            	<strong><h3 class="mar-no" style="color: white;">임시비밀번호가 메일로 발송되었습니다.</h3></strong>
                        </td>
                    </tr>
                    <tr>
                        <td class="content-wrap">
                            <table width="100%" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="content-block">
                                        	임시비밀빈호가 메일 (<strong>${email}</strong>) 로 발송되었습니다.
                                    </td>
                                </tr>
                                <tr>
                                    <td class="content-block">
                                        	임시비밀번호로 로그인 후 비밀번호를 변경해 주세요.
                                    </td>
                                </tr>
                                <tr>
                                    <td class="content-block">
                                        <a href="/auth/login" class="btn-primary">로그인 하러가기</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="content-block">
                                        2019 moim@
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <div class="footer">
                    <table width="100%">
                        <tr>
                            <td class="aligncenter content-block"><a href="/home">&#0169; 2019 moim@</a></td>
                        </tr>
                    </table>
                </div></div>
        </td>
        <td></td>
    </tr>
</table>

</body>
</html>

