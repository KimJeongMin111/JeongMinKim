<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page buffer="1kb" autoFlush="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	HttpServletResponse(기본객체 response) : 응답객체
		서버가 클라이언트 대상으로 전송될 응답컨텐츠 저장 또는
		리다이렉트 제어에 활용
		jsp의 출력버퍼(저장소 : 응답컨텐츠 저장) : default 8kb
		클라이언트 대상 전송(출력버퍼 저장된 응답컨텐츠) : Flush
													응답객체의 출력버퍼에 저장된 응답컨텐츠를 클라이언트 대상 전송
													* 출력버퍼에 저장된 응답컨텐츠의 출력버퍼 사이즈 이상일때 
													   출력버퍼 사이즈 단위로 분리해서 저장 후 Flush를 반복
													* 출력버퍼에 저장된 응답컨텐츠가 출력버퍼 사이즈 미만일때
													   _jspService() 종료시 Flush
		AutoFlush : default true 
		out.flush() : 현재 응답 객체의 출력버퍼에 저장된 응답컨텐츠를 클라이언트 대상 전송 후 출력버퍼가 clear
		out.clear() : 현재 응답 객체의 출력버퍼에 저장된 응답컨텐츠를 클라이언트에게 전송하지 않고, 출력버퍼에서 삭제처리 
				   	   출력버퍼가 한번 이상 Flush된 상태라면 IOException 발생 
		out.clearBuffer() : 현재 응답 객체의 출력버퍼에 저장된 응답컨텐츠를 클라이언트에게 전송하지 않고, 출력버퍼에서 삭제처리 
 -->
 <%
 	for(int i=0; i<50; i++){
 		out.println("출력버퍼 전체 사이즈 : " + out.getBufferSize() + "<br/>");
 		out.println("출력버퍼 저장 가능 사이즈 : " + out.getRemaining() + "<br/>");
 		if(i%10 == 0){
 			//수동 Flush
 			out.flush();
 		}
 	}
 %>
</body>
</html>