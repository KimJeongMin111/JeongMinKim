<!-- 디렉티브 : 해당 jsp파일의 선언부 
			  서블릿 클래스 response.setContentType("text/html; charset="UTF-8");
			  서블릿 클래스 response.setCharacterEncoding("UTF-8");
			  
-->
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%! 
	//디클러레이션 : 해당 jsp파일 내에 메서드, 전역변수 정의
	private int plus(int i, int j){
		return i + j;
}
%>    

<%
	//스크립트릿 : 해당 jsp 파일 내에 자바 코드(비즈니스 로직) 포함
	Date currentDate = new Date();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<script>
 alert('hello jsp');        
</script>
</head>
<body>
<!-- 익스프레션 : 디클러레이션 또는 스크립트릿에 선언된 자원을 활용한 
                    응답 컨텐츠 작성시 활용 
      주석 : html <!--  풀때 control shift c 
     JSP 영역 주석 : <%-- --%>
-->
현재 날짜는 <%= currentDate %> 입니다. <br />
10과 20을 더한 합은 <%= plus(10, 20) %> 입니다.
