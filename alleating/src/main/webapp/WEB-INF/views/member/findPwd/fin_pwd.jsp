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
   <style>
    #emailText{
      color: #000060;
      font-weight: bold;
    }
    .pwdchangeresult{
      font-size: 26px;
      margin: 100px;
    }
    .emailTextCenter{
      text-align: center;
    }
    .grayText{
      font-size: 17px;
      color: gray;
    }
   </style>
</head>
<body>
    <div class="pwdchangeresult">
      <img src="${contextPath}/img/image_icon/free-icon-email.png" alt="mailIcon" width="44px" height="44px">
    <div class="emailTextCenter">
      <span id="emailText">${email}</span>으로<br>
      비밀번호 재설정 메일이 발송되었어요.
    </div>
      <div class="emailTextCenter grayText">
      5분 후에도 메일이 오지 않는다면<br>
      스팸함을 확인해 주세요
    </div>
  </div>


    
    </body>
    </html>