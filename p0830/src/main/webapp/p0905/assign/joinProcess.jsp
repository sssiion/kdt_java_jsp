<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.sql.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String userNumber = request.getParameter("numberic_pre")+request.getParameter("numberic_last");
	String intro =request.getParameter("intro");
	String name = request.getParameter("name");
	String addr = request.getParameter("addr_number");
	String email= request.getParameter("email_pre")+"@"+request.getParameter("email_last");
	
	Connection conn=null;
	
	String sql= "INSERT INTO login (Id,Pw,auth,userNumber, intro, addr, Name, email) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQLDB");
		conn=ds.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);

		stmt.setString(1, id);
		stmt.setString(2, pw);
		stmt.setBoolean(3, false);
		stmt.setString(4,userNumber);
		stmt.setString(5,intro);
		stmt.setString(6,addr);
		stmt.setString(7,name);
		stmt.setString(8, email);
		stmt.executeUpdate();
		// alter 로 회원가입되었습니다.
		
	}catch(Exception e){
		out.print("<h3>레코드가 등록실패</h3>");
		e.printStackTrace();
	}
	
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