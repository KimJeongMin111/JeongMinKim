<%@page import="kr.or.ddit.lprod.service.ILprodServiceImpl"%>
<%@page import="kr.or.ddit.lprod.service.ILprodService"%>
<%@page import="kr.or.ddit.prod.service.IProdService"%>
<%@page import="kr.or.ddit.vo.LprodVO"%>
<%@page import="kr.or.ddit.vo.BuyerVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.buyer.service.IBuyerServiceImpl"%>
<%@page import="kr.or.ddit.buyer.service.IBuyerService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String message = request.getParameter("message");
	
	ILprodService service = ILprodServiceImpl.getInstance(); 

	List<LprodVO> gulist = service.selectLprodNames();
	
	response.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src = "/ddit/js/validation.js"></script>
<script type="text/javascript" src='/ddit/js/Validation.js'></script>
<script type="text/javascript">
	$(function(){
		
		$('#btn1').click(function(){
			$(location).attr('href', '<%=request.getContextPath()%>/11/insertBuyerInfo.jsp ');
		});
		
		$('#btn3').click(function(){
			$(location).attr('href', '<%=request.getContextPath()%>/11/main.jsp?contentPage=/11/buyerList.jsp');
		});
		
		$('form').submit(function(){
			/* validation!!!!!!!!! */
		});
		
		$('#search_buyer_id').click(function(){
			var url = '<%=request.getContextPath()%>/11/buyerSearchForm.jsp';
			var options = 'copyhistory=no,width=380px,height=400px,status=no,resizable=no,scrollbars=no';
			window.open(url, '거래처코드중복검사', options);
		});
		
		$('form').submit(function(){
	         if(!$('#buyer_id').val().validationBUYERID()){
	            alert('거래처 코드를 바르게 입력해주세요.');
	            return false;
	         }
	         if(!$('#buyer_lgu').val().validationBUYERLGU()){
	            alert('상품 분류 코드를 바르게 입력해주세요.');
	            return false;
	         }
	         if(!$('#buyer_charger').val().validationBUYERNAME()){
	            alert('담당자를 바르게 입력해주세요.');
	            return false;
	         }
	         if(!$('#buyer_comtel').val().validationBUYERTEL()){
	            alert('전화번호를 바르게 입력해주세요.');
	            return false;
	         }
	         if(!$('#buyer_fax').val().validationBUYERTEL()){
	            alert('팩스 번호를 바르게 입력해주세요.');
	            return false;
	         }
	         if(!$('#buyer_mail').val().validationBUYERMAIL()){
	            alert('메일을 바르게 입력해주세요.');
	            return false;
	         }
	      });
		
	});
</script>

</head>
<style>
.fieldName {text-align: center; background-color: #f4f4f4;}
/* .tLine {background-color: #d2d2d2; height: 1px;} */
/* .btnGroup { text-align: right; } */
td {text-align: left; }
</style>
<body>
<form action="<%=request.getContextPath() %>/11/insertBuyerInfo.jsp" name="buyerForm" method="post">
<table width="600" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td class="fieldName" width="100px" height="25">거래처코드</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="buyer_id" name="buyer_id" value="">
				<label class="mdl-textfield__label" for="buyer_id">거래처코드</label>
				<button style="margin-left: 400px; width: 200px;" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="search_buyer_id" type="button">거래처코드중복검사</button>
			</div>
		</td>
	</tr>
	<tr>
		<td class="fieldName" width="100px" height="25">거래처명</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="buyer_name" name="buyer_name" value="">
				<label class="mdl-textfield__label" for="buyer_name">거래처명</label>
			</div>
		</td>
	</tr>
	<tr>
		<td class="fieldName" width="100px" height="25">상품분류코드</td>
		<td>
			<div class="mdl-selectfield">
				<!-- 해당 셀렉트에 출력될 option의 구성은 LProd 테이블의 lprod_gu와 lprod_nm으로 UI출력시 먼저 
				     구성되도록 함.
				 -->
				<select class="browser-default" name="buyer_lgu" id="buyer_lgu">
					<option value="" disabled selected>상품분류코드</option>
					<%
						for(LprodVO guInfo : gulist){
					%>
						<option value="<%=guInfo.getLprod_gu() %>"><%=guInfo.getLprod_nm() %></option>
					<%		
						}
					%>
				</select>
			</div>
		</td>
	</tr>
	<tr>
		<td class="fieldName" width="100px" height="25">담당자</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="buyer_charger" name="buyer_charger" value="">
				<label class="mdl-textfield__label" for="buyer_charger">담당자명</label>
			</div>			
		</td>
	</tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">거래은행</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="buyer_bank" name="buyer_bank" value="">
				<label class="mdl-textfield__label" for="buyer_bank">거래처명</label>
			</div>			
		</td>
	</tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">거래처주소1</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="buyer_add1" name="buyer_add1" value="">
				<label class="mdl-textfield__label" for="buyer_add1">거래처주소1</label>
			</div>			
		</td>
	</tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">거래처주소2</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="buyer_add2" name="buyer_add2" value="">
				<label class="mdl-textfield__label" for="buyer_add2">거래처주소2</label>
			</div>
		</td>
	</tr>
</table>
<table width="600" border="0" cellpadding="0" cellspacing="0" style="margin-top: 10px;">
	<tr>
		<td class="fieldName" width="100px" height="25">전화번호</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="buyer_comtel" name="buyer_comtel" value="">
				<label class="mdl-textfield__label" for="buyer_comtel">전화번호</label>
			</div>		
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">팩스번호</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="buyer_fax" name="buyer_fax" value="">
				<label class="mdl-textfield__label" for="buyer_fax">팩스번호</label>
			</div>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="300px" height="25">거래처메일</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="buyer_mail" name="buyer_mail" value="">
				<label class="mdl-textfield__label" for="buyer_mail">거래처메일</label>
			</div>
		</td>
	</tr>
	
	<tr><td colspan="2" height="20"></td></tr>
	
	<tr>
		<td class="btnGroup" colspan="2" >
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn1" type="submit">거래처등록</button>
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn2" type="reset">취소</button>
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn3" type="button">목록</button>
		</td>
	</tr>
</table>
</form>
</body>
</html>








