<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%
request.setCharacterEncoding("utf-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<c:set var="productVO" value="${productInfo.productVO}" /><!--상품정보-->
<c:set var="productImgList" value="${productInfo.productImgList}" /><!--이미지리스트-->


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
            <div class="qwerqwer">
              <img src="${contextPath}/img/image_food/mara.png" width="240" height="320" alt="Image 1" />
              <div class="test2">
                <h5>[승기네]마라탕</h5>
                <div>10,000원</div>
              </div>
            </div>
            <div class="qwerqwer">
              <img src="${contextPath}/img/image_food/olive.png" width="240" height="320" alt="Image 2" />
              <div class="test2">
                <h5>[현진이네]올리브</h5>
                <div>3,500원</div>
              </div>
            </div>
            <div class="qwerqwer">
              <img src="${contextPath}/img/image_food/curry.png" width="240" height="320" alt="Image 3" />
              <div class="test2">
                <h5>[건태네]카레</h5>
                <div>7,000원</div>
              </div>
            </div>
            <div class="qwerqwer">
              <img src="${contextPath}/img/image_food/picle.png" width="240" height="320" alt="Image 4" />
              <div class="test2">
                <h5>[All Eating]피클</h5>
                <div>2,800원</div>
              </div>
            </div>
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
          <div>
            <img src="${contextPath}/img/image_food/pizza.png" alt="Image 1" />
            <div class="test2">
              <h5>[승기네]시카고 피자</h5>
              <div><b style="color: #ef6c33;">10%</b> 9,900원</div>
              <div class="text-line">11,000원</div>
            </div>
          </div>
          <div>
            <img src="${contextPath}/img/image_food/candy.png" alt="Image 2" />
    
            <div class="test2">
              <h5>[All Eating]레몬 사탕</h5>
              <div><b style="color: #ef6c33;">5%</b> 3,040원</div>
              <div class="text-line">3,200원</div>
            </div>
          </div>
          <div>
            <img src="${contextPath}/img/image_food/rib.png" alt="Image 3" />
            <div class="test2">
              <h5>[All Eating]LA 갈비</h5>
              <div><b style="color: #ef6c33;">20%</b> 12,800원</div>
              <div class="text-line">16,000원</div>
            </div>
          </div>
          <div>
            <img src="${contextPath}/img/image_food/egg.png" alt="Image 4" />
            <div class="test2">
              <h5>[서형이네]1+등급 계란</h5>
              <div><b style="color: #ef6c33;">10%</b> 8,100원</div>
              <div class="text-line">9,000원</div>
            </div>
          </div>
        </div>
        </div>
        </div>
  </body>
</html>
