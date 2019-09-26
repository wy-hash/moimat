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
	${domain.seq}
	${domain.talk}
	${domain.postTypeSeq}memberSeq
	${domain.memberSeq}
	
	<form method="post" action="fileupload" enctype="multipart/form-data">
         <label>email:</label>
         <input type="text" name="email">
         <br><br>
         <label>파일:</label>
         <input type="file" name="files" multiple>
         <br><br>
        <input type="submit" value="upload">
	</form>

	
</body>
</html>