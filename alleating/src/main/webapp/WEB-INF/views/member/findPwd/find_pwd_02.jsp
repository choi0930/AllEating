<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <% request.setCharacterEncoding("utf-8"); %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
    <link href="${contextPath}/css/find_pwd_02.css" rel="stylesheet" type="text/css" />
    <!DOCTYPE html>
<html>
<head>
    

    <title>비밀번호 재설정</title>
</head>
<body>
    <div class="pwdchangeresult">



<div class="pwdchange-detail">
<h1 class="pwdchange-title">비밀번호 재설정</h1>
<h5>고객님의 비밀번호를 재설정합니다.</h5>
</div>

<div class="pwdchangeform">
    <div class="form-floating mb-3" id="pwdchangeform-2">
        <input type="password" class="form-control" id="floatingPassword" placeholder="abc123">
        <label for="floatingPassword">비밀번호</label>
      </div>
      <div class="form-floating" id="pwdchangeform-3">
        <input type="password" class="form-control" id="floatingPassword" placeholder="abc123">
        <label for="floatingPassword">비밀번호 확인</label>
      </div>
      </div>



<div class="pwdchangeresult">
  <div class="pwdchangeresult-2">
    <button type="button"  radius="3" class="pwdchangeresultbutton" onclick="location.href='${contextPath}/member/login.do'">
    <span class="pwdchangeresultbutton-text">완료</span>
    </button>
     </div>
   
        </div>






</div>
</div>

    
    </body>
    </html>