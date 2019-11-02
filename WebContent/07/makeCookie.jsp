<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//쿠키 생성 : 클라이언트(브라우저:javascript, jquery) 생성
	//          서버(Java) 생성 후 응답객체의 해더에 쿠키를 포함해서 클라이언트에 전송
	//쿠키 사이즈 : 4kb 이내 권장(너무 길면 안된다)
	//쿠키 저장 : 클라이언트(브라우저)의 메모리|파일 단위로 쿠키가 저장
	//쿠키 전송 : 클라이언트(브라우저)의 쿠키 저장소에 저장된 쿠키는
	//			해당 클라이언트의 서버 대상 요청 시 전송되려는 성향
	//			전송 또는 미전송을 구분하는 기준 - 도메인과 경로 일치여부
	//쿠키 구조 : 문자열,  패턴 => 키=값;유효시간=값;도메인=값;경로=값;
	//쿠키 유효시간(만료시간) : 클라이언트의 쿠키 저장소에 저장된 쿠키는 
	//						유효시간이 경과하면 저장소로부터 삭제
	//						default : -1(해당 클라이언트[브라우저] 종료시 삭제처리)
	
	Cookie memidCookie = new Cookie("mem_id", "a001");
	memidCookie.setPath("/"); //경로 default값
	response.addCookie(memidCookie); //쿠키 저장
	
	Cookie mempassCookie = new Cookie("mem_pass", "asdfasdf");
	//서버단 쿠기의 유효시간 설정 : 초단위 
	mempassCookie.setMaxAge(60*60*24);  //int타입
	mempassCookie.setPath("/ddit/07");
	response.addCookie(mempassCookie);  
	
	//URLEncoder.encode가 깨지는것 방지
	Cookie memnameCookie = new Cookie("mem_name", URLEncoder.encode("김은대", "UTF-8"));
	memnameCookie.setDomain("www.bagrant.co.kr");
	memnameCookie.setPath("/ddit/");
	response.addCookie(memnameCookie);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
쿠키가 맛있게 구워졌습니다.
</body>
</html>