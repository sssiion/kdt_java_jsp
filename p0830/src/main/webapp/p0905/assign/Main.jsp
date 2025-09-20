<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
request.setCharacterEncoding("utf-8");
String id = (String)session.getAttribute("id");

out.print("<h4 style=\"display:block;\">"+id+"님 반갑습니다</h4>");
String result= "";
boolean auth = (Boolean)session.getAttribute("auth");

if(auth==true){
	result = "<form method=\"post\" action=\"Member_list.jsp\"> <input type=\"submit\" value=\"member list\"/></form>";
			
}else{
	result="";
}

if(id==""){
	response.sendRedirect("loginForm.jsp");
}
%>
<html>
<head>
<meta charset="UTF-8">
<title>dd</title>
</head>
<body>
<%
 out.print(result);
%>
<form action="logout.jsp" method="post">
<input type="submit" value="로그아웃" />
</form>
<form action="setting.jsp" method="post">
<input type="submit" value="정보수정" />
</form>
</body>
</html>