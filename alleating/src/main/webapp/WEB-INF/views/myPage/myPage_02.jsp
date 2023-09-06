<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <% request.setCharacterEncoding("utf-8"); %>
    
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
 	<c:set var="orderDetailVO" value="${orderDetailInfo.orderDetailVO}" /><!--주문내역상세 정보-->
 	<c:set var="reserveList" value="${orderDetailInfo.reserveList}" />
 	 <c:set var="normalList" value="${orderDetailInfo.normalList}" />

    
    
    <link href="${contextPath}/css/myPage_02.css" rel="stylesheet" type="text/css" />
    <!DOCTYPE html>
<html>
<head>
<script>
  /*장바구니 담기*/
function fn_addcart(productId){
  
  var select_qty = 1;

  $.ajax({
    type: "POST",
    async: true, // true로 변경
    url: "/cart/addProduct.do",
    data: {
      productId: productId,
      cart_product_qty: select_qty
    },

    success: function(data, textStatus) {
      
      if(data === 'add_success'){   // 등록 성공시
        alert("상품을 장바구니에 담았습니다.");
        
      } else if(data === 'already_existed'){ //이미 등록된 상품일시
        alert("이미 장바구니에 등록된 상품입니다.");
        var go = confirm("장바구니로 가시겠습니까?");
        if(go){
          location.href='/cart/myCart.do';
        }
      }

    },
    error: function(data, textStatus) {
      alert("에러가 발생했습니다." + data);
    }
  });
}
/*------------------------------------------------------------------*/

/*모든 상품 장바구니 담기*/
function fn_addAllCart(){
  var cartList=[];
  $('.addAllProductId').each(function(){
    var productId = $(this).val();
    var cart_product_qty = 1;
    console.log(productId);
    cartList.push({
      productId:productId,
      cart_product_qty:cart_product_qty
    });
  });
  $.ajax({
        type: "POST",
        url: "${contextPath}/cart/addAllProduct.do",
        data: JSON.stringify(cartList),
        contentType: "application/json;charset=UTF-8",
        success: function (response) {
            alert("모든 상품을 장바구니에 담았습니다.");
            var go = confirm("장바구니로 가시겠습니까?");
        if(go){
          location.href='/cart/myCart.do';
        }
        },
        error: function (error) {
            console.error("오류 발생:", error);
        }
    });
}
/*------------------------------------------------------------------*/

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
function fn_allCancel(orderId){
	location.href="/myPage/deliveryAllCancelUpdate.do?orderId="+orderId;
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
   

     <c:if test="${not empty reserveList}">
   <div class="clear">

   

    <div class="orderBox">
     
      <c:forEach var="reserve" items="${reserveList}">
        <input type="hidden" class="addAllProductId" value="${reserve.productId}" />
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
          <p>${reserve.productPrice}원</p>
        </div>
        <div class="product-orderdetail-line-2">
          <p>${reserve.productQty}개</p>
        </div>
        <div class="product-orderdetail-line-3">
         <c:choose>
         <c:when test="${reserve.delivery_status == 'delivery_prepared'}">
          <p>배송 준비중</p>
         </c:when>
          <c:when test="${reserve.delivery_status == 'delivery_complete'}">
          <p>배송 완료</p>
         </c:when>
          <c:when test="${reserve.delivery_status == 'cancel'}">
          <p>주문 취소</p>
         </c:when>
         </c:choose>
        
        </div>
      </div>
      
    </div>
      
      
   
      <div class="orderdetailview">
     
      
       <div class="orderdetailview-2">
        <a class="orderdetailview-3" href="javascript:fn_addcart('${reserve.productId}')">장바구니 담기 <img src="${contextPath }/img/side/arrow-right-black.png" width="25px" height="25px"></a>    
       </div>
       	<div class="orderdetailview-2">
        	<a class="orderdetailview-3" href="${contextPath }/myPage/deliveryCancelUpdate.do?order_seq_num=${reserve.order_seq_num}&orderId=${reserve.orderId}">주문 취소 <img src="${contextPath }/img/side/arrow-right-black.png" width="25px" height="25px"></a>    
       	</div> 
      </div>
    </c:forEach>
    </div>
  </div>
  </c:if>
    
    <div>
    <div class="orderBox">
     <c:forEach var="normal" items="${normalList}">
      <input type="hidden" class="addAllProductId" value="${normal.productId}" />
    <div class="product-orderdetail">
    
      <div class="product-orderdetail-pic">
   <img src="${contextPath}/download.do?fileName=${normal.fileName}&productId=${normal.productId}&cateCode=${normal.cateCode}" alt="${normal.fileName}" width="150px" height="150px">
      </div>
      <div class="product-orderdetail-line">
      <div class="product-orderdetail-line-2">
          <p>일반 배송</p>
        </div>
      <div class="product-orderdetail-line-2">
          <p>[${normal.productBrand}]</p>
        </div>
       <div class="product-orderdetail-line-2">
          <p>${normal.productName}</p>
        </div>
        <div class="product-orderdetail-line-2">
          <p>${normal.productPrice}원</p>
        </div>
        <div class="product-orderdetail-line-2">
          <p>${normal.productQty}개</p>
        </div>
        <div class="product-orderdetail-line-3">
         <c:choose>
         <c:when test="${normal.delivery_status == 'delivery_prepared'}">
          <p>배송 준비중</p>
         </c:when>
          <c:when test="${normal.delivery_status == 'delivery_complete'}">
          <p>배송 완료</p>
         </c:when>
          <c:when test="${normal.delivery_status == 'cancel'}">
          <p>주문 취소</p>
         </c:when>
         </c:choose>
      </div>
      </div>
      </div>
      
   
      <div class="orderdetailview">
      
       <div class="orderdetailview-2">
        <a class="orderdetailview-3" href="javascript:fn_addcart('${normal.productId}')">장바구니 담기 <img src="${contextPath }/img/side/arrow-right-black.png" width="25px" height="25px"></a>    
       </div>
      
       	<div class="orderdetailview-2">
        	<a class="orderdetailview-3" href="${contextPath }/myPage/deliveryCancelUpdate.do?order_seq_num=${normal.order_seq_num}&orderId=${normal.orderId}">주문 취소 <img src="${contextPath }/img/side/arrow-right-black.png" width="25px" height="25px"></a>    
       	</div> 
      </div>
     
      </c:forEach>
    </div>
    
  </div>
    
 
    
    
    

    
    
    <div class="orderresult">
     	<div class="readd">
       <button type="button" radius="3" class="readdbutton" onclick="fn_addAllCart()">
         <span class="readd-2">전체 상품 다시 담기</span>
       </button>
       </div>
     <div class="allcancel">
       <button type="button"  radius="3" class="allcancelbutton" onclick="fn_allCancel('${orderDetailVO.orderId}')">
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
            <p>${orderDetailVO.card_pay_month}</p>
           </dd>
         </dl>
         <dl class="dlcss" id="dlcss-2">
          <dt class="listcss-6">결제 일시</dt>
           <dd class="listcss-7">
            <p>${orderDetailVO.payDate}</p>
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
      
      
   </div>
   
   <div class="orderlistdetailview-list-2">
       <div class="orderlistdetailview-list-3">
        <h3>배송 정보</h3>
        </div>
          <div class="orderlistdetailview-list-4">
       
       
         <c:if test="${orderDetailVO.reserveDate != null }">
         <dl class="dlcss" id="dlcss-2">
          <dt class="listcss-6">선택 배송 일자</dt>
           <dd class="listcss-7">
            <p>${orderDetailVO.reserveDate} ${orderDetailVO.reserveTime}</p>
           </dd>
         </dl>
         </c:if>
         
         
         
         
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