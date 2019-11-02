<%@page import="kr.or.ddit.buyer.service.IBuyerServiceImpl"%>
<%@page import="kr.or.ddit.buyer.service.IBuyerService"%>
<%@page import="kr.or.ddit.vo.BuyerVO"%>
<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="kr.or.ddit.vo.ZipCodeVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.zipcode.service.IZipCodeService"%>
<%@page import="kr.or.ddit.zipcode.service.IZipCodeServiceImpl"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String code = request.getParameter("buyer_id");
	
	Map<String, String> params = new HashMap<String, String>();
	params.put("buyer_id", code);
	
	
	IBuyerService service = IBuyerServiceImpl.getInstance();
	List<BuyerVO> buyerList = service.searchBuyer(code);
	
	ObjectMapper mapper = new ObjectMapper();
	String jsonData = mapper.writeValueAsString(buyerList);
	
	out.println(jsonData);
%>    
