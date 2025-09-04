<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.sql.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<!DOCTYPE html>
<%
	Connection conn=null;
	String sql= "INSERT INTO student (num,name) VALUES (? ,?)";
	String[] arr = {"도윤", "성훈", "대원","서연"};
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQLDB");
		conn=ds.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
	
		for(int i=7; i<=10; i++){
			stmt.setInt(1, i);
			stmt.setString(2, arr[i-7]);
			if(stmt.executeUpdate() !=0){
				out.println("<h3>"+i+"번 이름:"+arr[i-7]+" 레코드 등록 </h3>");
			}
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