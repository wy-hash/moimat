<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<h1>정모목록</h1>
	<c:forEach items="${meetlist }" var="list" >
	<div class="card mb-3" style="width: 540px;">
		<div class="row no-gutters">
			<div class="col-md-4">
			<!-- 임시용 사진 -->
				<img src="/resources/img/221.png" class="card-img" alt="..." style="height: 100%;">
			</div>
			<div class="col-md-8">
				<div class="card-body">
					<h5 class="card-title">${list.title }</h5>
					<p class="card-text">${list.content }</p>
					<p class="card-text">${list.payment }</p>
					<p class="card-text">
						<small class="text-muted">Last updated 3 mins ago</small>
					</p>
				</div>
			</div>
		</div>
	</div>
	</c:forEach>
</div>
</body>
</html>