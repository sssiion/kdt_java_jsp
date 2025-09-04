<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.sql.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<!DOCTYPE html>
<%
	Connection conn=null;
	String sql= "SELECT * FROM student";


	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQLDB");
		conn=ds.getConnection();
		//PreparedStatement stmt = conn.prepareStatement(sql);
		Statement stmt = conn.createStatement();
	
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			out.println("<h3>"+rs.getInt(1)+","+rs.getString(2)+"</h3>");
		}
		
	}catch(Exception e){
		out.print("<h3>레코드가 등록실패</h3>");
		e.printStackTrace();
	}
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


</body>
</html>