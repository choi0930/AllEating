<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%
request.setCharacterEncoding("utf-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<c:set var="saleProduct" value="${mainresult.saleList}" /><!--할인상품-->
<c:set var="newProduct" value="${mainresult.newList}" /><!--신상품-->




<link href="${contextPath}/css/test.css" rel="stylesheet" type="text/css" />
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>main.jsp</title>
    <style>
      .btn:hover {
        color: var(--bs-btn-hover-color);
        background-color: #0c4a60;
        border-color: #0c4a60;
      }
      .delivery_type_text{
      color:#C9C9C9;}
      .sale_text{
          display: flex;
      }
      .sale_text_1{
      color:#EF6C33;
      font-weight:bold;
      padding-right:5px;
      font-size:35px;}
      .sale_text_2{
      text-decoration:line-through;
      color:#C9C9C9;
      
      }
      .sale_text {
    display: flex;
}
    </style>
  </head>
  <body>
  
   
        <div class="main-mid">
          <!------ 카테고리 첫 번째 시작점 ------>
          <div id="menu-title1">
            <h3 class="newgoods">신규 상품</h3>
          </div>
          <div>
          <div class="image-container">
              <%-- <img src="${contextPath}/img/image_food/mara.png" width="240" height="320" alt="Image 1" /> --%>
              <c:forEach var="newProductInfo" items="${newProduct}">
               <div class="qwerqwer">
               <a href="${contextPath }/product/userProductDetail.do?productId=${newProductInfo.productId}">
                  <img src="${contextPath}/download.do?fileName=${newProductInfo.fileName}&productId=${newProductInfo.productId}&cateCode=${newProductInfo.cateCode}" alt="${newProductInfo.fileName}" width="300px" height="300px">
                 </a>
                <div class="test2">
        
        <div class=delivery_type_text>
       <c:choose>
         <c:when test="${newProductInfo.deliveryType == 'reserve' }"> 예약배송<img src="${contextPath }/img/image_logo/thunder.png" style="width:20px;height:20px;">
         </c:when> 
        <c:when test="${newProductInfo.deliveryType == 'normal' }"> 일반배송
         </c:when>
         </c:choose>
        
        </div>
        <h5> 
        <c:choose>
         <c:when test="${newProductInfo.deliveryType == 'reserve' }">[All Eating]
         </c:when>
        <c:when test="${newProductInfo.deliveryType == 'normal' }">[${newProductInfo.productBrand}]
         </c:when>
         </c:choose>
        </h5>
                  <h5> ${newProductInfo.productName} </h5>
                  
                  
                  
                  
                  <div class="sale_text">  
                  
                    <c:choose>
                    <c:when test="${newProductInfo.productDiscount != 0}">
                 
                   <div class="sale_text_1" >${newProductInfo.productDiscount}%</div>
                  
                   <div class="sale_text_2"> <fmt:formatNumber value="${newProductInfo.productPrice}" pattern="#,###"/>원</div>
                   <div class="sale_result"> <fmt:formatNumber value="${newProductInfo.productSalesPrice}" pattern="#,###"/>원 </div> </c:when>
                   
                   <c:otherwise> <h6 class="sale_text_3"><fmt:formatNumber value="${newProductInfo.productPrice}" pattern="#,###"/>원</h6></c:otherwise>
                   </c:choose>
                  
                </div>
           </div> 
           </div>
            </c:forEach>
             
            
            
            
            
          </div>
        </div>
         
          <!-- <div class="newproduct-list">
            <c:forEach var="newProduct" items="${newProductlist}">
              <div class="newProductname">
                <p>${newProduct.image}</p>
                <p><b>사업장명:</b> ${newProduct.owner}</p>
                <p><b>상품명:</b> ${newProduct.name}</p>
                <p><b>가격</b> ${newProduct.cost}</p>
              </div>
            </c:forEach>
          </div> -->
          <div id="menu-title2">
            <h3 class="newgoods">All Eating의 추천 recipe</h3>
            <div class="btn3">
              <button type="button" class="btn btn-outline-secondary" onclick="location.href='${ContextPath }/community/review_01.do'">
                커뮤니티 바로가기
              </button>
            </div>
          <div class="image-container2">
            <div>
              <img src="${contextPath}/img/image_food/jeayuk.png" alt="Image 1" />
              <div class="test2">
                <h5>[서형이네]제육볶음</h5>
                <div>8,000원</div>
              </div>
            </div>
            <div>
              <img src="${contextPath}/img/image_food/porkcutlet.png" alt="Image 2" />
    
              <div class="test2">
                <h5>[현진이네]돈까스</h5>
                <div>11,000원</div>
              </div>
            </div>
            <div>
              <img src="${contextPath}/img/image_food/eggfood.png" alt="Image 3" />
              <div class="test2">
                <h5>[건태네]계란조림</h5>
                <div>5,500원</div>
              </div>
            </div>
          </div>
        <div id="menu-title3">
          <h3 class="newgoods">할인 품목</h3>
        </div>
        <div class="image-container3">
        <c:forEach var="saleProductInfo" items="${saleProduct}">
               <div class="qwerqwer">
                  <img src="${contextPath}/download.do?fileName=${saleProductInfo.fileName}&productId=${saleProductInfo.productId}&cateCode=${saleProductInfo.cateCode}" alt="${saleProductInfo.fileName}" width="300px" height="300px">
                 
                <div class="test2">
        <div class=delivery_type_text>
       <c:choose>
         <c:when test="${saleProductInfo.deliveryType == 'reserve' }"> 예약배송<img src="${contextPath }/img/image_logo/thunder.png" style="width:20px;height:20px;">
         </c:when> 
        <c:when test="${saleProductInfo.deliveryType == 'normal' }"> 일반배송
         </c:when>
         </c:choose>
        
        </div>
        <h5> 
        <c:choose>
         <c:when test="${saleProductInfo.deliveryType == 'reserve' }">[${saleProductInfo.productBrand}]
         </c:when>
        <c:when test="${saleProductInfo.deliveryType == 'normal' }">[${saleProductInfo.productBrand}]
         </c:when>
         </c:choose>
        </h5>
                  <h5> ${saleProductInfo.productName} </h5>
                  <div class="sale_text">  
                   <div class="sale_text_1" >${saleProductInfo.productDiscount}%</div>
                   <div class="sale_text_2"><fmt:formatNumber value="${saleProductInfo.productPrice}" pattern="#,###"/>원</div>
                  </div>
                  <div class="sale_result"> <fmt:formatNumber value="${saleProductInfo.productSalesPrice}" pattern="#,###"/>원 </div>
                </div>
           </div> 
            </c:forEach>
          
         
        </div>
        </div>
        </div>
  </body>
</html>
