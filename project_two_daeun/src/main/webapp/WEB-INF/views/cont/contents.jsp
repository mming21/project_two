<%@page import="contents.ContentsVO"%>
<%@page import="java.util.List"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
List<ContentsVO> contentslist = (List<ContentsVO>)request.getAttribute("contentslist");
int j = (int)request.getAttribute("j");
int i = j - 1;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<style>
img{
width : 300px;
height : 300px;
}
tr{
border: 2px solid;
}
.desc{
/* position:fixed; 
right:200px; 
top:50px; */
border:1px solid;
}
.character{
border:1px solid;
}
.slang{
border:1px solid;
}
.a{
border:1px solid;
}
</style>
<img img  
src=<%=contentslist.get(i).getContent_url() %> >
<div class="a">
  		<h3><%=contentslist.get(i).getQuotes() %> </h3> 
</div>

<div class="desc" >
	<p><%=contentslist.get(i).getContent_name() %></p>
	<p><%=contentslist.get(i).getContent_description() %></p>
</div>

<div class="character" >
	<p><%=contentslist.get(i).getContent_characters() %></p>
</div>

<div class="slang" >
	<p><%=contentslist.get(i).getContent_slang() %></p>
	<p><%=contentslist.get(i).getContent_slang_desc() %></p>
</div>
<button onclick="" >Main</button>
</body>
</html>