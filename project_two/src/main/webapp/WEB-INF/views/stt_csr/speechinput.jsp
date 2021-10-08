<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	String languages[] = {"Kor", "Jpn", "Chn", "Eng"};
	String languagenames[] = {"한국어", "일본어", "중국어", "영어"};
%>

<form action="/speech">
	언어선택 : <br>
	<% for(int i = 0; i< languages.length; i++){ %>
		<input type=radio name="lang" value= <%=languages[i]%> > <%=languagenames[i] %><br>
	<%} %>
	
	<select name="image">
	<%	String[] filelist = (String[])request.getAttribute("filelist"); 
		for(int i=0; i<filelist.length; i++){
			String onefile = filelist[i];
			String[] onefile_split = onefile.split("[.]");
			String fileext = onefile_split[(onefile_split.length)-1];
			if(fileext.equals("mp3")){
	%>
			<option value="<%=onefile %>"> <%=onefile %></option>
	<%		}//if end
		}//for end
	%>
	</select>
	<input type="submit" value="텍스트로 변환해 주세요">
</form> 
</body>
</html>