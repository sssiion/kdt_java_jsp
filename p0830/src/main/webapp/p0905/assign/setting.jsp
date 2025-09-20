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
	
	String intro =request.getParameter("intro");
	if(intro==null){
		intro= (String)session.getAttribute("intro");
	}
	String name = request.getParameter("name");
	if(name==null){
		name= (String)session.getAttribute("name");
	}
	String addr = request.getParameter("addr_number");
	if(addr==null){
		addr= (String)session.getAttribute("addr");
	}
	String email= request.getParameter("email");
	if(email==null){
		email= (String)session.getAttribute("email");
	}
	Connection conn=null;
	
	String sql= "UPDATE login SET (Pw= ? , intro= ? , addr= ? ,  email= ?) WHERE Id= ?";

	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQLDB");
		conn=ds.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);


		stmt.setString(1, pw);

		stmt.setString(2,intro);
		stmt.setString(3,addr);

		stmt.setString(4, email);
		stmt.setString(5,id);
		stmt.executeUpdate();
		// alter 로 회원가입되었습니다.
		
	}catch(Exception e){
		out.print("<h3>레코드가 등록실패</h3>");
		e.printStackTrace();
	}
	
	response.sendRedirect("Member_into.jsp");
%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>