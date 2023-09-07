<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
      <%
    request.setCharacterEncoding("utf-8");
    %>
    <c:set var = "contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <script>
    $(document).ready(function(){
        
        $('.side_aTag').click(function(){
            $('.side_aTag').removeClass('current');
            $(this).addClass('current');
        });


        $('#memberTap').click(function(){
            $('.hide_side_menu').toggle('500');
        });
        
        $('#orderTap').click(function(){
            $('.hide_side_menu2').toggle('500');
        });
    });

   function fn_cartOder(){
        location.href="${contextPath}/order/pay_02.do";
    }
    function fn_showMenu(){
       
    }
    </script>
<style>
    .side_aTag:active, .side_aTag:hover, .side_small_aTag:hover{
        background-color:#E1DDDB;
        color:#0c4A60;
        font-weight: 1000;
    }
.no-underline{
text-decoration:none;}
.side_title{
    height: 75px;
    padding: 5px 0px 35px 1px;
    font-weight: 1000;
    font-size: 28px;
    line-height: 35px;
    letter-spacing: -1px;
}
.side_menu_subheading{
    border: 1px solid #E1DDDB;
}
.side_aTag{
    cursor: pointer;
    border-bottom: 1px solid rgb(242, 242, 242);
    padding: 15px 13px 15px 20px;
    display: flex;
    -webkit-box-pack: justify;
    justify-content: space-between;
    -webkit-box-align: center;
    align-items: center;
    line-height: 19px;
    letter-spacing: -0.3px;
    font-size: 14px;
    color: rgb(102, 102, 102);
}
.side_menu_icon{
    width: 19px;
    height: 19px;
}
.current{
    background-color:#E1DDDB;
        color:#0c4A60;
        font-weight: 1000;
}
.side_product_title{
    font-weight: 1000;
    font-size: 20px;
    color: rgb(51, 51, 51);
}
.side_cart_menu{
    
    width: 300px;
    border: 2px solid #eee;
    background: #fff;
}
.side_cart_menu2{
    position: relative;
}
.side_cart_top_menuBox{
    padding: 15px 15px 18px;
    background: #f9f9f9;
}
.side_cart_deliveryTitleText{
    font-size: 16px;
}
.side_cart_deliveryAddressText{
    font-size: 14px;
}
.side_deliveryAddressChange_btn{
   position: relative;
   left:170px;
}
.side_clear{
    clear:both;
}
.side_font_size{
    font-size: 16px;
}
.side_product_total_count{
    height: 120px;
    padding: 20px 20px 50px 20px;
}
.side_cartMenu_bottom{

    padding: 20px 20px 20px;
}
.side_cartMenu_bottom2{
    justify-content: space-between;
    display: flex;
}
.codr_opt_bx{
    margin-top: 10px;
    padding-top: 9px;
    border-top: 1px solid #e0e0e0
}
.side_font_OrgText{
    color: #EF6C33;
    font-weight: 1000;
}
.side_total_priceText{
    font-size: 20px;
}
.codr_btn_payment{
    border: none;
    display: block;
    width: 100%;
    min-height: 70px;
    height: auto;
    background: #EF6C33;
    color: #fff;
    font-size: 21px;
    letter-spacing: -0.3px;
    line-height: 1.2;
}
.codr_btn_payment:hover{
    background-color: black;
}
.codr_btn_paymentText{
    vertical-align: middle;
}
.side_bar{
    border-bottom: 1px solid rgb(238, 238, 238);
}
.side_flex{
    display: flex;
    align-items: center;
}
.side_price_input{
    width: 70px;
    height: 35px;
}
.side_filter{
    padding: 9px 9px 9px 13px;
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    line-height: 19px;
    letter-spacing: -0.3px;
    font-size: 14px;
}
#side_fontSize{
    font-size: 15px;
}
#filter_price{
    background-color: #EF6C33;
    width: 50px;
    height: 35px;
    border-radius: 5px;
    text-align: center;
    vertical-align: middle;
    margin-left: 5px;
    color: white;
}
#filter_price_text{
    position: relative;
    left: 169px;
    top: -26px;
    color: white;
}
.side_small_aTag{
    cursor: pointer;
    padding: 10px 13px 10px 30px;
    display: flex;
    -webkit-box-pack: justify;
    justify-content: space-between;
    -webkit-box-align: center;
    align-items: center;
    line-height: 19px;
    font-size: 12px;
    color: rgb(102, 102, 102);
}
.lastAtag{
    border-bottom: 1px solid rgb(242, 242, 242);
}

</style>
<meta charset="UTF-8">
<title>사이드 메뉴</title>
</head>
<body>
    <div>
        <c:choose>
            
            <c:when test="${side_menuType == 'my_page'}">
                <!--마이페이지 사이드 메뉴-->
                <div class="side_title">마이페이지</div>
                <ul class="side_menu_subheading">
                    <li class="side_tap">
                        <a class="side_aTag" href="${contextPath}/myPage/myPage_01.do?id=${loginMember.id}">주문 내역
                            <img src="${contextPath}/img/side/arrow-right-gray.png" class="side_menu_icon" alt="우측화살표">
                        </a>
                    </li>
                    <li class="side_tap"> 
                        <a class="side_aTag" href="${contextPath}/myPage/myPage_review.do?id=${loginMember.id}">상품 후기
                            <img src="${contextPath}/img/side/arrow-right-gray.png" class="side_menu_icon" alt="우측화살표">
                        </a>
                        <ul class="hide_side_menu">
                            <li class="side_tap"> 
                                <a class="side_small_aTag" href="${contextPath}/myPage/myPage_review.do?id=${loginMember.id}">작성 가능 후기</a>
                            </li>
                            <li class="side_tap"> 
                                <a class="side_small_aTag lastAtag" href="${contextPath}/myPage/myPage_writtenReview.do?id=${loginMember.id}">작성한 후기</a>
                            </li>
                        </ul>
                    </li>
                    <li class="side_tap">
                        <a class="side_aTag" href="${contextPath}/myPage/myPage_wish.do?id=${loginMember.id}">찜한 상품
                            <img src="${contextPath}/img/side/arrow-right-gray.png" class="side_menu_icon" alt="우측화살표">
                        </a>
                    </li>
          
                    <li class="side_tap">
                        <a class="side_aTag" href="${contextPath}/myPage/myPage_reserves.do?id=${loginMember.id}">적립금
                            <img src="${contextPath}/img/side/arrow-right-gray.png" class="side_menu_icon" alt="우측화살표">
                        </a>
                    </li>
                    <li class="side_tap">
                        <a class="side_aTag" href="${contextPath}/myPage/myPage_coupon.do">쿠폰
                            <img src="${contextPath}/img/side/arrow-right-gray.png" class="side_menu_icon" alt="우측화살표">
                        </a>
                    </li>
                    <li class="side_tap">
                        <a class="side_aTag" href="${contextPath}/myPage/myPage_edit.do">개인 정보 수정
                            <img src="${contextPath}/img/side/arrow-right-gray.png" class="side_menu_icon" alt="우측화살표">
                        </a>
                    </li>
                    <li class="side_tap">
                        <a class="side_aTag" href="${contextPath}/myPage/myPage_address.do">배송지 관리
                            <img src="${contextPath}/img/side/arrow-right-gray.png" class="side_menu_icon" alt="우측화살표">
                        </a>
                    </li>
                </ul>
            </c:when>
            
            <c:when test="${side_menuType == 'owner_page'}">
                <!--사업자페이지 사이드 메뉴-->
                <div class="side_title">사업자페이지</div>
                <ul class="side_menu_subheading">
                    <li class="side_tap">
                        <a class="side_aTag" href="${contextPath}/owner/ownerProductList.do">상품 관리
                            <img src="${contextPath}/img/side/arrow-right-gray.png" class="side_menu_icon" alt="우측화살표">
                        </a>
                    </li>
                    <li class="side_tap"> 
                        <a class="side_aTag" href="${contextPath}/owner/ownerOrderList.do">배송/주문 관리
                            <img src="${contextPath}/img/side/arrow-right-gray.png" class="side_menu_icon" alt="우측화살표">
                        </a>
                    </li>
                    <!-- <li class="side_tap">
                        <a class="side_aTag" href="#">블랙리스트 관리
                            <img src="${contextPath}/img/side/arrow-right-gray.png" class="side_menu_icon" alt="우측화살표">
                        </a>
                    </li> -->
                    <li class="side_tap">
                        <a class="side_aTag" href="${contextPath}/owner/ownerinquirylist.do">상품 문의 관리
                            <img src="${contextPath}/img/side/arrow-right-gray.png" class="side_menu_icon" alt="우측화살표">
                        </a>
                    </li>
                </ul>
            </c:when>
           
            <c:when test="${side_menuType == 'admin_page'}">
                 <!--관리자페이지 사이드 메뉴-->
                <div class="side_title">관리자페이지</div>
                <ul class="side_menu_subheading">
                    <li class="side_tap">
                        <a class="side_aTag" href="${contextPath}/admin/productMain.do">상품 관리
                            <img src="${contextPath}/img/side/arrow-right-gray.png" class="side_menu_icon" alt="우측화살표">
                        </a>
                    </li>
                    <li class="side_tap" > 
                        <a id="memberTap" class="side_aTag" href="#">회원 관리
                            <img src="${contextPath}/img/side/arrow-right-gray.png" class="side_menu_icon" alt="우측화살표">
                        </a>
                        <ul class="hide_side_menu">
                            <li class="side_tap"> 
                                <a class="side_small_aTag" href="${contextPath}/admin/userMemberList.do">일반회원 관리</a>
                            </li>
                            <li class="side_tap"> 
                                <a class="side_small_aTag lastAtag" href="${contextPath}/admin/ownerMemberList.do">사업자회원 관리</a>
                            </li>
                        </ul>
                    </li>
                    <li class="side_tap">
                        <a id="orderTap" class="side_aTag" href="#">배송/주문 관리
                            <img src="${contextPath}/img/side/arrow-right-gray.png" class="side_menu_icon" alt="우측화살표">
                        </a>
                        <ul class="hide_side_menu2">
                            <li class="side_tap"> 
                                <a class="side_small_aTag" href="${contextPath}/admin/adminOwnerOrderList.do">사업자 주문/배송 관리</a>
                            </li>
                            <li class="side_tap"> 
                                <a class="side_small_aTag lastAtag" href="${contextPath}/admin/adminOrderList.do">예약배송 주문 관리</a>
                            </li>
                        </ul>
                    </li>
                    <li class="side_tap">
                        <a class="side_aTag" href="#">커뮤니티 관리
                            <img src="${contextPath}/img/side/arrow-right-gray.png" class="side_menu_icon" alt="우측화살표">
                        </a>
                    </li>
                    <li class="side_tap">
                        <a class="side_aTag" href="${contextPath}/admin/couponList.do">쿠폰 관리
                            <img src="${contextPath}/img/side/arrow-right-gray.png" class="side_menu_icon" alt="우측화살표">
                        </a>
                    </li>
                    <li class="side_tap">
                        <a class="side_aTag" href="${contextPath}/admin/adminAnnouncement.do">공지사항 관리
                            <img src="${contextPath}/img/side/arrow-right-gray.png" class="side_menu_icon" alt="우측화살표">
                        </a>
                    </li>
                    <li class="side_tap">
                        <a class="side_aTag" href="#">상품문의/후기 관리
                            <img src="${contextPath}/img/side/arrow-right-gray.png" class="side_menu_icon" alt="우측화살표">
                        </a>
                    </li>
                </ul>
            </c:when>
            
            <c:when test="${side_menuType == 'customer_service_center'}">
                <!--고객센터 사이드 메뉴-->
                <div class="side_title">고객센터</div>
                <ul class="side_menu_subheading">
                    <li class="side_tap">
                        <a class="side_aTag" href="${contextPath}/serviceCenter/announcement.do">공지사항
                            <img src="${contextPath}/img/side/arrow-right-gray.png" class="side_menu_icon" alt="우측화살표">
                        </a>
                    </li>
                    <%-- <li class="side_tap"> 
                        <a class="side_aTag" href="#">자주하는 질문
                            <img src="${contextPath}/img/side/arrow-right-gray.png" class="side_menu_icon" alt="우측화살표">
                        </a>
                    </li> --%>
                   
                    <li class="side_tap">
                        <a class="side_aTag" href="${cotextPath }/serviceCenter/productQnA.do">상품 문의
                            <img src="${contextPath}/img/side/arrow-right-gray.png" class="side_menu_icon" alt="우측화살표">
                        </a>
                    </li>
                </ul>
            </c:when>
            
            <c:when test="${side_menuType == 'community'}">
                <!--커뮤니티 사이드 메뉴-->
                <div class="side_title">커뮤니티</div>
                <ul class="side_menu_subheading">
                    <li class="side_tap">
                        <a class="side_aTag" href="#">레시피
                            <img src="${contextPath}/img/side/arrow-right-gray.png" class="side_menu_icon" alt="우측화살표">
                        </a>
                    </li>
                    <li class="side_tap"> 
                        <a class="side_aTag" href="#">리뷰
                            <img src="${contextPath}/img/side/arrow-right-gray.png" class="side_menu_icon" alt="우측화살표">
                        </a>
                    </li>
                    <li class="side_tap">
                        <a class="side_aTag" href="#">이벤트
                            <img src="${contextPath}/img/side/arrow-right-gray.png" class="side_menu_icon" alt="우측화살표">
                        </a>
                    </li>
                </ul>
                <!-- 커뮤니티 - 리뷰 -->
            </c:when>
            <c:when test="${side_menuType == 'review_01'}">
                <div class="side_title">커뮤니티</div>
                <ul class="side_menu_subheading">
                    <li class="side_tap">
                        <a class="side_aTag" href="#">레시피
                            <img src="${contextPath}/img/side/arrow-right-gray.png" class="side_menu_icon" alt="우측화살표">
                        </a>
                    </li>
                    <li class="side_tap"> 
                        <a class="side_aTag" href="#">리뷰
                            <img src="${contextPath}/img/side/arrow-right-gray.png" class="side_menu_icon" alt="우측화살표">
                        </a>
                    </li>
                    <li class="side_tap">
                        <a class="side_aTag" href="#">이벤트
                            <img src="${contextPath}/img/side/arrow-right-gray.png" class="side_menu_icon" alt="우측화살표">
                        </a>
                    </li>
                </ul>
            </c:when>
            <c:when test="${side_menuType == 'product_01'}">
            <!--목록 상세페이지 필터-->    
            <div>
            <div class="side_product_title">필터</div>
            <div class="side_bar"></div>
            <div class="side_product_title">브랜드</div>
                <ul>
                    <li class="side_filter">
                        <label >
							<input type="checkbox" class="form-check-input" name="sms_yn" />
							<span class="side_font_size">달콤트리</span>
						</label>
                    </li>
                    <li class="side_filter"> 
                        <label >
							<input type="checkbox" class="form-check-input" name="sms_yn" />
							<span class="side_font_size">귤림원</span>
						</label>
                    </li>
                    <li class="side_filter">
                        <label >
							<input type="checkbox" class="form-check-input" name="sms_yn" />
							<span class="side_font_size">스위프리</span>
						</label>
                    </li>
                    <li class="side_filter">
                        <label >
							<input type="checkbox" class="form-check-input" name="sms_yn" />
							<span class="side_font_size">올프레쉬</span>
						</label>
                    </li>
                </ul>
                <div class="side_bar"></div>
                <div class="side_product_title">가격</div>
                <ul>
                    <li class="side_filter">
                        <label >
							<input type="checkbox" class="form-check-input" name="sms_yn" />
							<span class="side_font_size">5,000미만</span>
						</label>
                    </li>
                    <li class="side_filter">
                        <label >
							<input type="checkbox" class="form-check-input" name="sms_yn" />
							<span class="side_font_size">5,000~10,000원 미만</span>
						</label>
                    </li>
                    <li class="side_filter">
                        <label >
							<input type="checkbox" class="form-check-input" name="sms_yn" />
							<span class="side_font_size">10,000~20,000원 미만</span>
						</label>
                    </li>
                </ul>
                <div class="side_flex">
                    <input type="text" name="startPrice" class="side_price_input">
                    <span id="side_fontSize">~</span>
                    <input type="text" name="endPrice"  class="side_price_input">
                    <a href="#" id="filter_price"></a>
                   
                </div>
                <span id="filter_price_text">검색</span>
            </div>
            </c:when>
           
            <c:when test="${side_menuType == 'cart_page'}">
                 <!--장바구니 사이드 메뉴-->
                <div class="side_cart_menu">
                    <div class="side_cart_menu2">
                        <div class="side_cart_top_menuBox">
                           
                            
                            <div>
                                <c:choose>
                                    <c:when test="${isLoginON == null || isLoginON == false}">
                                        <img src="${contextPath}/img/side/icon-location.png" width="16px" alt="location">        
                                        <strong class="side_cart_deliveryTitleText">로그인을 해보세요.</strong><br>
                                        <span class="side_cart_deliveryAddressText">로그인을 하시면 지금 보고있는 상품을 나중에도 확인하실 수 있습니다.</span>
                                    </c:when>
                                    <c:otherwise>
                                        <c:set var="deliveryAddressVO" value="${product_map.deliveryAddressVO}" />
                                        <img src="${contextPath}/img/side/icon-location.png" width="16px" alt="location">
                                        <strong class="side_cart_deliveryTitleText">기본배송지: ${deliveryAddressVO.deliveryName}</strong><br>
                                        <span class="side_cart_deliveryAddressText">[${deliveryAddressVO.zipcode}] ${deliveryAddressVO.address}
                                            <c:if test="${not empty deliveryAddressVO.address2}">
                                            (${deliveryAddressVO.address2})
                                            </c:if>
                                        ${deliveryAddressVO.address_detail}
                                        </span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="side_deliveryAddressChange_btn">
                                <!--<button class="btn btn-info btn-sm">배송지 변경</button>-->
                            </div>
                        </div>
                        
                        <div>
                            <div class="side_product_total_count">
                                <img src="${contextPath}/img/side/icon-shopping-cart.png" width="16px" alt="cart">
                                <span class="side_font_size">전체상품 : <input type="text" value="0" class="css0930" id="productCount">개</span>
                            </div>
                            <div class="side_cartMenu_bottom">
                                <div class="side_cartMenu_bottom2">
                                    <div><span class="side_font_size">주문금액:</span></div>
                                    <div><span class="side_font_size" id="total_sum"><!--<input type="text" value="0" class="css0930" id="total_sum">--></span>원</div>
                                </div>
                                <!--<div class="side_cartMenu_bottom2">
                                    <div><span class="side_font_size">상품할인:</span></div>
                                    <div><span class="side_font_size">-0원</span></div>
                                </div>-->
                                <div class="side_cartMenu_bottom2">
                                    <div><span class="side_font_size">배송비:</span></div>
                                    <div><span class="side_font_size" id="deliveryPrice"><!--<input type="text" value="0" class="css0930" id="deliveryPrice">--></span>원</div>
                                </div>
                                <div class="side_cartMenu_bottom2 codr_opt_bx">
                                    <div>
                                        <span class="side_font_size side_font_OrgText">
                                            결제 예정 금액:
                                        </span>
                                    </div>
                                    <div>
                                        <span class="side_font_size side_font_OrgText side_total_priceText"  id="td">
                                            <!--<input type="text" value="0" class="css0930" id="td">-->
                                        </span>원
                                    </div>
                                </div>
                                <button class="codr_btn_payment" onclick="getcheck()">주문하기</button>
                            </div>
                        </div>
                    </div>
                </div>
            </c:when>
            <c:when test="${side_menuType == 'sale_product_01'}">
            <!--할인 목록 상세페이지 필터-->    
            <div>
            <div class="side_product_title">필터</div>
            <div class="side_bar"></div>
            <div class="side_product_title">브랜드</div>
                <ul>
                    <li class="side_filter">
                        <label >
							<input type="checkbox" class="form-check-input" name="sms_yn" />
							<span class="side_font_size">달콤트리</span>
						</label>
                    </li>
                    <li class="side_filter"> 
                        <label >
							<input type="checkbox" class="form-check-input" name="sms_yn" />
							<span class="side_font_size">귤림원</span>
						</label>
                    </li>
                    <li class="side_filter">
                        <label >
							<input type="checkbox" class="form-check-input" name="sms_yn" />
							<span class="side_font_size">스위프리</span>
						</label>
                    </li>
                    <li class="side_filter">
                        <label >
							<input type="checkbox" class="form-check-input" name="sms_yn" />
							<span class="side_font_size">올프레쉬</span>
						</label>
                    </li>
                </ul>
                <div class="side_bar"></div>
                <div class="side_product_title">가격</div>
                <ul>
                    <li class="side_filter">
                        <label >
							<input type="checkbox" class="form-check-input" name="sms_yn" />
							<span class="side_font_size">5,000미만</span>
						</label>
                    </li>
                    <li class="side_filter">
                        <label >
							<input type="checkbox" class="form-check-input" name="sms_yn" />
							<span class="side_font_size">5,000~10,000원 미만</span>
						</label>
                    </li>
                    <li class="side_filter">
                        <label >
							<input type="checkbox" class="form-check-input" name="sms_yn" />
							<span class="side_font_size">10,000~20,000원 미만</span>
						</label>
                    </li>
                </ul>
                <div class="side_flex">
                    <input type="text" name="startPrice" class="side_price_input">
                    <span id="side_fontSize">~</span>
                    <input type="text" name="endPrice"  class="side_price_input">
                    <a href="#" id="filter_price"></a>
                   
                </div>
                <span id="filter_price_text">검색</span>
            </div>
            </c:when>
        </c:choose>
    </div>
</body>
</html>