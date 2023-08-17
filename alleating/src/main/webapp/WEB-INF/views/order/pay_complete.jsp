<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <% request.setCharacterEncoding("utf-8"); %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<title>주문 완료</title>
<link href="${contextPath}/css/pay_complete.css" rel="stylesheet" type="text/css" />





</head>
<body>



<div class="paycomplete-main">
    <div class="paycomplete-box">
        <div class="paycomplete-text">
         <h1>주문이 완료되었습니다!</h1>
        </div>
        <div class="paycomplete-ordernum">
            주문 번호: 23081512345
        </div>
    <div class="paycomplete-next">
        <div class="paycomplete-next-text-2">
            <a>
                <h6>주문 내역 확인하기</h6></a>
                
                 <button class="triangle-button">
                  <img src="${contextPath}/img/image_icon/triangle_middlegray.png" width="25px" height="29px">
                 </button>
                
               
         </div>

    </div>
    </div>
</div>


</body>
</html>