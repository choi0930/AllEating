<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <% request.setCharacterEncoding("utf-8"); %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<c:set var="cateList" value="${cateresult.cateList}" />
    
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
        <div class="all-producttotalnum">총 9개</div>
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
  <a href="#" class="product-next">
  
  <c:forEach var="cateFE" items="${cateList}">
  <div class="all-productview-list-preview">
  
  <a href="${contextPath }/product/userProductDetail.do?cateCode=${cateFE.cateCode}">
  <img src="${contextPath}/download.do?fileName=${cateFE.fileName}&productId=${cateFE.productId}&cateCode=${cateFE.cateCode}" alt="${cateFE.fileName}" width="300px" height="300px">
  <div class="all-product-text">${cateFE.deliveryType}</div>
  <div class="all-product-text">${cateFE.productBrand}</div>
   <div class="all-product-text">${cateFE.productName}</div>
     <div class="all-product-text">${cateFE.productPrice}</div>
     <a href="#" class="product-review">
     <div class="product-text">후기</div></a>
    </a>
 </div>
 </c:forEach>
  </a>
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


