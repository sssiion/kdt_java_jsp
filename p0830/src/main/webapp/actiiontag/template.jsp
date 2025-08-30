<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String p = request.getParameter("page");
	if(p == null ){
		p = "newitem";
	}
	p =p+ ".jsp";
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1" style="width:100%">
	<tr>
		<td colspan="2">
			<jsp:include page="top.jsp"></jsp:include>
		</td>
		
	</tr>
	<tr>
		<td>
			<jsp:include page="left.jsp"></jsp:include>
		</td>
		
		<td>
			<jsp:include page="<%=p%>"/>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<jsp:include page="bottom.jsp"></jsp:include>
		</td>
	</tr>
		
</table>
</body>
</html>