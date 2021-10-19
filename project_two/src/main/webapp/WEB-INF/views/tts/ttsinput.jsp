<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	// 1. #data 공간에서 keyup이라는 이벤트가 발생했을 때
	$("#data").val();
	$("#data").keyup(function(){
		// 2. #out 공간에 #data의 내용이 출력된다.
		$("#out").text($("#data").val());
		// #out의 위치에 text로 데이터를 받는다.(setter)
		// 들어가는 데이터는 #data의 값(.val())이다. (getter)
		// 메서드 괄호 안에 아무것도 없으면 getter, 파라미터가 있으면 setter이다.
	});
});
</script>

</head>
<body>
<% double speed[]={5,0};
String speedinform[]={"0.5배속", "표준속도"};
%>

<form action="/ttsinput" method="post">
음성으로 들으실 한국어를 입력해주세요 <input id="data" name="out"><br><br><br>

음성 속도 선택:
<% for(int i=0; i<speed.length; i++){ %>
<input type=radio name="speed" value=<%=speed[i] %>><%=speedinform[i]%>
<%} %>


<input type=submit value="음성듣기"> <br>
</form>
<audio id="audio" src="/naverimages/${ttsoutput}" controls="controls"></audio><br><br>
<script>
var mp3 = document.getElementById("mp3"); //${mp3file} document.getElementById("mp3");
mp3.play();
</script>
음성내용:<br>
${out }

</body>
</html>