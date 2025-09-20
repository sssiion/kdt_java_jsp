

function openZipcode() {
    daum.postcode.load(function() {
    new daum.Postcode({
                oncomplete: function(data) {
                    console.log(data);
                    console.log(data.zonecode);

                    var roadAddr = '';
                    var jibunAddr = '';
                    if(data.userSelectedType === 'R'){
                        roadAddr = data.roadAddress;
                        console.log(roadAddr);
                    }else{
                        jibunAddr = data.jibunAddress;
                    }   
                    var number =document.getElementById('member_post');
                    var addr  =document.getElementById('member_addr');

                    number.value = data.zonecode;
                    number.innerHTML= data.zonecode;
                    if(roadAddr !== ''){
                        document.getElementById('member_addr').value = roadAddr;
                        document.getElementById('member_addr').innerHTML = roadAddr;
                        
                    }else if(jibunAddr !== ''){
                        document.getElementById('member_addr').value = jibunAddr;
                    }
                }
    }).open({
    autoClose: true //기본값 true
});
  
    });
}

function birthdayinput(inputValue){

    if((/^[0-9]{6}$/).test(inputValue)){
        const year = "20"+inputValue.substring(0, 2);
        const month = inputValue.substring(2, 4);
        const day = inputValue.substring(4, 6);
        yeartext.value = year;
        monthtext.value = month;
        daytext.value = day;
         birthmessage.innerHTML="";
        
    }else if(inputValue.length > 1 && inputValue.length < 6){
        birthmessage.innerHTML = "생년월일 6자리를 정확히 입력해주세요.";
    }

}
function residentnumber(inputValue){
    const outputElement = document.getElementById("numberic_pre").value;
    if((/^[0-9]{7}$/).test(inputValue)){
        numberic_message.innerHTML="";
        const number = [2,3,4,5,6,7,8,9,2,3,4,5];
        
        
        var arr=[...outputElement+inputValue];
        var result = [];
        for(i=0; i<arr.length-1; i++){
            result.push(number[i] * arr[i]);
        }
        var sum =0;
        result.forEach(num => {
            sum += num;
        })
        console.log(sum);
        sum = sum % 11;
        sum = 11 - sum;
        if(sum >= 10){
            sum = sum -10;
        }
    
        if(Number(sum) === Number(arr[arr.length-1])){
            numberic_message.innerHTML = "올바른 주민등록번호입니다.";
            numberic_message.style.color = "blue";
        }else{
            numberic_message.innerHTML="올바르지 않은 주민등록번호입니다.";
            numberic_message.style.color = "red";
            return false;
        }
        return true;


    }
    else if(inputValue.length === 0){
         numberic_message.innerHTML = "예) 123456-1234567";
    }
    else{
        numberic_message.innerHTML = "주민등록번호 7자리를 정확히 입력해주세요.";
    }
}
function emailchange(inputValue){
    console.log(inputValue);
    const outputElement = document.getElementById("email_last");
    
    if(inputValue === "direct"){
        outputElement.readOnly = false;
    }
    else{
        outputElement.readOnly = true;
        outputElement.innerHTML = inputValue;
        outputElement.value = inputValue;
    }


}
function idpwcheck(id, message){
    const outputElement = document.getElementById(id);
    var inputValue = outputElement.value;
    const messageElement = document.getElementById(message);
    messageElement.style.color = "red";
    if((/^[A-Za-z0-9]{4,12}$/).test(inputValue) === false){
        messageElement.innerHTML = " 4~12자의 영문 대소문자와 숫자로만 입력해주세요.";
        outputElement.value = "";
        outputElement.focus();
        return false;
    }else{
        messageElement.style.color = "blue";
        messageElement.innerHTML = "사용가능한 "+id+"입니다.";
        return true;
    }
}
function totalcheck(){

	return idpwcheck("Id", "Idmessage")&&
    idpwcheck("pw", "Passwordmessage")&&
	passwordcheck()&&
	nullchenk("fullname")&&
	 nullchenk("email_pre")&&
	 nullchenk("email_last")&&
	nullchenk("numberic_pre")&&
	nullchenk("numberic_last")&&
	hobbycheck()&&
	nullchenk("member_addr")&&
	textboxcheck();
	

}
function nullchenk(value){
    const outputElement = document.getElementById(value);
    if(outputElement.value.length === 0){
        alert("필수입력항목입니다.");
        outputElement.focus();
        
        return false;
    }return true;
}
function hobbycheck(){
    
    if($('input[class="hobbybox"]:checked').is(':checked') === false){
        alert("관심분야를 1개이상 선택해주세요.");
        return false;
    }return true;
}
function textboxcheck(){
    const textbox= document.getElementById("textbox");
    if(textbox.value.length < 20){
        alert("자기소개는 20자이상 작성해주세요.");
        textbox.focus();
        return false;
    }return true;
}
function passwordcheck(){
    const password = document.getElementById("pw");
    const passwordcheck = document.getElementById("Passwordcheck");
    const passwordmessage = document.getElementById("passwordcheckmessage");
    if(password.value !== passwordcheck.value){
        passwordmessage.style.color = "red";
        passwordmessage.innerHTML = "비밀번호가 일치하지 않습니다.";
        passwordcheck.value = "";
        passwordcheck.focus();
        return false;
    }
    passwordmessage.innerHTML ="";
    return true;
}