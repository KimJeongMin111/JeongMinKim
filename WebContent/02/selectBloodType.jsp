<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
1.	selectBloodType.jsp 요청 후 취득된 응답컨텐츠에서
	혈액형 선택 후 [요청] 클릭되면
	bloodTypeRedirected.jsp?bloodType=A 요청
	
2.	bloodTypeRedirected.jsp
	혈액형 취득
	만약 A형이면 a.jsp로 리다이렉트 처리
		* response.sendRedirect("/ddit/02/a.jsp");
	만약 B형이면 b.jsp로 리다이렉트 처리
	만약 O형이면 o.jsp로 리다이렉트 처리
	만약 AB형이면 ab.jsp로 리다이렉트 처리
	
3.	a|b|o|ab.jsp
		네이버 혈액형 별 성격 검색 결과를 각각의 jsp에 추가해서 작성
		
 -->

<!-- form action="수신대상" --> 
<form action="/ddit/02/bloodTypeRedirected.jsp">
<select name="bloodType" id="">
		<option value="A">A형</option>
		<option value="B">B형</option>
		<option value="O">O형</option>
		<option value="AB">AB형</option>
	</select>
	<input type="submit" value="요청" />
</form>
</body>
</html>