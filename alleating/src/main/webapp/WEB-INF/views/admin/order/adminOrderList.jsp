<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %> <%
request.setCharacterEncoding("utf-8"); %>
<c:set var="orderList" value="${orderMap.orderList}" />
<!DOCTYPE html>
  <html>
    <head>
      <title>관리자 상품관리 페이지</title>
      <script>
        $(document).ready(function () {
          $("ul.tabs li").click(function () {
            var tab_id = $(this).attr("data-tab");

            $("ul.tabs li").removeClass("active");
            $(".tab-content").removeClass("active");

            $(this).addClass("active");
            $("#" + tab_id).addClass("active");
          });

          $("#tab1").click(function () {
            location.href = "/admin/productMain.do";
          });
          $("#tab2").click(function () {
            location.href = "/admin/listProducts.do";
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
          text-align: left;
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
        .pageBottom {
          width: 600px;
          margin: 0 auto;
        }
        .tables {
          vertical-align: middle;
        }
      </style>
      <script></script>
    </head>
    <body>
      <div class="tabContainer">
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
                  <tr class="tables">
                    <td>
                      성명(ID)/주문 날짜<br />
                      수취인성명/주소(연락처)
                    </td>
                    <td>주문 상품(상품 * 수량)</td>
                    <td>금액</td>
                    <td>결제수단</td>
                    <td>결제확인</td>
                    <td>배송상태</td>
                    <td></td>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="or" items="${orderList}"> 
                    <tr>
                        <td>
                            ${or.orderName}(${or.id})<br>
                            ${or.receiverName}/${or.address}(${or.receiverHp})
                        </td>
                        <td>
                            ${or.productName}x${or.productQty}
                        </td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div>
            <!--사업자가 등록한 상품 목록-->

            <div class="pageBottom">
              <c:if test="${total != null }">
                <c:choose>
                  <c:when test="${total > 150 }">
                    <c:forEach
                      var="page"
                      begin="1"
                      end="${(total/15)+1}"
                      step="1"
                    >
                      <c:if test="${section >1 && page==1 }">
                        <a
                          class="no-uline"
                          href="${contextPath}/admin/productMain.do?section=${section-1}&pageNum=${(section-1)*10 +1}"
                          >&nbsp; pre</a
                        >
                      </c:if>
                      <a
                        class="no-uline"
                        href="${contextPath }/admin/productMain.do?section=${section}&pageNum=${page}"
                        >${(section-1)*15 + page }</a
                      >
                      <c:if test="${page == (total/15)+1 }">
                        <a
                          class="no-uline"
                          href="${contextPath }/admin/productMain.do?section=${section+1}&pageNum=${section*10+1 }"
                          >&nbsp; next</a
                        >
                      </c:if>
                    </c:forEach>
                  </c:when>
                  <c:when test="${total == 150 }">
                    <c:forEach var="page" begin="1" end="10" step="1">
                      <a
                        class="no-uline"
                        href="${contextPath }/admin/productMain.do?section=${section }&pageNum=${page }"
                        >${page }</a
                      >
                    </c:forEach>
                  </c:when>
                  <c:when test="${total < 150 }">
                    <c:forEach
                      var="page"
                      begin="1"
                      end="${(total/15)+1}"
                      step="1"
                    >
                      <c:choose>
                        <c:when test="${page==pageNum }">
                          <a
                            class="sel-page"
                            href="${contextPath }/admin/productMain.do?section=${section-1}&pageNum=${page}"
                            >${page }</a
                          >
                        </c:when>
                        <c:otherwise>
                          <a
                            class="no-uline"
                            href="${contextPath }/admin/productMain.do?section=${section+1}&pageNum=${page }"
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
      </div>
    </body>
  </html>
</c:set>
