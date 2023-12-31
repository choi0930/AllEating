<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
    
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
        <div class="all-producttotalnum">총 5개</div> 
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
        
  <div class="all-productview-list">
 
   <c:forEach var="zzzzz" items="${cateResult}">
               <div class="qwerqwer">
               <a class="product-next" href="${contextPath }/product/userProductDetail.do?productId=${zzzzz.productId}">
                  <img src="${contextPath}/download.do?fileName=${zzzzz.fileName}&productId=${zzzzz.productId}&cateCode=${zzzzz.cateCode}" alt="${zzzzz.fileName}" width="250px" height="320px">
                 </a>
                <div class="test2">
        
        <div class=delivery_type_text>
            <a class="product-next" href="${contextPath }/product/userProductDetail.do?productId=${zzzzz.productId}">
       <c:choose>
         <c:when test="${zzzzz.deliveryType == 'reserve' }"> 예약배송<img src="${contextPath }/img/image_logo/thunder.png" style="width:20px;height:20px;">
         </c:when> 
        <c:when test="${zzzzz.deliveryType == 'normal' }"> 일반배송
         </c:when>
         </c:choose>
         </a>
        </div>
        <a class="product-next" href="${contextPath }/product/userProductDetail.do?productId=${zzzzz.productId}">
        <h5> 
        <c:choose>
         <c:when test="${zzzzz.deliveryType == 'reserve' }">[All Eating]
         </c:when>
        <c:when test="${zzzzz.deliveryType == 'normal' }">[${zzzzz.productBrand}]
         </c:when>
         </c:choose>
        </h5>
                  <h5> ${zzzzz.productName} </h5>
            </a>
                  <div class="sale_text">  
                    <a class="product-next" href="${contextPath }/product/userProductDetail.do?productId=${zzzzz.productId}">
                    <c:choose>
                    <c:when test="${zzzzz.productDiscount != 0}">
                 
                   <div class="sale_text_1" >${zzzzz.productDiscount}%</div>
                  
                   <div class="sale_text_2"> <fmt:formatNumber value="${zzzzz.productPrice}" pattern="#,###"/>원</div>
                   <div class="sale_result"> <fmt:formatNumber value="${zzzzz.productSalesPrice}" pattern="#,###"/>원 </div> </c:when>
                   
                   <c:otherwise> <h6 class="sale_text_3"><fmt:formatNumber value="${zzzzz.productPrice}" pattern="#,###"/>원</h6></c:otherwise>
                   </c:choose>
                  </a>
                </div>
           </div> 
           </div>
            </c:forEach>
            
        
        
        
      
   <!--   <div class="productpaging">
        <a class="productpaging-2"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAkAAAAHCAQAAABwkq/rAAAAHUlEQVR42mNgAIPi/8X/kWkwA8SE0UQIMJAsCKMBBzk27fqtkcYAAAAASUVORK5CYII=" alt="처음 페이지로 이동하기 아이콘"></a>
        <a class="productpaging-2"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUAAAAHCAQAAABqrk9lAAAAGElEQVR42mNgAIPi/8X/4QwwE5PBQJADAAKSG3cyVhtXAAAAAElFTkSuQmCC" alt="이전 페이지로 이동하기 아이콘"></a>
        <a class="productpaging-3">1</a>
        <a class="productpaging-2">2</a>
        <a class="productpaging-2"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUAAAAHCAQAAABqrk9lAAAAGUlEQVR42mMo/l/8nwECQEwCHEwGhAlRBgA2mht3SwgzrwAAAABJRU5ErkJggg==" alt="다음 페이지로 이동하기 아이콘"></a>
        <a class="productpaging-2"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAkAAAAHCAQAAABwkq/rAAAAIElEQVR42mMo/l/8n4GBgQFGQ5kgDowmQZCwAMImhDkAb0k27Zcisn8AAAAASUVORK5CYII=" alt="마지막 페이지로 이동하기 아이콘"></a>
    </div>-->


 </div>
 </div>
</body>
</html>
