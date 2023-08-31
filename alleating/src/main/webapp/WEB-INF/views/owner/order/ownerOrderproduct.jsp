<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <% request.setCharacterEncoding("utf-8"); %>
    
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
 <c:set var="orderDetailVO" value="${ownerOrderDetailInfo.OwnerorderDetailVO}" /><!--주문내역상세 정보-->
 <c:set var="reserveList" value="${ownerOrderDetailInfo.OwnerreserveList}" />
  <c:set var="normalList" value="${ownerOrderDetailInfo.OwnernormalList}" />

    <link href="${contextPath}/css/ownerorderpd.css" rel="stylesheet" type="text/css" />
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
      <p>${orderDetailVO.orderId}</p>
     </div>
     <div class="order-problem-next">

     </div>
     </div>
   
   
    <div>
     <c:forEach var="reserve" items="${reserveList}">
     
    <div class="product-orderdetail">
    
      <div class="product-orderdetail-pic">
   <img src="${contextPath}/download.do?fileName=${reserve.fileName}&productId=${reserve.productId}&cateCode=${reserve.cateCode}" alt="${reserve.fileName}" width="150px" height="150px">
      </div>
      <div class="product-orderdetail-line">
      <div class="product-orderdetail-line-2">
          <p>예약배송<img src="${contextPath }/img/image_logo/thunder.png" style="width:20px;height:20px;"></p>
        </div>
      <div class="product-orderdetail-line-2">
          <p>[All Eating]</p>
        </div>
       <div class="product-orderdetail-line-2">
          <p>${reserve.productName}</p>
        </div>
        <div class="product-orderdetail-line-2">
          <p>${reserve.productPrice}</p>
        </div>
        <div class="product-orderdetail-line-2">
          <p>${reserve.productQty}</p>
        </div>
      </div>
      </div>
      
   
      <div class="orderdetailview">
       <div class="orderdetailview-2">

        <a href="${contextPath }/myPage/myPage_review.do" class="orderdetailview-3" >후기 작성 <img src="${contextPath }/img/side/arrow-right-black.png" width="25px" height="25px"></a>   
       </div>
      
       <div class="orderdetailview-2">
        <a class="orderdetailview-3" >장바구니 담기 <img src="${contextPath }/img/side/arrow-right-black.png" width="25px" height="25px"></a>    
       </div>
      
       	<div class="orderdetailview-2">
        	<a class="orderdetailview-3" >주문 취소 <img src="${contextPath }/img/side/arrow-right-black.png" width="25px" height="25px"></a>    
       	</div> 
      </div>
     
      </c:forEach>
    </div>
    
    
    <div>
     <c:forEach var="normalList" items="${normalList}">
    
    <div class="product-orderdetail">
    
      <div class="product-orderdetail-pic">
   <img src="${contextPath}/download.do?fileName=${normalList.fileName}&productId=${normalList.productId}&cateCode=${normalList.cateCode}" alt="${normalList.fileName}" width="150px" height="150px">
      </div>
      <div class="product-orderdetail-line">
      <div class="product-orderdetail-line-2">
          <p>일반 배송</p>
        </div>
      <div class="product-orderdetail-line-2">
          <p>[${normalList.productBrand}]</p>
        </div>
       <div class="product-orderdetail-line-2">
          <p>${normalList.productName}</p>
        </div>
        <div class="product-orderdetail-line-2">
          <p>${normalList.productPrice}</p>
        </div>
        <div class="product-orderdetail-line-2">
          <p>${normalList.productQty}</p>
        </div>
      </div>
      </div>
      </c:forEach>
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
            <p>${orderDetailVO.totalPrice}원</p>
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
            <p>${orderDetailVO.totalPrice}원</p>
           </dd>
         </dl>
         <dl class="dlcss" id="dlcss-2">
          <dt class="listcss-6">결제 방법</dt>
           <dd class="listcss-7">
            <p>${orderDetailVO.card_com_name}</p>
           </dd>
         </dl>
         <dl class="dlcss" id="dlcss-2">
          <dt class="listcss-6">할부</dt>
           <dd class="listcss-7">
            <p>${orderDetailVO.card_com_name}</p>
           </dd>
         </dl>
         <dl class="dlcss" id="dlcss-2">
          <dt class="listcss-6">결제 일시</dt>
           <dd class="listcss-7">
            <p>${orderDetailVO.card_pay_month}</p>
           </dd>
         </dl>
       </div>
       
      <!-- <div class="orderlistdetailview-list-2">
       <div class="orderlistdetailview-list-3">
        <h3>주문 정보</h3>
        </div>
          <div class="orderlistdetailview-list-4">
         <dl class="dlcss" id="dlcss-2">
          <dt class="listcss-6">주문 번호</dt>
           <dd class="listcss-7">
            <p>${orderDetailVO.orderId}</p>
           </dd>
         </dl>
         <dl class="dlcss" id="dlcss-2">
          <dt class="listcss-6">구매자</dt>
           <dd class="listcss-7">
            <p>${orderDetailVO.orderName}</p>
           </dd>
         </dl>
         <dl class="dlcss" id="dlcss-2">
          <dt class="listcss-6">구매자 연락처</dt>
           <dd class="listcss-7">
            <p>${orderDetailVO.orderHp}</p>
           </dd>
         </dl>
       </div>
   </div> -->
   
   <div class="orderlistdetailview-list-2">
       <div class="orderlistdetailview-list-3">
        <h3>배송 정보</h3>
        </div>
          <div class="orderlistdetailview-list-4">
       
         <dl class="dlcss" id="dlcss-2">
          <dt class="listcss-6">선택 배송 일자</dt>
           <dd class="listcss-7">
            <p>???????</p>
           </dd>
         </dl>
         <dl class="dlcss" id="dlcss-2">
          <dt class="listcss-6">수령인</dt>
           <dd class="listcss-7">
            <p>${orderDetailVO.receiverName}</p>
           </dd>
         </dl>
        
         <dl class="dlcss" id="dlcss-2">
          <dt class="listcss-6">수령인 연락처</dt>
           <dd class="listcss-7">
            <p>${orderDetailVO.receiverHp}</p>
           </dd>
         </dl>
         <dl class="dlcss" id="dlcss-2">
          <dt class="listcss-6">배송지</dt>
           <dd class="listcss-7">
            <p>${orderDetailVO.zipcode}</p>
            <p>${orderDetailVO.address}&nbsp;${orderDetailVO.address2}&nbsp;${orderDetailVO.addressDetail}</p>
           </dd>
         </dl>
         <dl class="dlcss" id="dlcss-2">
          <dt class="listcss-6">배송메모</dt>
           <dd class="listcss-7">
            <p>${orderDetailVO.delivery_request}</p>
           </dd>
         </dl>
       </div>
       </div>
      </div>
     </div>
   </div> 
</body>
</html>