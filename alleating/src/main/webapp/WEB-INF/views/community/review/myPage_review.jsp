<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%
request.setCharacterEncoding("utf-8"); %>

<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<c:set var="reviewList" value="${userReviewInfo.reviewList}" />


<link
  href="${contextPath}/css/myPage_review.css"
  rel="stylesheet"
  type="text/css"
/>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>상품 후기</title>
    <script>
      $(document).ready(function () {
        $("ul.tabs li").click(function () {
          var tab_id = $(this).attr("data-tab");

          $("ul.tabs li").removeClass("active");
          $(".tab-content").removeClass("active");

          $(this).addClass("active");
          $("#" + tab_id).addClass("active");
        });
      });

      function fn_goAddProduct() {
        location.href = "/admin/adminAddProductForm.do";
      }
    </script>
  </head>
  <body>
    <div class="myreview">
      <div class="pwant">
        <div class="proW">
          <div class="want01"><h3>상품후기</h3></div>
        </div>
        <div>
          <div class="review01"></div>
        </div>
        <div class="review02">
          <ul class="tabs">
            <li
              class="tab-link ${selectedTab == 'tab-1' ? 'active' : ''}"
              data-tab="tab-1"
            >
              작성 가능 후기
            </li>
            <li
              class="tab-link ${selectedTab == 'tab-2' ? 'active' : ''}"
              data-tab="tab-2"
            >
              작성한 후기
            </li>
          </ul>
        </div>
      </div>



 
      <div
        id="tab-1"
        class="tab-content ${selectedTab == 'tab-1' ? 'active' : ''}"
      >
     
      <div>
      
      <c:forEach var="review" items="${reviewList}">
       <form action="/myPage/myPage_reviewForm.do" method="get" encType="multipart/form-data">
        <div class="want_02">
          <div class="capture">
          
             <img src="${contextPath}/download.do?fileName=${review.fileName}&productId=${review.productId}&cateCode=${review.cateCode}" alt="${review.fileName}" width="150px" height="150px">
          </div>
          </div>
          <div class="qwe">
           <input type="text" class="productNaming" name="brand" value="[${review.productBrand}]">
           <input type="text" class="productNaming" name="naming"  value="${review.productName}">
           <%--  <input type="hidden" class="detail_01" value="[${review.productBrand}]${review.productName}"> --%>
            </div>
           
           
          <div class="text04">
            <div class="form_end">
              <button type="submit" class="review_btn" > <span id="review_add_btn_text">후기 쓰기</span>
              </button>
            </div>
          </div>
          </form>
          </c:forEach>
          
      
       </div>
      
      
      </div>  
      
     

      <div
        id="tab-2"
        class="tab-content ${selectedTab == 'tab-2' ? 'active' : ''}"
      >
        <div class="want_02">
          <div class="capture">
            <img
              src="${contextPath}/img/image_food/shinemuscat.JPG"
              width="120"
              height="120"
              alt="Image 2"
            />
          </div>
          <div class="qwe">
            <div class="detail_01"><h4>???</h4></div>
            <div class="detail_01"><h5 id="asd">???</h5></div>
            <div class="detail_01">
              <h5 id="asd">후기 내용</h5>
            </div>
          </div>
          <div class="text04">
            <div class="form_end">
              <button class="review_btn" onclick="fn_loginGO()">
                <span id="review_mod_btn_text">후기 수정</span>
              </button>
            </div>
          </div>
        </div>

        <div class="want_02">
          <div class="capture">
            <img
              src="${contextPath}/img/image_food/peach.jpg"
              width="120"
              height="120"
              alt="Image 2"
            />
          </div>
          <div class="qwe">
            <div class="detail_01"><h4>???</h4></div>
            <div class="detail_01"><h5 id="asd">???</h5></div>
            <div class="detail_01">
              <h5 id="asd">후기 내용</h5>
            </div>
          </div>
          <div class="text04">
            <div class="form_end">
              <button class="review_btn" onclick="fn_loginGO()">
                <span id="review_mod_btn_text">후기 수정</span>
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
