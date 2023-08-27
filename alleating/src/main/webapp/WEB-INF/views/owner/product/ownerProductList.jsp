<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%
request.setCharacterEncoding("utf-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<c:choose>
  <c:when test="${total%30 == 0}">
    <c:set var="totals2" value="${total/30}" />
  </c:when>
  <c:otherwise>
    <c:set var="totals2" value="${total/30+1}" />
  </c:otherwise>
</c:choose>

<!DOCTYPE html>
<html>
  <head>
    <title>사업자 상품관리 페이지</title>
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
    <style>
      /* 탭 스타일 */
      .tabs {
        list-style: none;
        padding: 0;
      }
      .tab-link {
        display: inline-block;
        padding: 10px 20px;
        cursor: pointer;
        border-bottom: 2px solid #000060;
        margin-right: 5px;
      }
      .tab-link.active {
        background-color: #e1dddb;
      }
      /* 탭 컨텐츠 스타일 */
      .tab-content {
        display: none;
      }
      .tab-content.active {
        display: block;
      }
      .tabContainer {
        width: 840px;
        margin: 0 auto;
      }
      .adminProductMain_status {
        display: flex;
      }
      .adminProductMain_searchBarArea {
        display: flex;
        align-items: center;
        justify-content: space-between;
      }
      .adminProductMain_inputDateBOX {
        display: flex;
        align-items: center;
      }
      .adminProductMain_searchBTN {
        background-color: #000060;
        width: 50px;
        height: 38px;
        color: white;
        border: none;
        border-radius: 6px;
        margin: 0px 8px;
      }
      .adminProductMain_Dateinput {
        width: 120px;
      }
      .adminProductMain_dateArea {
        margin: 0px 10px;
      }
      .statusText {
        font-weight: 800;
        padding: 0px 5px;
      }
      .adminProductMain_searchBarArea {
        margin: 20px 0px;
      }
      .overflowText {
        vertical-align: middle;
        overflow: hidden;
        white-space: nowrap;
        word-break: break-all;
        width: 190px;
        text-overflow: ellipsis;
      }
      .productTable {
        font-size: 14px;
        padding: 10px 10px;
        text-align: center;
      }
      .adminProductTable {
        vertical-align: middle;
      }
      p {
        margin: 0px;
      }
      .productTable_btn_group {
        display: flex;
        flex-direction: column;
      }
      .productDetailGOlink {
        cursor: pointer;
      }
      #addProduct_BTN {
        background-color: #000060;
        width: 120px;
        height: 36px;
        color: white;
        border: none;
        border-radius: 6px;
        margin: 0px 8px;
        position: absolute;
        top: -45px;
        right: 0px;
      }
      .tab_contents {
        position: relative;
      }
      .ownerProductMain_addBTN {
        background-color: #000060;
        width: 100px;
        height: 38px;
        color: white;
        border: none;
        border-radius: 6px;
        margin: 0px 730px;
      }
      .product_mod_btn {
        width: 50px;
        height: 30px;
        background-color: #000060;
        border: none;
        border-radius: 3px;
        color: white;
      }
      .product_del_btn {
        width: 50px;
        height: 30px;
        background-color: #ffffff;
        border: 2px solid #f3f4f5;
        border-radius: 3px;
      }
    </style>
    <script></script>
  </head>
  <body>
    <div class="tabContainer">
      <a href="${ContextPath }/owner/ownerAddProductForm.do">
        <input class="ownerProductMain_addBTN" type="button" value="등록"
      /></a>
      <ul class="tabs"></ul>

      <div id="tab-1" class="tab-content active">
        <div class="tab_contents">
          <div class="adminProductMain_searchBarArea">
            <!--상품관리 상단-->
            <div class="adminProductMain_status">
              <!--상품관리 판매상태 선택 select박스-->
              <div class="statusText">판매 상태</div>
              <div>
                <select onchange="fn_productSelect()">
                  <option selected>전체</option>
                  <option>판매중</option>
                  <option>판매종료</option>
                  <option>승인요청</option>
                </select>
              </div>
            </div>
            <div class="adminProductMain_inputDateBOX">
              <!--조회할 일자 선택 및 검색 박스-->
              <div class="statusText">
                <span>조회기간</span>
              </div>
              <div class="adminProductMain_dateArea">
                <input type="date" class="adminProductMain_Dateinput" />
                <span>~</span>
                <input type="date" class="adminProductMain_Dateinput" />
              </div>
              <div>
                <input type="text" class="form-control" />
              </div>
              <div>
                <input
                  class="adminProductMain_searchBTN"
                  type="button"
                  value="조회"
                />
              </div>
            </div>
          </div>
          <!--상품관리 상단끝 end adminProductMain_searchBarArea-->

          <div class="productTable">
            <!--사업자가 등록한 상품 목록-->
            <table class="table adminProductTable table-hover">
              <thead class="table-dark">
                <tr onclick="location.href='/test.do?'" style="cursor: pointer">
                  <td>상품ID</td>
                  <td>등록일</td>
                  <td>상품명</td>
                  <td>정가</td>
                  <td>할인가</td>
                  <td>판매상태</td>
                  <td>선택</td>
                </tr>
              </thead>

              <tbody>
                <c:forEach var="ownerProduct" items="${ownerProductList }">
                  <tr style="cursor: pointer">
                    <td>${ownerProduct.productId}</td>
                    <td>${ownerProduct.creDate}</td>
                    <td>${ownerProduct.productName}</td>
                    <td>${ownerProduct.productPrice}</td>
                    <td>${ownerProduct.productSalesPrice}</td>

                    <td>
                      <c:choose>
                        <c:when
                          test="${ownerProduct.productStatus eq 'approval_request'}"
                        >
                          승인 요청
                        </c:when>
                        <c:when
                          test="${ownerProduct.productStatus eq 'declined'}"
                        >
                          승인 거절
                        </c:when>
                        <c:when test="${ownerProduct.productStatus eq 'sale'}">
                          판매중</c:when
                        >
                        <c:when
                          test="${ownerProduct.productStatus eq 'sales_end'}"
                        >
                          판매 종료</c:when
                        >
                        <c:when
                          test="${ownerProduct.productStatus eq 'sold_out'}"
                        >
                          품절
                        </c:when>
                      </c:choose>
                    </td>
                    <td>
                    	<a class="product_del_btn" href="${ContextPath}/owner/ModProduct.do?productId=${ownerProduct.productId}">
          				수정
      					 </a>
                     <!--  <button type="button" class="product_mod_btn">
                        수정
                      </button> -->
                       <a class="product_del_btn" href="${ContextPath}/owner/deleteProduct.do?productId=${ownerProduct.productId}">
          				삭제
      					 </a>
                    <%--  <button type="button" class="product_del_btn"  onclick="location.href='${ContextPath }/owner/deleteProduct.do'">   											
                        삭제
                      </button> --%>
                    </td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
          <!--사업자가 등록한 상품 목록-->

          <c:choose>
            <c:when test="${total>=40}">
              <div id="page_wrap">
                <c:forEach var="page" begin="1" end="10" step="1">
                  <c:if test="${section >1 && page==1 }">
                    <a
                      href="${contextPath}/member/listMembers.do?section=${section-1}&pageNum=${(section-1)*10 +1 }"
                      >&nbsp;pre &nbsp;</a
                    >
                  </c:if>
                  <a
                    href="${contextPath}/member/listMembers.do?section=${section}&pageNum=${page}"
                    >${(section-1)*10 +page }
                  </a>
                  <c:if test="${page ==10 }">
                    <a
                      href="${contextPath}/member/listMembers.do?section=${section+1}&pageNum=${section*10+1}"
                      >&nbsp; next</a
                    >
                  </c:if>
                </c:forEach>
              </div>
            </c:when>
            <c:when test="${total<40}">
              <c:forEach var="page" begin="1" end="${totals2}" step="1">
                <c:choose>
                  <c:when test="${page==pageNum}">
                    <a
                      href="${contextPath}/member/listMembers.do?section=${section}&pageNum=${page}"
                      >${(section-1)*10 +page }
                    </a>
                  </c:when>
                  <c:otherwise>
                    <a
                      href="${contextPath}/member/listMembers.do?section=${section}&pageNum=${page}"
                      >${(section-1)*10 +page }
                    </a>
                  </c:otherwise>
                </c:choose>
              </c:forEach>
            </c:when>
          </c:choose>
        </div>
      </div>
    </div>
  </body>
</html>
