<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
	Cookie[] cookies = request.getCookies();
	for(Cookie currentcookie : cookies){
		if("mem_id".intern() == currentcookie.getName().intern()){
			Cookie memidCookie = new Cookie("mem_id", "b001");
			//쿠키 유효시간 설정(초단위) : 0 설정시 바로삭제
			memidCookie.setMaxAge(0); 
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
쿠키가 삭제되었습니다. makeCookie -> viewCookie -> deleteCookie -> viewCookie 삭제된 mem_id 확인할 수 있다.
</body>
</html>