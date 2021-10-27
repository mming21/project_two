<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>
</head>
<script src="/jquery-3.2.1.min.js"></script>
<script>
function checkValue()
{  
    // 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
    if(document.updateform.pw.value != document.updateform.pwchk.value ){
        alert("비밀번호를 동일하게 입력하세요.");
        return false;
    }
}

//회원탈퇴
function deleteMember(){
	var id=$("#id").val();
	$.ajax({
		url:'/deletemember',
		type:'post',
		data:{'id': id},
		
		//dataType:'json',
		success: function(msg){
			alert("success");
		},//success
		error:function(e){alert("error")},
		//complete:function(){alert("완료 ")}
	});
	location.href = "main";
};
</script>
<body>
<h2>${sessionScope.nickname } 회원님 안녕하세요!</h2>
<h4>회원정보 수정</h4>
<form action="updatemember" name="updateform" method="post"  onsubmit="return checkValue()">
	<input id="id" type="hidden" name="id" value="${sessionScope.id }">
	PW <br><input type="password" name="pw" maxlength="4" placeholder="4-digit" value="${sessionScope.pw }"><br><br>
	PW CHECK <br><input id = "pwchk" type="password" name="pwchk" maxlength="4" value="${sessionScope.pw }"><br><br>
	
	NAME<br><input type="text" name="name" maxlength="10" value="${sessionScope.name }"><br><br>
	
	EMAIL<br><input id="email" type="email" name="email" maxlength="50" placeholder="name@example.com" value="${sessionScope.email }"><br><br>
	<!--
	EMAIL<br><input type="text" name="email" maxlength="20" value="${sessionScope.email }"><span>@</span>
	<input type="hidden" name="email" value="@">
	<input id="email02" name="email" list="domains" value="${sessionScope.domain }" >
	<datalist id="domains">
                <option value="naver.com">
                <option value="daum.net">
                <option value="gmail.com">
                <option value="yahoo.co.kr">
                </option>
    </datalist><br><br>
    -->
    PHONE NUMBER<br>
    <input type="number" name="phone_number" maxlength = "12" value="${sessionScope.phone_number }">
    <br><br>
    NICKNAME<br>
    <input type="text" name="nickname" maxlength="10" value="${sessionScope.nickname }"><br><br>
  
	<input type="submit" value="확인">
	
	<br>
	<button type="button" onclick="deleteMember()">회원 탈퇴</button>

</form>
</body>
</html>