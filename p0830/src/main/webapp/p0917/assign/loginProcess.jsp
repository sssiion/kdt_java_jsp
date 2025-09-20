<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.sql.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String pw = request.getParameter("pw");


Connection conn=null;

boolean isAdmin = false; boolean loginSuccess = false;
String sql= "SELECT  Pw,auth,userNumber, intro, addr, Name, email FROM login WHERE Id= ?";
try{
	Context init = new InitialContext();
	DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQLDB");
	conn=ds.getConnection();
	
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setString(1, id);
	ResultSet rs = stmt.executeQuery();
	
	// 해당 아이디 존재
	if(rs.next()){
		String dbpw = rs.getString("Pw");
		if(pw.equals(dbpw)){
			loginSuccess= true;
			isAdmin= rs.getBoolean("auth");
			session.setAttribute("id", id);
			session.setAttribute("pw",pw);
			session.setAttribute("auth", false);
			session.setAttribute("userNumber", rs.getString("userNumber"));
			session.setAttribute("intro", rs.getString("intro"));
			session.setAttribute("addr", rs.getString("addr"));
			session.setAttribute("Name", rs.getString("Name"));
			session.setAttribute("email", rs.getString("email"));
			if(isAdmin){
				session.setAttribute("auth", true);
			}
		}
		
		
	}else{
		id= "없는 아이디 입니다";
	}
	if(rs != null) rs.close();
	if(stmt!=null) stmt.close();
	if(conn!= null) conn.close();
	
}catch(Exception e){
	e.printStackTrace();
}
if(loginSuccess){
	response.sendRedirect("Main.jsp");
}else{
	out.print("<h3>정보 없음</h3>");
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