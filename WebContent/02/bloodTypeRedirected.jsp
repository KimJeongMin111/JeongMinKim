<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	String bloodType = request.getParameter("bloodType");

%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
/* 	if(bloodType.equals("A")){

		response.sendRedirect("/ddit/02/a.jsp");
		
	}else if(bloodType.equals("B")){
		
		response.sendRedirect("/ddit/02/b.jsp");
	
	}else if(bloodType.equals("O")){
		
		response.sendRedirect("/ddit/02/o.jsp");

	}else if(bloodType.equals("AB")){
		
		response.sendRedirect("/ddit/02/ab.jsp");
	} */
	
	response.sendRedirect("/ddit/02/"+ bloodType.toLowerCase() +".jsp");

%>
</body>
</html>