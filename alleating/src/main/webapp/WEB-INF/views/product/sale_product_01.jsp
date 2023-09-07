<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
    <% request.setCharacterEncoding("utf-8"); %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
    <c:set var="saleProduct" value="${saleresult.saleProduct}" />
  

<!DOCTYPE html>
<html>
<head>
<style>
.sale_group_title{
    width: 500px;
    margin: 50px auto;
    font-weight: 500;
    font-size: 28px;
    color: rgb(51, 51, 51);
    line-height: 35px;
    letter-spacing: -1px;
    text-align: center;
}
</style>

<title>신상품 목록  페이지</title>
<link href="${contextPath}/css/other_product.css" rel="stylesheet" type="text/css" />
</head>
<body>


<div>
<div class="sale_group_title">할인 상품</div>
  <div class="image-container">
    <c:forEach var="sale" items="${saleProduct}">
     <div class="qwerqwer">
     <a href="${contextPath }/product/userProductDetail.do?productId=${sale.productId}">
        <img src="${contextPath}/download.do?fileName=${sale.fileName}&productId=${sale.productId}&cateCode=${sale.cateCode}" alt="${sale.fileName}" width="250px" height="320px">
       </a>
      <div class="test2">

<div class=delivery_type_text>
<c:choose>
<c:when test="${sale.deliveryType == 'reserve' }"> 예약배송<img src="${contextPath }/img/image_logo/thunder.png" style="width:20px;height:20px;">
</c:when> 
<c:when test="${sale.deliveryType == 'normal' }"> 일반배송
</c:when>
</c:choose>

</div>
<h5> 
<c:choose>
<c:when test="${sale.deliveryType == 'reserve' }">[All Eating]
</c:when>
<c:when test="${sale.deliveryType == 'normal' }">[${sale.productBrand}]
</c:when>
</c:choose>
</h5>
        <h5> ${sale.productName} </h5>
        
        
        <div class="sale_text">  
          
       
         <div class="sale_text_1" >${sale.productDiscount}%</div>

         <div class="sale_text_2"> <fmt:formatNumber value="${sale.productPrice}" pattern="#,###"/>원</div>
         <div class="sale_result"> <fmt:formatNumber value="${sale.productSalesPrice}" pattern="#,###"/>원 </div> 
      
      </div>
 </div> 
 </div>
  </c:forEach>
</div>
    
</div>
</body>
</html>


