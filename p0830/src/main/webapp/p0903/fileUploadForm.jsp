<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");



%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="fileupload.jsp" method="post" enctype = "multipart/form-data" >
	
	<table border="1" >
		<tr >
			<td colspan="2" style="text-align:center;" > 파일 업로드 폼 </td>
		</tr>
		<tr>
			<td>올린 사람: </td>
			<td> <input type="text" name="name" /> </td>
		</tr>
		<tr>
			<td> 제목: </td>
			<td> <input type="text" name="subject" /> </td>
		</tr>
		<tr>
			<td> 파일명1: </td>
			<td> <input type="file" name="filename1"/> </td>
		</tr>
		<tr> 	
			<td> 파일명2:</td>
			<td> <input type="file" name="filename2"/> </td>
		</tr>
		<tr >
			<td colspan="2" style="text-align:center;"> <button>전송</button> </td>
		</tr>
	</table>
</form>

</body>
</html>