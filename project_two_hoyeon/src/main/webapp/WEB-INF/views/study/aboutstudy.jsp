<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>    
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>

<%@page import="study.StudyInfoVO"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Project</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap Icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic" rel="stylesheet" type="text/css" />
<!-- SimpleLightbox plugin CSS-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />

<script src="jquery-3.2.1.min.js"></script>
      
<style>
	#modal {
	display:none;
	position:fixed;
	width:100%;
	height:50%;
	z-index:1;
	}
	
	#modal h2 {
	  margin:0;   
	}
	
	#modal button {
	  display:inline-block;
	  width:100px;
	  margin-left:calc(100% - 100px - 10px);
	}
	
	#modal .modal_content {
	  width:300px;
	  margin:100px auto;
	  padding:20px 10px;
	  background:#fff;
	  border:2px solid #666;
	}
	
	#modal .modal_layer {
	  position:fixed;
	  top:0;
	  left:0;
	  width:100%;
	  height:100%;
	  background:rgba(0, 0, 0, 0.5);
	  z-index:-1;
	}   
</style>

<script>
$(document).ready(function(){
	$("#btnLogin").click(function(){
		var id = $("#id").val();
		var pw = $("#pw").val();
		if(id==""){
			alert("아이디를 입력하세요.");
			$("#id").focus();//입력포커스 이동
			return;//함수종료
		}
		if(pw==""){
			alert("비밀번호를 입력하세요.");
			$("#pw").focus();//입력포커스 이동
			return;//함수종료
		}
		//폼 내부의 데이터를 전송할 주소
		//document.login.action="main2"
		//제출
		document.login.submit();
	});
});
</script>
	
</head>
    <body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="/main2">Kulture</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto my-2 my-lg-0">
                        <li class="nav-item"><a class="nav-link">${sessionScope.nickname }</a></li>
                        <li class="nav-item"><a class="nav-link" href='/study'>Study</a></li>
                        <li class="nav-item"><a class="nav-link" href='/studylist'>My list</a></li>
                        <li class="nav-item"><a class="nav-link" href="/mypage">My page</a></li> 
                        <li class="nav-item"><a class="nav-link" href="/insertmember">Join</a></li>
                        <li class="nav-item"><a class="nav-link" href='/logout'>Log out</a></li>

              
                    </ul>
                </div>
            </div>
        </nav>


<!-- Study관련  script -->
<script>
/* Memo */
function savestudy(){
	var str = "${result}"
	console.log(str)
	alert("저장 되었습니다.")
}
</script>      

<%
Date nowTime = new Date();
SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 a hh:mm:ss");
%>
        
<!-- service -->
<section class="page-section">
<div class="container px-4 px-lg-5">
<div class="row gx-4 gx-lg-5">

	<div class="col-lg-4 col-md-4 text-center">  		
		<div id="TTSservice" align="center">                        
		<div><h2>Text To Sound</h2></div>	
		<hr class="divider" />
		<div id="ttsInput">
			Please enter Korean in the input box below<br><br>
			<textarea class="textarea" id="input" rows="5" cols="30"></textarea><br><br><br>
			
			Select voice play speed :
			<input type="radio" name="speed" value="5" /> 0.5x
			<input type="radio" name="speed" value="0" checked="checked" /> 1.0x
			<button class="btn btn-primary btn-xl2" onclick="playBtn()">Play</button> <br><br>
		</div>
	
		<div id="ttsResult">	
			<audio id="audio" src="" controls="controls"></audio><br><br>
		</div>
		</div>
	</div>

 	<div class="col-lg-4 col-md-4 text-center"> 
		<div id="STTservice" align="center">
		<div><h2>Sound To Text</h2></div>
		<hr class="divider" />
		If you want to record your Korean, click RECORD button below <br><br>
		<div>
			<div id="sound-clips">
			<button class="btn btn-primary btn-xl2" id="record">Record</button>
			<button class="btn btn-primary btn-xl2" id="stop">Stop</button><br>
			</div>
		</div><br>
	
		Please upload mp3file recording with Korean<br><br>
		<div id="sttInput">
			<div id="uploadPart">			
			    <input type="file" id="file1" name="file1" value="select">			    
			    <button class="btn btn-primary" id="btn_submit" onclick="uploadFile()">Upload</button><br>			 
			</div><br>
			<div id="sttPart" class="txtarea">
				<textarea class="textarea" cols="30" rows="5" id="txtArea"></textarea><br><br>
				<button  class="btn btn-primary btn-xl2" id="sttBtn" onclick="sttBtn()">Convert to Text</button><br><br>
			</div>		
			<div id="papagoPart" class="txtarea">
				<textarea class="textarea" cols="30" rows="5" id="txtArea2"></textarea><br><br>
				<button class="btn btn-primary btn-xl2" id="sttBtn" onclick="papagoBtn()">Translate to English</button><br><br>
			</div>
		</div>
		</div>		
	</div>

	<div class="col-lg-4 col-md-4 text-center"> 
		<div id="Studyservice" align="center"> 
		<div><h2>Study</h2></div>
		<hr class="divider" />
			<div id="studyInput">
				<form action="/upadatestudy" method="post">	
				<c:forEach items="${result }" var="memberlist">
					<div>
						 <input class="textarea" type="hidden" name="member_id" value="${sessionScope.id}" style="width:300px;" placeholder="member_id" ><br><br>
					   
					</div>
					<div>
					    <input class="textarea" type="text" name="study_id" style="width:300px;" required="required" placeholder="study_id" value="${memberlist.study_id}"><br><br>
					</div>
					<div>
					    <input class="textarea" type="text" name="title" style="width:300px;" required="required" placeholder="title" value="${memberlist.title }"><br><br>
					</div>
					<div>
					    <input class="textarea" type="text" name="study_memo1" style="width:300px; height:100px;" required="required" placeholder="memo1" value="${memberlist.study_memo1 }"> <br><br><br>
					</div>
					<div>
					    <input class="textarea" type="text" name="study_memo2" style="width:300px; height:100px;" required="required" placeholder="memo2" value="${memberlist.study_memo2 }"> <br><br><br>
					</div>
					<div>
					    <input class="textarea" type="hidden" name="study_date" value="<%=sf.format(nowTime) %>" style="width:300px;" ><br><br><br>	
					</div>
					</c:forEach>	
					<div>
						<button class="btn btn-primary btn-xl2" type="submit" id="submit" onclick="savestudy()">OK</button>					
						<button class="btn btn-primary btn-xl2" type="reset" id="cancel">Refresh</button>
					</div>		
				</form>
			
				
					<button class="btn btn-primary btn-xl2" id="gotoList" onclick="location.href='/studylist'">to the list</button>
			</div>
		</div>
	</div>
	
</div>
</div>
</section>
<!-- Footer-->
        <footer class="bg-light py-5">
            <div class="container px-4 px-lg-5"><div class="small text-center text-muted">Copyright &copy; 2021 - Kulture</div></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- SimpleLightbox plugin JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>

</body>
</html>