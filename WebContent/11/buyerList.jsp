<%@page import="java.util.Map"%>
<%@page import="kr.or.ddit.vo.LprodVO"%>
<%@page import="kr.or.ddit.lprod.service.ILprodServiceImpl"%>
<%@page import="kr.or.ddit.lprod.service.ILprodService"%>
<%@page import="kr.or.ddit.vo.BuyerVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.buyer.service.IBuyerServiceImpl"%>
<%@page import="kr.or.ddit.buyer.service.IBuyerService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	IBuyerService service = IBuyerServiceImpl.getInstance();
	List<Map<String,String>> buyerList = service.buyerList();
	
	
	response.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	

	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src='http://code.jquery.com/jquery-latest.js'></script>
<script type="text/javascript">

	$(function(){
		$('table tr:gt(0)').click(function(){
			var buyer_id = $(this).find('td:eq(0)').text();
			location.href = '<%=request.getContextPath() %>/11/main.jsp?contentPage=/11/buyerView.jsp?buyer_id=' + buyer_id;
		});
		
		$('#btn2').click(function(){
			$(location).attr('href', '<%=request.getContextPath()%>/11/main.jsp?contentPage=/11/buyerForm.jsp');
		});
	});
	
</script>
</head> 
<body>
<div id="list">
	<table class="mdl-data-table mdl-js-data-table mdl-data-table--selectable mdl-shadow--2dp" style="width: 100%;">
		<thead>
			<tr>
				<th class="mdl-data-table__cell--non-numeric">거래처코드</th>
				<th class="mdl-data-table__cell--non-numeric">거래처명</th>
				<th class="mdl-data-table__cell--non-numeric">상품분류명</th>
				<th class="mdl-data-table__cell--non-numeric">담당자명</th>
				<th class="mdl-data-table__cell--non-numeric">전화번호</th>
				<th class="mdl-data-table__cell--non-numeric">메일</th>
			</tr>
		</thead>
		<tbody>
<%
	for(Map<String,String> buyerInfo : buyerList){
%>		
	
			<tr>
				<td class="mdl-data-table__cell--non-numeric"><%=buyerInfo.get("BUYER_ID") %></td>
				<td class="mdl-data-table__cell--non-numeric"><%=buyerInfo.get("BUYER_NAME") %></td>
				<td class="mdl-data-table__cell--non-numeric"><%=buyerInfo.get("LPROD_NM") %></td>
				<td class="mdl-data-table__cell--non-numeric"><%=buyerInfo.get("BUYER_CHARGER") %></td>
				<td class="mdl-data-table__cell--non-numeric"><%=buyerInfo.get("BUYER_COMTEL") %></td>
				<td class="mdl-data-table__cell--non-numeric"><%=buyerInfo.get("BUYER_MAIL") %></td>
			</tr>
<%
	}
%>			
		</tbody>
	</table>
</div>
<div class="searchForm" align="right" style="margin-top: 10px;">
	<form method="post" action="">
		<select name="search_keycode">
			<option value="ALL">전체</option>
			<option value="BUYERID">거래처코드</option>
			<option value="BUYERNAME">거래처명</option>
			<option value="BUYERCHARGER">담당자명</option>
		</select>
		<input type="text" id="search_keyword" name="search_keyword">
		<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" type="button">검색</button>
		<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" id="btn2" type="button">거래처등록</button>
	</form>
</div>
</body>
</html>








