<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <% request.setCharacterEncoding("utf-8"); %>
    <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
    <link href="${contextPath}/css/find_id_02.css" rel="stylesheet" type="text/css" />
    <!DOCTYPE html>
<html>
<head>
    

    <title>아이디 찾기 결과</title>
    <script>
        function fn_gologinForm(){
            location.href="/member/loginForm.do"
        }
        function fn_goFindPwdForm(){
            location.href="/member/find_pwd_01.do"
        }
    </script>
</head>
<body>
  
    <div class="findidresult">



<div class="findidresult-detail">
<h1 class="findidresult-title">아이디 찾기 결과</h1>
<h5>고객님의 정보와 일치하는 아이디입니다.</h5>
</div>

<div class="findidresultview">
<div class="findidresultview-2">
    <div class="idlocation">
   <h3 class="idview">${findUserId}</h3>
</div>
</div>
<div class="findidresult-next">
  <div class="findidresult-login">
    <button type="button"  radius="3" class="findidresult-login-button" onclick="fn_gologinForm()">
    <span class="findbutton-text">로그인하기</span>
    </button>
     </div>
     <div class="findidresult-pwdfind">
        <button type="button"  radius="3" class="findidresult-pwdfind-button" onclick="fn_goFindPwdForm()">
        <span class="findbutton-text">비밀번호 찾기</span>
        </button>
         </div>
        </div>
</div>

</div>

    </body>
    </html>