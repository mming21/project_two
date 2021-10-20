<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>${msg }</h2>

<c:forEach items="${memberlist }" var="membervo">
${membervo.id } : ${membervo.pw } : ${membervo.name } : ${membervo.email } :${membervo.phone_number } :${membervo.nickname } <br>
</c:forEach>

</body>
</html>