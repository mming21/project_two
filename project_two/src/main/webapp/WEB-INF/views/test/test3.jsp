<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<style>
/* .servicepart{
	background-color: skyblue;	
}
.content{
	background-color: gray;
	float : left;
}
.button{
  padding: 6px 10px;
  background-color:#FF6600;
  border-radius: 4px;
  color: white;
  cursor: pointer;
} */
</style>

<meta charset="UTF-8">
<title>Insert title here</title>

<script src="jquery-3.2.1.min.js"></script>

<script>	
function playBtn() {
	var input = document.getElementById("input").value;//텍스트 입력값 저장
    var speed = document.getElementsByName("speed");//재생속도 저장 변수
    var speedResult;//선택된 재생속도 저장 변수
    //var ttsResult;//생성된 음성파일명 저장 변수

    for (var i=0; i < speed.length; i++) {
    	if (speed[i].checked == true) {
    		//alert("입력 내용은 "+input+" 입니다.")
            //alert("선택한 재생 속도값은 "+speed[i].value+" 입니다");
            speedResult = speed[i].value;
            //alert("전달할 재생 속도값은 "+speedResult+" 입니다");
            
		  	$.ajax({		  		
				url : '/tts2',
				data : {"input": input, "speed":speedResult},
				dataType : 'text',
				type : 'post',
				success : function(mp3file){
					ttsResult = mp3file;
					$("#audio").attr("src", "/naverimages/" + mp3file);
				}//success	
			});//ajax  
		}//if
	}//for	
}//playBtn()


var txtArea = document.getElementById("txtArea");

//전역변수 선언
var upload_resultData; //파일명 저장 변수
var stt_resultData; //stt 결과 데이터 저장 변수

//파일 업로드
function uploadFile(){
    var formData = new FormData();
    formData.append("file1", $("#file1")[0].files[0]);

    $.ajax({
        url: '/uploadresult',
        processData: false,
        contentType: false,
        data: formData,
        type: 'POST',
        success: function(uploadData){	        	
            alert("파일명 : " + uploadData + " 업로드 완료");
            upload_resultData = uploadData;//파일명 저장
        }//success
    });//ajax
}//uploadFile()

function sttBtn(){
	$.ajax({
		url : '/sttservice',
		data : {"file": upload_resultData},
		dataType : 'json',
		type : 'post',
		success : function(sttData){
			console.log(sttData);
			$("#txtArea").val(JSON.stringify(sttData.text));
			stt_resultData = JSON.stringify(sttData.text);//stt결과 저장
		}//success			
	})//ajax
}//sttBtn()

function papagoBtn(){
	$.ajax({
		url : '/papagoservice',
		data : {"text": stt_resultData},
		dataType : 'json',
		type : 'post',
		success : function(result){
			console.log(result);
			$("#txtArea2").val(JSON.stringify(result.message.result.translatedText));
		}//success			
	});//ajax
}//papagoBtn()
	
</script>


</head>
<body>

<div class="container" id="TTSservice" align="center">
	<div><h1>TTS</h1></div>	
	<div id="ttsInput">
		Please enter Korean in the input box below<br><br>
		<textarea id="input" rows="10" cols="30"></textarea><br><br><br>
		
		Select voice play speed :
		<input type="radio" name="speed" value="5" /> 0.5x
		<input type="radio" name="speed" value="0" checked="checked" /> 1.0x
		<button onclick="playBtn()">Play</button> <br><br>
	</div>
	
	<div id="ttsResult">	
		<audio id="audio" src="" controls="controls"></audio><br><br>
	</div>

</div>
<hr class="divider" />

<div class="container" id="STTservice" align="center">							

	<div><h2>STT</h2></div>	
	<div id="sttInput">
		<div id="uploadPart">
		    <input type="file" id="file1" name="file1" value="select"> 
		    <button id="btn_submit" onclick="uploadFile()">Upload</button><br><br>
		</div>
		<div id="sttPart" class="txtarea">
			<textarea cols="30" rows="10" id="txtArea"></textarea><br><br>
			<button id="sttBtn" onclick="sttBtn()">Convert to Text</button><br><br>
		</div>
	
		<div id="papagoPart" class="txtarea">
			<textarea cols="30" rows="10" id="txtArea2"></textarea><br><br>
			<button id="sttBtn" onclick="papagoBtn()">Translate to English</button><br><br>
		</div>
	</div>		

</div>

<hr class="divider" />

<div class="container" id="Memoservice" align="center">
	<div><h2>Memo</h2></div>

	<div id="memoInput">
	<form action="/savememo" method="post">
	    <input type="text" id="id" style="width:300px;" >id <br><br>
	    <input type="text" id="num" style="width:300px;" >num <br><br>
	    <input type="text" id="memo_contents1" style="width:300px; height:200px;" >memo1 <br><br><br>
	    <input type="text" id="memo_contents2" style="width:300px; height:200px;" >memo2 <br><br><br>
		<input type="submit" value="확인">
	</form>
	</div>
</div>

</body>
</html>
