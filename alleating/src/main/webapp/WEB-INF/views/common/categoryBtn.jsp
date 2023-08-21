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
        border-bottom:none ;
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
    <c:choose>
        <c:when test="${category.contains('901') }">
            <div id="btn_category_group_title">채소</div>
            <div class="btn_category_container">
                <div class="btn_category_group">
                    <button class="btn_category">전체</button>
                    <button class="btn_category">친환경</button>
                    <button class="btn_category">고구마·감자·당근</button>
                    <button class="btn_category">시금치·쌈채소·나물</button>
                    <button class="btn_category">브로콜리·파프리카·양배추</button>
                    <button class="btn_category">양파·대파·마늘·배추</button>
                    <button class="btn_category">오이·호박·고추</button>
                    <button class="btn_category">콩나물·버섯</button>
                    </div>
            </div>
        </c:when>
        <c:when test="${cateGoryCode.contains == '902'}">
            <div id="btn_category_group_title">과일·견과·쌀</div>
            <div class="btn_category_container">
                <div class="btn_category_group">
                    <button class="btn_category">전체</button>
                    <button class="btn_category">국산과일</button>
                    <button class="btn_category">수입과일</button>
                    <button class="btn_category">쌀·잡곡</button>
                    <button class="btn_category">견과류</button>
                    <button class="btn_category">간편과일</button>
                    </div>
            </div>
        </c:when>
        <c:when test="${cateGoryCode.contains == '903'}">
            <div id="btn_category_group_title">수산·해산·건어물</div>
            <div class="btn_category_container">
                <div class="btn_category_group">
                    <button class="btn_category">전체</button>
                    <button class="btn_category">생선류</button>
                    <button class="btn_category">반건류</button>
                    <button class="btn_category">오징어·낙지·문어</button>
                    <button class="btn_category">새우·게·랍스터</button>
                    <button class="btn_category">해산물·조개류</button>
                    <button class="btn_category">김·미역·해조류</button>
                    <button class="btn_category">건어물·다시팩</button>
                    </div>
            </div>
        </c:when>
        <c:when test="${cateGoryCode.contains == '904'}">
            <div id="btn_category_group_title">과일·견과·쌀</div>
            <div class="btn_category_container">
                <div class="btn_category_group">
                    <button class="btn_category">전체</button>
                    <button class="btn_category">국산과일</button>
                    <button class="btn_category">수입과일</button>
                    <button class="btn_category">쌀·잡곡</button>
                    <button class="btn_category">견과류</button>
                    <button class="btn_category">간편과일</button>
                    </div>
            </div>
        </c:when>
    </c:choose>
    
</body>
</html>