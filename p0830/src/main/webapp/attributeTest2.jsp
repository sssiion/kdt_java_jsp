<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String email = request.getParameter("email");
	String addr = request.getParameter("addr");
	String phone = request.getParameter("phone");
	session.setAttribute("email", email);
	session.setAttribute("addr", addr);
	session.setAttribute("phone", phone);
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 님의 정보가 모두 저장되었습니다.
 <p><a href="attributeTest3.jsp" style="border:0px; background-color:0px;">확인하러 가기</a></p>
</body>
</html>