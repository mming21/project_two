<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head></head>
<body>

<div class="container" id="Recordservice" align="center">
	<div><h2>Record</h2></div>
	<div>
		<button id="record">녹음</button>
		<button id="stop">정지</button><br><br>
		<div id="sound-clips"></div>
	</div><br>
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
