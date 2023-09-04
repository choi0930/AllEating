<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
/*
     optionSelect.addEventListener('change', function() {
       if (optionSelect.value === '직접입력') {
         inputField.readOnly = false;
       } else {
         inputField.readOnly = true;
       }
     });
  */  	
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
    	/* 주문페이지로 가기 */
      function fn_pay(){
        var userOrder;
        var receiverName = $('#receiverName').text();
        var receiverHp = $('#receiverHp').text();
        var zipcode = $('#zipcode').text();
        var address = $('#address').text();
        var addressDetail = $('#addressDetail').text();
        var deliveryRequest = $('#deliveryRequest').val();
        var orderName = $('#orderName').text();
        var orderHp = $('#orderHp').text();
        var userPoint = $('input[name=userPoint]').val();
        var couponId = $('input[name=couponId]').val();
        var totalPrice = $('input[name=totalPrice]').val();
        var card_com_name = $('select[name=card_com_name]').val();
        var card_pay_month = $('select[name=card_pay_month]').val();
        var productId = $('input[name=productId]').val();
        var productName = $('input[name=productName]').val();
        var cateCode = $('input[name=cateCode]').val();
        var fileName = $('input[name=fileName]').val();

        console.log('받는사람: '+receiverName);
        console.log('받는사람 전화: '+receiverHp);
        console.log('우편번호: '+zipcode);
        console.log('주소: '+address);
        console.log('상세주소: '+addressDetail);
        console.log('배송요청사항: '+deliveryRequest);
        console.log('주문자: '+orderName);
        console.log('주문자 번호: '+orderHp);
        console.log('사용한 포인트: '+userPoint);
        console.log('총결제가격: '+totalPrice);
        console.log('카드사: '+card_com_name);
        console.log('할부: '+card_pay_month);
        console.log('대표상품id: '+productId);
        console.log('대표상품이름: '+productName);
        console.log('대표상품카테고리코드: '+cateCode);
        console.log('대표상품이미지 파일 이름: '+fileName);

        userOrder={
          receiverName: receiverName,
          receiverHp: receiverHp,
          zipcode: zipcode,
          address: address,
          addressDetail: addressDetail,
          deliveryRequest: deliveryRequest,
          orderName: orderName,
          orderHp: orderHp,
          userPoint: userPoint,
          couponId: couponId,
          totalPrice: totalPrice,
          card_com_name: card_com_name,
          card_pay_month: card_pay_month,
          productId: productId,
          productName: productName,
          cateCode: cateCode,
          fileName: fileName
        }
        $.ajax({
        type: "POST",
        url: "${contextPath}/order/pay.do",
        data: JSON.stringify(userOrder),
        contentType: "application/json; charset=UTF-8",

        success: function (response) {
            console.log("서버 응답 성공");
          location.href="/order/pay_complete.do?orderId="+response;
        },
        error: function (error) {
            console.error("오류 발생:", error);
        }
    });
      }
      /*----------------------주문페이지로 가기 끝--------------------*/
      function fn_deliveryPopUp(){
          let popUrl = "/order/deliveryChangePopup.do";
          let popOption = "width = 800px, height = 550px, top = 300px, left = 300px, scrollbars=yes";
        window.open(popUrl, "배송지 변경", popOption);
      }
      function fn_selectCoupon(){
        let popUrl = "/coupon/couponPopUp.do";
          let popOption = "width = 800px, height = 550px, top = 300px, left = 300px, scrollbars=yes";
        window.open(popUrl, "쿠폰 적용", popOption);
      }
/* 배송지 변경 팝업창에서 가져온 정보 */
  function setResList(resArr){

    var html = "";
    
    $('#deliveryTable > tbody').empty();
    
    html += '<tr>';  
    html += '<td class="css0930">받으실 분</td>';
    html += '<td>'+resArr[0]+'</td>';
    html += '</tr>';
    html += '<tr>';  
    html += '<td class="css0930">배송주소</td>';
    html += '<td id="addressText">'+resArr[1]+'</td>';
    html += '</tr>';
    html += '<tr>';  
    html += '<td class="css0930">연락처</td>';
    html += '<td>'+resArr[2]+'</td>';
    html += '</tr>';

  $('#deliveryTable').append(html);
}

/* 쿠폰 팝업창에서 가져온 정보 */
function setCoupon(useCoupon){
var discountPrice;
var productId = useCoupon.productId;
var productPrice = $('#originalPrice_'+productId).val();
useCoupon.productPrice = productPrice;

console.log(useCoupon);

$.ajax({
        type: "POST",
        async: false,
        url: "${contextPath}/order/couponApply.do",
        data: JSON.stringify(useCoupon),
        contentType: "application/json; charset=UTF-8",

        success: function (response) {
            alert('선택하신 쿠폰이 적용되었습니다. ');

            var resCouponId = response.couponId;
            var resProductId = response.productId;
            var resProductPrice = response.productPrice;
            var couponDiscountRate = response.couponDiscountRate;
            var originalPrice = productPrice;

            discountPrice = originalPrice - resProductPrice;
            console.log("discount: "+discountPrice);
            let _originalPrice = originalPrice
                          .toString()
                          .replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
            let _prdouctPrice = resProductPrice  .toString()
                          .replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
            let _discountPrice = discountPrice.toString()
                          .replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
            var html = '<strong class="redText"> 쿠폰 적용('+couponDiscountRate+'%) </strong> </br>';
            html += '<sapn>'+_prdouctPrice+'</span> </br>';
            html += '<span class="originalPriceText">'+_originalPrice+ '</span>';
             
            $('#productPrice_'+productId).attr("value",resProductPrice);
            $('#priceTextArea_'+productId).empty();            
            $('#priceTextArea_'+productId).html(html); 
            $('#couponDiscount').text(_discountPrice);           

        },
        error: function (error) {
            console.error("오류 발생:", error);
        }
}).done(function(){
  discountInfo('coupon',discountPrice);
});
}
/*--------------------------------쿠폰적용 끝-------------------------------------*/

/* 포인트 전체사용 체크시 */
$(function(){
        $('#useAllPoint').click(function(){
          if($('#useAllPoint').prop("checked")){
            var allPoint = $('#originalUserPoint').val();
            $('#payUsePointInput').attr("value",allPoint);
          }else{
            $('#payUsePointInput').attr("value","");
          }
        });
      });
/*----------------------------------------------------------*/

/* 포인트 사용 */
function fn_usePoint(){
  var point = $('#payUsePointInput').val();
  $('#pointuse').attr("value", point);

  discountInfo('point',point);
}

function discountInfo(status, discount){
  console.log(discount);
 var _couponDiscount;
 var coupondiscountText;

 var _pointDiscount;
 var pointDiscountText;

 var totalDiscount;
  if(status == 'coupon'){
    const couponDiscount = discount;  
    _couponDiscount = couponDiscount;
    
  }else{
    const  pointDiscount = discount;
    _pointDiscount = pointDiscount;
    
  }
  if(_pointDiscount == null){
    totalDiscount = _couponDiscount;
  }else if(_couponDiscount == null){
    totalDiscount = _pointDiscount;
  }else if(_pointDiscount !=null && _couponDiscount !=null){
    totalDiscount = _couponDiscount+_pointDiscount;
  }
  totalDiscountText = totalDiscount
                          .toString()
                          .replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
    
  var html = totalDiscountText;
  $('#discountPriceText').text(html);
}
    </script>
    <style>
      #addressText{
        font-size: 12px;
      }
      #payTwoText  table{
        border:0;
      }

      #deliveryTable tr td{
        text-align: left;
        border-left: none;
        border-right: none;
        border-top:  none;
        border-bottom: 1px solid #e1ddde;
      }
      .css0930{
        width: 120px;
      }
      .originalPriceText{
        text-decoration: line-through;
        color: #e1ddde;
      }
    </style>
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
            <td><strong>8월/25일</strong></td>
            <td><strong>8월/26일</strong></td>
            <td><strong>8월/27일</strong></td>
            <td><strong>8월/28일</strong></td>
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
         <!--수령자 배송지및 이름 전화번호 처음에는 기본배송지 회원가입시 적었던 배송지 표시 배송지 변경시에 변경가능-->
         
        <div class="payDeliveryInfo">
         
          <div class="payTwoTitleText"><span>배송지 정보</span></div>
          <div class="payTwoText">
            <table id="deliveryTable">
              <tbody id="deliveryAddressBody">
                <tr>
                  <td class="css0930">받으실 분</td>
                  <td>${deliveryAddressVO.receiver_name}</td>
                </tr>
                <tr>
                  <td class="css0930">배송주소</td>
                  <td id="addressText">
                    ${deliveryAddressVO.zipcode}<br>
                    ${deliveryAddressVO.address}
                    <c:if test="${not empty deliveryAddressVO.address2}">
                      <span id="address2">${deliveryAddressVO.address2}</span>
                    </c:if>
                    ${deliveryAddressVO.address_detail}
                  </td>
                </tr>
                <tr>
                  <td class="css0930">연락처</td>
                  <td>${deliveryAddressVO.receiver_hp1}-${deliveryAddressVO.receiver_hp2}-${deliveryAddressVO.receiver_hp3}</td>
                </tr>
              </tbody>
            </table>
           <!-- <span id="receiverName">${deliveryAddressVO.receiver_name}</span> <span id="receiverHp">${deliveryAddressVO.receiver_hp1}-${deliveryAddressVO.receiver_hp2}-${deliveryAddressVO.receiver_hp3}</span>   &nbsp;&nbsp;<br>
            <span id="zipcode">${deliveryAddressVO.zipcode}</span>&nbsp;
            <div id="address">
              ${deliveryAddressVO.address}
              <c:if test="${not empty deliveryAddressVO.address2}">
                <span id="address2">${deliveryAddressVO.address2}</span>
              </c:if>
            </div>
            <div id="addressDetail">${deliveryAddressVO.address_detail}</div>-->
          </div>
        </div>
        <div class="deliveryAddressText">
          <div>
            <a href="javascript:fn_deliveryPopUp()">배송지변경</a>
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
            class="form-select deliveryRequest_select"
            id="deliveryRequestSelect"
            onchange="fn_deliveryMsgSelect()"
          >
            <option selected value="직접입력">직접입력</option>
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
          <div id="payTwoOrderName"><span id="orderName">${memberVO.name}</span></div>
        </div>
        <div class="payDeliveryInfo">
          <div class="payTwoTitleText">휴대폰</div>
          <div class="payTwoOrderInfo" id="orderHp">${memberVO.hp1}-${memberVO.hp2}-${memberVO.hp3}</div>
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
            [${item.productBrand}]<br>
            ${item.productName}
          </div>
          <div>
            <span id="priceTextArea_${item.productId}"><fmt:formatNumber value="${item.productPrice * item.productQty}" type="number" /></span>
            <input type="hidden" value="${item.productPrice * item.productQty}" name="oneProductPrice" id="productPrice_${item.productId}"/> 
            <input type="hidden" value="${item.productPrice * item.productQty}" id="originalPrice_${item.productId}" />
           <br />
            수량 ${item.productQty}개
          </div>
        </div>
        </c:forEach>
        <input type="hidden" name="productId" value="${allEating[0].productId}" />
        <input type="hidden" name="productName" value="${allEating[0].productName}" />
        <input type="hidden" name="fileName" value="${allEating[0].fileName}" />
        <input type="hidden" name="cateCode" value="${allEating[0].cateCode}" />
      </div>
      <!--end payProductInfo(주문하는 상품)-->

      <!--할인혜택 정보-->
      <div class="paySaleInfo">
        <div class="payTwoSeationText">
          <span>할인 혜택</span>
        </div>
       
        <div class="payDeliveryInfo payTwoborderTop">
          <div class="payTwoTitleText">현재 보유중인 적립금</div>
          <div class="payTwoPoint">
            <fmt:formatNumber value="${userPointVO.userPoint}" type="number" />원
            <input type="hidden" value="" id="userPoint1">
            <input type="hidden" value="${userPointVO.userPoint}" id="originalUserPoint">
          </div>
          <input type="hidden" name="userPoint" value="" id="pointuse"/>
        </div>
        <div class="payDeliveryInfo">
          <div class="payTwoTitleText">사용할 적립금</div>
          <div class="payTwoUsePoint">
            전체사용 <input type="checkbox" id="useAllPoint" class="form-check-input"/>
            <input
              type="text"
              class="form-control"
              id="payUsePointInput"  
            />원
          </div>
          <button class="btn btn-primary payTwoCouponBtn" onclick="fn_usePoint()">사용</button>
        </div>
        <div class="payDeliveryInfo">
          <div class="payTwoTitleText">쿠폰 적용</div>
          <div class="payTwoSalePriceText">
            <input type="hidden" id="couponId" value=""/>
            -<span id="couponDiscount">0</span>원[할인]
          
            <button onclick="fn_selectCoupon()">
              쿠폰 선택
            </button>
          </div>
        </div>
        <div>
          
        </div>
        <div class="payDeliveryInfo payTwoborderTop">
          
          <table>
            <tbody>
            <tr>
              <td>할인 금액</td>
              <td>
                -<span id="discountPriceText">0</span>원
                <input type="hidden" id="discountPrice" />
              </td>
            </tr>
            <tr>
              <td>주문 금액</td>
              <td><span style="font-size: 20px; font-weight: bold" id="totalPrice">${totalPrice+deliveryPrice}원</span>   (상품가 ${totalPrice}원+배송비 ${deliveryPrice}원)</td>
              <input type="hidden" name="totalPrice" value="${totalPrice+deliveryPrice}" />
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
          <select class="form-select dliveryRequest_select" name="card_com_name">
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
          <select class="form-select dliveryRequest_select" name="card_pay_month">
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
        <button id="payTwoLastbtn" onclick="fn_pay()"><span>결제하기</span></button>
      </div>
     
     
    </div>
  </body>
</html>
