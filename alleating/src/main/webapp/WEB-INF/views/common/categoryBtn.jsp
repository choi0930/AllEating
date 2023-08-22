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
        font-size: 14px;
        font-weight: bold;
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
        border-bottom:2px solid #f3f5f7 ;
        border-radius: 0;
        -webkit-box-flex: 1;
        -ms-flex: 1;
        flex: 1;
     margin-left: 0;
     border-top: none;
     border-right: none;
    }
    .btn_category_group .btn_category2{
        border-left: 2px solid #f3f5f7;
        border-right: 2px solid #f3f5f7;
        border-top: none;
        border-bottom:2px solid #f3f5f7 ;
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
    .btn_category2{
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
                    </div>
                    <div class="btn_category_group">
                        <button class="btn_category">오이·호박·고추</button>
                        <button class="btn_category">콩나물·버섯</button>
                        <div class="btn_category2"></div>
                        <div class="btn_category2"></div>
                        <div class="btn_category2"></div>
                        <div class="btn_category2"></div>
                    </div>
            </div>
         

        </c:when>
        <c:when test="${category.contains('902') }">
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
        <c:when test="${category.contains('903') }">
            <div id="btn_category_group_title">수산·해산·건어물</div>
            <div class="btn_category_container">
                <div class="btn_category_group">
                    <button class="btn_category">전체</button>
                    <button class="btn_category">생선류</button>
                    <button class="btn_category">반건류</button>
                    <button class="btn_category">오징어·낙지·문어</button>
                    <button class="btn_category">새우·게·랍스터</button>
                    <button class="btn_category">해산물·조개류</button>
                </div>
                <div class="btn_category_group">   
                    <button class="btn_category">김·미역·해조류</button>
                    <button class="btn_category">건어물·다시팩</button>
                    <div class="btn_category2"></div>
                    <div class="btn_category2"></div>
                    <div class="btn_category2"></div>
                    <div class="btn_category2"></div>
                </div>    
            </div>
        </c:when>
        <c:when test="${category.contains('904') }">
            <div id="btn_category_group_title">정육·계란</div>
            <div class="btn_category_container">
                <div class="btn_category_group">
                    <button class="btn_category">전체</button>
                    <button class="btn_category">국내산 소고기</button>
                    <button class="btn_category">수입산 소고기</button>
                    <button class="btn_category">돼지고기</button>
                    <button class="btn_category">닭·오리고기</button>
                    <button class="btn_category">양고기</button>
                </div>
                <div class="btn_category_group">
                    <button class="btn_category">양념육·돈까스</button>
                    <div class="btn_category2"></div>
                    <div class="btn_category2"></div>
                    <div class="btn_category2"></div>
                    <div class="btn_category2"></div>
                    <div class="btn_category2"></div>
                </div>        
            </div>
        </c:when>
        <c:when test="${category.contains('905') }">
            <div id="btn_category_group_title">국·반찬·메인요리</div>
            <div class="btn_category_container">
                <div class="btn_category_group">
                    <button class="btn_category">전체</button>
                    <button class="btn_category">국·탕·찌개</button>
                    <button class="btn_category">밀키트·메인요리</button>
                    <button class="btn_category">밑반찬</button>
                    <button class="btn_category">김치·젓갈·장류</button>
                    <button class="btn_category">두부·어묵·부침개</button>
                </div>
                <div class="btn_category_group">    
                    <button class="btn_category">베이컨·햄·통조림</button>
                    <div class="btn_category2"></div>
                    <div class="btn_category2"></div>
                    <div class="btn_category2"></div>
                    <div class="btn_category2"></div>
                    <div class="btn_category2"></div>
                </div>
                    
            </div>
        </c:when>
        <c:when test="${category.contains('906') }">
            <div id="btn_category_group_title">샐러드·간편식</div>
            <div class="btn_category_container">
                <div class="btn_category_group">
                    <button class="btn_category">전체</button>
                    <button class="btn_category">샐러드·닭가슴살</button>
                    <button class="btn_category">도시락·밥류</button>
                    <button class="btn_category">파스타·면류</button>
                    <button class="btn_category">떡볶이·튀김·순대</button>
                    <button class="btn_category">피자·핫도그·만두</button>
                </div>
                <div class="btn_category_group">
                    <button class="btn_category">폭립·떡갈비·안주</button>
                    <button class="btn_category">죽·스프·카레</button>
                    <button class="btn_category">선식·시리얼</button>
                    <div class="btn_category2"></div>
                    <div class="btn_category2"></div>
                    <div class="btn_category2"></div>
                </div>
            </div>
        </c:when>
        <c:when test="${category.contains('907') }">
            <div id="btn_category_group_title">면·양념·오일</div>
            <div class="btn_category_container">
                <div class="btn_category_group">
                    <button class="btn_category">전체</button>
                    <button class="btn_category">파스타·면류</button>
                    <button class="btn_category">식초·소스·드레싱</button>
                    <button class="btn_category">양념·액젓·장류</button>
                    <button class="btn_category">식용유·참기름·오일</button>
                    <button class="btn_category">소금·설탕·향신료</button>
                </div>
                <div class="btn_category_group">
                    <button class="btn_category">밀가루·가루·믹스</button>
                    <div class="btn_category2"></div>
                    <div class="btn_category2"></div>
                    <div class="btn_category2"></div>
                    <div class="btn_category2"></div>
                    <div class="btn_category2"></div>
                </div>    
            </div>
        </c:when>
        <c:when test="${category.contains('908') }">
            <div id="btn_category_group_title">생수·음료·우유·커피</div>
            <div class="btn_category_container">
                <div class="btn_category_group">
                    <button class="btn_category">전체</button>
                    <button class="btn_category">생수·탄산수</button>
                    <button class="btn_category">음료·주스</button>
                    <button class="btn_category">우유·두유·요거트</button>
                    <button class="btn_category">커피</button>
                    <div class="btn_category2"></div>
                </div>
            </div>
        </c:when>
    </c:choose>
    
</body>
</html>