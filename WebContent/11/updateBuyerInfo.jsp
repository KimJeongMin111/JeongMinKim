<%@page import="kr.or.ddit.buyer.service.IBuyerServiceImpl"%>
<%@page import="kr.or.ddit.buyer.service.IBuyerService"%>
<%@page import="java.lang.reflect.InvocationTargetException"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@page import="kr.or.ddit.vo.BuyerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	BuyerVO buyerInfo = new BuyerVO();
	
	try{		
	BeanUtils.populate(buyerInfo, request.getParameterMap());
	} catch(IllegalAccessException e){
		e.printStackTrace();
	} catch(InvocationTargetException e){
		e.printStackTrace();
	}
	
	IBuyerService service = IBuyerServiceImpl.getInstance();
	service.updateBuyerInfo(buyerInfo);
	
	RequestDispatcher dispatcher = request.getRequestDispatcher("/11/main.jsp?contentPage=/11/buyerList.jsp");
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