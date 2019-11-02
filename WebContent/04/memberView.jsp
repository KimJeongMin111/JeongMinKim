<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="kr.or.ddit.member.service.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String mem_id = request.getParameter("mem_id");

	Map<String, String> params = new HashMap<String, String>();
	params.put("mem_id", mem_id);
	
	IMemberService service = IMemberServiceImpl.getInstance();
	MemberVO memberInfo = service.memberInfo(params);
	
	response.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>멤버 정보</title>
<script type='text/javascript' src='http://code.jquery.com/jquery-latest.js'></script>
<script type='text/javascript'>
	$(function() {
		$('input[value=회원목록]').click(function() {
			$(location).attr('href', '<%=request.getContextPath()%>/04/memberList.jsp');
		});
		$('input[value=회원탈퇴]').click(function() {
			$(location).attr('href', '<%=request.getContextPath()%>/04/deleteMember.jsp?mem_id=<%=memberInfo.getMem_id()%>');
		});
	});

</script>

</head>
<body>
<form action="<%=request.getContextPath() %>/04/updateMember.jsp" method="POST">
	<input type="hidden" name="mem_id" value="<%=memberInfo.getMem_id()%>"/>
	<table>
		<tr>
			<td>아이디</td>
			<td><input type="text" name="mem_id" disabled="disabled" value="<%=memberInfo.getMem_id()%>"/></td>
		</tr>
		<tr>
			<td>패스워드</td>
			<td><input type="text" name="mem_pass" value="<%= memberInfo.getMem_pass()%>"/></td>
		</tr>
		<tr>
			<td>성명</td>
			<td><input type="text" name="mem_name" disabled="disabled" value="<%=memberInfo.getMem_name()%>"/></td>
		</tr>
		<tr>
			<td>집 전화번호</td>
			<td><input type="text" name="mem_hometel" value="<%=memberInfo.getMem_hometel()%>"/></td>
		</tr>
		<tr>
			<td>회사 전화번호</td>
			<td><input type="text" name="mem_comtel" value="<%=memberInfo.getMem_comtel()%>"/></td>
		</tr>
		<tr>
			<td>휴대폰</td>
			<td><input type="text" name="mem_hp" value="<%=memberInfo.getMem_hp()%>"/></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input type="text" name="mem_mail" value="<%=memberInfo.getMem_mail()%>"/></td>
		</tr>
		<tr>
			<td>주소</td>
			<td>
				<input type="text" name="mem_add1" value="<%=memberInfo.getMem_add1()%>"/>
				<input type="text" name="mem_add2" value="<%=memberInfo.getMem_add2()%>"/>
			</td>
		</tr>
		<tr>
			<td>직업</td>
			<td><input type="text" name="mem_job" value="<%= memberInfo.getMem_job()%>"/></td>
		</tr>
		<tr>
			<td>취미</td>
			<td><input type="text" name="mem_like" value="<%= memberInfo.getMem_like()%>"/></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="회원정보수정" />
				<input type="button" value="회원탈퇴" />
				<input type="button" value="회원목록" />
			</td>
		</tr>
	</table>
</form>

</body>
</html>