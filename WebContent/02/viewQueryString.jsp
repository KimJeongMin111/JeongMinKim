<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
아이디 : <%=request.getParameter("mem_id") %> <br/>
성명 : <%=request.getParameter("mem_name") %> <br/>
학위 : <%=request.getParameter("queststring_grp") %> <br/>
<h3>request.getParameterMap() : 클라이언트로부터 전송된 쿼리스트링을 Map 타입으로 반환</h3>
<%
	Map<String, String[]> paramMap = request.getParameterMap();
	Iterator<String> keys = paramMap.keySet().iterator();
	while(keys.hasNext()){
		String key = keys.next();
		String[] values = paramMap.get(key); 
		for(String value : values){
%>
			Map : <%=key %> - <%=value %><br/>
<% 
		}
	}
%>
<h3>request.getParameterValues(키) : 클라이언트로부터 전송된 단일키의 다중값 쿼리스트링을 키를 활용해 취득</h3>	
<%
	String[] values = request.getParameterValues("querystring_grp");
	for(String value : values){

%>
	String [] : <%=value %><br/>
<%		
	}
%>
<h3>request.getParameterNames() : 클라이언트로부터 전송되는 쿼리스트링의 키를 취득</h3>
<%
	Enumeration<String> names = request.getParameterNames();
	while(names.hasMoreElements()){
		String key = names.nextElement();
%>
	String : <%=key %><br/>
<%		
	}
%>
</body>
</html>













