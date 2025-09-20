<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="javax.sql.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
request.setCharacterEncoding("utf-8");
String result = "";
int count=1;
Connection conn=null;
String sql= "SELECT * FROM login";

try{
	Context init = new InitialContext();
	DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQLDB");
	conn=ds.getConnection();
	PreparedStatement stmt = conn.prepareStatement(sql);
	
	ResultSet rs = stmt.executeQuery();
	
	while(rs.next()){
		String id = rs.getString(1);
		result += ("<input type=\"radio\" name=\"id\" value="+id+">"+count++ +" :<a href=\"Member_into.jsp?id="+id+"\">"+id+ " </a>"+ rs.getString(2)+"</input><br>");
		
	}
}catch(Exception e){
	out.print("<h3>레코드가 등록실패</h3>");
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
<form method="post" action="Member_delete.jsp">
<%
	out.print(result);
%>
<input type="submit" value="삭제" />
</form>

</body>
</html>