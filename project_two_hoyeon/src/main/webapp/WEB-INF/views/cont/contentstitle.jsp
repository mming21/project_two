<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.lang.reflect.Array"%>
<%@page import="contents.ContentsVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix= "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%List<ContentsVO> contentslist = (List<ContentsVO>)request.getAttribute("contentstitle"); %>
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

<section class="page-section">


<div class="text-center">
<%for (int i=0; i < 1; i++){ %>
<h1>=<%=contentslist.get(i).getContent_title()%>=</h1> 
<%} %>
 </div>
 <br>

 
<center>  
<div class="container px-4 px-lg-5">
  

<table>
<thead>
		<tr>
			<% for (int i=0; i < contentslist.size(); i++) {%>
			<th>
			<img img onclick="location.href='./contents1?content_id=<%=contentslist.get(i).getContent_id() %>'"
			src=<%=contentslist.get(i).getContent_url() %> 
			style="cursor: pointer;" width=200 height=250>
			<% } %>
			
			</th>
		</tr>
	</thead>
	<br>
	<tbody>
 		<tr>
 			<% for (int i=0; i < contentslist.size(); i++) {%>
	 		<td align="center"><%=contentslist.get(i).getContent_name() %></td>
			<% } %>
 		</tr>
 	</tbody>
</table>
</div>
	</center>  

<br>
<br>
<br>
<br>

<div class="text-center">
<h2>Comming Soon</h2>
</div>
 <br>



<center>  
<div class="container px-4 px-lg-5">

<table>
<thead>
		<tr>
			<% for (int i=0; i < contentslist.size(); i++) {%>
			<th>
			<img img onclick="location.href='./contents1?content_id=<%=contentslist.get(i).getContent_id() %>'"
			src=<%=contentslist.get(i).getContent_url() %> 
			style="cursor: pointer;" width=200 height=250>
			<% } %>
			</th>
		</tr>
	</thead>
	<br>
	<tbody>
 		<tr>
 			<% for (int i=0; i < contentslist.size(); i++) {%>
	 		<td align="center"><%=contentslist.get(i).getContent_name() %></td>
			<% } %>
 		</tr>
 	</tbody>
</table>
</div>
</center> 


  <!-- Contact-->
       <section class="page-section" id="contact">
            <div class="container px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-lg-8 col-xl-6 text-center">
                        <h2 class="mt-0">Please Send Me the Contents!</h2>
                        <hr class="divider" />
                        <p class="text-muted mb-5">Please contact me about the Korean content you want. <br> I'll prepare it quickly and update it!</p>
                    </div>
                </div>
                <div class="row gx-4 gx-lg-5 justify-content-center mb-5">
                    <div class="col-lg-6">
                       <!-- ---------------------------------------------------------------------- -->
                        <form action="content_mail" >
                            <!-- Name input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="name" type="text" placeholder="Enter your nick-name..."  />
                                <label for="name">Nick-name</label>
                               
                            </div>
                            <!-- Email address input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="email" type="email" placeholder="name@example.com"  />
                                <label for="email">Your Email</label>

                            </div>
                            <!-- Phone number input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="phone" type="tel" placeholder="(123) 456-7890"  />
                                <label for="phone">Phone number</label>
                                <div class="invalid-feedback" >A phone number is required.</div>
                            </div>
                            <!-- Message input-->
                            <div class="form-floating mb-3">
                                <textarea class="form-control" id="message" type="text" placeholder="Enter your message here..." style="height: 10rem" ></textarea>
                                <label for="message">Message</label>
                                <div class="invalid-feedback">A message is required.</div>
                            </div>
                            
                             <div class="d-grid"><input class="btn btn-primary btn-xl" id="submitButton" type="submit" value="submit"></div>
                			 
                			<!--  <div class="d-grid"><button type="button" class="btn btn-primary btn-xl" id="btn" 
							onclick="location.href='/content_mail'">submit</button> -->
                    		<!--  <div class="d-grid"><input class="btn btn-primary btn-xl" id="submitButton" type="submit" value="submit"></div> -->
                            <br> </form>
                          
                            
                    </div>
                </div>
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-lg-4 text-center mb-5 mb-lg-0">
                        <i class="bi-phone fs-2 mb-3 text-muted"></i>
                        <div> dbekdms27@gmail.com </div>
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
