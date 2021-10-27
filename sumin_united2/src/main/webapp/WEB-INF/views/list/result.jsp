<%@page import="users.StudyInfoVO"%>
<%@page import="java.util.List"%>
<%@ page import="users.TestController2" %>
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
<%
//List<UsersVO> userslist = (List<UsersVO>)request.getAttribute("userslist");
List<StudyInfoVO> studyinfolist = (List<StudyInfoVO>)request.getAttribute("studyinfolist");
//String title = (String)request.getAttribute("userstitle");
%>
<h2><%=studyinfolist.get(0).getStudy_memo1()%></h2>
<h2><%=studyinfolist.get(0).getStudy_memo2()%></h2>
<button type="button" onclick="location.href='/main'">main</button>

</body>
</html>