<%@page import="kr.or.ddit.vo.ProdVO"%>
<%@page import="kr.or.ddit.prod.service.IProdServiceImpl"%>
<%@page import="kr.or.ddit.prod.service.IProdService"%>
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

	String code = request.getParameter("lprod_nm");
	
	Map<String, String> params = new HashMap<String, String>();
	params.put("lprod_nm", code);
	
	
	IProdService service = IProdServiceImpl.getInstance();
	List<ProdVO> prodList = service.searchProd(code);
	
	ObjectMapper mapper = new ObjectMapper();
	String jsonData = mapper.writeValueAsString(prodList);
	
	out.println(jsonData);
%>    
