<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <% request.setCharacterEncoding("utf-8"); %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
    
<!DOCTYPE html>
<html>
<head>

<title>상품 목록 페이지</title>
<link href="${contextPath}/css/product_01.css" rel="stylesheet" type="text/css" />

</head>
<body>
  <div class="all-product-detail-list">

  <div class = "all-product-detail-list-main">

    <div class="product-top">
        <div class="all-producttotalnum">총 9개 왜 안 돼</div>
        <div id="search_01_toptext">
            <div>
                <a href="#">낮은가격순</a>
            </div>
            <div class="searchProduct_bar"></div>
            <div>
                <a href="#">높은가격순</a>
            </div>
            <div class="searchProduct_bar"></div>
            <div>
                <a href="#">최신순</a>
            </div>
        </div>
        </div>
        </div>
        

<div class="all-productview">
<div class="all-productview-list">
    <a href="#" class="product-next">
<div class="all-productview-list-preview">
<img src="${contextPath}/img/image_food/shinemuscat.jpg" width="230px" height="320px">
<div class="all-product-text">예약배송<img src="${contextPath}/img/image_logo/thunder.png" width="20px"></div>
<div class="all-product-text">[All Eating]</div>
<div class="all-product-text">저탄소 샤인머스캣</div>
<div class="all-product-text">13,990원</div></a>
<a href="#" class="product-review">
    <div class="product-text">후기</div>
   </a>
</div>
<div class="all-productview-list-preview">
    <a href="#" class="product-next">
    <img src="${contextPath}/img/image_food/peach.jpg" width="230px" height="320px">
    <div class="all-product-text">예약배송</div>
    <div class="all-product-text">천중도 백도 복숭아</div>
    <div class="all-product-text">18,900원</div></a>
    <a href="#" class="product-review">
        <div class="product-text">후기</div>
       </a>
    </div>
    <a href="#" class="product-next">
    <div class="all-productview-list-preview">
        <img src="${contextPath}/img/image_food/muskmelon.jpg" width="230px" height="320px"">
        <div class="all-product-text">머스크 멜론 1.2kg</div> 
        <div class="all-product-text">10,000원</div></a>
        <a href="#" class="product-review">
            <div class="product-text">후기</div>
           </a>
        </div>
</div>

<div class="all-productview-list">
    <a href="#" class="product-next">
    <div class="all-productview-list-preview">
        
    <img src="${contextPath}/img/image_food/mandarin.jpg" width="230px" height="320px" >
    <div class="all-product-text">당도 선별 GAP 하우스 감귤 1kg</div>
    <div class="all-product-text">14,900원</div></a>
    <a href="#" class="product-review">
        <div class="product-text">후기</div>
       </a>
    
    </div>
    <a href="#" class="product-next">
    <div class="all-productview-list-preview">
        <img src="${contextPath}/img/image_food/blueberry.jpg" width="230px" height="320px">
        <div class="all-product-text">국산 블루베리 100g</div>
        <div class="all-product-text">6,900원</div></a>
        <a href="#" class="product-review">
            <div class="product-text">후기</div>
           </a>
        </div>
        <a href="#" class="product-next">
        <div class="all-productview-list-preview">
            <img src="${contextPath}/img/image_food/icestrawberry.jpg" width="230px" height="320px">
            <div class="all-product-text">냉동 딸기 1kg</div>
            <div class="all-product-text">7,950원</div></a>
            <a href="#" class="product-review">
                <div class="product-text">후기</div>
               </a>
            </div>
    </div>
    <a href="#" class="product-next">
    <div class="all-productview-list">
        <div class="all-productview-list-preview">
        <img src="${contextPath}/img/image_food/koreamelon.jpg" width="230px" height="320px">
        <div class="all-product-text">성주 참외 1.5kg (4~7개입)</div>
        <div class="all-product-text">18,900원</div></a>
        <a href="#" class="product-review">
            <div class="product-text">후기</div>
           </a>
        </div>
        <a href="#" class="product-next">
        <div class="all-productview-list-preview">
            <img src="${contextPath}/img/image_food/grape.jpg" width="230px" height="320px">
            <div class="all-product-text">GAP 거봉 포도 450g</div>
            <div class="all-product-text">11,900원</div></a>
            <a href="#" class="product-review">
                <div class="product-text">후기</div>
               </a>
            </div>
            <a href="#" class="product-next">
            <div class="all-productview-list-preview">
                <img src="${contextPath}/img/image_food/apple.jpg" width="230px" height="320px">
                <div class="all-product-text">썸머킹 사과 1.3kg (4-8개입)</div>
                <div class="all-product-text">17,900원</div></a>
                <a href="#" class="product-review">
                    <div class="product-text">후기</div>
                   </a>
                </div>
        </div>

  
</div>



      </div>

      <div class="productpaging">
        <a class="productpaging-2"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAkAAAAHCAQAAABwkq/rAAAAHUlEQVR42mNgAIPi/8X/kWkwA8SE0UQIMJAsCKMBBzk27fqtkcYAAAAASUVORK5CYII=" alt="처음 페이지로 이동하기 아이콘"></a>
        <a class="productpaging-2"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUAAAAHCAQAAABqrk9lAAAAGElEQVR42mNgAIPi/8X/4QwwE5PBQJADAAKSG3cyVhtXAAAAAElFTkSuQmCC" alt="이전 페이지로 이동하기 아이콘"></a>
        <a class="productpaging-3">1</a>
        <a class="productpaging-2">2</a>
        <a class="productpaging-2"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUAAAAHCAQAAABqrk9lAAAAGUlEQVR42mMo/l/8nwECQEwCHEwGhAlRBgA2mht3SwgzrwAAAABJRU5ErkJggg==" alt="다음 페이지로 이동하기 아이콘"></a>
        <a class="productpaging-2"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAkAAAAHCAQAAABwkq/rAAAAIElEQVR42mMo/l/8n4GBgQFGQ5kgDowmQZCwAMImhDkAb0k27Zcisn8AAAAASUVORK5CYII=" alt="마지막 페이지로 이동하기 아이콘"></a>
    </div>

      </div>

</body>
</html>


