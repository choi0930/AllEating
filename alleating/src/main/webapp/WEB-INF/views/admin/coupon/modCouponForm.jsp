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
              <option value="none">상품분류 선택</option>
              <optgroup label="채소">
                <option value="901001">친환경</option>
                <option value="901002">고구마 · 감자 · 당근</option>
                <option value="901003">시금치 · 쌈채소 · 나물</option>
                <option value="901004">브로콜리 · 파프리카 · 양배추</option>
                <option value="901005">양파 · 대파 · 마늘 · 배추</option>
                <option value="901006">오이 · 호박 · 고추</option>
                <option value="901007">콩나물 · 버섯</option>
              </optgroup>

              <optgroup label="과일 · 견과 · 쌀">
                <option value="902001">국산과일</option>
                <option value="902002">수입과일</option>
                <option value="902004">냉동·건과일</option>
                <option value="902005">견과류</option>
                <option value="902006">쌀·잡곡</option>
              </optgroup>

              <optgroup label="수산 · 해산 · 건어물">
                <option value="903001">생선류</option>
                <option value="903002">반건류</option>
                <option value="903003">오징어·낙지·문어</option>
                <option value="903004">새우·게·랍스터</option>
                <option value="903005">해산물·조개류</option>
                <option value="903006">김·미역·해조류</option>
                <option value="903007">건어물·다시팩</option>
              </optgroup>

              <optgroup label="정육 · 계란">
                <option value="904001">국내산 소고기</option>
                <option value="904002">수입산 소고기</option>
                <option value="904003">돼지고기</option>
                <option value="904004">닭·오리고기</option>
                <option value="904005">양고기</option>
                <option value="904006">양념육·돈까스</option>
                <option value="904007">계란류</option>
              </optgroup>

              <optgroup label="국 · 반찬 · 메인요리">
                <option value="905001">국·탕·찌개</option>
                <option value="905002">밀키트·메인요리</option>
                <option value="905003">밑반찬</option>
                <option value="905004">김치·젓갈·장류</option>
                <option value="905005">두부·어묵·부침개</option>
                <option value="905006">베이컨·햄·통조림</option>
              </optgroup>

              <optgroup label="샐러드 · 간편식">
                <option value="906001">샐러드·닭가슴살</option>
                <option value="906002">도시락·밥류</option>
                <option value="906003">파스타·면류</option>
                <option value="906004">떡볶이·튀김·순대</option>
                <option value="906005">폭립·떡갈비·안주</option>
                <option value="906006">죽·스프·카레</option>
                <option value="906007">선식·시리얼</option>
              </optgroup>

              <optgroup label="면 · 양념 · 오일">
                <option value="907001">파스타·면류</option>
                <option value="907002">식초·소스·드레싱</option>
                <option value="907003">양념·액젓·장류</option>
                <option value="907004">식용유·참기름·오일</option>
                <option value="907005">소금·설탕·향신료</option>
                <option value="907006">밀가루·가루·믹스</option>
              </optgroup>

              <optgroup label="생수 · 음료 · 우유 · 커피">
                <option value="908001">생수·탄산수</option>
                <option value="908002">음료·주스</option>
                <option value="908003">우유·두유·요거트</option>
                <option value="908004">커피</option>
              </optgroup>
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
