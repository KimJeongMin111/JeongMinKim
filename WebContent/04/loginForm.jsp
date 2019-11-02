<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String message = request.getParameter("message");
	
	response.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	if(<%=message != null%>){
		alert("<%=message%>");
	}	
</script>
</head>
<body>
<form action="<%=request.getContextPath()%>/04/loginCheck.jsp" method="GET">
<table>
	<tr>
	<td>아이디</td>
	<td><input type="text" name="mem_id"></td>
	</tr>
	
	<tr>
	<td>패스워드</td>
	<td><input type="text" name="mem_pass"></td>
	</tr>
	
	<tr>
	<td colspan="2">
	<input type="submit" value="로그인">
	<a href="<%=request.getContextPath() %>/04/memberForm.jsp">회원가입을 해주세요.</a>
	</td>
	</tr>
</table>
</form>	
</body>
</html>