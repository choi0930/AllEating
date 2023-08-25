<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%request.setCharacterEncoding("utf-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>pay.jsp</title>
    <link
      href="${contextPath}/css/pay_02.css"
      rel="stylesheet"
      type="text/css"
    />
    <script>
     /*  function fn_deliveryMsgSelect(){
        
      } */
     
      $(document).ready(function() {
     	  // select 요소의 변경 이벤트 감지
     	  $('#deliveryRequestSelect').on('change', function() {
     	    var deliveryRequestSelect = $('#deliveryRequestSelect').val(); //배송 요청 사항 select
     	
     	    $('#deliveryRequest').val(deliveryRequestSelect); //배송 요청사항 input 에 적용
     	  });
     	  
    /*  	  $('#deliveryRequest').prop('readonly', false); */
     	});
      
    /*   $(document).ready(function() {
      if ($("#deliveryRequestSelect").val() === "직접입력") {
    	  $("#deliveryRequest").prop(readonly, false);
    	} else {
    	  $("#deliveryRequest").prop(readonly, true);
    	}
      });
     */
     
     const optionSelect = document.getElementById('deliveryRequestSelect');
     const inputField = document.getElementById('deliveryRequest');

     optionSelect.addEventListener('change', function() {
       if (optionSelect.value === '직접입력') {
         inputField.readOnly = false;
       } else {
         inputField.readOnly = true;
       }
     });
    	
     /*  $(document).ready(function() {
    	    var deliveryReadOnly = true;

    	    if (deliveryReadOnly) {
    	        if ($('#deliveryRequestSelect').val() === 'self') {
    	            $('#deliveryRequest').prop('readonly', false);
    	        }
    	    } else {
    	        if ($('#deliveryRequestSelect').val() !== 'self') {
    	            $('#deliveryRequest').prop('readonly', true);
    	        }
    	    }
    	}); */
    	
      
    </script>
  </head>
  <body>
    <!-- Modal -->
    <div
      class="modal fade"
      id="exampleModal"
      tabindex="-1"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">쿠폰 선택</h5>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
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
                <c:choose>
                  <c:when test="${empty couponList}">
                      <tr>
                        <td colspan="3"> 쿠폰 내역이 없습니다.</td>
                      </tr>
                  </c:when>
                  <c:otherwise>
                    <c:forEach var="coupon" items="${couponList}">
                       <tr>
                         <td>
                           <input type="checkbox" />
                         </td>
                          <td>회원가입 환영 쿠폰</td>
                         <td>2,000원</td>
                       </tr>
                     </c:forEach>
                  </c:otherwise>
                </c:choose>
              </tbody>
            </table>
          </div>
          <div class="modal-footer">
            <button
              type="button"
              class="btn btn-secondary"
              data-bs-dismiss="modal"
            >
              닫기
            </button>
            <button type="button" class="btn btn-primary">쿠폰 선택</button>
          </div>
        </div>
      </div>
    </div>
    <div class="payTwoSeationText">결제하기</div>
    <div class="payTwoPage">
      <!--배송지 정보-->
      <div class="payTwoDeliberyInfoMain">
        <div class="dvtext01">
          <ul>
            <h5>예약 배송 일자 및 시간 선택</h5>
          </ul>
        </div>
        <table class="dvtb">
          <tr>
            <td></td>
            <td><strong>${dateInfo.endDate}</strong></td>
            <td><strong>8월/10일</strong></td>
            <td><strong>8월/11일</strong></td>
            <td><strong>${dateInfo.beginDate}</strong></td>
          </tr>
          <tr>
            <td>10:00~16:00</td>
            <td rowspan="3">예약 마감</td>
            <td><input type="radio" name="checkBox" />예약가능</td>
            <td><input type="radio" name="checkBox" />예약가능</td>
            <td><input type="radio" name="checkBox" />예약가능</td>
          </tr>
          <tr>
            <td>15:00~19:00</td>
            <td><input type="radio" name="checkBox" />예약가능</td>
            <td><input type="radio" name="checkBox" />예약가능</td>
            <td><input type="radio" name="checkBox" />예약가능</td>
          </tr>
          <tr>
            <td>17:00~21:00</td>
            <td><input type="radio" name="checkBox" />예약가능</td>
            <td><input type="radio" name="checkBox" />예약가능</td>
            <td><input type="radio" name="checkBox" />예약가능</td>
          </tr>
        </table>
        <div class="payDeliveryInfo">
          <!--수령자 배송지및 이름 전화번호 처음에는 기본배송지 회원가입시 적었던 배송지 표시 배송지 변경시에 변경가능-->
          <div class="payTwoTitleText"><span>배송지 정보</span></div>
          <div class="payTwoText">
            ${memberVO.name} ${memberVO.hp1}-${memberVO.hp2}-${memberVO.hp3}   &nbsp;&nbsp;<br>
            ${memberVO.zipcode}&nbsp;${memberVO.address}&nbsp;${memberVO.address_detail}
           
          </div>
        </div>
        <div class="deliveryAddressText">
          <div>
            <a href="#">배송지변경</a>
            <img
              src="${contextPath}/img/side/arrow-right-gray.png"
              width="14px"
            />
          </div>
        </div>
       
        <div class="payDeliveryInfo payTwoborderTop">
          <span class="payTwoTitleText">배송 요청 사항</span>

          <input
            type="text" class="form-control payTwoInput" name="delivery_request"id="deliveryRequest"  />

          <select
            class="form-select dliveryRequest_select"
            id="deliveryRequestSelect"
            onchange="fn_deliveryMsgSelect()"
          >
            <option value="직접입력">직접입력</option>
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
          <div id="payTwoOrderName">${memberVO.name}</div>
        </div>
        <div class="payDeliveryInfo">
          <div class="payTwoTitleText">휴대폰</div>
          <div class="payTwoOrderInfo">
            ${memberVO.hp1}-${memberVO.hp2}-${memberVO.hp3}
          </div>
        </div>
    <!-- <div class="payDeliveryInfo">
          <div class="payTwoTitleText">이메일</div>
          <div class="payTwoOrderInfo">${order.email}</div>
        </div>-->
      </div>
      <!--end payDeliveryInfoMain(배송지정보)-->

      <!--주문하는 상품 정보-->
      <div class="payProductInfo">
       
        <div class="payTwoSeationText">주문 상품 정보</div>
        <div class="payTwoTitleText payTwoQty">주문 상품: ${allEating.size()}개</div>
        <c:forEach var="item" items="${allEating}">
        <div class="payDeliveryInfo payTwoProduct">
          <img
            src="${contextPath}/download.do?fileName=${item.fileName}&productId=${item.productId}&cateCode=${item.cateCode}"
            alt="${item.fileName}"
            width="100px"
          >

          <div>
            ${item.productName}
          </div>
          <div>
            ${item.productPrice * item.productQty}<br />
            수량 ${item.productQty}개
          </div>
        </div>
        </c:forEach>
      </div>
      <!--end payProductInfo(주문하는 상품)-->

      <!--할인혜택 정보-->
      <div class="paySaleInfo">
        <div class="payTwoSeationText">
          <span>할인 혜택</span>
        </div>
       
        <div class="payDeliveryInfo payTwoborderTop">
          <div class="payTwoTitleText">현재 보유중인 적립금</div>
          <div class="payTwoPoint">${userPointVO.userPoint}원</div>
        </div>
        <div class="payDeliveryInfo">
          <div class="payTwoTitleText">사용할 적립금</div>
          <div class="payTwoUsePoint">
            전체사용 <input type="checkbox" class="form-check-input" /><input
              type="text"
              class="form-control"
              id="payUsePointInput"
            />원
          </div>
          <button class="btn btn-primary payTwoCouponBtn">사용</button>
        </div>
        <div class="payDeliveryInfo">
          <div class="payTwoTitleText">쿠폰 적용</div>
          <div class="payTwoSalePriceText">
            0원[할인]<button
              class="btn btn-primary payTwoCouponBtn"
              data-bs-toggle="modal"
              data-bs-target="#exampleModal"
            >
              <span>쿠폰 선택</span>
            </button>
          </div>
        </div>
        <div class="payDeliveryInfo payTwoborderTop">
          
          <table>
            <tbody>
            <tr>
              <td>할인 금액</td>
              <td>-0원</td>
            </tr>
            <tr>
              <td>주문 금액</td>
              <td><span style="font-size: 20px; font-weight: bold">${totalPrice+deliveryPrice}원</span>   (상품가 ${totalPrice}원+배송비 ${deliveryPrice}원)</td>
            </tr>
            </tbody>
          </table>
          
        </div>
      </div>
      <!--end paySaleInfo(할인혜택)-->

      <!--결제 수단 선택-->
      <div class="payOptionInfo">
        <div class="payTwoSeationText">결제 수단</div>
        <div><input type="radio" checked />신용카드</div>
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
      </div>
      <!--end payOptionInfo(결제수단선택)-->
      <div>
        <button id="payTwoLastbtn"><span>결제하기</span></button>
      </div>
     
     
    </div>
  </body>
</html>
