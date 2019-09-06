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
	
	id: ${ domain.id }<br>
	name: ${ domain.name }<br>
	address: ${ domain.address }
</body>
</html>