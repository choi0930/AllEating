<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <% request.setCharacterEncoding("utf-8"); %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
    
<!DOCTYPE html>
<html>
<head>

<title>검색결과 페이지</title>
<link href="${contextPath}/css/product_01.css" rel="stylesheet" type="text/css" />
<style>
    .productList{
        display: grid;
        grid-template-columns: repeat(auto-fill,249px);
        gap: 31px 18px;
        width: 100%;
    }
    .product_box{
        display: flex;
        flex-direction: column;
        height: 538px;
        color: black;
        cursor: pointer;
    }
</style>
</head>
<body>
 <div>총 20건</div>
    <div class="productList"> <!--상품목록-->
        <a href="#" class="product_box"><!--상품1개 박스-->
            <div> <!--상품 이미지-->
                <img src="${contextPath}/img/image_food/shinemuscat.JPG" alt="상품이미지" width="249px" height="320px">
            </div>
            <div>
                예약배송<img src="${contextPath}/img/image_logo/thunder.png" alt="예약배송 아이콘" width="50px" height="50px">
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

    </div>

</body>
</html>


