<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %> <%
request.setCharacterEncoding("utf-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<c:set var="useCouponList" value="${couponMap.useCouponList}" />
<c:set var="total" value="${couponMap.total}" />
<c:set var="invalidCouponList" value="${couponMap.invalidCouponList}" />
<c:set var="total2" value="${couponMap.total2}" />
<!DOCTYPE html>
<html>
  <head>
    <title>관리자 쿠폰관리 페이지</title>

    <style>
      .topArea {
        display: flex;
      }
      .memberList {
        width: 840px;
      }
      .tapDateArea {
        display: flex;
        align-items: center;
      }
      .memberSearchBtn {
        background-color: #000060;
        width: 50px;
        height: 38px;
        color: white;
        border: none;
        border-radius: 6px;
        margin: 0px 8px;
      }
      .statusText {
        font-weight: 800;
        padding: 0px 5px;
      }
      .selectArea {
        padding: 0px 10px;
      }
      .couponTable {
        overflow: initial;
      }
      .couponTables {
        width: 1200px;
      }
      #couponBtnArea {
        float: right;
      }
      #couponTitle {
        font-size: 27px;
        font-weight: bold;
      }
      #addCouponBtn {
        background-color: #000060;
        width: 110px;
        height: 38px;
        color: white;
        border: none;
        border-radius: 6px;
        margin: 0px 8px;
      }
      .adminCouponTable{
        vertical-align: middle;
      }
    </style>
    <script>
      function fn_addCoupon() {
        location.href = "${contextPath}/admin/addCouponForm.do";
      }

      function fn_modCouponForm(couponId) {
        location.href =
          "${contextPath}/admin/modCouponForm.do?couponId=" + couponId;
      }

      function fn_delCoupon(couponId) {
        $.ajax({
          type: "POST",
          async: true,
          url: "/admin/delCoupon.do",
          data: {
            couponId: couponId,
          },
          success: function (data) {
            alert("쿠폰 삭제 완료");
            location.href = "${contextPath}/admin/couponList.do";
          },
          error: function (data) {
            alert("에러 발생");
          },
        });
      }
    </script>
  </head>
  <body>
    <div class="memberList">
      <div>
        <div id="couponTitle">쿠폰관리</div>
        <div id="couponBtnArea">
          <button id="addCouponBtn" onclick="fn_addCoupon()">쿠폰 생성</button>
        </div>
        <div class="topArea">
          <div>
            <span class="statusText">쿠폰 현황</span>
          </div>
          <div>
            <span class="statusText">현재 사용가능한 쿠폰을 조회합니다.</span>
          </div>
        </div>
        총${total}개
        <div class="couponTable">
          <!--쿠폰 목록-->
          <table class="table adminProductTable table-hover couponTables adminCouponTable">
            <thead class="table-dark ">
              <tr>
                <td>쿠폰ID</td>
                <td>쿠폰이름</td>
                <td>사용처</td>
                <td>할인율</td>
                <td>잔여량</td>
                <td>배포기간</td>
                <td>사용기간</td>
                <td></td>
              </tr>
            </thead>
            <tbody>
              <c:choose>
                <c:when test="${empty useCouponList}">
                  <tr>
                    <td colspan="7">쿠폰이 없습니다.</td>
                  </tr>
                </c:when>
                <c:otherwise>
                  <c:forEach var="coupon" items="${useCouponList}">
                    <tr>
                      <td>${coupon.couponId}</td>
                      <td>${coupon.coupon_name}</td>
                      <td>
                        (${coupon.coupon_range})<br>
                        ${coupon.cateGoryName}
                      </td>
                      <td>${coupon.couponDiscountRate}%</td>
                      <td>${coupon.coupon_quantity}개</td>
                      <td>${coupon.beginDate}~${coupon.endDate}</td>
                      <td>
                        ${coupon.coupon_startDate}~${coupon.coupon_endDate}
                      </td>
                      <td>
                        <button
                          onclick="fn_modCouponForm('${coupon.couponId}')"
                        >
                          수정
                        </button>
                        <button onclick="fn_delCoupon('${coupon.couponId}')">
                          삭제
                        </button>
                      </td>
                    </tr>
                  </c:forEach>
                </c:otherwise>
              </c:choose>
            </tbody>
          </table>
        </div>
        <!--쿠폰 목록 끝-->

        <div class="pageBottom">
          <c:if test="${total != null }">
            <c:choose>
              <c:when test="${total > 50 }">
                <c:forEach var="page" begin="1" end="${(total/5)+1}" step="1">
                  <c:if test="${section >1 && page==1 }">
                    <a
                      class="no-uline"
                      href="${contextPath}/admin/couponList.do?section=${section-1}&pageNum=${(section-1)*10 +1}"
                      >&nbsp; pre</a
                    >
                  </c:if>
                  <a
                    class="no-uline"
                    href="${contextPath }/admin/couponList.do?section=${section}&pageNum=${page}"
                    >${(section-1)*5 + page }</a
                  >
                  <c:if test="${page == (total/5)+1 }">
                    <a
                      class="no-uline"
                      href="${contextPath }/admin/couponList.do?section=${section+1}&pageNum=${section*10+1 }"
                      >&nbsp; next</a
                    >
                  </c:if>
                </c:forEach>
              </c:when>
              <c:when test="${total == 50 }">
                <c:forEach var="page" begin="1" end="10" step="1">
                  <a
                    class="no-uline"
                    href="${contextPath }/admin/couponList.do?section=${section }&pageNum=${page }"
                    >${page }</a
                  >
                </c:forEach>
              </c:when>
              <c:when test="${total < 50 }">
                <c:forEach var="page" begin="1" end="${(total/5)+1}" step="1">
                  <c:choose>
                    <c:when test="${page==pageNum }">
                      <a
                        class="sel-page"
                        href="${contextPath }/admin/couponList.do?section=${section-1}&pageNum=${page}"
                        >${page }</a
                      >
                    </c:when>
                    <c:otherwise>
                      <a
                        class="no-uline"
                        href="${contextPath }/admin/couponList.do?section=${section+1}&pageNum=${page }"
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
      <div>
        <div></div>
        <div class="topArea">
          <div>
            <span class="statusText">만료된 쿠폰</span>
          </div>
          <div>
            <span class="statusText"
              >사용기간 만료, 수량없음, 삭제된 쿠폰을 조회합니다.</span
            >
          </div>
        </div>
        총${total2}개
        <div class="couponTable">
          <!--사용기간 만료된 혹은 삭제된 쿠폰 목록-->
          <table class="table adminProductTable table-hover couponTables adminCouponTable">
            <thead class="table-dark ">
              <tr>
                <td>쿠폰ID</td>
                <td>쿠폰이름</td>
                <td>사용처</td>
                <td>할인율</td>
                <td>잔여량</td>
                <td>배포기간</td>
                <td>사용기간</td>
                <td></td>
              </tr>
            </thead>
            <tbody>
              <c:choose>
                <c:when test="${empty invalidCouponList}">
                  <tr>
                    <td colspan="7">쿠폰이 없습니다.</td>
                  </tr>
                </c:when>
                <c:otherwise>
                  <c:forEach var="invalidCoupon" items="${invalidCouponList}">
                    <tr>
                      <td>${invalidCoupon.couponId}</td>
                      <td>${invalidCoupon.coupon_name}</td>
                      <td>
                        (${invalidCoupon.coupon_range})<br>
                        ${invalidCoupon.cateGoryName}
                      </td>
                      <td>${invalidCoupon.couponDiscountRate}%</td>
                      <td>${invalidCoupon.coupon_quantity}개</td>
                      <td>
                        ${invalidCoupon.beginDate}~${invalidCoupon.endDate}
                      </td>
                      <td>
                        ${invalidCoupon.coupon_startDate}~${invalidCoupon.coupon_endDate}
                      </td>
                      <td></td>
                    </tr>
                  </c:forEach>
                </c:otherwise>
              </c:choose>
            </tbody>
          </table>
        </div>
        <!--사용기간 만료된 혹은 삭제된 쿠폰 목록-->
        <div class="pageBottom">
          <c:if test="${total2 != null }">
            <c:choose>
              <c:when test="${total2 > 50 }">
                <c:forEach var="page" begin="1" end="${(total2/5)+1}" step="1">
                  <c:if test="${section2 >1 && page==1 }">
                    <a
                      class="no-uline"
                      href="${contextPath}/admin/couponList.do?section2=${section2-1}&pageNum2=${(section2-1)*10 +1}"
                      >&nbsp; pre</a
                    >
                  </c:if>
                  <a
                    class="no-uline"
                    href="${contextPath }/admin/couponList.do?section2=${section2}&pageNum2=${page}"
                    >${(section-1)*5 + page }</a
                  >
                  <c:if test="${page == (total2/5)+1 }">
                    <a
                      class="no-uline"
                      href="${contextPath }/admin/couponList.do?section2=${section2+1}&pageNum2=${section2*10+1 }"
                      >&nbsp; next</a
                    >
                  </c:if>
                </c:forEach>
              </c:when>
              <c:when test="${total2 == 50 }">
                <c:forEach var="page" begin="1" end="10" step="1">
                  <a
                    class="no-uline"
                    href="${contextPath }/admin/couponList.do?section2=${section2 }&pageNum2=${page }"
                    >${page }</a
                  >
                </c:forEach>
              </c:when>
              <c:when test="${total2 < 50 }">
                <c:forEach var="page" begin="1" end="${(total2/5)+1}" step="1">
                  <c:choose>
                    <c:when test="${page==pageNum }">
                      <a
                        class="sel-page"
                        href="${contextPath }/admin/couponList.do?section2=${section2-1}&pageNum2=${page}"
                        >${page }</a
                      >
                    </c:when>
                    <c:otherwise>
                      <a
                        class="no-uline"
                        href="${contextPath }/admin/couponList.do?section2=${section2+1}&pageNum2=${page }"
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
    </div>
  </body>
</html>
