<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div id="d"> 프로젝트 </div>

<script>
var div=document.getElementById("d").innerHTML;
loacation.href="/test?parameter="+div;
${parameter}
</script>

</body>
</html>