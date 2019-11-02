<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
td {f on t-family:"돋움";
	font-size: 9pt;
	line-height: 16px;
	color: #818181;
	letter-spacing: 0px;
}

td a {
	font-family: "돋움";
	font-size: 9pt;
	line-height: 16px;
	color: #818181;
	letter-spacing: 0px;
	text-decoration: none;
}

td a:hover {
	font-family: "돋움";
	font-size: 9pt;
	line-height: 16px;
	color: #818181;
	letter-spacing: 0px;
	text-decoration: underline;
}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="/ddit/js/validation.js"></script>
<script>
	$(function(){
		// $('#btnsearch').click(function(){
			 /* if(!$('#buyer').val().validationBUYER()){
				alert('거래처를 바르게 입력해주세요.');
				return;
				
			}  */
			
			 $.ajax({
				    type : "POST"
				    , url : "<%=request.getContextPath()%>/10/searchedBuyer.jsp" 
				    , dataType : "json"  
				    /* , data : { buyer : $('#buyer').val() } */
				    , error : function(xhr) {
				                alert("code : " + xhr.status + "\r\nmessage : " + xhr.reponseText);
				              }
				    , success : function(result) {
				    			//TODO 취득한 json형식의 문자열을 활용해서 Table 태그의 tr을 반복적으로 작성 및 추가
				    			//TODO Table 태그의 tr에 클릭 이벤트가 설정 
				    			var htmls = '<table width="200px", height="200px", border="0", cellspacing="0", cellpadding="0", style="overflow:scroll", id="buyerTBL">' +
				    						 '<thead>' +
				    						     '<tr>' +
				    						      '<th>거래처번호</th>' +
				    						      '<th>거래처명</th>' +
				    						     '</tr>' +
				    						 '</thead>' +
				    						'<tbody>';
				    			for(var i=0; i<result.length; i++){
				    				htmls += '<tr>' +
				    				          '<td>' + result[i].buyer_id + '</td>' + 
				    				          '<td>' + result[i].buyer_name + '</td>' + 
				    				         '</tr>';
				    			}
				    			htmls += '</tbody></table>';
				    			
				    			$('#viewTable').empty().html(htmls);
				    			
				    			$('#buyerTBL tr:gt(0)').click(function(){
				    				var buyercode = $(this).find('td:eq(0)').text();
				    				
				    				/* 
				    				//팝업을 오픈한 도큐먼트 : main.jsp?contentPage=/06/memberForm.jsp
				    				$('#mem_zip1', opener.document).val(zipcode.split('-')[0]);
				    			//	$(opener.document).find('#mem_zip1').val(zipcode.split('-')[0]);
				    				$(opener.document).find('#mem_zip2').val(zipcode.split('-')[1]);
				    				 */
				    				 $('#prod_buyer', opener.document).val(buyercode);
				    				 $('#prod_cost', opener.document).focus();
				    				 
				    				//팝업이 종료됨
				    				self.close();
				    			});
				    			
				    		}
				    });
			 //});
			
	});

</script>
</head>
<body>
	<table width="354" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<!-- <td height="30"><img src="../image/open_post.gif" width="136"
				height="22"></td> -->
		</tr>
		<tr>
			<td><img src="../image/open_table01.gif" width="354" height="10"></td>
		</tr>
		<tr>
			<td height="10" background="../image/open_table02.gif" align="center">&nbsp;</td>
		</tr>
		<tr>
			<td height="300" align="center" valign="top"
				background="../image/open_table02.gif">
				<table width="300" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td height="25"><div align="center">거래처를
								선택해주십시오.</div></td>
					</tr>
					<!-- <tr>
						<td height="38" background="../image/open_tt.gif" align="center">
							 <input type="text" id="buyer">&nbsp;&nbsp;
							<input id="btnsearch" type="image" src="../image/bt_search.gif" border='0'
							align="middle"> 
						</td>
					</tr> -->
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>
							<div style="overflow: auto; white-space: nowrap; overflow-X: hidden; height: 200px;" id="viewTable">
							</div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td><img src="../image/open_table03.gif" width="354" height="10"></td>
		</tr>
	</table>
</body>
</html>