<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<% request.setCharacterEncoding("utf-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<link href="${contextPath}/css/dvinfo_01.css" rel="stylesheet" type="text/css" />
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송 정보</title>
<script>
  function fn_goPay_02(){
    location.href="/order/pay_02.do";
  }
</script>
</head>

<body>
<div class="dvinfo">
 <div class="dvtitle"><h4>배송 정보</h4></div>
  <div class="dvtext01">
   <ul><h5>예약 배송 일자 및 시간 선택</h5></ul>
    <li>상품 준비에 소요되는 시간이 있어 아래 상품은 일부 시간대/날짜에만 배송 가능합니다.<br>
        다른 시간대/날짜에 받으시려면 해당 상품을 제외하고 주문해 주세요.</div>       
   <div class="dvtext02"><h5>예약 배송 날짜</h5></div>
    <div class="dvtext03">     
     <table class="dvtb">
      <tr>
        <td></td>
        <td><strong>8월/9일</strong></td>
        <td><strong>8월/10일</strong></td>
        <td><strong>8월/11일</strong></td>
        <td><strong>8월/12일</strong></td>
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
    </div>
 <div class="dvtext04"><h3><strong>예약 배송 상품</strong></h3></div> 
 
  <div class="dvcart">
          <div class="cart-info">
            <img
              class="cart-image"
              src="${contextPath}/img/image_food/shinemuscat.JPG"
              alt="Image 1"
            />
            <div class="cart-text03">
              <h5>저탄소<br />샤인머스켓</h5>
            </div>
            <div class="choice-8">
              <div class="choice-9">
                <button
                  type="button"
                  aria-label="수량내리기"
                  disabled
                  class="choicebutton-down"
                ></button>
                <div class="choice-10">1</div>
                <button
                  type="button"
                  aria-label="수량올리기"
                  class="choicebutton-up"
                ></button>
              </div>
              <div class="choice-11">
                <span class="choice-12">13,990</span
                ><span class="choice-12">원</span>
              </div>
            </div>
          </div>
          <div class="cart-cost">
            <h4>13,990원 + 3,000원 = 16,990원</h4>
          </div>
     </div>
   <div class="dvbtbox">      
   <button type="button" class="pay_01LastBtn" onclick="fn_goPay_02()">
            주문하기
   </button>
   </div>       
</div>
</body>
</html>