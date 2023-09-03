<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%
request.setCharacterEncoding("utf-8"); %>

<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<link
  href="${contextPath}/css/myPage_03.css"
  rel="stylesheet"
  type="text/css"
/>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>찜한 상품</title>
  </head>
  <body>
    <div class="pwant">
      <div class="proW">
        <div class="want01"><h3>찜한 상품</h3></div>
        <div class="text001"></div>
        <div class="text01">찜한 상품은 최대 100개 까지 보관 가능합니다.</div>
      </div>

      <div class="want_02">
        <c:forEach var="wish" item="${wishList}">
        <div class="capture">
          <img
            src="${contextPath}/img/image_food/shinemuscat.JPG"
            width="120"
            height="120"
            alt="Image 2"
          />
        </div>
        <div class="qwe">
          <div class="detail_01"><h4>[${wish.productBrand}] ${wish.productName}</h4></div>
          <div class="detail_01"><h5 id="asd">${wish.productPrice}원</h5></div>
          
        </div>
        <div class="text04">
          <div class="form_end">
            <button class="join_censel_btn" onclick="fn_loginGO()">
              <span id="join_btn_text">취소</span>
            </button>
          </div>
          <div class="form_end">
            <button class="join_end_btn" onclick="fn_loginGO()">
              <span id="join_btn2_text">담기</span>
            </button>
          </div>
        </div>
      </c:forEach>
      </div>

     
    </div>
  </body>
</html>
