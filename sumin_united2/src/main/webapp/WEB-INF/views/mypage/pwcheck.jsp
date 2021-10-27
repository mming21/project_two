<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Type your password</h1>
<form action="pwCheck" name="chk" method="post">
<input type="hidden" name="id" value="${sessionScope.id }">
pw: <input id ="pwchk" name = "pw" type="password" name="pw" maxlength="4" placeholder="4-digit">
<input type="button" id ="pwchkBtn" value="확인">
</form>
<br>

<script src="/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
	$("#pwchkBtn").click(function(){
		var pw = $("#pwchk").val();
		if(pw==""){
			alert("비밀번호를 입력하세요.");
			$("#pwchk").focus();//입력포커스 이동
			return;//함수종료
		}
		document.chk.submit();
		//폼 내부의 데이터를 전송할 주소
		//document.login.action="main2"
		//제출
	});
});
</script>
</body>
</html>