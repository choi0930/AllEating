<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <% request.setCharacterEncoding("utf-8"); %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>

<title>주문 내역</title>
<link href="${contextPath}/css/myPage_01.css" rel="stylesheet" type="text/css" />


</head>
<body>
  <div class="orderlist">
   <div class = "orderlist-main">
    <div class="orderlistview">
     <div class="orderlistview-2">
     <h3>주문 내역</h3></div>
     <div class="orderlistview-3"><h5 class="orderlisttext">최대 1년 간의 주문 내역을 확인할 수 있습니다.</h5>
     </div>

     <div class="order-period-select">
      <select>
       <option value="1개월">1개월</option>
       <option value="3개월">3개월</option>
       <option value="6개월">6개월</option>
       <option value="1년">1년</option>
      </select>
      </div>
      </div>
      
    <div class="orderlistview-under">
     <div class="orderlist-time">
      2023.08.25 12:23
     </div>
     <div class="orderlist-detail-next">
      <a>
       주문 상세 보기
       <span>
        <button class="triangle-button">
         <img src="${contextPath}/img/image_icon/triangle_black.png" width="25px" height="29px">
        </button>
       </span>
      </a>
     </div>
     </div>
    </div>
    <div class="product-order">
      <div class="product-order-pic">
       <img src="${contextPath }/img/image_food/shinemuscat.jpg" width="150px" height="150px">
      </div>
      <div class="product-order-line">
       <dl class="dlcss" id="dlcss-2">
        <dt class="listcss-6">상품명</dt>
         <dd class="listcss-7">
          <p>저탄소 샤인머스캣</p>
         </dd>
       </dl>
       <dl class="dlcss" id="dlcss-2">
        <dt class="listcss-6">주문 번호</dt>
         <dd class="listcss-7">
          <p>23081412345</p>
         </dd>
       </dl>
       <dl class="dlcss" id="dlcss-2">
        <dt class="listcss-6">결제방법</dt>
         <dd class="listcss-7">
          <p>신용카드</p>
         </dd>
       </dl>
       <dl class="dlcss" id="dlcss-2">
        <dt class="listcss-6">결제 금액</dt>
         <dd class="listcss-7">
          <p>16,990원</p>
         </dd>
       </dl>
      </div>
   
     <div class="orderview">
      <div class="orderview-2">
       <p>배송중</p>
       <div class="order-refund">
        <div class="orderview-3">
         <button type="button" class="btn btn-outline-primary" id="order-refund-button">교환 신청</button>
        </div>
        <div class="orderview-3" >
        <button type="button" class="btn btn-outline-primary"  id="order-refund-button">반품 신청</button>
        </div>
       </div>
      </div>
            
     </div>
    
    </div>
</div>
</body>
</html>