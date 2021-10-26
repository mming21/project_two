<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<style>
.container{
	float : left;
}

</style>

<meta charset="UTF-8">
<title>Insert title here</title>

<script src="jquery-3.2.1.min.js"></script>
<script>
/* TTS */
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

/* STT */
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

/* Papago */
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

/* Memo */
function gotoList(frm){
	frm.action="/studyList";
	frm.submit();
	return true;
}


function check(){
	var ch = document.getElementById("checkbox").checked;
	if(ch == false){
		alert("title을 입력하세요");		
	}	
}
</script>


</head>
<body>
<div class="main">

<div class="container" id="TTSservice" align="center">
	<div><h2>TTS</h2></div>	
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

<div class="container" id="Recordservice" align="center">
	<div><h2>Record</h2></div>
	<div>
		<button id="record">녹음</button>
		<button id="stop">정지</button><br><br>
		<div id="sound-clips"></div>
	</div><br>
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

<div class="container" id="Studyservice" align="center">
	<div><h2>Study</h2></div>

	<div id="studyInput">
	<form action="/savestudy" method="post">	
		<div>
		    <input type="text" name="member_id" style="width:300px;" placeholder="member_id" ><br><br>
		</div>
		<div>
		    <input type="text" name="study_id" style="width:300px;" placeholder="study_id"><br><br>
		</div>
		<div>
		    <input type="text" name="title" style="width:300px;" placeholder="title"><br><br>
		</div>
		<div>
		    <input type="text" name="study_memo1" style="width:300px; height:200px;" placeholder="memo1"> <br><br><br>
		</div>
		<div>
		    <input type="text" name="study_memo2" style="width:300px; height:200px;" placeholder="memo2" > <br><br><br>
		</div>
		<div>
		    <input type="date" name="study_date" style="width:300px;" ><br><br><br>		
		</div>
		<div>
			<button type="submit" id="submit">확인</button>
			<button type="reset" id="cancel">초기화</button><br><br>
		</div>
	</form>
	<form action="/studylist">
		<input type="submit" id="studylidt" value="리스트 조회">	
	</form>
	</div>
</div>

</div>

<script>


/* mic */
const record = document.getElementById("record")
const stop = document.getElementById("stop")
const soundClips = document.getElementById("sound-clips")

if (navigator.mediaDevices) {
	
	console.log('getUserMedia supported.')
	const constraints = {
		audio: true
		}
	
	let chunks = []	
	navigator.mediaDevices.getUserMedia(constraints).then(function(stream) {
		
		const mediaRecorder = new MediaRecorder(stream)//녹음기
		
		record.onclick = function() {//녹음 버튼 클릭시에
			mediaRecorder.start()// 음성 녹음 시작하라
			console.log(mediaRecorder.state)
			console.log("recorder started")
			record.style.background = "red"
			record.style.color = "black"
			}//record.onclick
			
		stop.onclick = function() {//정지 버튼 클릭시에
			mediaRecorder.stop()//녹음 정지시켜라
			console.log(mediaRecorder.state)
			console.log("recorder stopped")
			record.style.background = ""
			record.style.color = ""
			}//stop.onclick
				
		mediaRecorder.ondataavailable = function(e) {
			chunks.push(e.data)
			}
		//녹음 정지시킨 상태가 되면 실행하라
				
		mediaRecorder.onstop = function(e) {
			console.log("data available after MediaRecorder.stop() called.")
			
			//추가 구현 예정
			//3.audio태그를 재생한다-녹음내용 확인한다.
			var audio = document.createElement('audio');
			audio.setAttribute("controls", '');
			audio.cotrols = true;
			soundClips.appendChild(audio);
			
			const blob = new Blob(chunks, {'type' : "audio/mp3"});
			var mp3URL = URL.createObjectURL(blob);
			audio.src = mp3URL;
			
			//4. 다음 녹음파일을 위해 비워둔다
			chunks = [];
			//5. 파일 저장
			var a = document.createElement('a'); //audio ssrc = 'mp3 url' controls
			soundClips.appendChild(a); //div태그 내부 audio태그 추가한다 다음에 a태그 추가
			a.href = mp3URL;
			a.innerHTML = "MP3파일로 저장";
			a.download = "mictest.mp3";
			
			var now = new Date();
			var year = now.getFullYear();
			var month = ('0' + now.getMonth() + 1).slice(-2);
			var day = now.getDate();
			var dateString = year + month + day;
			console.log(dateString);
			
			a.download = "mictest" + dateString + ".mp3";
			//6. 스프링 서버로 업로드
			}//mediaRecorder.onstop
			
			})//then 
			.catch(function(err) {
				console.log('The following error occurred: ' + err)
				})
}
</script>

</body>
</html>
