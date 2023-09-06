<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <% request.setCharacterEncoding("utf-8"); %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
    
<!DOCTYPE html>
<html>
<head>
    <style>
        .productview-list {
    display: grid;
    grid-template-columns: repeat(auto-fill,249px);
    gap: 31px 14px;
    width: 100%;
    justify-content: space-between;
    padding-top: 30px;
}
    </style>

<title>베스트 목록  페이지</title>
<link href="${contextPath}/css/other_product.css" rel="stylesheet" type="text/css" />

</head>
<body>
<div class="product-detail-list">

 <div class = "product-detail-list-main">

    
        <!--<div class="producttotalnum">
            <h3 class="producttotalnumber">총 12개</h3>
        </div>-->
        

<div class="productview">
 <div class="productview-list">
    
  <div class="productview-list-preview">
    <a href="#" class="product-next">
    <div class="best-num">1</div>
   <img src="${contextPath}/img/image_food/shinemuscat.jpg" width="250px" height="320px">
   <div class="product-text">예약배송 <img src="${contextPath}/img/image_logo/thunder.png" width="20px"></div>
   <div class="product-text">[All Eating]</div>
   <div class="product-text">저탄소 샤인머스캣</div>
   <div class="product-text">13,990원</div>
     href="#" class="product-review">
     <div class="product-text">후기</div>
    </a>
  </div>
  
  <div class="productview-list-preview">
    <a href="#" class="product-next">
    <div class="best-num">2</div>
    <img src="${contextPath}/img/image_food/peach.jpg" width="250px" height="320px">
    <div class="product-text">일반배송</div>
    <div class="product-text">천중도 백도 복숭아</div>
    <div class="product-text">18,900원</div>
  
        <div class="product-text">후기</div>
       </a>
    </div>
    
 <div class="productview-list-preview">
    <a href="#" class="product-next">
    <div class="best-num">3</div>
        <img src="${contextPath}/img/image_food/muskmelon.jpg" width="250px" height="320px">
        <div class="product-text">머스크 멜론 1.2kg</div> 
        <div class="product-text">10,000원</div>
            <div class="product-text">후기</div>
           </a>
  </div>


  
  
  <div class="productview-list-preview">
    <a href="#" class="product-next">
    <div class="best-num">4</div>
    <img src="${contextPath}/img/image_food/shinemuscat.jpg" width="250px" height="320px">
    <div class="product-text">예약배송 <img src="${contextPath}/img/image_logo/thunder.png" width="20px"></div>
    <div class="product-text">[All Eating]</div>
    <div class="product-text">저탄소 샤인머스캣</div>
    <div class="product-text">13,990원</div>
        <div class="product-text">후기</div>
       </a>
   </div>


   
    <div class="productview-list-preview">
        <a href="#" class="product-next">
        <div class="best-num">6</div>
        <img src="${contextPath}/img/image_food/blueberry.jpg" width="250px" height="320px">
        <div class="product-text">국산 블루베리 100g</div>
        <div class="product-text">6,900원</div>
       
            <div class="product-text">후기</div>
           </a>
        </div>
       
     </div>
 </div>
</div>



     

      <!--<div class="productpaging">
        <a class="productpaging-2"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAkAAAAHCAQAAABwkq/rAAAAHUlEQVR42mNgAIPi/8X/kWkwA8SE0UQIMJAsCKMBBzk27fqtkcYAAAAASUVORK5CYII=" alt="처음 페이지로 이동하기 아이콘"></a>
        <a class="productpaging-2"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUAAAAHCAQAAABqrk9lAAAAGElEQVR42mNgAIPi/8X/4QwwE5PBQJADAAKSG3cyVhtXAAAAAElFTkSuQmCC" alt="이전 페이지로 이동하기 아이콘"></a>
        <a class="productpaging-3">1</a>
        <a class="productpaging-2">2</a>
        <a class="productpaging-2"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUAAAAHCAQAAABqrk9lAAAAGUlEQVR42mMo/l/8nwECQEwCHEwGhAlRBgA2mht3SwgzrwAAAABJRU5ErkJggg==" alt="다음 페이지로 이동하기 아이콘"></a>
        <a class="productpaging-2"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAkAAAAHCAQAAABwkq/rAAAAIElEQVR42mMo/l/8n4GBgQFGQ5kgDowmQZCwAMImhDkAb0k27Zcisn8AAAAASUVORK5CYII=" alt="마지막 페이지로 이동하기 아이콘"></a>
    </div>-->


</body>
</html>


