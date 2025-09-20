<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");
%>
<html>
<head>
<meta charset="UTF-8">
    <title>Project 1</title>
    <link rel="stylesheet" type="text/css" href="css.css"/> 
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="script.js"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Dongle&family=Mozilla+Headline:wght@200..700&family=Nanum+Pen+Script&display=swap');
    </style>
</head>
<body>
<form action="joinProcess.jsp" method="post">
		<table>
        <!-- 1행: 병합된 셀 -->
        <tr>
            <td colspan="2" class="merged-cell">회원 기본 정보</td>
        </tr>
        
        <!-- 2-6행: 일반 2열 -->
        <tr>
            <td class="dongle-regular">아이디:</td>
            <td><input type="text" id="Id" name="id"/><div style="display: inline-block; padding-left: 10px;" id="Idmessage">  4~12자의 영문 대소문자와 숫자로만 입력</div></td>
        
        </tr>
        <tr>
            <td>비밀번호:</td>
            <td><input type="password" id="pw" name="pw"/><div style="display: inline-block; padding-left: 10px;" id="Passwordmessage"> 4~12자의 영문 대소문자와 숫자로만 입력</div></td>
        </tr>
        <tr>
            <td>비밀번호확인:</td>
            <td><input type="password" id="Passwordcheck" /><div id="passwordcheckmessage" style="display: inline-block; padding-left:10px;"> </div></td>
        </tr>
        <tr>
            <td>메일주소:</td>
            <td><input type="text" style="width: 60px;" id="email_pre" name="email_pre"/> @ <input name="email_last" id="email_last" type="text" style="width: 80px;" readonly />
                <div style="display: inline-block;"> 
                    <select oninput="emailchange(this.options[this.selectedIndex].value)">
                         <option value="">------</option>
                        <option value="naver.com">naver.com</option>
                        <option value="daum.net">daum.net</option>
                        <option value="gmail.com">gmail.com</option>
                        <option value="nate.com">nate.com</option>
                        <option value="hotmail.com">hotmail.com</option>
                        <option value="direct">직접입력</option>
                    </select>
                </div></td>
        </tr>
        <tr>
            <td>이름:</td>
            <td><input type="text" style="width: 70px;" id="fullname" name="name"/></td>
        </tr>
        
        <!-- 7행: 병합된 셀 -->
        <tr>
            <td colspan="2" class="merged-cell">개인 신상 정보</td>
        </tr>
        
        <!-- 8-11행: 일반 2열 -->
        <tr>
            <td>주민등록번호:</td>
            <td>
                <input name="numberic_pre" id="numberic_pre" type="text" maxlength="6" oninput="birthdayinput(this.value)"style="background-color:white;"> -</input> <input name="numberic_last" id="numberic_last" type="password" maxlength="7" oninput="residentnumber(this.value)"></input>
                <div id="numberic_message" style="display:inline-block;"> 예) 123456-1234567</div>
            </td>
        </tr>
        <tr>
            <td>생일:</td>
            <td>
                <div class="birthbox">
                    <input id="yeartext" type="text" readonly> 년</input>
                    <input id="monthtext" class="birth" type="text" readonly> 월</input>
                    <input id="daytext"  class="birth" type="text" readonly> 일</input>
                    <div id="birthmessage" style="color:red;"> </div>
                </div>    
            </td>
        </tr>
        <tr>
            <td>관심분야:</td>
            <td>
                <label for="hob1" class="hlabel">
                <input id="hob1" class="hobbybox" type="checkbox">컴퓨터</input></label>
                <label for="hob2" class="hlabel">
                <input id="hob2" class="hobbybox" type="checkbox">인터넷</input></label>
                <label for="hob3" class="hlabel">
                <input id="hob3" class="hobbybox" type="checkbox"> 여행 </input></label>
                <label for="hob4" class="hlabel">
                <input id="hob4" class="hobbybox" type="checkbox">음악감상</input></label>
            </td>
        </tr>
        <tr>
            <td>주소: </td>
            <td ><div id="memberbox" >
                    <div name="addr_number" id="member_post"  placeholder="우편번호"style="background-color:white;" ></div>
                    <div onclick="openZipcode()" id="addressbutton" >우편번호</div>
                </div>

                <input  id="member_addr" type="text" placeholder=지번 readonly ></input><br>
                <input name="addr_last" id="totaladdress" type="text" placeholder=상세주소  ></input>
            </td>
        </tr>
        <tr>
            <td>자기소개:</td>
            <td><textarea name="intro" id="textbox" type="text" placeholder="20자이상 작성해주세요. "></textarea></td>
        </tr>
    </table>
<div>
    <input class="buttoncss" type="submit" value="회원가입" onclick="return totalcheck()" />
    <div></div>
    <button class="buttoncss" type="reset">초기화</button>
</div>
</form>
</body>
</html>