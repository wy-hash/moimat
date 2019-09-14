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
	
	${ domain.seq }<br>
	${ domain.post_type_seq }<br>
	${ domain.title }
	${ domain.content }
	${ domain.reqdate }
	${ domain.updatedate }
	${ domain.count }
	${ domain.member_seq }
	${ domain.orgin }
	${ domain.priority }
	${ domain.depth }
</body>
</html>