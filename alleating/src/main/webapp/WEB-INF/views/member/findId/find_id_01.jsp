<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <% request.setCharacterEncoding("utf-8"); %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
    <link href="${contextPath}/css/find_id_01.css" rel="stylesheet" type="text/css" />
    <!DOCTYPE html>
<html>
<head>
    

    <title>아이디 찾기</title>
</head>
<body>
    <div class="findid">
<div class="findid-detail">
<h1 class="findid-title">아이디 찾기</h1>
</div>
<div class="findform">
<div class="form-floating mb-3" id="findform-2">
    <input type="text" class="form-control" id="floatingInput" name="name" placeholder="name">
    <label for="floatingInput">이름</label>
  </div>
  <div class="form-floating" id="findform-3">
    <input type="email" class="form-control" id="floatingInput" name="email" placeholder="id@example.com">
    <label for="floatingInput">이메일</label>
  </div>

  <div class="findid-next">
    <button type="button"  radius="3" class="findbutton" onclick="location.href='${contextPath}/member/find_id_02.do'">
    <span class="findbutton-text">다음</span>
    </button>
     </div>
</div>



<!-- <div class="form-floating" id="findid-1">
아이디 <input class="fillinid" type="text">
<label for="floatingPassword">Id</label>
</div>
<div class="form-floating" id="findid-2">
비밀번호 <input class="fillinpw" type="password">
<label for="floatingPassword">Password</label>
</div> -->



</div>

    </div>
    </body>
    </html>