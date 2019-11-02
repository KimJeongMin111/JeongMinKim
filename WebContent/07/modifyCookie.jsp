<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
	Cookie[] cookies = request.getCookies();
	for(Cookie currentcookie : cookies){
		if("mem_id".intern() == currentcookie.getName().intern()){
			Cookie memidCookie = new Cookie("mem_id", "b001");
			memidCookie.setPath("/");
			response.addCookie(memidCookie);
		}
	}
   
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
쿠키가 구워졌습니다. makeCookie -> viewCookie -> modifyCookie -> viewCookie 바뀐 mem_id 확인할 수 있다.
</body>
</html>