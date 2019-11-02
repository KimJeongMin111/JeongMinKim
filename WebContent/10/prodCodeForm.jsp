<%@page import="kr.or.ddit.vo.LprodVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%


%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script>
  $(function(){
      $('input[type=image]').click(function(){
         $.ajax({
             type : "POST" //"POST", "GET"   <form method="post"> / ajax{type="post"}
             , url : "<%=request.getContextPath() %>/10/searchedProd.jsp"
             , dataType : "json"
             , data : { lprod_nm : $('#lprod_nm').val() }
             , error : function(result) {
                             alert("code : " + request.status + "\r\n message : " + request.reponseText);
                       }
             , success : function(result) {
                         //TODO 취득한 json 형식의 문자열을 활용해서 Table 태그의 tr을 반복적으로 작성
                         //TODO Table 태그의 tr에 클릭 이벤트가 설정
                        var htmls = '<table width="100%" height="200px" border="0" cellspacing="0" cellpadding="0" ' + 
                                 'style="overflow:scroll;" id="prodTBL">';
                        for(var i = 0; i < result.length; i++){
                           htmls += '<tr>' +
                                    '<td>' + result[i].prod_id +'</td>' +
                                    '<td>' + result[i].prod_name +'</td>' +
                                    '<td>' + result[i].prod_lgu +'</td>' +
                                 '</tr>';
                        }
                        htmls += '</tbody></table>';
                        htmls += '<button type="button">확인</button>';
                        
                        $('#viewTable').html(htmls);
                        
                        $('button').click(function(){
                           var prod_id = $('#prodTBL').find('tr:last td:eq(0)').text();
                           aa = prod_id.substring(0,1);
                           bb = parseInt(prod_id.substring(1))+1;
                           $(opener.document).find('#prod_id').val(aa+bb);
                           
                           var prod_lgu = $('#prodTBL').find('tr:last td:eq(2)').text();
                           $(opener.document).find('#prod_lgu').val(prod_lgu).prop('selected', true);
                           self.close();
                        });
                      }
         });
      });
   });
		
		
		 <%-- $.ajax({
			    type : "POST"
			    , url : "<%=request.getContextPath()%>/10/searchedProd.jsp" 
			    , dataType : "json"  
			    , data : { id : idvalue } 
			    , error : function(xhr) {
			                alert("code : " + xhr.status + "\r\nmessage : " + xhr.reponseText);
			              }
			    , success : function(result) {
			    			//TODO 취득한 json형식의 문자열을 활용해서 Table 태그의 tr을 반복적으로 작성 및 추가
			    			//TODO Table 태그의 tr에 클릭 이벤트가 설정 
			    			var htmls = '<table width="200px", height="200px", border="0", cellspacing="0", cellpadding="0", style="overflow:scroll", id="prodTBL">' +
			    						 '<thead>' +
			    						     '<tr>' +
			    						      '<th>상품코드</th>' +
			    						      '<th>상품분류코드</th>' +
			    						      '<th>상품명</th>' +
			    						     '</tr>' +
			    						 '</thead>' +
			    						'<tbody>';
			    			for(var i=0; i<result.length; i++){
			    				htmls += '<tr>' +
			    				          '<td>' + result[i].prod_id + '</td>' + 
			    				          '<td>' + result[i].prod_name + '</td>' + 
			    				         '</tr>';
			    			}
			    			htmls += '</tbody></table>';
			    			
			    			$('#viewTable').empty().html(htmls);
			    			
			    			$('#prodTBL tr:gt(0)').click(function(){
			    				var prodcode = $(this).find('td:eq(0)').text();
			    				var res = prodcode.substring(1, 10);
			    				var result = parseInt(res) + 1;
			    				
			    				var pGu = $(this).find('td:eq(1)').text();
			    				
			    				
			    				/* 
			    				//팝업을 오픈한 도큐먼트 : main.jsp?contentPage=/06/memberForm.jsp
			    				$('#mem_zip1', opener.document).val(zipcode.split('-')[0]);
			    			//	$(opener.document).find('#mem_zip1').val(zipcode.split('-')[0]);
			    				$(opener.document).find('#mem_zip2').val(zipcode.split('-')[1]);
			    				 */
			    				 $('#prod_id', opener.document).val("P" + result);
			    				 $('#prod_img', opener.document).val("P" + result + ".gif");
			    				 $('#prod_name', opener.document).focus();
			    				 
			    				//팝업이 종료됨
			    				self.close();
			    			});
			    			
			    		}
			    });
		 });
	}); --%>
</script>
</head>
<body>
   <table width="354" border="0" cellspacing="0" cellpadding="0">
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
                  <td height="25"><div align="center">찾고자 하는 상품분류명을 입력해주세요.</div></td>
               </tr>
               <tr>
                  <td height="38" background="../image/open_tt.gif" align="center">
                     <input type="text" id="lprod_nm">&nbsp;분류명&nbsp;
                     <br>
                     <input type="image" src="<%=request.getContextPath() %>/image/bt_search.gif" border='0'
                     align="middle">
                  </td>
               </tr>
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