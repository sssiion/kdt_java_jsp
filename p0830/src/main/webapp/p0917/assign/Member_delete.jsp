<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.sql.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
Connection conn=null;
String result ="";

String sql= "DELETE FROM login WHERE Id= ?";
try{
	Context init = new InitialContext();
	DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQLDB");
	conn=ds.getConnection();
	
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setString(1, id);
	int rs = stmt.executeUpdate();
	
	if(rs == 1){
		
		result= "<script>alert(\"삭제성공\")</script>";
	}
	

	if(stmt!=null) stmt.close();
	if(conn!= null) conn.close();
	response.sendRedirect("Member_list.jsp");
	
}catch(Exception e){
	e.printStackTrace();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


</body>
</html>