<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String id= request.getParameter("id");
	String pw= request.getParameter("pw");
	String email_f= request.getParameter("email_f");
	String email_l= request.getParameter("email_l");
	String email = email_f +"@"+ email_l;
	String hnumber_f= request.getParameter("hnumber_f");
	String hnumber_l= request.getParameter("hnumber_l");
	String hnumber = hnumber_f+hnumber_l;
	String intro= request.getParameter("intro");
	String addrnumber= request.getParameter("addrnumber");
	String addr= request.getParameter("addr");
	

%>
<jsp:useBean id="user" class="login.User" scope="page"/>

<jsp:setProperty name="user" property="name" value="<%=name %>" />
<jsp:setProperty name="user" property="id" value="<%=id %>" />
<jsp:setProperty name="user" property="pw" value="<%=pw %>" />
<jsp:setProperty name="user" property="email" value="<%=email %>" />
<jsp:setProperty name="user" property="hnumber" value="<%=hnumber %>" />
<jsp:setProperty name="user" property="intro" value="<%=intro %>" />
<jsp:setProperty name="user" property="addrnumber" value="<%=addrnumber %>" />
<jsp:setProperty name="user" property="addr" value="<%=addr %>" />



<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="logincss.css"/> 
<title>Insert title here</title>
</head>
<body>

 <table >
        <!-- 1행: 병합된 셀 -->
        <tr>
            <td colspan="2" class="merged-cell">회원 기본 정보</td>
        </tr>
        
        <!-- 2-6행: 일반 2열 -->
        <tr>
            <td class="dongle-regular">아이디:</td>
            <td><jsp:getProperty name="user" property="id"/></td>
        
        </tr>
        <tr>
            <td>비밀번호:</td>
            <td><jsp:getProperty name="user" property="pw"/></td>
        </tr>
        
        <tr>
            <td>메일주소:</td>
            <td><jsp:getProperty name="user" property="email"/></td>
        </tr>
        <tr>
            <td>이름:</td>
            <td><jsp:getProperty name="user" property="name" /></td>
        </tr>
        
        <!-- 7행: 병합된 셀 -->
        <tr>
            <td colspan="2" class="merged-cell">개인 신상 정보</td>
        </tr>
        
        <!-- 8-11행: 일반 2열 -->
        <tr>
            <td>주민등록번호:</td>
            <td>
                <jsp:getProperty name="user" property="hnumber"/>
            </td>
        </tr>
        
        
        <tr>
            <td>주소: </td>
            <td ><div id="memberbox" >
                    <jsp:getProperty name="user" property="addrnumber"/>
                    
                </div>

                <jsp:getProperty name="user" property="addr"/><br>
                
            </td>
        </tr>
        <tr>
            <td>자기소개:</td>
            <td><jsp:getProperty name="user" property="intro"/></td>
        </tr>
    </table>








</body>
</html>