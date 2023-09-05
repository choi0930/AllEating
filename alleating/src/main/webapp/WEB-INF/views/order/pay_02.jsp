<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%request.setCharacterEncoding("utf-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<c:set var="deliveryStatus" value="${userInfo.deliveryStatus}" />
<c:set var="deliveryAddressVO" value="${userInfo.dliveryAddressVO}" />
<c:set var="deliveryPrice" value="${userInfo.deliveryPrice}" />
<c:set var="memberVO" value="${userInfo.memberVO}" />
<c:set var="userPointVO" value="${userInfo.userPointVO}" />
<c:set var="couponList" value="${userInfo.couponList}" />
<c:set var="totalPrice" value="${userInfo.totalPrice}" />
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
     	
     	    $('#deliveryRequest').attr("value", deliveryRequestSelect); //배송 요청사항 input 에 적용
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
      function fn_pay(deliveryStatus){

        if(deliveryStatus == 'reserve'){
          var radioCheck = $('input[name=radioBox]:checked').val();
          var date = [];
          date = radioCheck.split(",");

          var reserveDate = date[0];
          var reserveTime = date[1];
        }

        var userOrder;
        var receiverName = $('input[name=receiverName]').val();
        var receiverHp = $('input[name=receiverHp]').val();
        var zipcode = $('input[name=zipcode]').val();
        var address = $('#address').text();
        var addressDetail = $('input[name=addressDetail]').val();
        var deliveryRequest = $('#deliveryRequest').val();
        var orderName = $('#orderName').text();
        var orderHp = $('#orderHp').text();
        var userPoint = $('input[name=userPoint]').val();
        var couponId = $('#couponId').val();
        var totalPrice = $('input[name=totalPrice]').val();
        var card_com_name = $('select[name=card_com_name]').val();
        var card_pay_month = $('select[name=card_pay_month]').val();
        var productId = $('input[name=productId]').val();
        var productName = $('input[name=productName]').val();
        var cateCode = $('input[name=cateCode]').val();
        var fileName = $('input[name=fileName]').val();
        address = address.trim();
       
        userOrder={
          reserveDate: reserveDate,
          reserveTime: reserveTime,
          receiverName: receiverName,
          receiverHp: receiverHp,
          zipcode: zipcode,
          address: address,
          addressDetail: addressDetail,
          delivery_request: deliveryRequest,
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
    
      /*팝업창*/
      function fn_deliveryPopUp(){ //배송지 주소 변경 팝업창
          let popUrl = "/order/deliveryChangePopup.do";
          let popOption = "width = 800px, height = 550px, top = 300px, left = 300px, scrollbars=yes";
        window.open(popUrl, "배송지 변경", popOption);
      }

      function fn_selectCoupon(){// 쿠폰 적용 팝업창
        let popUrl = "/coupon/couponPopUp.do";
          let popOption = "width = 800px, height = 550px, top = 300px, left = 300px, scrollbars=yes";
        window.open(popUrl, "쿠폰 적용", popOption);
      }
/*-------------------------------------------------------------------------------------------------------------*/

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
    html += '<td id="addressText">'+resArr[1]+'<br> <span id="address">'+resArr[2]+'</span>'+resArr[3]+'</td>';
    html += '</tr>';
    html += '<tr>';  
    html += '<td class="css0930">연락처</td>';
    html += '<td>'+resArr[4];
    html +=  '<input type="hidden" name="receiverName" value="'+resArr[0]+'" >';
    html += '<input type="hidden" name="receiverHp" value="'+resArr[4]+'" >';
    html += '<input type="hidden" name="zipcode" value="'+resArr[1]+'" >'
    html += '<input type="hidden" name="addressDetail" value="'+resArr[3]+'">'+'</td>';
    html += '</tr>';

  $('#deliveryTable').append(html);
}
/*---------------------------------------------------------------------------------------------------------------*/

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
            $('#h_couponDiscount_'+productId).attr("value",discountPrice);
            $('#couponId').attr("value",resCouponId);
            $('#couponBtn').attr("disabled", true);
        },
        error: function (error) {
            console.error("오류 발생:", error);
        }
}).done(function(){
  discountInfo();
});
}
/*--------------------------------쿠폰적용 끝-------------------------------------*/

/* 포인트 전체사용 체크시 */
$(function(){
        $('#useAllPoint').click(function(){
          if($('#useAllPoint').prop("checked")){
            var allPoint = $('#originalUserPoint').val();
            $('#payUsePointInput').attr("value","");
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

  var originalPoint = $('#originalUserPoint').val();
  if(Number(point)>Number(originalPoint)){
    alert('보유하신 포인트보다 더많은 포인트를 입력하셨습니다. \n다시입력해 주세요');
    return false;
  }

  var finalPoint = Number(originalPoint) - Number(point);

  var _finalPoint = finalPoint.toString()
                          .replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");

  $('#pointuse').attr("value", point);
  $('#payPoint').text(_finalPoint);
  console.log(_finalPoint);
  discountInfo();
}
/*-------------------------------------------------------------------------------*/

/* 쿠폰 포인트로 할인되는 금액계산 */
function discountInfo(){
  var discount = [];
  var point = $('#pointuse').val();
  $('.h_couponDiscount').each(function(index){
    discount.push($(this).val());
  });
  var couponDiscount = 0;
  for(var i in discount){
    if(discount[i] >0){
      couponDiscount = discount[i];
      break;
    }
  }
 var totalDiscount = Number(couponDiscount) + Number(point);
 console.log("포인트 할인금액: "+point);
 console.log("쿠폰 할인금액: "+couponDiscount);
 console.log("총할인금액: "+totalDiscount);
  var _totalDiscount = totalDiscount.toString()
                          .replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");

  $('#discountPriceText').text(_totalDiscount);
  $('#discountPrice').attr("value", totalDiscount);
  fn_totalPrice();
}
/*----------------------------------------------------------------------*/

/* 할인 적용시 값 계산 */
function fn_totalPrice(){
  
  var totalProductPrice = $('#h_totalProductPrice ').val();
  var deliveryPrice = $('#h_deliveryPrice').val();
  var discountPrice = $('#discountPrice ').val();
  var finalPrice;
  var finalTotalProductPrice;

  finalTotalProductPrice = Number(totalProductPrice) - Number(discountPrice);
  finalPrice = Number(finalTotalProductPrice) + Number(deliveryPrice);

  $('#finalTotalPrice').attr("value",finalPrice);
  $('#totalPrices').text(finalTotalProductPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));
  $('#totalPrice').text(finalPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));
}
/*-------------------------------------------------------------------------------------------------------------------*/
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
      .dliveryRequest_select{
        width: 25%;
        display: inline;
      }
      .reserveChoice{
        width: 820px;
        margin: 0 auto;
      }
    </style>
  </head>
  <body>
 
    <div class="payTwoSeationText">결제하기</div>
    <div class="payTwoPage">
      <!--배송지 정보-->
      <div class="payTwoDeliberyInfoMain">
        <div class="reserveChoice">
        <c:if test="${deliveryStatus eq 'reserve'}">
          <c:set var="dateInfo" value="${userInfo.dateInfo}" />
          <div class="dvtext01">
            <ul>
              <h5>예약 배송 일자 및 시간 선택</h5>
            </ul>
          </div>
          <table class="dvtb">
            <tr>
              <td></td>
              <c:forEach var="list" items="${dateInfo}">
                <td><strong>${list}</strong></td> 
              </c:forEach>
            </tr>
            <tr>
              <td>10:00~16:00</td>
              <td rowspan="3">예약 마감</td>
              <c:forEach var="i" begin="1" end="4">
                <td><input type="radio" name="radioBox" value="${dateInfo[i]},10:00~16:00"/>예약가능</td>
              </c:forEach>
            </tr>
            <tr>
              <td>15:00~19:00</td>
              <c:forEach var="i" begin="1" end="4">
                <td><input type="radio" name="radioBox" value="${dateInfo[i]},15:00~19:00"/>예약가능</td>
              </c:forEach>
            </tr>
            <tr>
              <td>17:00~21:00</td>
              <c:forEach var="i" begin="1" end="4">
                <td><input type="radio" name="radioBox" value="${dateInfo[i]},17:00~21:00"/>예약가능</td>
              </c:forEach>
            </tr>
          </table>
        </c:if>
      </div>
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
                    <span id="address">
                    ${deliveryAddressVO.address}
                    <c:if test="${not empty deliveryAddressVO.address2}">
                      <span id="address2">${deliveryAddressVO.address2}</span>
                    </c:if>
                    </span>
                    ${deliveryAddressVO.address_detail}
                  </td>
                </tr>
                <tr>
                  <td class="css0930">연락처</td>
                  <td>
                    ${deliveryAddressVO.receiver_hp1}-${deliveryAddressVO.receiver_hp2}-${deliveryAddressVO.receiver_hp3}
                    <input type="hidden" name="receiverName" value="${deliveryAddressVO.receiver_name}" />
                    <input type="hidden" name="receiverHp" value="${deliveryAddressVO.receiver_hp1}-${deliveryAddressVO.receiver_hp2}-${deliveryAddressVO.receiver_hp3}" />
                    <input type="hidden" name="zipcode" value="${deliveryAddressVO.zipcode}" />
                    <input type="hidden" name="addressDetail" value="${deliveryAddressVO.address_detail}" />
                  </td>
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
            type="text" class="form-control payTwoInput" name="delivery_request" id="deliveryRequest"  />

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
            <input type="hidden"  class="h_couponDiscount" id="h_couponDiscount_${item.productId}"/>
           <br />
            수량 ${item.productQty}개
          </div>
        </div>
        </c:forEach>
        <!--대표 상품 저장-->
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
            <span id="payPoint">
              <fmt:formatNumber value="${userPointVO.userPoint}" type="number" />
            </span>원
          </div>
          <input type="hidden" value="${userPointVO.userPoint}" id="originalUserPoint">
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
            <input type="hidden" name="userPoint" value="" id="pointuse"/>
          </div>
          <button class="btn btn-primary payTwoCouponBtn" onclick="fn_usePoint()">사용</button>
        </div>
        <div class="payDeliveryInfo">
          <div class="payTwoTitleText">쿠폰 적용</div>
          <div class="payTwoSalePriceText">
            <input type="hidden" id="couponId" value=""/>
            -<span id="couponDiscount">0</span>원[할인]
          
            <button class="btn btn-primary payTwoCouponBtn" id="couponBtn" onclick="fn_selectCoupon()">
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
              <td>
                  <span style="font-size: 20px; font-weight: bold" id="totalPrice">
                    <fmt:formatNumber value="${totalPrice+deliveryPrice}" type="number" /> 
                  </span> 원   
              (상품가 <span id="totalPrices"><fmt:formatNumber value="${totalPrice}" type="number" /></span>원+배송비 <span id="deliveryPrice"><fmt:formatNumber value="${deliveryPrice}" type="number" /></span>원)</td>
              <input type="hidden" id="h_totalProductPrice" value="${totalPrice}" />
              <input type="hidden" id="h_deliveryPrice" value="${deliveryPrice}" />
              <input type="hidden" name="totalPrice" id="finalTotalPrice" value="${totalPrice+deliveryPrice}" />
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
        <button id="payTwoLastbtn" onclick="fn_pay('${deliveryStatus}')"><span>결제하기</span></button>
      </div>
     
     
    </div>
  </body>
</html>
