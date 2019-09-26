<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<table width="500" cellpadding="0" cellspacing="0" border="1">
		<form action="write" method="post">
			<tr>
				<td> 이름 </td>
				<td> <input type="text" name="name" size = "50"> </td>
			</tr>
			<tr>
				<td> 이메일 </td>
				<td> <input type="text" name="email" size = "50"> </td>
			</tr>
			<tr>
				<td> id </td>
				<td> <input type="text" name="id" size="50" ></textarea> </td>
			</tr>
			<tr>
				<td> pw </td>
				<td> <input type="text" name="pw" size = "50"> </td>
			</tr>
			<tr>
				<td> 생년월일 </td>
				<td> <input type="text" name="birth" size = "50"> </td>
			</tr>
			<tr>
				<td> 핸드폰번호 </td>
				<td> <input type="text" name="phonenumber" size = "50"> </td>
			</tr>
			<tr>
				<td> 성별 </td>
				<td> <input type="text" name="gender" size = "50"> </td>
			</tr>
			<tr >
				<td colspan="2"> <input type="submit" value="입력"> &nbsp;&nbsp; <a href="list">목록보기</a></td>
			</tr>
		</form>
	</table>
	
</body>
</html>