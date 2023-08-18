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
        height: 538px;
        color: black;
        cursor: pointer;
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
        margin: 0px 0px 20px 10px;
        justify-content: space-between;
        align-items: center;
    }
    .searchProduct_bar{
        width: 1px;
        height: 16px;
        margin: 0px 12px;
        background-color: #E1DDDB;
    }
</style>
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
    <div class="productList"> <!--상품목록-->
        
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


