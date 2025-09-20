<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.sql.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<!DOCTYPE html>

<%
request.setCharacterEncoding("utf-8");
String id = (String)session.getAttribute("id");
String pw = (String)session.getAttribute("pw");
boolean auth = (Boolean)session.getAttribute("auth");
String userNumber = (String)session.getAttribute("userNumber");
String intro = (String)session.getAttribute("intro");
String addr = (String)session.getAttribute("addr");
String name = (String)session.getAttribute("name");
String email = (String)session.getAttribute("email");


%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form acton="setting.jsp" method="post">


아이디: <%=id %>
비밀번호:  <input type="text" name="pw" value="<%=pw %>" />
이메일:   <input type="text" name="email"value="<%=email %>" />

<input type="submit" value = "정보 변경" />
</form>
</body>
</html>