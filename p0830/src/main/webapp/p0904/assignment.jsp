<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="javax.sql.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<!DOCTYPE html>
<%
request.setCharacterEncoding("utf-8");
int count=1;
String result = "";
Connection conn=null;
String sql= "SELECT * FROM assign";

try{
	Context init = new InitialContext();
	DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQLDB");
	conn=ds.getConnection();
	PreparedStatement stmt = conn.prepareStatement(sql);
	
	ResultSet rs = stmt.executeQuery();
	
	while(rs.next()){
		result += ("<h6>"+count++ +" : "+rs.getString(1)+", "+rs.getString(2)+"</h6><br>");
		
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
	<h3>이벤트 등록</h3>
	<hr>
	<form action="inputsql.jsp" method="post">
		<label>등록이름:</label><input type="text" name="name" />
		<label>email 주소:</label> <input type="text" name="email" />
		<input type="submit"/>
	</form>
	<hr>
	<h5>#등록목록</h5>
	<%
		out.print(result);
	%>
	
</body>
</html>