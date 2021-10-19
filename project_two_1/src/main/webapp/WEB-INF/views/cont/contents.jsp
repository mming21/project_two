<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:forEach items="${contresult}" var="contfile">
</c:forEach>

<!-- java script에서 String을 json 변환-->
<script src="/jquery-3.2.1.min.js"></script>
<script>
<%
String contresult = (String)request.getAttribute("contresult");
%>

</script>






<div id="names" style="border:2px solid pink"></div>
<div id="conf" style="border:2px solid blue"></div>
<canvas id="contentscanvas" width=200 height=300 style="border:2px solid black"></canvas>
</body>
</html>