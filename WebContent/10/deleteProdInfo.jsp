<%@page import="kr.or.ddit.prod.service.IProdServiceImpl"%>
<%@page import="kr.or.ddit.prod.service.IProdService"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="kr.or.ddit.member.service.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String prod_id = request.getParameter("prod_id");

	response.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	
	HashMap<Object, Object> params = new HashMap<Object, Object>();
	params.put("prod_id", prod_id);
	
	IProdService service = IProdServiceImpl.getInstance();
	service.deleteProdInfo(params);
	
	String message =URLEncoder.encode("삭제가 완료되었습니다.", "UTF-8");
	
	RequestDispatcher dispatcher = request
            .getRequestDispatcher("/10/main.jsp?contentPage=/10/prodList.jsp?message="+message);
      dispatcher.forward(request, response);
	

%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>