<%@page import="users.UsersVO"%>
<%@page import="java.util.List"%>
<%@ page import="users.TestController" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
//List<UsersVO> userslist = (List<UsersVO>)request.getAttribute("userslist");
List<UsersVO> studyinfolist = (List<UsersVO>)request.getAttribute("studyinfolist");
//String title = (String)request.getAttribute("userstitle");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<form action="/search" method="get">
		<fieldset>
			<legend>Search</legend>
				<label>검색</label>
				<input type = "text" name="word" value="" />
				<input id="searchBtn" type="submit" value="Search">
		</fieldset>
	</form>
<!-- 회원탈퇴 -->
<form action="/delete">
<table>
	<th>제목</th>
    <%for(int i=0; i < studyinfolist.size(); i++){ %>
    <tr>
    	<td>
    		<input name="delete" type="checkbox" value="<%=studyinfolist.get(i).getTitle()%>"></input>
     		<a href="" ><%=studyinfolist.get(i).getTitle()%></a> 
    	</td>
	</tr>
   			<%} %>
</table>
<input type="submit" value="Delete"/>
</form>
<!-- 탈퇴끝 -->
</div>
<style>
table{
	border : 2px solid;
	margin-left : auto;
	margin-right : auto;
}
td{
	border : 1px solid;
	width : 300px;
	height : 15px;
	
}

</style>
<input type="button" onclick="location.href='/shadow/write'" value="Write">


</body>
</html>