<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <% request.setCharacterEncoding("utf-8"); %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main.jsp</title>

  
</head>
<body>
 <!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">쿠폰 선택</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <td>선택</td>
                        <td>쿠폰 이름</td>
                        <td>할인중</td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <input type="checkbox">
                        </td>
                        <td>회원가입 환영 쿠폰</td>
                        <td>2,000원</td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
          <button type="button" class="btn btn-primary">쿠폰 선택</button>
        </div>
      </div>
    </div>
  </div>
<div class="payTwoSeationText">결제하기</div>
<div class="payTwoPage">
    <!--배송지 정보-->
    <div class="payTwoDeliberyInfoMain">
        
        <div class="payDeliveryInfo">
            <!--수령자 배송지및 이름 전화번호 처음에는 기본배송지 회원가입시 적었던 배송지 표시 배송지 변경시에 변경가능-->
            <div class="payTwoTitleText"><span>배송지 정보</span></div>
            <div class="payTwoText">최현진&nbsp;&nbsp;010-1234-5678</div>
        </div>
        <div class="deliveryAddressText">
            <div>대전 서구 둔산동 오라클 빌딩 10층 1005호&nbsp;&nbsp;
                <a href="#">배송지변경</a><img src="${contextPath}/img/side/arrow-right-gray.png" width="14px">
            </div>
        </div>
        
        <div class="payDeliveryInfo payTwoborderTop">
            <span class="payTwoTitleText">배송 요청 사항</span>
            
            <input tpye="text" class="form-control payTwoInput" name="delivery_request" id="deliveryRequest"/>
            
            <select class="form-select dliveryRequest_select"  id="dliveryRequestSelect" onchange="fn_deliveryMsgSelect()">
                <option value="self">직접 입력</option>
                <option>빠른 배송 부탁드립니다.</option>
                <option>배송 전, 연락주세요.</option>
                <option>부재 시, 휴대폰으로 연락주세요.</option>
                <option>부재 시, 경비실에 맡겨주세요.</option>
                <option>경비실이 없습니다. 배송 전, 연락주세요.</option>
                <option>선택 안함</option>
            </select>
        </div>
       
        <!--주문자-->
        <div class="payDeliveryInfo payTwoborderTop">
            <div class="payTwoTitleText">주문자명</div>
            <div id="payTwoOrderName">최현진</div>
        </div>
        <div class="payDeliveryInfo">
            <div class="payTwoTitleText">휴대폰</div>
            <div class="payTwoOrderInfo">010-1234-5678</div>
        </div>
        <div class="payDeliveryInfo">
            <div class="payTwoTitleText">이메일</div>
            <div class="payTwoOrderInfo">test@naver.com</div>
        </div>
    </div><!--end payDeliveryInfoMain(배송지정보)-->
    
    <!--주문하는 상품 정보-->
    <div class="payProductInfo">
        <div class="payTwoSeationText">
            주문 상품 정보
        </div>
        <div class="payTwoTitleText payTwoQty">
            주문 상품: 1개
        </div>
        <div class="payDeliveryInfo payTwoProduct">
            <img src="${contextPath}/img/image_food/shinemuscat.JPG" alt="샤인머스켓" width="100px">
           
            <div>
                [AllEating]<br>
                저탄소 샤인머스캣               
            </div>
            <div>
                13,990원<br>
                수량 1개
            </div>
        </div>
    </div><!--end payProductInfo(주문하는 상품)-->
    
    <!--할인혜택 정보-->
    <div class="paySaleInfo">
        <div class="payTwoSeationText">
            <span>할인 혜택</span>
        </div>
        <div  class="payDeliveryInfo">
            <div class="payTwoTitleText">주문금액</div>
            <div class="payTwoPriceText"><span style="font-size: 20px; font-weight: bold;">16,990원</span> (상품가 13,990원+배송비 3,000원)</div>
        </div>
        <div class="payDeliveryInfo payTwoborderTop">
            <div class="payTwoTitleText">현재 보유중인 적립금</div>
            <div class="payTwoPoint">0원 </div>
        </div>
        <div class="payDeliveryInfo">
            <div class="payTwoTitleText">사용할 적립금</div>
            <div class="payTwoUsePoint">전체사용 <input type="checkbox" class="form-check-input"><input type="text" class="form-control" id="payUsePointInput">원</div>
            <button class="btn btn-primary payTwoCouponBtn">사용</button>
        </div>
        <div class="payDeliveryInfo">
            <div class="payTwoTitleText"> 쿠폰 적용</div>
            <div class="payTwoSalePriceText">0원[할인]<button class="btn btn-primary payTwoCouponBtn" data-bs-toggle="modal" data-bs-target="#exampleModal"><span>쿠폰 선택</span></button></div>
        </div>
        <div class="payDeliveryInfo payTwoborderTop">
            <div class="payTwoTitleText">할인 금액</div>
            <div class="payTwoSalePriceText">-0원</div>
        </div>
    </div><!--end paySaleInfo(할인혜택)-->
    
    <!--결제 수단 선택-->
    <div class="payOptionInfo">
        <div class="payTwoSeationText">결제 수단</div>
        <div>
            <input type="radio" checked>신용카드
        </div>
        <div>
            <!--카드사 선택-->
            <select class="form-select dliveryRequest_select">
                <option>카드 선택</option>
                <option>국민카드</option>
                <option>삼성카드</option>
                <option>롯데카드</option>
                <option>우리카드</option>
                <option>신한카드</option>
                <option>현대카드</option>
                <option>BC카드</option>
                <option>농협카드</option>
                <option>기업카드</option>
                <option>하나카드</option>
            </select>
            <!--할부 선택-->
            <select class="form-select dliveryRequest_select">
                <option>일시불</option>
                <option>1개월 무이자</option>
                <option>2개월 무이자</option>
                <option>3개월</option>
                <option>4개월</option>
                <option>5개월</option>
                <option>6개월</option>
                <option>7개월</option>
                <option>8개월</option>
                <option>9개월</option>
            </select>
        </div>
    </div><!--end payOptionInfo(결제수단선택)-->
    <div>
        <button id="payTwoLastbtn"><span>결제하기</span></button>
    </div>
</div>
</body>
</html>