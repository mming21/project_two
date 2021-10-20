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
function playBtn(){	
	var input = document.getElementById("input");
	var speed = document.querySelector('input[name="speedvalue"]').value;
	var mp3file;
	
	$.ajax({
		url : '/service2',
		data : {"input": input, "speed":speed},
		//dataType : 'json',
		success : function(ttsResult){
			console.log(ttsResult);
			mp3file = ttsResult;//(String값)파일명 저장 231321321.mp3
			//audio.play();
			/* $("#txtArea").val(JSON.stringify(sttData.text));
			stt_resultData = JSON.stringify(sttData.text); *///stt결과 저장
		}//success	
	});//ajax
}//playBtn()
</script>

</head>
<body>

<div class="container" id="TTSservice" align="center">
						
	<% 
	double speed[]={5,0};
	String speedinform[]={"0.5x", "1x"};
	%>
	
	
	<div id="ttsInput">
		Please enter Korean in the input box below<br>
		<textarea id="input" name="out" rows="10" cols="30"></textarea><br><br><br>
		
		Select voice play speed :
		<% for(int i=0; i < speed.length; i++){ %>
		<input type=radio id="speed" name="speedvalue" value=<%=speed[i] %> checked="checked"> <%=speedinform[i]%>
		<%} %>
		
		<button id=playBtn onclick="playBtn()">Play</button> <br><br>
	</div> 
	
	<div id="ttsResult">	
		<audio id="audio" src="/naverimages/${mp3file }" controls="controls"></audio><br><br>
		Result<br>
		<textarea rows="10" cols="30">${mp3file }</textarea>
	</div>

</div>

</body>
</html>