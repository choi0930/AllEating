<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <% request.setCharacterEncoding("utf-8"); %>
    
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
    <link href="${contextPath}/css/myPage_02.css" rel="stylesheet" type="text/css" />
    <!DOCTYPE html>
<html>
<head>
<script>
function OrderDeleteCallback(obj){
   
	if(obj != null){        
           
		var result = obj.result;
           
		if(result == "SUCCESS"){
			alert("주문취소를 성공하였습니다.");                
			location.href="${contextPath}/myPage/myPage_01.do";
		} else {                
			alert("취소는 상품준비중일 때만 가능합니다.");    
			return;
		}
	}
}
</script>



<title>주문 내역</title>
<link href="${contextPath}/css/myPage_01.css" rel="stylesheet" type="text/css" />



</head>
<body>
  <div class="orderlistdetail">
   <div class = "orderlistdetail-main">
    <div class="orderlistdetailview">
     <div class="orderlistdetailview-title">
     <h3>주문 내역 상세</h3></div>
     </div>
    </div>
      
    <div class="orderlistdetailview-under">
     <div class="orderlist-time">
      23081412345
     </div>
     <div class="order-problem-next">
      <span class="order-problem-next-text">
       배송 또는 상품에 문제가 있습니까?     
      </span>
      <a class="oneoneq" style="color:navy;">
       1:1문의하기
       <span>
        <button class="triangle-button">
         <img src="${contextPath}/img/image_icon/triangle_navy.png" width="25px" height="29px">
        </button>
       </span>
      </a>
     </div>
     </div>
   
    <div class="product-orderdetail">
      <div class="product-orderdetail-pic">
       <img src="${contextPath }/img/image_food/shinemuscat.jpg" width="150px" height="150px">
      </div>
      <div class="product-orderdetail-line">
       <div class="product-orderdetail-line-2">
          <p>저탄소 샤인머스캣</p>
        </div>
        <div class="product-orderdetail-line-2">
          <p>13,990원</p>
        </div>
        <div class="product-orderdetail-line-2">
          <p>1개</p>
        </div>
      </div>
   
      <div class="orderdetailview">
       <div class="orderdetailview-2">
        <a class="orderdetailview-3" >후기 작성 <img src="${contextPath }/img/side/arrow-right-black.png" width="25px" height="25px"></a>   
       </div>
       <div class="orderdetailview-2">
        <a class="orderdetailview-3" >장바구니 담기 <img src="${contextPath }/img/side/arrow-right-black.png" width="25px" height="25px"></a>    
       </div>
      
       	<div class="orderdetailview-2">
        	<a class="orderdetailview-3" >주문 취소 <img src="${contextPath }/img/side/arrow-right-black.png" width="25px" height="25px"></a>    
       	</div> 
      </div>
    
    
    
   
    </div>
    
    
    <div class="orderresult">
     	<div class="readd">
       <button type="button"   radius="3" class="readdbutton">
         <span class="readd-2">전체 상품 다시 담기</span>
       </button>
       </div>
     <div class="allcancel">
       <button type="button"  radius="3" class="allcancelbutton">
        <span class="allcancel-2">전체 상품 주문 취소</span>
        </button>
      </div>
    </div>
    
    <div class="orderpotential">
      <div class="orderpotential-view">
      <p class="orderpotential-text">주문 취소는 [배송 준비중]인 상태일 경우에만 가능합니다.</p>
      </div>
  </div>
    
    
    
     <div class="orderlistdetailview-list">
      <div class="orderlistdetailview-list-2">
       <div class="orderlistdetailview-list-3">
        <h3>결제정보</h3>
       </div>
               <div class="orderlistdetailview-list-4">
         <dl class="dlcss" id="dlcss-2">
          <dt class="listcss-6">상품 금액</dt>
           <dd class="listcss-7">
            <p>13,990원</p>
           </dd>
         </dl>
         <dl class="dlcss" id="dlcss-2">
          <dt class="listcss-6">배송비</dt>
           <dd class="listcss-7">
            <p>3,000원</p>
           </dd>
         </dl>
         <dl class="dlcss" id="dlcss-2">
          <dt class="listcss-6">적립금 사용</dt>
           <dd class="listcss-7">
            <p>0원</p>
           </dd>
         </dl>
         <dl class="dlcss" id="dlcss-2">
          <dt class="listcss-6">결제 금액</dt>
           <dd class="listcss-7">
            <p>16,990원</p>
           </dd>
         </dl>
         <dl class="dlcss" id="dlcss-2">
          <dt class="listcss-6">결제 방법</dt>
           <dd class="listcss-7">
            <p>신용카드</p>
           </dd>
         </dl>
         <dl class="dlcss" id="dlcss-2">
          <dt class="listcss-6">결제 일시</dt>
           <dd class="listcss-7">
            <p>2023-08-14 18:00</p>
           </dd>
         </dl>
       </div>
       
      <div class="orderlistdetailview-list-2">
       <div class="orderlistdetailview-list-3">
        <h3>주문 정보</h3>
        </div>
          <div class="orderlistdetailview-list-4">
         <dl class="dlcss" id="dlcss-2">
          <dt class="listcss-6">주문 번호</dt>
           <dd class="listcss-7">
            <p>23081412345</p>
           </dd>
         </dl>
         <dl class="dlcss" id="dlcss-2">
          <dt class="listcss-6">보내는분</dt>
           <dd class="listcss-7">
            <p>최현진</p>
           </dd>
         </dl>
       </div>
      
      
   </div>
   
   <div class="orderlistdetailview-list-2">
       <div class="orderlistdetailview-list-3">
        <h3>배송 정보</h3>
        </div>
          <div class="orderlistdetailview-list-4">
         <dl class="dlcss" id="dlcss-2">
          <dt class="listcss-6">배송 타입</dt>
           <dd class="listcss-7">
            <p>예약 배송</p>
           </dd>
         </dl>
         <dl class="dlcss" id="dlcss-2">
          <dt class="listcss-6">선택 배송 일자</dt>
           <dd class="listcss-7">
            <p>10:00~16:00</p>
           </dd>
         </dl>
         <dl class="dlcss" id="dlcss-2">
          <dt class="listcss-6">수령인</dt>
           <dd class="listcss-7">
            <p>최현진</p>
           </dd>
         </dl>
         <dl class="dlcss" id="dlcss-2">
          <dt class="listcss-6">결제 금액</dt>
           <dd class="listcss-7">
            <p>16,990원</p>
           </dd>
         </dl>
         <dl class="dlcss" id="dlcss-2">
          <dt class="listcss-6">전화번호</dt>
           <dd class="listcss-7">
            <p>010-1234-5678</p>
           </dd>
         </dl>
         <dl class="dlcss" id="dlcss-2">
          <dt class="listcss-6">배송지</dt>
           <dd class="listcss-7">
            <p>31547</p>
            <p>대전 서구 둔산동 오라클 빌딩</p>
           </dd>
         </dl>
         <dl class="dlcss" id="dlcss-2">
          <dt class="listcss-6">배송메모</dt>
           <dd class="listcss-7">
            <p>문 앞에 놓아주세요</p>
           </dd>
         </dl>
       </div>
       </div>
      </div>
     </div>
   </div> 
</body>
</html>