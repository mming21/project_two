<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%int i = 0;%>

<script src="/jquery-3.2.1.min.js"></script>
<script>
//회원탈퇴
function deleteMember(id){
	//var id = $("#").val();
	console.log("id:::::", id);
	$.ajax({
		url:'/deletemember',
		type:'post',
		data:{'id': id},
		
		//dataType:'json',
		success: function(msg){
			alert("success");
		},//success
		error:function(e){alert("error")},
		//complete:function(){alert("완료 ")}
	});
	//location.href = "main";
};

</script> 
<body>
<h2>${msg }</h2>

<c:forEach items="${memberlist }" var="membervo">
${membervo.id } : ${membervo.pw } : ${membervo.name } : ${membervo.email } :${membervo.phone_number } :${membervo.nickname } 
<input id="<%=i %>" class="id" type="hidden" name="id" value="${membervo.id }">
<input id="${membervo.id}" type="button" value="삭제" onclick="deleteMember(this.id)">
<br>
<%i = i+1;%>
</c:forEach>

</body>

</html>