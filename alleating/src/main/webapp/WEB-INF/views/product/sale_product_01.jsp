<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <% request.setCharacterEncoding("utf-8"); %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
    
<!DOCTYPE html>
<html>
<head>

<title>할인 상품 페이지</title>

<style>
    .saleProductList{
        display: grid;
    grid-template-columns: repeat(auto-fill,249px);
    gap: 31px 14px;
    width: 100%;
    justify-content: space-between;
    padding-top: 30px;
    }
    .saleProduct_box{
        display: flex;
        flex-direction: column;
        height: 480px;
        color: black;
        cursor: pointer;
    }
    .saleProduct_box:hover{
        box-shadow: 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22);
        transition-duration: 1s;
    }
    #saleproduct_totalCountText{
        
        font-size: 20px;
        font-weight: 700;
        
    }
#sale_01_toptext{
        display: flex;
align-items: center
    }
    #saleProduct{
        display: flex;
        margin: 0px 0px 6px 10px;
        justify-content: space-between;
        align-items: center;
    }
    .saleProduct_bar{
        width: 1px;
        height: 16px;
        margin: 0px 12px;
        background-color: #E1DDDB;
    }
    #sale_topBar{
        border-top: 1px solid black;
        margin-bottom: 23px;
    }
    .saleProductDeliveryTypeText{
        font-size: 14px;
        color: rgb(153, 153, 153);
        line-height: 19px;
        letter-spacing: -0.5px;
    }
    .sale_product_title{
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
    .saleProduct_sale{
        font-size: 20px;
        font-weight: 800;
    }
    .saleProduct_price{

        text-decoration: line-through;
    }
    .saleProduct_salePrice{
        font-size: 20px;
        font-weight: 800;
    }
    .saleProduct_originalPriceText{
        font-size: 14px;
        color: rgb(153, 153, 153);
        line-height: 19px;
        letter-spacing: -0.5px;
    }
   .saleProduct_box_Text{
    padding: 9px 0px 0px 10px;
   }
   .sale-title{
    font-size:30px;
    font-weight:1000px;
    padding-bottom:30px;
    text-align: center;
   }

</style>
<script>
    $(window).load(function(){
        $('.saleProduct_box').hover(
        function(){
           
        },function(){

        }
        );
    });
</script>
</head>
<body>
<div class="sale-title">할인 상품</div>
 <div id="saleProduct">
    <div id="saleproduct_totalCountText">총 20건</div>
    <div id="sale_01_toptext">
        <div>
            <a href="#">낮은가격순</a>
        </div>
        <div class="saleProduct_bar"></div>
        <div>
            <a href="#">높은가격순</a>
        </div>
        <div class="saleProduct_bar"></div>
        <div>
            <a href="#">최신순</a>
        </div>
    </div>
</div>
<div id="sale_topBar"></div>
    <div class="saleProductList"> <!--상품목록-->
        <!--forEach들어가야함-->
        <a href="#" class="saleproduct_box"><!--상품1개 박스-->
            <div> <!--상품 이미지-->
                <img src="${contextPath}/img/image_food/shinemuscat.JPG" alt="상품이미지" width="249px" height="320px">
            </div>
            <div class="saleproduct_box_Text">
                <div>
                    <c:choose>
                        <c:when test="${deliveryType == 'reserve'}">
                            <span class="saleproductDeliveryTypeText">예약배송</span><img src="${contextPath}/img/image_logo/thunder.png" alt="예약배송 아이콘" width="20px" height="20px">
                        </c:when>
                        <c:otherwise>
                            <span class="saleproductDeliveryTypeText">일반배송</span>
                        </c:otherwise>
                    </c:choose>
                <!--예약배송<img src="${contextPath}/img/image_logo/thunder.png" alt="예약배송 아이콘" width="20px" height="20px">-->
                </div>
                <div><!--상품 브랜드명 상품명-->
                    <span class="sale_product_title">[AllEating] 저탄소 샤인머스캣</span>
                </div>
                <div><!-- 상품 가격-->
                    <span class="saleproduct_sale redText">35%</span><!--할인율-->
                    <span class="saleproduct_salePrice">14,190원</span><!--가격-->
                </div>
                <div class="saleproduct_originalPriceText">
                    <span class="saleproduct_price">21,900</span><!--할인상품일시 정가-->
                    <span>원</span>
                </div>
                <div><!--상품 후기-->
                후기
                </div>
            </div>
        </a>

        <!--데모-->
        <a href="#" class="saleproduct_box"><!--상품1개 박스-->
            <div> <!--상품 이미지-->
                <img src="${contextPath}/img/image_food/shinemuscat.JPG" alt="상품이미지" width="249px" height="320px">
            </div>
            <div>
                <span class="saleproductDeliveryTypeText">예약배송</span><img src="${contextPath}/img/image_logo/thunder.png" alt="예약배송 아이콘" width="20px" height="20px">
            </div>
            <div><!--상품 브랜드명 상품명-->
                <span>[AllEating] 저탄소 샤인머스캣</span>
            </div>
            <div><!-- 상품 가격-->
                <span class="saleproduct_sale redText">35%</span><!--할인율-->
                <span class="saleproduct_salePrice">14,190원</span><!--가격-->
            </div>
            <div>
                <span class="saleproduct_price">21,900원</span><!--할인상품일시 정가-->
            </div>
            <div><!--상품 후기-->
                후기
            </div>
        </a>
        <a href="#" class="saleproduct_box"><!--상품1개 박스-->
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
                <span class="saleproduct_sale redText">35%</span><!--할인율-->
                <span class="saleproduct_salePrice">14,190원</span><!--가격-->
            </div>
            <div>
                <span class="saleproduct_price">21,900원</span><!--할인상품일시 정가-->
            </div>
            <div><!--상품 후기-->
                후기
            </div>
        </a>
        <a href="#" class="saleproduct_box"><!--상품1개 박스-->
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
                <span class="saleproduct_sale redText">35%</span><!--할인율-->
                <span class="saleproduct_salePrice">14,190원</span><!--가격-->
            </div>
            <div>
                <span class="saleproduct_price">21,900원</span><!--할인상품일시 정가-->
            </div>
            <div><!--상품 후기-->
                후기
            </div>
        </a>
        <a href="#" class="saleproduct_box"><!--상품1개 박스-->
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
                <span class="saleproduct_sale redText">35%</span><!--할인율-->
                <span class="saleproduct_salePrice">14,190원</span><!--가격-->
            </div>
            <div>
                <span class="saleproduct_price">21,900원</span><!--할인상품일시 정가-->
            </div>
            <div><!--상품 후기-->
                후기
            </div>
        </a>
       

    </div><!--end saleproductList 상품 목록 끝-->

</body>
</html>


