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


<table border="1">
<thead>
<tr>
<th>member_id</th>
<th>study_id</th>
<th>title</th>
<th>study_memo1</th>
<th>study_memo2</th>
<th>study_date</th>
</tr>
</thead>


<tr>
<td>${sessionScope.member_id }</td>
<td>${studyinfovo.study_id }</td>
<td>${studyinfovo.title }</td>
<td>${studyinfovo.study_memo1 }</td>
<td>${studyinfovo.study_memo2 }</td>
<td>${studyinfovo.study_date }</td>
</tr>
</table>

</c:forEach>
</body>
</html>