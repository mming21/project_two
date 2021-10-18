<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.text-rainbow {
  background-image: linear-gradient(90deg, red, orange, yellow, green, blue, navy, purple);
  -webkit-background-clip: text;
  color: transparent;

  font-weight: bold;
  font-size: 40px;
}
div{
	width : 300px;
	margin-left: auto;
	margin-right: auto;
}
</style>
<body>
<script src="/jquery-3.2.1.min.js"></script>
<script>
/* function btn(){
    alert('Complete!');
}
function idchk(){
	if (document.id == ""){
		alert("Input ID first!")	
		history.back()
		return false;
	}else{
		return true;
	}
} */
//필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
function checkValue()
{
    if(!document.userInfo.id.value){
        alert("아이디를 입력하세요.");
        return false;
    }
    
    if(!document.userInfo.pw.value){
        alert("비밀번호를 입력하세요.");
        return false;
    }
    
    // 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
    if(document.userInfo.pw.value != document.userInfo.pwchk.value ){
        alert("비밀번호를 동일하게 입력하세요.");
        return false;
    }
}

// 취소 버튼 클릭시 로그인 화면으로 이동
function goLoginForm() {
    location.href="main";
}
//출처: https://all-record.tistory.com/115 [세상의 모든 기록]

function idCheck() {
	var id=$("#id").val();
	
	$.ajax({
		url:'/idCheck',
		type:'post',
		data:{'id': id},
		dataType:'json',
		success: function(count){
			if(count>0){
				alert("해당아이디가 존재합니다.");
			}else{
				alert("사용가능한 아이디 입니다.")
			}
		},//success
		error:function(e){alert("error")}
	});
}


/*출처: https://yulfsong.tistory.com/67 [Code Writer]*/
/* 
function email(){
	var email = document.userInfo.email.value+"@"+$(domains option:selected).val;
	$.ajax({
		url:'/idCheck',
		type:'post',
		data:{'email': email},
		dataType:'json',
		success: function(count){
			if(count>0){
				alert("해당아이디가 존재합니다.");
			}else{
				alert("사용가능한 아이디 입니다.")
			}
		},//success
		error:function(e){alert("error")}
	});
}
 */
</script>
<h1 align="center" class="text-rainbow">JOIN US</h1>
<div>
<form action="insertmember" method="post" name="userInfo" onsubmit="return checkValue()">
	ID <br> 
	<input id ="id" type="text" autofocus="autofocus" name="id" placeholder="10-digit" maxlength="10" style="width:150px; height:15px;">
	<input type="button" value="중복확인" id="idchk" onclick="idCheck()" ><br><br>
	
	PW <br>
	<input id = "pw" type="password" name="pw" maxlength="4" placeholder="4-digit"><br><br>
	PW CHECK <br>
	<input id = "pwchk" type="password" name="pwchk" maxlength="4"><br><br>
	
	NAME<br>
	<input type="text" name="name" maxlength="10"><br><br>
	
	<div name=email>
	EMAIL<br><input id= email type="text" name="email" maxlength="50"><span>@</span>
	<input id="email02" name="email" list="domains" placeholder="Domain"style="width:75px;" >
	<datalist id="domains" name = "email">
                <option value="naver.com">
                <option value="daum.net">
                <option value="gmail.com">
                <option value="yahoo.co.kr">
                </option>
    </datalist><br><br>
    </div>
    
    PHONE NUMBER<br>
    <input type="number" name="phone_number" maxlength = "12" style="width:150px; height:15px;">
    <br><br>
    NICKNAME<br>
    <input type="text" name="nickname" maxlength="10" style="width:150px; height:15px;"><br><br>
    
	<input style="text-align:center; width:200px;" type="submit" value="확인">
	<input type ="button" value="취소" onclick="goLoginForm()">
	
</form>
</div>
</body>
</html>