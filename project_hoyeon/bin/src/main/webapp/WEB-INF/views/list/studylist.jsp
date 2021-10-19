<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
List<UsersVO> studyinfolist = (List<UsersVO>)request.getAttribute("studyinfolist");
/* sql 데이터 리스트형식으로 studyinfolist에 저장 */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
	<!-- <th>글번호</th> -->
	<th>제목</th>
<%
       for(int i=20; i>0; i--){ /* 글 제목 최신순으로 나열 */
%>
    <tr>
		<%-- <td><%=studyinfolist.get(i).getStudy_ID() %></td> --%>
		<td><a href="" ><%=studyinfolist.get(i).getTitle() %></a></td> <!-- 글제목 누르면 페이지이동 -->
	</tr>
<%
    	}
%>	
</table>
<input type="button" onclick="delete" value="삭제">
<input type="button" onclick="location.href='/semiproject/login'" value="작성하기">
<button ></button>
</body>
</html>