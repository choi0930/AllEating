<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <% request.setCharacterEncoding("utf-8"); %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
    <link href="${contextPath}/css/find_pwd_01.css" rel="stylesheet" type="text/css" />
    <!DOCTYPE html>
<html>
<head>
    

    <title>비밀번호 찾기</title>
</head>
<body>
    <div class="findpwd">
<div class="findpwd-detail">
<h1 class="findpwd-title">비밀번호 찾기</h1>
</div>
<div class="findform">
<div class="form-floating" id="findform-4">
    <input type="text" class="form-control" id="floatingInput" placeholder="id">
    <label for="floatingInput">아이디</label>
  </div>
  <div class="form-floating" id="findform-5">
    <input type="text" class="form-control" id="floatingInput" placeholder="name">
    <label for="floatingInput">이름</label>
  </div>
  <div class="form-floating" id="findform-6">
    <input type="text" class="form-control" id="floatingInput" placeholder="id@example.com">
    <label for="floatingInput">이메일</label>
    <button type="button"  radius="3" class="emailrequestbutton">
        <span class="emailrequestbutton-text">인증번호 받기</span>
        </button>
  </div>
  <div class="form-floating" id="findform-7">
    <input type="text" class="form-control" id="floatingInput" placeholder="111111" >
    <label for="floatingInput">인증번호 6자리 숫자 입력</label>
  </div>




  
  <div class="findpwd-next">
    <button type="button"  radius="3" class="findbutton" onclick="location.href='${contextPath}/member/find_pwd_02.do'">
    <span class="findbutton-text">다음</span>
    </button>
     </div>
</div>





</div>

    </div>
    </body>
    </html>