<%@page import="kr.or.ddit.prod.service.IProdServiceImpl"%>
<%@page import="kr.or.ddit.prod.service.IProdService"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.lang.reflect.InvocationTargetException"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@page import="kr.or.ddit.vo.ProdVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	ProdVO prodInfo = new ProdVO();
	
	try{
	BeanUtils.populate(prodInfo, request.getParameterMap());
	}catch(IllegalAccessException e){
		e.printStackTrace();
	}catch(InvocationTargetException e){
		e.printStackTrace();
	}
	
	String message = URLEncoder.encode("상품등록이 완료되었습니다.", "UTF-8");
	
	IProdService service = IProdServiceImpl.getInstance();
	service.insertProdInfo(prodInfo);
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
<%
	response.sendRedirect(request.getContextPath() + "/10/main.jsp?contentPage=/10/prodList.jsp");
%>
</body>
</html>