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
				<input id="searchBtn" type="submit" value="Serach">
				<!-- <script src="/jquery-3.2.1.min.js">
					$(function(){
							
						});
					});
				</script> -->
		</fieldset>
<table>
	<th>제목</th>
    <%for(int i=0; i < 2; i++){ %>
    <tr>
    	<td><a href="" ><%=studyinfolist.get(i).getTitle()%></a></td>
<%--     	<td><a href="" ><%=studyinfolist.get(i).getMember_id()%></a></td> --%>
	</tr>
    <%} %>
</table>
	</form>
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
	<!-- <th>글번호</th> -->
<%-- <%
       for(int i=0; i < 1; i++){ /* 글 제목 최신순으로 나열 */
%> --%>
<%-- 		<td><%=userslist.get(i).getPw()%></td>
		<td><%=userslist.get(i).getName()%></td>
		<td><%=userslist.get(i).getEmail()%></td> --%>
		<%-- <td><%=userslist.get(i).getId() %></td>
		<td><a href="" ><%=userslist.get(i).getPw() %></a></td><!-- 글제목 누르면 페이지이동 --> --%>
<%-- <%
}
%> --%>
<input type="button" onclick="location.href='/shadow/write'" value="작성하기">
<input type="button" onclick="delete" value="삭제" >


</body>
</html>