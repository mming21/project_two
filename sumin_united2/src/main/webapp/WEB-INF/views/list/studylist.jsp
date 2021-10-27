<%@page import="users.StudyInfoVO"%>
<%@page import="java.util.List"%>
<%@ page import="users.TestController2" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
//List<UsersVO> userslist = (List<UsersVO>)request.getAttribute("userslist");
List<StudyInfoVO> studyinfolist = (List<StudyInfoVO>)request.getAttribute("studyinfolist");
//String title = (String)request.getAttribute("userstitle");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
function deletelist(){
	if($("#title1").val==null){
		alert("Error : Check title first!");
		location.reload(true)	
	}else{
		var result = confirm('Sure to delete?')
		if(result){
			location.reload(true);
			document.deletelist.submit();
		}else{
			history.back();	
		}
	}
	
}

</script>
<body>
<div>
	<form action="/search" method="get">
		<fieldset>
			<legend>Search</legend>
				<label>검색</label>
				<input type = "text" name="title"/>
				<input name = "member_id" type="hidden" value="${sessionScope.id }">
				<input id="searchBtn" type="submit" value="Search">
		</fieldset>
	</form>
	
	${studyinfolist }
	
<!-- 회원탈퇴 -->
<form action="/delete" name="deletelist">
<table>
	<th>제목</th>
    <%for(int i=0; i < studyinfolist.size(); i++){ %>
    <tr>
    	<td>
    		<input id="title1" name="title1" type="checkbox" value="<%=studyinfolist.get(i).getTitle()%>"></input>
     		<a href="/main" ><%=studyinfolist.get(i).getTitle()%></a> 
    	</td>
	</tr>
   			<%} %>
</table>
<button onclick="deletelist()">delete</button>
<!-- <input type="button" value="Delete" onclick="deletelist()"> -->
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
<input type="button" onclick="location.href='/service'" value="Write">


</body>
</html>