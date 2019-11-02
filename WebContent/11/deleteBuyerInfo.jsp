<%@page import="java.net.URLEncoder"%>
<%@page import="kr.or.ddit.buyer.service.IBuyerServiceImpl"%>
<%@page import="kr.or.ddit.buyer.service.IBuyerService"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String buyer_id = request.getParameter("buyer_id");

	response.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	
	HashMap<Object, Object> params = new HashMap<Object, Object>();
	params.put("buyer_id", buyer_id);
	
	IBuyerService service = IBuyerServiceImpl.getInstance();
	service.deleteBuyerInfo(params);
	
	String message = URLEncoder.encode("삭제가 완료되었습니다.", "UTF-8");
	
	RequestDispatcher dispatcher = request.getRequestDispatcher("/11/main.jsp?contentPage=/11/buyerList.jsp?message="+message);
	dispatcher.forward(request, response);
	

%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function(){
	
	});
</script>
</head>
<body>

</body>
</html>