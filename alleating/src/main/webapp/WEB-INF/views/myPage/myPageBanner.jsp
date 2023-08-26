<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <% request.setCharacterEncoding("utf-8"); %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
    <c:set var="userVO" value="${userProductInfo.userVO}" />
   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPageBanner</title>
<style>
    .myPageBannerTop{
        display: flex;
        width: 1050px;
        margin: 0 auto;
        height: 100px;
        background-color: #f1eeec;
        justify-content: space-between;
        align-items: center;
    }
   #myPageBannerTopText{
    font-size: 25px;
    font-weight: bold;
   }
   .myPageBannerValue{
    padding: 30px 70px 30px 30px;
   }
   .myPageBannerText{
    font-size: 15px;
    font-weight: 1000;
   }
   .myPageBannerMiddle{
    width: 230px;
    text-align: right;
   }
   .myPageBannerLast{
    width: 150px;
    text-align: right;
   
   }
</style>
</head>
<body>
    <div class="myPageBannerTop">
        <div class="myPageBannerValue">
            <div><span id="myPageBannerTopText">${userVO.name} 님</span></div>
        </div>
        <div class="myPageBannerValue myPageBannerMiddle">
            <div><span class="myPageBannerText">적립금</span></div>
            <div><span class="myPageBannerText">0원</span></div>
        </div>
        <div class="myPageBannerValue myPageBannerLast">
            <div><span class="myPageBannerText">쿠폰</span></div>
            <div><span class="myPageBannerText">0개</span></div>
        </div>
    </div>

</body>
</html>