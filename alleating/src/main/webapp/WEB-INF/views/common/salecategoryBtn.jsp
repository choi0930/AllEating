<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <% request.setCharacterEncoding("utf-8"); %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>category group</title>
<script>
    $(function(){
        $('.btn_category').hover(
            function(){
                $(this).css('background-color','#E1DDDB');
            },
            function(){
                $(this).css('background-color','#fff');
            }
        );
    });
</script>
<style>
    .btn_category_container{
        border: 2px solid #e1e5e9;
        border-radius: 8px;
        max-width: 1050px;
        margin: 0 auto;
        margin-top: 20px;
    }
    .btn_category_group{
        display: flex;
        -webkit-box-align: center;
        -ms-flex-align: center;
        align-items: center;
    }
    .btn_category_group .btn_category{
        border-left: 2px solid #f3f5f7;
        border-right: 2px solid #f3f5f7;
        
        border-top: none;
        border-bottom:2px solid #f3f5f7;
        border-radius: 0;
        -webkit-box-flex: 1;
        -ms-flex: 1;
        flex: 1;
     margin-left: 0;
     border-top: none;
     border-right: none;
    }
    .btn_category{
        height: 44px;
    background-color: #fff;
    display: block;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    position: relative;
    -webkit-transition: 200ms background-color cubic-bezier(0.4, 0.8, 0.74, 1);
    transition: 200ms background-color cubic-bezier(0.4, 0.8, 0.74, 1);
    }
    #btn_category_group_title{
        width: 500px;
        margin: 50px auto;
       
        font-weight: 500;
        font-size: 28px;
        color: rgb(51, 51, 51);
        line-height: 35px;
        letter-spacing: -1px;
        text-align: center;
    }
</style>
</head>
<body>
    <div id="btn_category_group_title">신상품</div>
    <div class="btn_category_container">
        <div class="btn_category_group">
            <button class="btn_category" onclick="location.href='/product/new_product_01.do'">전체</button>
            <button class="btn_category" onclick="location.href='/product/new_product_01.do?category=901'">채소</button>
            <button class="btn_category" onclick="location.href='/product/new_product_01.do?category=902'">과일·견과·쌀</button>
            <button class="btn_category" onclick="location.href='/product/new_product_01.do?category=903'">수산·해산·건어물</button>
            <button class="btn_category" onclick="location.href='/product/new_product_01.do?category=904'">정육·계란</button>
        </div>
        <div class="btn_category_group">
            <button class="btn_category" onclick="location.href='/product/new_product_01.do?category=905'">국·반찬·메인요리</button>
            <button class="btn_category" onclick="location.href='/product/new_product_01.do?category=906'">샐러드·간편식</button>
            <button class="btn_category" onclick="location.href='/product/new_product_01.do?category=907'">면·양념·요리</button>
            <button class="btn_category" onclick="location.href='/product/new_product_01.do?category=908'">생수·음료·커피</button>
            <button class="btn_category" disabled></button>
        </div>

        </div>
    </div>
</body>
</html>