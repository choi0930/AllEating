<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
    <% request.setCharacterEncoding("utf-8"); %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
    <c:set var="newPro" value="${newproresult.newproduct}" />
    <c:set var="total" value="${newproresult.total}" />

<!DOCTYPE html>
<html>
<head>

<title>신상품 목록  페이지</title>
<link href="${contextPath}/css/other_product.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div>
  <div class="image-container">
    <c:forEach var="newProInfo" items="${newPro}">
     <div class="qwerqwer">
     <a href="${contextPath }/product/userProductDetail.do?productId=${newProInfo.productId}">
        <img src="${contextPath}/download.do?fileName=${newProInfo.fileName}&productId=${newProInfo.productId}&cateCode=${newProInfo.cateCode}" alt="${newProInfo.fileName}" width="250px" height="320px">
       </a>
      <div class="test2">

<div class=delivery_type_text>
<c:choose>
<c:when test="${newProInfo.deliveryType == 'reserve' }"> 예약배송<img src="${contextPath }/img/image_logo/thunder.png" style="width:20px;height:20px;">
</c:when> 
<c:when test="${newProInfo.deliveryType == 'normal' }"> 일반배송
</c:when>
</c:choose>

</div>
<h5> 
<c:choose>
<c:when test="${newProInfo.deliveryType == 'reserve' }">[All Eating]
</c:when>
<c:when test="${newProInfo.deliveryType == 'normal' }">[${newProInfo.productBrand}]
</c:when>
</c:choose>
</h5>
        <h5> ${newProInfo.productName} </h5>
        
        
        <div class="sale_text">  
                  
          <c:choose>
          <c:when test="${newProInfo.productDiscount != 0}">
       
         <div class="sale_text_1" >${newProInfo.productDiscount}%</div>

         <div class="sale_text_2"> <fmt:formatNumber value="${newProInfo.productPrice}" pattern="#,###"/>원</div>
         <div class="sale_result"> <fmt:formatNumber value="${newProInfo.productSalesPrice}" pattern="#,###"/>원 </div> </c:when>
         
         <c:otherwise> <h6 class="sale_text_3"><fmt:formatNumber value="${newProInfo.productPrice}" pattern="#,###"/>원</h6></c:otherwise>
         </c:choose>
      </div>
 </div> 
 </div>
  </c:forEach>
</div>
      <!-- <div class="productpaging">
        <a class="productpaging-2"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAkAAAAHCAQAAABwkq/rAAAAHUlEQVR42mNgAIPi/8X/kWkwA8SE0UQIMJAsCKMBBzk27fqtkcYAAAAASUVORK5CYII=" alt="처음 페이지로 이동하기 아이콘"></a>
        <a class="productpaging-2"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUAAAAHCAQAAABqrk9lAAAAGElEQVR42mNgAIPi/8X/4QwwE5PBQJADAAKSG3cyVhtXAAAAAElFTkSuQmCC" alt="이전 페이지로 이동하기 아이콘"></a>
 <a class="productpaging-3">1</a>
<a class="productpaging-2">2</a>
<a class="productpaging-2"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUAAAAHCAQAAABqrk9lAAAAGUlEQVR42mMo/l/8nwECQEwCHEwGhAlRBgA2mht3SwgzrwAAAABJRU5ErkJggg==" alt="다음 페이지로 이동하기 아이콘"></a>
<a class="productpaging-2"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAkAAAAHCAQAAABwkq/rAAAAIElEQVR42mMo/l/8n4GBgQFGQ5kgDowmQZCwAMImhDkAb0k27Zcisn8AAAAASUVORK5CYII=" alt="마지막 페이지로 이동하기 아이콘"></a>
 
</div> -->
<div class="pageBottom">
  <c:if test="${total != null }">
    <c:choose>
      <c:when test="${total > 200 }">
        <c:forEach var="page" begin="1" end="${(total/20)+1}" step="1">
          <c:if test="${section >1 && page==1 }">
            <a
              class="no-uline"
              href="${contextPath}/product/new_product_01.do?section=${section-1}&pageNum=${(section-1)*10 +1}"
              >&nbsp; pre</a
            >
          </c:if>
          <a
            class="no-uline"
            href="${contextPath }/product/new_product_01.do?section=${section}&pageNum=${page}"
            >${(section-1)*5 + page }</a
          >
          <c:if test="${page == (total/20)+1 }">
            <a
              class="no-uline"
              href="${contextPath }/product/new_product_01.do?section=${section+1}&pageNum=${section*10+1 }"
              >&nbsp; next</a
            >
          </c:if>
        </c:forEach>
      </c:when>
      <c:when test="${total == 200 }">
        <c:forEach var="page" begin="1" end="10" step="1">
          <a
            class="no-uline"
            href="${contextPath }/product/new_product_01.do?section=${section }&pageNum=${page }"
            >${page }</a
          >
        </c:forEach>
      </c:when>
      <c:when test="${total < 200 }">
        <c:forEach var="page" begin="1" end="${(total/20)+1}" step="1">
          <c:choose>
            <c:when test="${page==pageNum }">
              <a
                class="sel-page"
                href="${contextPath }/product/new_product_01.do?section=${section-1}&pageNum=${page}"
                >${page }</a
              >
            </c:when>
            <c:otherwise>
              <a
                class="no-uline"
                href="${contextPath }/product/new_product_01.do?section=${section+1}&pageNum=${page }"
                >${page }</a
              >
            </c:otherwise>
          </c:choose>
        </c:forEach>
      </c:when>
    </c:choose>
  </c:if>
</div>
</div>
</body>
</html>


