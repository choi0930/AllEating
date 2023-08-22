<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%
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
                  <img src="${contextPath}/download.do?fileName=${newProductInfo.fileName}&productId=${newProductInfo.productId}&cateCode=${newProductInfo.cateCode}" alt="${newProductInfo.fileName}" width="300px" height="300px">
                 
                <div class="test2">
   efsdf     <h5> [${newProductInfo.productBrand}] </h5>
                  <h5> ${newProductInfo.productName} </h5>
                   <div> ${newProductInfo.productPrice}원 </div>
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
        <h5>
           <c:if test="${saleProductInfo.deliveryType == 'reserve' }">[${saleProductInfo.productBrand}]<img src="${contextPath }/img/image_logo/thunder.png" style="width:20px;height:20px;">
           </c:if>
       
       
         </h5>
                  <h5> ${saleProductInfo.productName} </h5>
                   <div> ${saleProductInfo.productPrice}원 </div>
                </div>
           </div> 
            </c:forEach>
          
         
        </div>
        </div>
        </div>
  </body>
</html>
