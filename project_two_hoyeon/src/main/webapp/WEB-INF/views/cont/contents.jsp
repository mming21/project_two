<%@page import="contents.ContentsVO"%>
<%@page import="java.util.List"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<%
List<ContentsVO> contentslist = (List<ContentsVO>)request.getAttribute("contentslist");
int j = (int)request.getAttribute("j");
int i = j - 1;
%>

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
        
        <!-- 제가 적용하는 style 및 sript 부분 -->
        <script src="/jquery-3.2.1.min.js"></script>
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

#toReveal.revealed {
  opacity: 1;
  transform:translate(100px,0px);
}

#.



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

//-----------------------------------------------
//회원가입 폼
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
//회원가입 기능 끝 
</script>
  
   
</head>


<body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="http://localhost:9007/main">Kulture</a>
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
        
        <!-- 로그인 -->
        <div id="modal">
   
    <div class="modal_content">
        <h2>Log in</h2>
       
        <form action="main" name="login" method="post">
		ID: <input id="id" type="text" autofocus="autofocus" name="id" placeholder="10-digit" maxlength="10"><br>
		Password: <input id ="pw" name = "pw" type="password" name="pw" maxlength="4" placeholder="4-digit">
		<input id ="btnLogin" type="button" value="확인">
		</form>
        <button type="submit" id="modal_close_btn">닫기</button>      
       
    </div>
    <div class="modal_layer"></div>
</div>

<script>
    $("#modal_open_btn").click(function(){
        $("#modal").attr("style", "display:flex");
    });
   
     $("#modal_close_btn").click(function(){
        $("#modal").attr("style", "display:none");
    });
  
</script>

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



<style>
img{
width : 500px;
height : 650px;
}

#wapper div{
border:3px solid #f4623a;
padding:20px;
font-family: Y 너만을 비춤체;
}
.divcontents{border-radius:10px;}

}
/* .desc{
position:fixed;

} */

</style>

<section class="page-section">
<div class="container px-4 px-lg-1">
 <div class="row gx-4 gx-lg-5">
	<div class="col-lg-5 col-md-5"> 
	<div id="space_little2"></div>
		<img img  
		src=<%=contentslist.get(i).getContent_quotesurl() %> >
	</div>
  <div class="col-lg-7 col-md-7"> 

	<div class="content_name" style="color:#BC5200; font-family:'Heebo Black';">
	 	<h1 class="text-center"><%=contentslist.get(i).getContent_name() %></h1><br>
	</div>	

<div id=wapper>
	<div class="desc divcontents">
		<H4 class="text-center">Content introduction</H4>
			<p class="text-left"><%=contentslist.get(i).getContent_description() %><br>
			<%=contentslist.get(i).getContent_description_ko() %></p>
		<h4 class="text-center">Character</h4>	
			<p class="text-left"><%=contentslist.get(i).getContent_characters() %></p>
	</div>
	<br>

	<div class="quotes divcontents">
		<h4 class="text-center">Quotes</h4>
	  		<p class="text-left"><%=contentslist.get(i).getContent_quotes() %><br>
	  		<%=contentslist.get(i).getContent_quotes_ko() %> </p>
	</div>	
	<br>

	<div class="slang divcontents">
		<h4 class="text-center">Hidden Meaning</h4>	
			<p class="left"><%=contentslist.get(i).getContent_slang() %></p>
			<p class="text-left"><%=contentslist.get(i).getContent_slang_desc() %><br>
			<%=contentslist.get(i).getContent_slang_desc_ko() %></p>
	</div>
  </div>
 </div>
 </div>
</div>

</section>

<div id="space_little"></div>
 
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