<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <% request.setCharacterEncoding("utf-8"); %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
    <c:set var="productList" value="${productMap.productList}" />
    <c:set var="total" value="${productMap.total}" />
<!DOCTYPE html>
<html>
<head>

<title>검색결과 페이지</title>

<style>
    .productList{
        display: grid;
        grid-template-columns: repeat(auto-fill,249px);
        gap: 31px 14px;
        width: 100%;
    }
    .product_box{
        display: flex;
        flex-direction: column;
        height: 480px;
        color: black;
        cursor: pointer;
    }
    .product_box:hover{
        box-shadow: 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22);
        transition-duration: 1s;
    }
    #product_totalCountText{
        
        font-size: 20px;
        font-weight: 700;
        
    }
#search_01_toptext{
        display: flex;
align-items: center
    }
    #searchProduct{
        display: flex;
        margin: 0px 0px 6px 10px;
        justify-content: space-between;
        align-items: center;
    }
    .searchProduct_bar{
        width: 1px;
        height: 16px;
        margin: 0px 12px;
        background-color: #E1DDDB;
    }
    #search_topBar{
        border-top: 1px solid black;
        margin-bottom: 23px;
    }
    .productDeliveryTypeText{
        font-size: 14px;
        color: rgb(153, 153, 153);
        line-height: 19px;
        letter-spacing: -0.5px;
    }
    .search_product_title{
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
    .product_sale{
        font-size: 20px;
        font-weight: 800;
    }
    .product_price{

        text-decoration: line-through;
    }
    .product_salePrice{
        font-size: 20px;
        font-weight: 800;
    }
    .product_originalPriceText{
        font-size: 14px;
        color: rgb(153, 153, 153);
        line-height: 19px;
        letter-spacing: -0.5px;
    }
   .product_box_Text{
    padding: 9px 0px 0px 10px;
   }
   .pageBottom{
    text-align: center;
   }
   .noWord{
    display: flex;
    text-align: center;
    justify-content: center;
    height: 500px;
    width: 500px;
    margin: 0 auto;
    flex-direction: column
   }
   .noWordText{
    color: #E1DDDB;
    font-size: 25px;
    font-weight: 500;
    margin-top: 10px;
   }
</style>
<script>
    $(window).load(function(){
        $('.product_box').hover(
        function(){
           
        },function(){

        }
        );
    });
</script>
</head>
<body>
<c:if test="${not empty productList}">
 <div id="searchProduct">
    <div id="product_totalCountText">총 ${total}건</div>
    <div id="search_01_toptext">
        <div>
            <a href="#">낮은가격순</a>
        </div>
        <div class="searchProduct_bar"></div>
        <div>
            <a href="#">높은가격순</a>
        </div>
        <div class="searchProduct_bar"></div>
        <div>
            <a href="#">최신순</a>
        </div>
    </div>
</div>
<div id="search_topBar"></div>
</c:if>
        <c:choose>
            <c:when test="${empty productList}">
                <div class="noWord">
                    <div><img src="${contextPath}/img/image_icon/icon-search-gray.png" width="48px" height="48px" alt="돋보기"></div>
                    <div><span class="noWordText">검색결과가 없습니다.</span></div>
                </div>
            </c:when>
            <c:otherwise>
                <div class="productList"> <!--상품목록-->
                <c:forEach var="product" items="${productList}">
                    <a href="${contextPath}/product/userProductDetail.do?productId=${product.productId}" class="product_box"><!--상품1개 박스-->
                        <div> <!--상품 이미지-->
                            <img src="${contextPath}/download.do?fileName=${product.fileName}&productId=${product.productId}&cateCode=${product.cateCode}" alt="${product.fileName}" width="249px" height="320px">
                        </div>
                        <div class="product_box_Text">
                            <div>
                                <c:choose>
                                    <c:when test="${product.deliveryType == 'reserve'}">
                                        <span class="productDeliveryTypeText">예약배송</span><img src="${contextPath}/img/image_logo/thunder.png" alt="예약배송 아이콘" width="20px" height="20px">
                                    </c:when>
                                    <c:otherwise>
                                        <span class="productDeliveryTypeText">일반배송</span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div><!--상품 브랜드명 상품명-->
                                <span class="search_product_title">[${product.productBrand}] ${product.productName}</span>
                            </div>
                            <div><!-- 상품 가격-->
                                <c:choose>
                                    <c:when test="${product.productDiscount>0}" >
                                        <span class="product_sale redText">${product.productDiscount}%</span><!--할인율-->
                                        <span class="product_salePrice"><fmt:formatNumber value="${product.productSalesPrice}" pattern="#,###"/>원</span><!--가격-->
                                    </c:when>
                                    <c:otherwise>
                                        <span class="product_salePrice"><fmt:formatNumber value="${product.productPrice}" pattern="#,###"/>원</span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="product_originalPriceText">
                                <c:if test="${product.productDiscount > 0}" >
                                    <span class="product_price"><fmt:formatNumber value="${product.productPrice}" pattern="#,###"/></span><!--할인상품일시 정가-->
                                    <span>원</span>
                                </c:if>
                            </div>
                            <div><!--상품 후기-->
                                후기
                            </div>
                        </div>
                    </a>    
                </c:forEach>
            </div><!--end productList 상품 목록 끝-->
            </c:otherwise>
        </c:choose>
       
   
<!--페이징-->
<c:if test="${not empty productList}">
    <div class="pageBottom">
        <c:if test="${total != null }">
          <c:choose>
            <c:when test="${total > 200 }">
              <c:forEach var="page" begin="1" end="${(total/20)+1}" step="1">
                <c:if test="${section >1 && page==1 }">
                  <a
                    class="no-uline"
                    href="${contextPath}/product/new_product_01.do?section=${section-1}&pageNum=${(section-1)*10 +1}"
                    >&nbsp; pre</a
                  >
                </c:if>
                <a
                  class="no-uline"
                  href="${contextPath }/product/new_product_01.do?section=${section}&pageNum=${page}"
                  >${(section-1)*5 + page }</a
                >
                <c:if test="${page == (total/20)+1 }">
                  <a
                    class="no-uline"
                    href="${contextPath }/product/new_product_01.do?section=${section+1}&pageNum=${section*10+1 }"
                    >&nbsp; next</a
                  >
                </c:if>
              </c:forEach>
            </c:when>
            <c:when test="${total == 200 }">
              <c:forEach var="page" begin="1" end="10" step="1">
                <a
                  class="no-uline"
                  href="${contextPath }/product/new_product_01.do?section=${section }&pageNum=${page }"
                  >${page }</a
                >
              </c:forEach>
            </c:when>
            <c:when test="${total < 200 }">
              <c:forEach var="page" begin="1" end="${(total/20)+1}" step="1">
                <c:choose>
                  <c:when test="${page==pageNum }">
                    <a
                      class="sel-page"
                      href="${contextPath }/product/new_product_01.do?section=${section-1}&pageNum=${page}"
                      >${page }</a
                    >
                  </c:when>
                  <c:otherwise>
                    <a
                      class="no-uline"
                      href="${contextPath }/product/new_product_01.do?section=${section+1}&pageNum=${page }"
                      >${page }</a
                    >
                  </c:otherwise>
                </c:choose>
              </c:forEach>
            </c:when>
          </c:choose>
        </c:if>
      </div>
    </c:if>
</body>
</html>


