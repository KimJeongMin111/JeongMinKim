<%@page import="kr.or.ddit.utiles.CryptoGenerator"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//공개키 취득
	Map<String, String> publicKeyMap = CryptoGenerator.generatePairKey(session);
%>
<%
	request.setCharacterEncoding("UTF-8");
	String message = request.getParameter("message");
	
	response.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/admin.css" type="text/css">
<title>회원관리 관리자 로그인</title>
<!-- 
	클라이언트단 SHA254|512 해시 암호화 알고리즘을 적용한 암호화 환경
	 1. js 라이브러리
	 	1-1. http://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9/core.js
	 	1-1. http://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9/sha256.js
 -->
<script type='text/javascript' src='http://code.jquery.com/jquery-latest.js'></script>
<script type='text/javascript' src="<%=request.getContextPath()%>/js/validation.js"></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/js/cookieControl.js'></script>
<!-- 
	자바스크리비트 RSA 암호화 환경
	1. js 라이브러리
	   http://www-cs-students.stanford.edu/~tjw/jsbn
	   
	   jsbn.js, prng4.js, rng.js, rsa.js 다운로드
	   
	2. js 폴더 import
	
	3. js 라이브러리 선언 순서
 	   (1)jsbn.js, (2)rsa.js, (3)prng4.js, (4)rng.js
 -->
 <script type="text/javascript" src="<%=request.getContextPath()%>/js/jsbn.js"></script>
 <script type="text/javascript" src="<%=request.getContextPath()%>/js/rsa.js"></script>
 <script type="text/javascript" src="<%=request.getContextPath()%>/js/prng4.js"></script>
 <script type="text/javascript" src="<%=request.getContextPath()%>/js/rng.js"></script>
<!-- 
   클라이언트단    SHA256|512 해시 암호화 알고리즘을 적용한 암호화 환경
      1. js 라이브리
        1.1 http://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9/core.js
        1.1 http://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9/sha256.js
 -->
 <script type="http://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9/core.js"></script>
 <script type="http://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9/sha256.js"></script>
<script type='text/javascript'>
   //alert
   if('<%=message%>' != 'null') {
      alert("<%=message%>");
   }
   
   
   
   $(function(){ 
	   
	   
// 	   console.log(Get_Cookie('mem_id'));
	   if(Get_Cookie('mem_id')){
		   a = Get_Cookie('mem_id');
		    $('input[name=mem_id]').val(a);
		    $('input[type=checkbox]').prop('checked', true);
		  }  
      
           
         $('.loginBtn').click(function(){
            
            // 해시 암호화 기법(단방향성 FingerPrint)을 할용한 해싱(암호화 기법)
            // - 해싱된 암호문을 서버 단에서 평문으로 복호화 하지 않고 활용.
            // - 적용된 해시 암호화알고리즘이 해커에 의해서 뚫리면 모든 데이터가 평문으로 변경되어 노출됨.
            // - 사용을 기피 이유 : 단어사전입력공격(무차별 글자조합 적용 입력)
            //               대응 - salt(소금치기) salt + 해시 암호화 기법
            // 해시암호화 알고리즘 : SHA256(256bit : 32byte) or SHA512(512bit:64byte) : 32byte Hexa 표현(암호화 결과값)
            
            var mem_id = $('input[name=mem_id]').val();
             // 평문 a001을 해시 암호화 처리 후 반환.  
             //var encrypt_id = CryptoJS.SHA256(mem_id).toString();  
             var mem_pass = $('input[name=mem_pass]').val();
              //var encrypt_pass = CryptoJS.SHA256(mem_pass).toString();
            
            
            //javascript, jquery 내 jsp 익스프레션 선언시 반드시 '' 또는 "" 
            var modulus = '<%=publicKeyMap.get("publicModulus")%>';
            var exponent = '<%=publicKeyMap.get("publicExponent")%>';
            
            var rsaOBJ = new RSAKey();
            rsaOBJ.setPublic(modulus, exponent);
            
            var encrypt_id = rsaOBJ.encrypt(mem_id);
            var encrypt_pass = rsaOBJ.encrypt(mem_pass);
            
            
            
            var $frm = $('<form action="<%=request.getContextPath()%>/06/loginCheck.jsp" method="POST"></form>'); 
            $frm.append('<input type="hidden" name="mem_id" value="'+ encrypt_id + '"/>'); 
            $frm.append('<input type="hidden" name="mem_pass" value="'+ encrypt_pass +'"/>'); 
         
            $(document.body).append($frm); 
            
        	if($('input[type=checkbox]').is(':checked')){
//         		console.log($('input[name=mem_id]').val());
     			Set_Cookie('mem_id', $('input[name=mem_id]').val(), 1, '/');
        		console.log("setCookie2");
     		}else{
     			Delete_Cookie('mem_id', '/');
     		}

   				
             $frm.submit(); 
         });
            
      
   });
</script>

</head>
<body>
   <table width="770" border="0" align="center" cellpadding="0"
      cellspacing="0" style="margin: 90px;">
      <tr>
         <td height="150" align="center"><img
            src="${pageContext.request.contextPath }/image/p_login.gif" /></td>
      </tr>
      <tr>
         <td height="174"
            style="background: url(${pageContext.request.contextPath }/image/login_bg.jpg); border: 1px solid #e3e3e3;">
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
               <tr>
                  <td width="260" height="110" align="center"
                     style="border-right: 1px dotted #736357;"><img
                     src="${pageContext.request.contextPath }/image/logo.jpg" /></td>
                  <td>
                     <table border="0" align="center" cellpadding="5" cellspacing="0">
                        <tr>
                           <td><b>아이디</b></td>
                           <td><input type="text" name="mem_id" class="mem_id"
                              tabindex="3" height="18" /></td>
                           <td rowspan="2"><img
                              src="${pageContext.request.contextPath }/image/login.gif"
                              class="loginBtn" onclick="" /></td>
                        </tr>
                        <tr>
                           <td><b>패스워드</b></td>
                           <td><input type="password" name="mem_pass" class="mem_pass"
                              tabindex="3" height="18" /></td>
                        </tr>
                        <tr>
                           <td colspan="3" align="right">
                           아이디 저장:<input type="checkbox" id="saveID" />
                           <a href="<%=request.getContextPath() %>/06/main.jsp?contentPage=/06/memberForm.jsp">회원가입을 원하세요??</a></td>
                        </tr>
                     </table>
                  </td>
               </tr>
            </table>
         </td>
      </tr>
   </table>
</body>

</html>
