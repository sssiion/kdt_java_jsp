<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
session.setAttribute("id", "");
session.setAttribute("pw", "");
session.setAttribute("auth", false);
response.sendRedirect("loginForm.jsp");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>