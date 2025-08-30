<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String name = (String)application.getAttribute("name");
	String id = (String)application.getAttribute("id");
	String addr = (String)session.getAttribute("addr");
	String phone = (String)session.getAttribute("phone");
	String email = (String)session.getAttribute("email");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>영역과 속성 테스트</h2>
<table border="1">
	<tr>
		<td colspan="2">
			application 영역에 저장할 내용들
		</td>
	<tr>
	<tr>
		<td>이름</td>
		<td>
			<%=name %>
		</td>
	</tr>
	<tr>
		<td>아이디</td>
		<td>
			<%=id %>
		</td>
	</tr>
</table>

<table border="1">
	<tr>
		<td colspan="2">
			session 영역에 저장할 내용들
		</td>
	<tr>
	<tr>
		<td>address</td>
		<td>
			<%=addr %>
		</td>
	</tr>
	<tr>
		<td>phone</td>
		<td>
			<%=phone %>
		</td>
	</tr>
	<tr>
		<td>email</td>
		<td>
			<%=email %>
		</td>
	</tr>
</table>
</body>
</html>