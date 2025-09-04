<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="javax.sql.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("name");
	String email = request.getParameter("email");
	Connection conn=null;
	
	String sql= "INSERT INTO assign (name,email) VALUES (?, ?)";

	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQLDB");
		conn=ds.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);

		stmt.setString(1, name);
		stmt.setString(2, email);
		stmt.executeUpdate();
	
		
	}catch(Exception e){
		out.print("<h3>레코드가 등록실패</h3>");
		e.printStackTrace();
	}
	
	response.sendRedirect("assignment.jsp");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>