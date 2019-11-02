<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  
	http://localhost/ddit/01/gugudanResult.jsp?dan=2(문자열)
	
	request,response 기본적으로 제공하는 객체 
-->
<%!

	public int multiple(int i, int j){
		return i * j;	

	}

%>
<%
	//클라이언트 요청 헤더 구성
	//    요청라인 : 클라이언트의 서버대상 요청 시 URL, 프로토콜 정보, 쿼리스트링 전송방식
	//    요청헤더 : 서버로부터 취득을 기대하는 응답컨텐츠의 마임타입(text/html), 
	//             요청 시 클라이언트의 위치 국가코드와 언어코드, 쿠키정보, 세션정보, 
	//             클라이언트 정보(브라우저,버전,모바일인지...)
	//             클라이언트의 서버 대상 요청 후 상태정보(keep-alive)
	//    요청본문 : 클라이언트에서 서버대상 요청 시 쿼리 스트링 전송방식 POST일때 
	//			    패킷 내 저장된 쿼리스트링의 내용
	//클라이언트 응답 헤더 구성
	//    응답라인 : 프로토콜, 요청처리 결과 상태코드 및 상태값
	//    응답헤더 : 해당 요청을 처리한 서버, 응답컨텐츠의 마임타입, 응답컨텐츠의 사이즈, 응답처리일자
	//    응답본문 : 서버에서 클라이언트 대상 전송하는 응답컨텐츠
	
	String dan = request.getParameter("dan");
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%= dan %>단 <br/>

<%

	for(int j=1; j<10; j++){
%>
		<%=dan %> * <%=j %> = <%= multiple(Integer.parseInt(dan), j) %><br/>
<%
	}
%>	


<%-- 	<%= dan %>단 <br/>
<%
	for(int j=1; j<10; j++){
	
	int d = Integer.parseInt(dan);	
%>	
	<%=d %> * <%=j %> = <%=d*j %><br/>
<%
	}
%> --%>


</body>
</html>