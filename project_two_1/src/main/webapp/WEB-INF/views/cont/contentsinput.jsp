<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix= "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<center>
<H3>이달의 추천</H3>
<%-- 		<c:forEach items="${filelist}" var="onefile"> --%>
<%-- 		</c:forEach> --%>
 		<a href="/contents">
		<img img onclick="/contents" src="https://file.mk.co.kr/meet/neds/2021/08/image_readtop_2021_774018_16285690364746521.jpg" style="cursor: pointer;" alt="${onefile }" width=120 height=150>
		</a>
</center>

 <script>

 let canvas = document.getElementById("contentscanvas");
 let context = canvas.getContext("2d");
 let image = new Image();
 image.src="/naverimages/";
 image.onclick  = function(){
	
 }

</script> 

<!-- <div id="result" style="border:2px solid black"></div> -->
<%-- <canvas id="contentscanvas" width=400 height=400 style="border:2px solid black"></canvas> --%>


</body>
</html>