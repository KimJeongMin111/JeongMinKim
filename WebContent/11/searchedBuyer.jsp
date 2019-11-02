<%@page import="kr.or.ddit.vo.BuyerVO"%>
<%@page import="kr.or.ddit.buyer.service.IBuyerServiceImpl"%>
<%@page import="kr.or.ddit.buyer.service.IBuyerService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="kr.or.ddit.vo.ProdVO"%>
<%@page import="java.util.List"%>
<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="kr.or.ddit.prod.service.IProdServiceImpl"%>
<%@page import="kr.or.ddit.prod.service.IProdService"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
   request.setCharacterEncoding("UTF-8");

   String code = request.getParameter("code");
   
   Map<String, String> params = new HashMap<String, String>();
   params.put("lprod_nm", code);

   IBuyerService service = IBuyerServiceImpl.getInstance();
   List<Map<String, Object>> bList = service.getCode(params);
   
   ObjectMapper mapper = new ObjectMapper();
   String jsonData = mapper.writeValueAsString(bList);
   
   out.println(jsonData);
%>