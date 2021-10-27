<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.lang.reflect.Array"%>
<%@page import="contents.ContentsVO"%>
<%@page import="java.util.List"%>
<%@taglib prefix= "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%List<ContentsVO> contentslist = (List<ContentsVO>)request.getAttribute("contentslist"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/jquery-3.2.1.min.js"></script>
<style>
#modal {
display:none;

  position:fixed;
  width:100%;
  height:40%;
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

<body>
<h1>프로젝트 2조</h1>
<button type="button" class="join_us" onClick="location.href='/insertmember'">Join Us</button>
<button type="button" onClick="location.href='/contentsinput'">Let's go</button> 

<div id="root">
   
    <button type="button" id="modal_open_btn">Log in</button>
       
</div>

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

<center>
<H3>이달의 추천</H3></center>
<form action=/contents>
<center><table>
	<thead>
		<tr>
			<% for (int i=0; i < contentslist.size(); i++) {%>
			<th>
			<img img onclick="location.href='./contents?content_id=<%=contentslist.get(i).getContent_id() %>'"
			src=<%=contentslist.get(i).getContent_url() %> 
			style="cursor: pointer;" width=120 height=150>
			<% } %>
			</th>
		</tr>
	</thead>
	<tbody>
 		<tr>
 			<% for (int i=0; i < contentslist.size(); i++) {%>
	 		<td align="center"><%=contentslist.get(i).getContent_title() %></td>
			<% } %>
 		</tr>
 	</tbody>
</table>
</center>
</form>


<p>
<center>
<input id="id" type="hidden" name="id" value="${sessionScope.id }">
<input type="button" onclick="goto()" value="Let's study">
</center>
</p>
<script src="/jquery-3.2.1.min.js"></script>
<script>

function goto(){
	
	var id = $("#id").val();
	console.log("'" + id + "'");
	if(id==""){
		alert("로그인이 필요합니다.");
		//location.reload();
	}else{
		location.href="/studylist";
	}
	//location.href="/studylist";
}
</script>


</body>
</html>