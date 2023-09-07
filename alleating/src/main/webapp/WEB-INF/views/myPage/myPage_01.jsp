<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <% request.setCharacterEncoding("utf-8"); %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>

 


<!DOCTYPE html>
<html>
<head>

  <style>

  .noOrderHistoryText{
    font-size: 20px;
    font-weight: bold;
    color: #000060;
    text-align: center;
    margin: 40px;
  }
      </style>


  <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
$(function(){
  $('.datepicker').datepicker({dateFormat:'yy-mm-dd'});

});

//날짜 포맷("yyyy-MM-dd")형식으로 반환
dateFormatter = function(newDay, today){
  let year = newDay.getFullYear()
  let month = newDay.getMonth()+1
  let date = newDay.getDate()
//기존 날짜와 새로운 날짜가 다를 경우
  if(today){
    let todayDate = today.getDate()

    if(date != todayDate) {
      if(month == 0) year -=1
      month = (month +11) % 12
      date = new Date(year, month, 0).getDate() // 해당 달의 마지막 날짜를 반환
    }
  }
  month = ("0" + month).slice(-2)
  date = ("0" + date).slice(-2)

  return year + "-" + month + "-" + date
}

document.getElementByName("filterDate").forEach(e=>{
  e.addEventListener('click', function(){
    let endDate = new Date ($("endDate").val()) 
    let newDate = new Date($("endDate").val()) 

    switch(this.value){
      case '1':
        console.log("1개월")
        newDate.setMonth(newDate.getMonth()-1)
        newDate = dateFormatter(newDate, endDate)
        break;
        case '2':
        console.log("3개월")
        newDate.setMonth(newDate.getMonth()-3)
        newDate = dateFormatter(newDate, endDate)
        break;
        case '3':
        console.log("6개월")
        newDate.setMonth(newDate.getMonth()-6)
        newDate = dateFormatter(newDate, endDate)
        break;
        case '4':
        console.log("1년")
        newDate.setFullYear(newDate.getFullYear()-1)
        newDate = dateFormatter(newDate, endDate)
        break;
    }
$("startDate").val(newDate)

  })
});

  </script>

<title>주문 내역</title>
<link href="${contextPath}/css/myPage_01.css" rel="stylesheet" type="text/css" />


</head>
<body>

  <div class="orderlist">
   <div class = "orderlist-main">
    <div class="orderlistview">
     <div class="orderlistview-2">
     <h3>주문 내역</h3></div>
     <!-- <div class="orderlistview-3"><h5 class="orderlisttext">최대 1년 간의 주문 내역을 확인할 수 있습니다.</h5> -->
     </div>

     <!-- <div class="order-period-select">
    시작 날짜:  <input class="datepicker" id="startDate"/>
     <br/><br/>
    종료 날짜: <input class="datepicker" id="endDate"/>
    <br/><br/>
    <div>
      <button name="filterDate" value="1">1개월</button>
      <button name="filterDate" value="2">3개월</button>
      <button name="filterDate" value="3">6개월</button>
      <button name="filterDate" value="4">1년</button>
    </div>
      </div> -->
      </div>


      
    <div class="orderlistview-under">
      <div class="orderViewBox">
        <c:choose>
          <c:when test="${empty orderHistoryResult}">
            <div class="noOrderHistoryText">주문내역이 없습니다.</div>
          </c:when>
          <c:otherwise>
      <c:forEach var="bbig" items="${orderHistoryResult}">
     <div class="orderlist-time">
     ${bbig.payDate}
     </div>
     <div class="orderlist-detail-next">
      <a href="${contextPath }/myPage/myPage_02.do?orderId=${bbig.orderId}">
       주문 상세 보기
       <span>
        <button class="triangle-button">
         <img src="${contextPath}/img/image_icon/triangle_black.png" width="25px" height="29px">
        </button>
       </span>
      </a>
     </div>
     
    
   
     <a href="${contextPath }/myPage/myPage_02.do?orderId=${bbig.orderId}"> 
    <div class="product-order">
      
      <div class="product-order-pic">
     
      <img src="${contextPath}/download.do?fileName=${bbig.fileName}&productId=${bbig.productId}&cateCode=${bbig.cateCode}" alt="${bbig.fileName}" width="150px" height="150px">
      </div>
      <div class="product-order-line">
       
       <dl class="dlcss" id="dlcss-2">
        <dt class="listcss-6">상품명</dt>
         <dd class="listcss-7">
          <p>${bbig.productName}</p>
         </dd>
       </dl>
      
       

       <dl class="dlcss" id="dlcss-2">
        <dt class="listcss-6">주문 번호</dt>
         <dd class="listcss-7">
          <p>${bbig.orderId}</p>
         </dd>
       </dl>
       <dl class="dlcss" id="dlcss-2">
        <dt class="listcss-6">결제방법</dt>
         <dd class="listcss-7">
          <p>${bbig.card_com_name}</p>
         </dd>
       </dl>
       <dl class="dlcss" id="dlcss-2">
        <dt class="listcss-6">결제 금액</dt>
         <dd class="listcss-7">
          <p>${bbig.totalPrice}원</p>
          </dd>
          </dl>
        </div>

        <div class="exchange_refund">
          <div class="orderview-3">
            <button type="button" class="btn btn-outline-primary" id="order-refund-button">교환 신청</button>
           </div>
           <div class="orderview-3" >
           <button type="button" class="btn btn-outline-primary"  id="order-refund-button2">반품 신청</button>
           </div>
           </div>
       </div>
      
        </a>
      

      </c:forEach>
    </c:otherwise>
    </c:choose>
    </div>
        </div>
        
          
          
      </div>
      
      
            
     
    
     
    

</body>
</html>