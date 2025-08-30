<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	application.setAttribute("name", name);
	application.setAttribute("id", id);
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>영역과 속성 테스트</h2>
<%=name %> 반갑습니다.
<%=name%>님의 아이디는 <%=id %>입니다.
<form method=post action="attributeTest2.jsp">
<table border="1">
	<tr>
		<td colspan="2">
			session 영역에 저장할 내용들
		</td>
	<tr>
	<tr>
		<td>e-mail주소</td>
		<td>
			<input type="text" name="email"/>
		</td>
	</tr>
	<tr>
		<td>집 주소</td>
		<td>
			<input type="text" name="addr"/>
		</td>
	</tr>
	<tr>
		<td>전화번호</td>
		<td>
			<input type="text" name="phone"/>
		</td>
	</tr>
	<tr>
		<td>
			<input type="submit" value="전송"/>
		</td>
	</tr>
</table>
</form>
</body>
</html>