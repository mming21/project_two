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
<c:forEach items="${studylist }" var="studyinfovo">
<%-- ${studyinfovo.member_id } :${studyinfovo.study_id} :${studyinfovo.title } : ${studyinfovo.study_memo1 } : ${studyinfovo.study_memo2 } : ${studyinfovo.study_date}  <br>  --%>
${studyinfovo.title } : ${studyinfovo.study_memo1 } : ${studyinfovo.study_memo2 } : ${studyinfovo.study_date}  <br> 
</c:forEach>
</body>
</html>