<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <%
request.setCharacterEncoding("utf-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
  <head>

    <meta charset="UTF-8" />
    <title>헤더</title>
    
    <link href ="${contextPath}/css/allEatingHeader.css" rel="stylesheet" type="text/css"> 
    <script>
      $(function(){ //카테고리 호버
        $('#header_categroy').hover(
        function(){
            $('#hide_cate').css('display', 'block');
        },
        function(){
            $('#hide_cate').css('display', 'none');
        }
    );
      });
  $(function(){
    //상세카테고리 호버
    $('#vegetable').hover(
        function(){
            $('#vegetable_categroy').css('display', 'block');
        },
        function(){
            $('#vegetable_categroy').css('display', 'none');
        }
    );
    $('#fruit').hover(
        function(){
            $('#fruit_categroy').css('display', 'block');
        },
        function(){
            $('#fruit_categroy').css('display', 'none');
        }
    );
    $('#fish').hover(
        function(){
            $('#fish_categroy').css('display', 'block');
        },
        function(){
            $('#fish_categroy').css('display', 'none');
        }
    );
    $('#meat').hover(
        function(){
            $('#meat_categroy').css('display', 'block');
        },
        function(){
            $('#meat_categroy').css('display', 'none');
        }
    );
    $('#mainFood').hover(
        function(){
            $('#mainFood_categroy').css('display', 'block');
        },
        function(){
            $('#mainFood_categroy').css('display', 'none');
        }
    );
    $('#salad').hover(
        function(){
            $('#salad_categroy').css('display', 'block');
        },
        function(){
            $('#salad_categroy').css('display', 'none');
        }
    );
    $('#noodle').hover(
        function(){
            $('#noodle_categroy').css('display', 'block');
        },
        function(){
            $('#noodle_categroy').css('display', 'none');
        }
    );
    $('#water').hover(
        function(){
            $('#water_categroy').css('display', 'block');
        },
        function(){
            $('#water_categroy').css('display', 'none');
        }
    );
});
$(function(){$('.header_nav').hover(
    function(){
      $(this).css('border-bottom','3px solid #0C4A60');
      $(this).css('color','#0C4A60');
    },
    function(){
      $(this).css('border-bottom','none');
      $(this).css('color','black');
    }
  );
});
  function fn_checkLogin(){
    alert("로그인해주세요");
  }
    </script>
  </head>
  <body>
    <div class="allEating_header"> <!--카테고리 위쪽 메뉴들 그룹-->
      <div id="header_top"> <!--헤더 우측 상단 메뉴-->
        <c:choose>
          <c:when test="${isLoginON == true and loginMember != null}"><!--로그인 했을때-->
            <c:choose>
              <c:when test="${loginMember.join_type == 'user' and loginMember.member_grade == 'base'}"> <!--일반회원 로그인-->
                <span id="header_top_join"><span class="textColor2">일반 회원</span> ${loginMember.name}님 반갑습니다!</span>
              </c:when>
              <c:when test="${loginMember.join_type == 'user' and loginMember.member_grade == 'vip'}"> <!--VIP회원 로그인-->
                <span id="header_top_join"><span class="textColor2">VIP 회원</span> ${loginMember.name}님 반갑습니다!</span>
              </c:when>
              <c:when test="${loginMember.join_type == 'owner'}"> <!--사업자회원 로그인-->
                <span id="header_top_join"><span class="textColor2">사업자 회원</span> ${loginMember.name}님 반갑습니다!</span>
              </c:when>
              <c:when test="${loginMember.join_type == 'admin'}"> <!--관리자회원 로그인-->
                <span id="header_top_join"><span class="textColor2">관리자 회원</span>${loginMember.name}님 반갑습니다!</span>
              </c:when>
            </c:choose>
          </c:when>
          <c:otherwise><!--로그인 정보가 없을때-->
            <a href="${contextPath}/member/memberForm.do" id="header_top_join">회원가입</a>
          </c:otherwise>
        </c:choose>
        <div class="header_top_bar"></div> <!--일자 바-->
        <c:choose>
            <c:when test="${isLoginON == true and loginMember != null}"><!--로그인 했을때-->
              <a href="${contextPath}/member/logOut.do">로그아웃</a>
            </c:when>
            <c:otherwise><!--로그인 정보가 없을때-->
              <a href="${contextPath}/member/loginForm.do">로그인</a>
            </c:otherwise>
        </c:choose>
        <div class="header_top_bar"></div> <!--일자 바-->
        <a href="#">고객센터</a>
      </div>
        <div id="header_top_center">
          <div><a href="#">공지사항</a></div>
          <div><a href="#">자주하는질문</a></div>
          <div><a href="#">1:1문의</a></div>
        </div>
      <div id="header_middle">
        <div id="header_logo_img">
          <a href="${contextPath}/main.do"><img src="${contextPath}/img/image_logo/alleating_logo_background_X.png" width="200px"/></a>
        </div>
      </div>
      <div class="allEating_header">
        <div id="header_search_box">
            <input type="text" id="header_search_input"/>
            <a href="#" id="search_icon"><img src="${contextPath}/img/headerImg/icon/free-icon-search.png" width="26px" height="26px"></a>
        </div>
      </div>
      <div class="allEating_header">
        <div class="header_button_group">
          <div>
            <c:choose>
              <c:when test="${loginMember.join_type == 'user'}">
                <a href="${contexPath}/myPage/myPage_01.do" id="user_icon">
                  <img src="${contextPath}/img/headerImg/icon/free-icon-user-profile.png" alt="유저icon" width="29px" height="35px">
                </a>
              </c:when>
               <c:when test="${loginMember.join_type == 'owner'}">
                <a href="${contexPath}/owner/productMain.do" id="user_icon">
                  <img src="${contextPath}/img/headerImg/icon/free-icon-user-profile.png" alt="유저icon" width="29px" height="35px">
                </a>
              </c:when>
               <c:when test="${loginMember.join_type == 'admin'}">
                <a href="${contexPath}/admin/productMain.do" id="user_icon">
                  <img src="${contextPath}/img/headerImg/icon/free-icon-user-profile.png" alt="유저icon" width="29px" height="35px">
                </a>
              </c:when>
              <c:otherwise>
                <a href="#" id="user_icon">
                  <img src="${contextPath}/img/headerImg/icon/free-icon-user-profile.png" alt="유저icon" width="29px" height="35px">
                </a>
              </c:otherwise>
            </c:choose>
            
          </div>
          <div>
            <a href="#" id="wish_icon">
              <img src="${contextPath}/img/headerImg/icon/free-icon-heart.png" alt="찜목록icon" width="29px" height="35px">
            </a>
          </div>
          <div>
            <a href="${contextPath}/cart/myCart.do" id="cart_icon">
              <img src="${contextPath}/img/headerImg/icon/free-icon-shopping-cart.png" alt="장바구니icon" width="29px" height="35px">
            </a>
          </div>
        </div><!--end header_button_group-->
      </div><!--end allEating_header-->
    </div><!--end allEating_header-->
    <div id="header">
      <div id="fix_header">
        <div id="header_categroy">
          <div id="cate_header">
            <div id="cate_img">
              <img src="${contextPath}/img/headerImg/icon/free-icon-list.png" alt="목록icon" width="35px" >
            </div>
              <span id="cate_text">카테고리</span>
          </div>

            <div id="hide_cate">
              <div class="big_categroy">
                <ul>
                  <li class="categroy" id="vegetable">
                  <a href="#"><img src="${contextPath}/img/headerImg/categroy_icon/vegetable.png"  width="20px" height="20px"  style="margin-right: 5px;"/> 채소</a>
                  <div class="small_categroy" id="vegetable_categroy">
                    <ul>
                      <li class="categroy"><a href="#">친환경</a></li>
                      <li class="categroy"><a href="#">고구마·감자·당근</a></li>
                      <li class="categroy"><a href="#">시금치·쌈채소·나물</a></li>
                      <li class="categroy"><a href="#">브로콜리·파프리카·양베추</a></li>
                      <li class="categroy"><a href="#">양파·대파·마늘·배추</a></li>
                      <li class="categroy"><a href="#">오이·호박·고추</a></li>
                      <li class="categroy"><a href="#">콩나물·버섯</a></li>
                    </ul>
                  </div> 
                  </li>
                  <li class="categroy" id="fruit">
                <a href="#"><img src="${contextPath}/img/headerImg/categroy_icon/apple.png" width="20px" height="20px" style="margin-right: 5px;"/>과일·견과·쌀</a>
                <div class="small_categroy" id="fruit_categroy">
                  <ul>
                    <li class="categroy"><a href="${contextPath}/product/product_01.do">국산과일</a></li>
                    <li class="categroy"><a href="#">수입과일</a></li>
                    <li class="categroy"><a href="#">쌀·잡곡</a></li>
                    <li class="categroy"><a href="#">견과류</a></li>
                    <li class="categroy"><a href="#">간편과일</a></li>
                  </ul>
                </div> 
                  </li>
                  <li class="categroy" id="fish">
                  <a href="#"><img src="${contextPath}/img/headerImg/categroy_icon/free-icon-fish.png" width="20px" height="20px" style="margin-right: 5px;"/>수산·해산·건어물</a>
                  <div class="small_categroy" id="fish_categroy">
                    <ul>
                      <li class="categroy"><a href="#">생선류</a></li>
                      <li class="categroy"><a href="#">반건류</a></li>
                      <li class="categroy"><a href="#">오징어·낙지·문어</a></li>
                      <li class="categroy"><a href="#">새우·게·랍스터</a></li>
                      <li class="categroy"><a href="#">해산물·조개류</a></li>
                      <li class="categroy"><a href="#">김·미역·해조류</a></li>
                      <li class="categroy"><a href="#">건어물·다시팩</a></li>
                    </ul>
                  </div> 
                  </li>
                  <li class="categroy" id="meat">
                  <a href="#"><img src="${contextPath}/img/headerImg/categroy_icon/free-icon-meat.png" width="20px" height="20px" style="margin-right: 5px;"/>정육·계란</a>
                  <div class="small_categroy" id="meat_categroy">
                    <ul>
                      <li class="categroy"><a href="#">국내산 소고기</a></li>
                      <li class="categroy"><a href="#">수입산 소고기</a></li>
                      <li class="categroy"><a href="#">돼지고기</a></li>
                      <li class="categroy"><a href="#">닭·오리고기</a></li>
                      <li class="categroy"><a href="#">양고기</a></li>
                      <li class="categroy"><a href="#">양념육·돈까스</a></li>
                      <li class="categroy"><a href="#">계란류</a></li>
                    </ul>
                  </div> 
                  </li>
                  <li class="categroy" id="mainFood">
                  <a href="#"><img src="${contextPath}/img/headerImg/categroy_icon/free-icon-soup.png" width="20px" height="20px" style="margin-right: 5px;"/>국·반찬·메인요리</a>
                  <div class="small_categroy" id="mainFood_categroy">
                    <ul>
                      <li class="categroy"><a href="#">국 탕 찌개</a></li>
                      <li class="categroy"><a href="#">밀키트 메인요리</a></li>
                      <li class="categroy"><a href="#">밑반찬</a></li>
                      <li class="categroy"><a href="#">김치·젓갈 장류</a></li>
                      <li class="categroy"><a href="#">베이컨 햄 통조림</a></li>
                      <li class="categroy"><a href="#">두부·어묵 부침개</a></li>
                    </ul>
                  </div> 
                  </li>
                  <li class="categroy" id="salad">
                  <a href="#"><img src="${contextPath}/img/headerImg/categroy_icon/salad.png" width="20px" height="20px" style="margin-right: 5px;"/>샐러드·간편식</a>
                  <div class="small_categroy" id="salad_categroy">
                    <ul>
                      <li class="categroy"><a href="#">샐러드 닭가슴살</a></li>
                      <li class="categroy"><a href="#">도시락·밥류</a></li>
                      <li class="categroy"><a href="#">파스타·면류</a></li>
                      <li class="categroy"><a href="#">떡볶이·튀김·순대</a></li>
                      <li class="categroy"><a href="#">폭립 떡갈비·안주</a></li>
                      <li class="categroy"><a href="#">죽·스프·카레</a></li>
                      <li class="categroy"><a href="#">선식·시리얼</a></li>
                    </ul>
                  </div> 
                  </li>
                  <li class="categroy" id="noodle">
                  <a href="#"><img src="${contextPath}/img/headerImg/categroy_icon/free-icon-pasta.png" width="20px" height="20px" style="margin-right: 5px;"/>면·양념·오일</a>
                  <div class="small_categroy" id="noodle_categroy">
                    <ul>
                      <li class="categroy"><a href="#">파스타 면류</a></li>
                      <li class="categroy"><a href="#">식초·소스·드레싱</a></li>
                      <li class="categroy"><a href="#">양념·액젓·장류</a></li>
                      <li class="categroy"><a href="#">식용유·참기름·오일</a></li>
                      <li class="categroy"><a href="#">소금 설탕·향신료</a></li>
                      <li class="categroy"><a href="#">밀가루·가루·믹스</a></li>
                    </ul>
                  </div> 
                  </li>
                  <li class="categroy" id="water">
                  <a href="#"><img src="${contextPath}/img/headerImg/categroy_icon/free-icon-coffee-cup.png" width="20px" height="20px" style="margin-right: 5px;"/>생수·음료·우유·커피</a>
                  <div class="small_categroy" id="water_categroy">
                    <ul>
                      <li class="categroy"><a href="#">생수 탄산수</a></li>
                      <li class="categroy"><a href="#">음료 주스</a></li>
                      <li class="categroy"><a href="#">우유·두유·요거트</a></li>
                      <li class="categroy"><a href="#">커피</a></li>
                    </ul>
                  </div> 
                  </li>
                </ul>
              </div><!--end big_categroy-->
            </div><!--end hide_cate-->
        </div><!--end header_categroy-->
       
          <ul id="header_ul">
            <li class="header_nav"><a href="#">신상품</a></li>
            <li class="header_nav"><a href="#">베스트</a></li>
            <li class="header_nav"><a href="#">할인상품</a></li>
            <li class="header_nav"><a href="#">커뮤니티</a></li>
          </ul>
          <div>
            <div id="header_box">

            </div>
          </div>
    </div>
  </div>
  </body>
</html>
