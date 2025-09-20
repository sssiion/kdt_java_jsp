<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");
%>
<html>
<head>
<link  rel="stylesheet" type="text/css" href="logincss.css"/>
</head>
<body>

<div class="login-wrap">
  <div class="login-html">
    <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Sign In</label>
    <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">Sign Up</label>
    <div class="login-form">
      <div class="sign-in-htm">
       <form action="loginProcess.jsp" method="post">
        <div class="group">
          <label for="user" class="label">Username</label>
          <input name="id" id="user" type="text" class="input">
          <div style="background-color:inherit; height:3px; display:block;"></div>
          <input name="pw"  type="text" class="input">
        </div>
        
        
        <div class="group">
          <input type="submit" class="button" value="Sign In"></input>
        </div>
        
       </form>
      </div>
      <div class="sign-up-htm">
      <form action="joinForm.jsp" method="post">
        <div class="group">
        	회원가입
          <input id="user" type="submit" class="input" value="회원가입"/>
        </div>
      </form>
      </div>
    </div>
  </div>



</body>
</html>