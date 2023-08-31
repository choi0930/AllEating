<%@ page language="java" contentType="text/html; charset=UTF-8"
isELIgnored="false" pageEncoding="UTF-8"%> <%
request.setCharacterEncoding("utf-8"); %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>회원가입</title>
    <style>
      .couponArea {
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin-bottom: 20px;
      }
      .couponArea2 {
        display: flex;
        align-items: center;
      }
      .areaCoupon {
        width: 800px;
        margin: 50px auto;
      }
      .couponName {
        width: 600px;
      }
      .couponAreaBar {
        border-bottom: 1px solid black;
        margin-bottom: 20px;
      }
      .couponTitleText {
        font-size: 30px;
        font-weight: bold;
        margin-bottom: 20px;
      }
      #discountInput {
        width: 100px;
        display: inline;
        padding-left: 5px;
      }
      .couponBtn {
        display: flex;
      }
      .btn {
        padding: 10px 10px;
      }
      .form-control {
        height: 46px;
      }
    </style>
    <script>
      $(document).ready(function () {
        $("#couponRange")
          .val("${couponVO.coupon_range}")
          .attr("selected", "selected");
      });

      function fn_backList() {
        location.href = "${contextPath}/admin/couponList.do";
      }
      function fn_modfiyCoupon() {
        if ($("input[name=coupon_name]").val() == "") {
          alert("쿠폰 제목을 입력해주세요.");
          $("input[name=coupon_name]").focus();
          return false;
        }
        if ($("input[name=couponDiscountRate]").val() == "") {
          alert("할인율을 입력해주세요.");
          $("input[name=couponDiscountRate]").focus();
          return false;
        }
        if ($("select[name=coupon_range]").val() == "none") {
          alert("쿠폰 적용범위를 선택해주세요.");
          $("input[name=coupon_range]").focus();
          return false;
        }

        document.frmModCoupon.submit();
      }
    </script>
  </head>
  <body class="d-flex flex-column min-vh-100">
    <form
      action="${contextPath}/admin/modifyCoupon.do"
      name="frmModCoupon"
      method="post"
      enctype="UTF-8"
    >
      <div class="areaCoupon">
        <div class="couponTitleText">쿠폰 생성</div>
        <div class="couponAreaBar"></div>
        <div class="couponArea">
          <div>쿠폰 이름</div>
          <div class="couponName">
            <input
              type="text"
              class="form-control"
              name="coupon_name"
              placeholder="45자 이내로 작성해주세요"
              value="${couponVO.coupon_name}"
            />
          </div>
          <div></div>
        </div>
        <div class="couponArea">
          <div>쿠폰 할인율</div>
          <div>
            <input
              type="text"
              class="form-control"
              name="couponDiscountRate"
              id="discountInput"
              value="${couponVO.couponDiscountRate}"
              maxlength="2"
              oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
            />%
          </div>
          <div>쿠폰 적용 범위</div>
          <div>
            <select name="coupon_range" id="couponRange" class="form-select">
              <option selected value="none">상품분류 선택</option>
              <option value="901">채소</option>
              <option value="902">과일·견과·쌀</option>
              <option value="903">수산·해산·건어물</option>
              <option value="904">정육·계란</option>
              <option value="905">국·반찬·메인요리</option>
              <option value="906">샐러드·간편식</option>
              <option value="907">면·양념·오일</option>
              <option value="908">생수·음료·우유·커피</option>
            </select>
          </div>
        </div>
        <div class="couponArea">
          <div>배포시작일</div>
          <div>
            <input
              type="date"
              class="form-control"
              name="beginDate"
              value="${couponVO.beginDate}"
            />
          </div>
          <div>배포종료일</div>
          <div>
            <input
              type="date"
              class="form-control"
              name="endDate"
              value="${couponVO.endDate}"
            />
          </div>
        </div>
        <div class="couponArea">
          <div>쿠폰 사용시작일</div>
          <div>
            <input
              type="date"
              class="form-control"
              name="coupon_startDate"
              value="${couponVO.coupon_startDate}"
            />
          </div>
          <div>쿠폰 사용종료일</div>
          <div>
            <input
              type="date"
              class="form-control"
              name="coupon_endDate"
              value="${couponVO.coupon_endDate}"
            />
          </div>
        </div>
        <div class="couponArea2">
          <div>쿠폰 수량</div>
          <div>
            <input
              type="text"
              class="form-control"
              name="coupon_quantity"
              id="discountInput"
              value="${couponVO.coupon_quantity}"
              oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
            />
          </div>
        </div>
        <div class="couponBtn">
          <div class="btn">
            <button
              type="button"
              class="btn btn-outline-primary"
              onclick="fn_modfiyCoupon()"
            >
              쿠폰 수정
            </button>
          </div>
          <div class="btn">
            <button
              type="button"
              class="btn btn-outline-secondary"
              onclick="fn_backList()"
            >
              취소
            </button>
          </div>
        </div>
      </div>
      <input type="hidden" name="couponId" value="${couponVO.couponId}" />
      <input type="hidden" id="couponRange" value="${couponVO.coupon_range}" />
    </form>
  </body>
</html>
