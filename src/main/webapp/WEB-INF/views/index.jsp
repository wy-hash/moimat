<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>


	<h2>sample domain info.</h2>

		
	<c:choose>
	    <c:when test="${empty memberVO }">
	    	<a href="loginPage">로그인</a>
	    </c:when>
	 
	    <c:when test="${!empty memberVO}">
	    
	    	id: ${memberVO.id}<br>
			name: ${memberVO.name}<br>
	     	 <a href="logoutAction">로그아웃</a>
	     	 <a href="/groups/1">1번모임</a>
	    </c:when>
	</c:choose>

</body>
</html>