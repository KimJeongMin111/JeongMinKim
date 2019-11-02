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
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/validation.js"></script>
<script type="text/javascript">
   $(function(){
      $('input[type=image]').click(function(){
         $.ajax({
             type : "POST" 
             , url : "<%=request.getContextPath()%>/11/searchedBuyer.jsp" 
             , dataType : "json"
             , data : {code : $('#code').val()}
             , error : function(result) {
                alert("code : " + result.status + "\r\n message : " + result.reponseText);
               }
             , success : function(result) {
               var htmls = '<table width="100%" height="200px" border="0" cellspacing="0" cellpadding="0" ' 
                           + 'style="overflow:scroll;" id="buyercodeTBL">' 
                              + '<thead>'
                                 + '<tr>' 
                                    + '<th>상품분류코드</th>' 
                                    + '<th>상품분류명</th>' 
                                    + '<th>거래처코드</th>' 
                                 + '</tr>'
                              + '</thead>'
                              + '<tbody>';
                              
               for(var i=0; i<result.length; i++){
                  htmls += '<tr>'
                           + '<td>' + result[i].BUYER_LGU + '</td>'
                           + '<td>' + result[i].LPROD_NM + '</td>'
                           + '<td>' + result[i].BUYER_ID + '</td>'
                        + '</tr>';
               }
                              
               htmls += '</tbody></table>';
               
               $('#viewTable').html(htmls);
               
               $('#input').click(function(){
                  var data = $('#buyercodeTBL tr:last').find('td:eq(2)').text();
                  var data1 = parseInt(data.substring(1,data.length));
                  var data2 = 'P' + (data1 + 1);
                  
                  var lgu = $('#buyercodeTBL tr:last').find('td:eq(0)').text();
                  
                  $('#buyer_id', opener.document).val(data2);
                  $('select[name=buyer_lgu] option[value="'+ lgu +'"]', opener.document).attr('selected', true);
                  
                  self.close();
                  
                  $('#buyer_name', opener.document).focus();
               });
             }
         });
      });
   });
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
                  <td height="25"><div align="center">상품분류명을 입력하세요.</div></td>
               </tr>
               <tr>
                  <td height="38" background="<%=request.getContextPath() %>/image/open_tt.gif" align="center">
                     <input type="text" id="code">&nbsp;상품분류명&nbsp;
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
   <input type="button" id="input" value="적용" style="margin-left: 150px"/>
</body>
</html>