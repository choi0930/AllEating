<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%
request.setCharacterEncoding("utf-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
  <head>
    <title></title>

    <style>
    
      .productList {
        display: grid;
        grid-template-columns: repeat(auto-fill, 420px);
        gap: 25px 30px;
        width: 100%;
      }
      .product_box {
        display: flex;
        flex-direction: column;
        height: 480px;
        color: black;
        cursor: pointer;
      }
      .product_box:hover {
        box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25),
          0 10px 10px rgba(0, 0, 0, 0.22);
        transition-duration: 1s;
      }
      #product_totalCountText {
        font-size: 20px;
        font-weight: 700;
      }
      #search_01_toptext {
        display: flex;
        align-items: center;
      }
      #searchProduct {
        display: flex;
        margin: 0px 0px 6px 10px;
        justify-content: space-between;
        align-items: center;
      }
      .searchProduct_bar {
        width: 1px;
        height: 16px;
        margin: 0px 12px;
        background-color: #e1dddb;
      }
      #search_topBar {
        border-top: 1px solid black;
        margin-bottom: 23px;
      }
      .productDeliveryTypeText {
        font-size: 14px;
        color: rgb(153, 153, 153);
        line-height: 19px;
        letter-spacing: -0.5px;
      }
      .search_product_title {
        max-height: 58px;
        font-size: 16px;
        line-height: 24px;
        letter-spacing: normal;
        display: -webkit-box;
        overflow: hidden;
        word-break: break-all;
        white-space: normal;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
      }
      .product_sale {
        font-size: 20px;
        font-weight: 800;
      }
      .product_price {
        text-decoration: line-through;
      }
      .product_salePrice {
        font-size: 20px;
        font-weight: 800;
      }
      .product_originalPriceText {
        font-size: 14px;
        color: rgb(153, 153, 153);
        line-height: 19px;
        letter-spacing: -0.5px;
      }
      .product_box_Text {
        padding: 9px 0px 0px 10px;
      }
      .couponArea {
        padding: 20px 20px;
        border: 0px;
        border-radius: 10px;
        background-color: #f8f8f8;
      }
      .couponInfo {
        display: flex;
        margin-bottom: 8px;
        align-items: center;
      }
      .couponTitle {
        font-size: 20px;
      }
      .couponTitleArea {
        justify-content: space-between;
      }
      .couponIdInputbox {
        width: 110px;
      }
      .couponText {
        margin-right: 20px;
      }
      .hideInfo {
        width: 250px;
        padding: 5px 5px;
      }
      .Btn {
        justify-content: space-between;
      }
      #couponTopTitle {
        font-size: 38px;
        font-weight: bold;
      }
    </style>

    <script>
      $(document).ready(function () {
        $(".hideInfo").hide();
      });
      function fn_couponId(count, isLoginON) {
        if (isLoginON == "true") {
          $("#Info_" + count).show();
        } else {
          alert("로그인 해주세요");
        }
      }
      function fn_copy(countId) {
        var text = document.getElementById("couponId_" + countId);
        text.select();
        document.execCommand("copy");
        text.setSelectionRange(0, 0);
        alert("쿠폰번호가 복사되었습니다.");
      }
    </script>
  </head>
  <body>
    <div id="searchProduct">
      <div id="couponTopTitle">쿠폰</div>
    </div>
    <div id="search_topBar"></div>
    <div class="productList">
      <!--쿠폰 목록-->
      <c:forEach var="coupon" items="${couponList}" varStatus="status">
        <div class="couponArea">
          <div class="couponInfo couponTitleArea">
            <div>
              <span class="couponTitle">${coupon.coupon_name}</span>
            </div>
          </div>
          <div class="couponInfo">
            <div>등록기간:&nbsp;</div>
            <div>~${coupon.endDate}까지</div>
          </div>
          <div class="couponInfo">
            <div>사용기간:&nbsp;</div>
            <div>${coupon.coupon_startDate} ~ ${coupon.coupon_endDate}</div>
          </div>
          <div class="couponInfo">
            <div class="couponText">사용처:</div>
            <div>${coupon.cateGoryName}</div>
          </div>
          <div class="couponInfo">
            <div class="couponText">할인율:</div>
            <div>${coupon.couponDiscountRate}%</div>
          </div>

          <div class="couponInfo Btn">
            <button
              type="button"
              onclick="fn_couponId('${status.count}','${isLoginON}')"
              class="btn btn-dark couponIdBtn"
            >
              발급받기
            </button>
            <div class="hideInfo" id="Info_${status.count}">
              <div class="couponText">발급번호</div>
              <div class="input-group">
                <input
                  type="text"
                  value="${coupon.couponId}"
                  readonly
                  id="couponId_${status.count}"
                  class="form-control couponIdInputbox"
                />
                <button
                  class="btn btn-outline-secondary"
                  type="button"
                  id="button-addon1"
                  onclick="fn_copy('${status.count}')"
                >
                  번호복사
                </button>
              </div>
            </div>
          </div>
        </div>
      </c:forEach>
    </div>
    <!--end couponList 쿠폰 목록  끝-->
  </body>
</html>
