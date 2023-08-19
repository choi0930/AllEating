<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <% request.setCharacterEncoding("utf-8"); %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
    
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
 <div id="searchProduct">
    <div id="product_totalCountText">총 20건</div>
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
    <div class="productList"> <!--상품목록-->
        <!--forEach들어가야함-->
        <a href="#" class="product_box"><!--상품1개 박스-->
            <div> <!--상품 이미지-->
                <img src="${contextPath}/img/image_food/shinemuscat.JPG" alt="상품이미지" width="249px" height="320px">
            </div>
            <div class="product_box_Text">
                <div>
                    <c:choose>
                        <c:when test="${deliveryType == 'reserve'}">
                            <span class="productDeliveryTypeText">예약배송</span><img src="${contextPath}/img/image_logo/thunder.png" alt="예약배송 아이콘" width="20px" height="20px">
                        </c:when>
                        <c:otherwise>
                            <span class="productDeliveryTypeText">일반배송</span>
                        </c:otherwise>
                    </c:choose>
                <!--예약배송<img src="${contextPath}/img/image_logo/thunder.png" alt="예약배송 아이콘" width="20px" height="20px">-->
                </div>
                <div><!--상품 브랜드명 상품명-->
                    <span class="search_product_title">[AllEating] 저탄소 샤인머스캣</span>
                </div>
                <div><!-- 상품 가격-->
                    <span class="product_sale redText">35%</span><!--할인율-->
                    <span class="product_salePrice">14,190원</span><!--가격-->
                </div>
                <div class="product_originalPriceText">
                    <span class="product_price">21,900</span><!--할인상품일시 정가-->
                    <span>원</span>
                </div>
                <div><!--상품 후기-->
                후기
                </div>
            </div>
        </a>

        <!--데모-->
        <a href="#" class="product_box"><!--상품1개 박스-->
            <div> <!--상품 이미지-->
                <img src="${contextPath}/img/image_food/shinemuscat.JPG" alt="상품이미지" width="249px" height="320px">
            </div>
            <div>
                <span class="productDeliveryTypeText">예약배송</span><img src="${contextPath}/img/image_logo/thunder.png" alt="예약배송 아이콘" width="20px" height="20px">
            </div>
            <div><!--상품 브랜드명 상품명-->
                <span>[AllEating] 저탄소 샤인머스캣</span>
            </div>
            <div><!-- 상품 가격-->
                <span class="product_sale">35%</span><!--할인율-->
                <span class="product_salePrice">14,190원</span><!--가격-->
            </div>
            <div>
                <span class="product_price">21,900원</span><!--할인상품일시 정가-->
            </div>
            <div><!--상품 후기-->
                후기
            </div>
        </a>
        <a href="#" class="product_box"><!--상품1개 박스-->
            <div> <!--상품 이미지-->
                <img src="${contextPath}/img/image_food/shinemuscat.JPG" alt="상품이미지" width="249px" height="320px">
            </div>
            <div>
                예약배송<img src="${contextPath}/img/image_logo/thunder.png" alt="예약배송 아이콘" width="20px" height="20px">
            </div>
            <div><!--상품 브랜드명 상품명-->
                <span>[AllEating] 저탄소 샤인머스캣</span>
            </div>
            <div><!-- 상품 가격-->
                <span class="product_sale">35%</span><!--할인율-->
                <span class="product_salePrice">14,190원</span><!--가격-->
            </div>
            <div>
                <span class="product_price">21,900원</span><!--할인상품일시 정가-->
            </div>
            <div><!--상품 후기-->
                후기
            </div>
        </a>
        <a href="#" class="product_box"><!--상품1개 박스-->
            <div> <!--상품 이미지-->
                <img src="${contextPath}/img/image_food/shinemuscat.JPG" alt="상품이미지" width="249px" height="320px">
            </div>
            <div>
                예약배송<img src="${contextPath}/img/image_logo/thunder.png" alt="예약배송 아이콘" width="20px" height="20px">
            </div>
            <div><!--상품 브랜드명 상품명-->
                <span>[AllEating] 저탄소 샤인머스캣</span>
            </div>
            <div><!-- 상품 가격-->
                <span class="product_sale">35%</span><!--할인율-->
                <span class="product_salePrice">14,190원</span><!--가격-->
            </div>
            <div>
                <span class="product_price">21,900원</span><!--할인상품일시 정가-->
            </div>
            <div><!--상품 후기-->
                후기
            </div>
        </a>
        <a href="#" class="product_box"><!--상품1개 박스-->
            <div> <!--상품 이미지-->
                <img src="${contextPath}/img/image_food/shinemuscat.JPG" alt="상품이미지" width="249px" height="320px">
            </div>
            <div>
                예약배송<img src="${contextPath}/img/image_logo/thunder.png" alt="예약배송 아이콘" width="20px" height="20px">
            </div>
            <div><!--상품 브랜드명 상품명-->
                <span>[AllEating] 저탄소 샤인머스캣</span>
            </div>
            <div><!-- 상품 가격-->
                <span class="product_sale">35%</span><!--할인율-->
                <span class="product_salePrice">14,190원</span><!--가격-->
            </div>
            <div>
                <span class="product_price">21,900원</span><!--할인상품일시 정가-->
            </div>
            <div><!--상품 후기-->
                후기
            </div>
        </a>
       

    </div><!--end productList 상품 목록 끝-->

</body>
</html>


