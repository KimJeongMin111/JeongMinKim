<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="kr.or.ddit.member.service.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String mem_id = request.getParameter("mem_id");

	Map<String, String> params = new HashMap<String, String>();
	params.put("mem_id", mem_id);

	IMemberService service = IMemberServiceImpl.getInstance();
	MemberVO memberInfo = service.memberInfo(params);
	
	// http://search.maven.org
	//     jackson-core-asl-1.9.13.jar
	//     jackson-mapper-asl-1.9.13.jar
	// 자바 객체 -> json 형식 문자열
	// json 형식 문자열 -> 자바 객채
	Map<String, String> jsonMap = new HashMap<String, String>();
	
	if(memberInfo == null) {
		// { flag : true }
		jsonMap.put("flag", "true");
	}else {
		// { flag : false }
		jsonMap.put("flag", "false");
	}
	
	ObjectMapper jasonMapper = new ObjectMapper();
	String jsonData = jasonMapper.writeValueAsString(jsonMap);
	
	// { flag : true } or { flag : false }
	out.println(jsonData);
%>    
