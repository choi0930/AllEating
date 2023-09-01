<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
    
    <% request.setCharacterEncoding("utf-8"); %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
    <c:set var="userProductVO" value="${userProductInfo.userProductVO}" /><!--상품정보-->
	<c:set var="userProductImglist" value="${userProductInfo.userProductImglist}" /><!--이미지리스트-->
	<c:set var="userVO" value="${userProductInfo.userVO}" /><!--유저 리스트-->




    
<!DOCTYPE html>
<html>
<head>


    <title>상품 상세페이지</title>
<link href="${contextPath}/css/product_detail_01.css" rel="stylesheet" type="text/css" />


<script type="text/javascript">

/* $(function(){
	if(isLoginON == true and loginMember != null){
		document.getElementById("#listcss-5").style.display = "none";
	}else{//조건이 아닐떄
		document.getElementById("#listcss-5").style.display = "";
       
	}


}); 
}*/

/* 장바구니 담기 */
function add_cart(productId) {
  var select_qty = $('#qty_choice').val();
  if(select_qty == 0){
    alert("수량을 선택해주세요");
    return false;
  }
 
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
        alert("장바구니에 등록되었습니다.");
        $('#toDisplay').css('display','none');

      } else if(data === 'already_existed'){ //이미 등록된 상품일시
        alert("이미 카트에 등록된 상품입니다.");	
      }

    },
    error: function(data, textStatus) {
      alert("에러가 발생했습니다." + data);
    }
  });
}

  /*---------- 장바구니 담기 끝 ----------*/

function fn_goToPay(){
  var qty = $('#qty_choice').val();
  var productId = $('#productId').val();

  var formObj = document.createElement("form");
  var i_product_id = document.createElement("input");
  var i_qty = document.createElement("input");

  i_product_id.name = "product_id";
  i_qty.name = "qty";

  formObj.appendChild(i_product_id);
  formObj.appendChild(i_qty);

  document.body.appendChild(formObj);
  formObj.method ="POST";
  formObj.action="${contextPath}/order/orderEachProduct.do";
  formObj.submit();
}

 function fn_shopping(){
  $('#toDisplay').css('display','block');
 }

 
 function qty_mod(){
	  // select 요소의 변경 이벤트 감지
	  
	    var qty_choice = $('#qty_choice').val(); //수량 선택 select
	    var qty_hidden = $('#h_price').val(); // hidden으로 숨겨진 값
	    
	    qty_choice = Number(qty_choice);
	    qty_hidden = Number(qty_hidden);
	    var qty_total = qty_choice * qty_hidden; // 계산된 결과
	    
      var result = qty_total.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
      console.log

	    // 결과를 총합에 적용
      $('.h_qty_total').val(qty_total);
	    $('.qty_total').text(result);
   
	 /*  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","); */
 }

 
 
</script>


</head>
<body>



<div class="css-16c0d8l">
<main id="productinfo" class="productinfocss">
<div class="imagefood">

               <c:forEach var="pimg" items="${userProductImglist}">
                <c:if test="${pimg.fileType =='main_image'}">
                  <img src="${contextPath}/download.do?fileName=${pimg.fileName}&productId=${userProductVO.productId}&cateCode=${userProductVO.cateCode}" alt="${pimg.fileName}" width="300px" height="300px">
                </c:if>
            </c:forEach>
</div>
<div id="list">
<section class="listcss">
<div class="listcss-1"> <c:choose>
         <c:when test="${userProductVO.deliveryType == 'reserve' }"> 예약배송<img src="${contextPath }/img/image_logo/thunder.png" style="width:20px;height:20px;">
         </c:when> 
        <c:when test="${userProductVO.deliveryType == 'normal' }"> 일반배송
         </c:when>
         </c:choose>
<h1 class="listcss-2"> 
        <c:choose>
         <c:when test="${userProductVO.deliveryType == 'reserve' }">[All Eating]
         </c:when>
        <c:when test="${userProductVO.deliveryType == 'normal' }">[${userProductVO.productBrand}]
         </c:when>
         </c:choose>
                   ${userProductVO.productName} </h1>
                   
                   
                   <div class="sale_text">  
                    <c:choose>
                    <c:when test="${userProductVO.productDiscount != 0}">
                 
                   <div class="sale_text_1" >${userProductVO.productDiscount}%</div>
                   <div class="sale_text_2"><fmt:formatNumber value="${userProductVO.productPrice}" pattern="#,###"/>원</div>
                   <div class="sale_result"> <fmt:formatNumber value="${userProductVO.productSalesPrice}" pattern="#,###"/>원 </div> </c:when>
                   
                   <c:otherwise> <h6 class="sale_text_3"><fmt:formatNumber value="${userProductVO.productPrice}" pattern="#,###"/>원</h6></c:otherwise>
                   </c:choose>
                  </div> 

</div>

<c:choose>
            <c:when test="${isLoginON == true and loginMember != null}"><!--로그인 했을때-->
              <div id="listcss-5"></div>
            </c:when>
            <c:otherwise><!--로그인 정보가 없을때-->
              <div id="listcss-5">로그인 후, 적립 혜택이 제공됩니다.</div>
            </c:otherwise>
        </c:choose>

<!-- <div id="listcss-5">로그인 후, 적립 혜택이 제공됩니다.</div> -->



<div class="list">
<dl class="dlcss" id="dlcss-2">
<dt class="listcss-6">배송</dt>
<dd class="listcss-7">
<p><c:choose>
         <c:when test="${userProductVO.deliveryType == 'reserve' }">예약배송: 주문시 원하는 일자를 선택 하실 수 있습니다.
         </c:when>
        <c:when test="${userProductVO.deliveryType == 'normal' }">택배 배송
         </c:when>
         </c:choose>

</p>
</dd>
</dl>

<dl class="dlcss">
<dt class="listcss-6">판매자</dt>
<dd class="listcss-7">
<p>${userVO.owner_name}</p>
</dd>
</dl>

<dl class="dlcss">
<dt class="listcss-6">포장타입</dt>
<dd class="listcss-7">
<p>${userProductVO.productPackType }</p>
</dd>
</dl>

<dl class="dlcss">
<dt class="listcss-6">판매단위</dt>
<dd class="listcss-7">
<p>${userProductVO.productUnit }</p>
</dd>
</dl>

<dl class="dlcss">
<dt class="listcss-6">중량/용량</dt>
<dd class="listcss-7">
<p>${userProductVO.productWeight}</p>
</dd>
</dl>

<dl class="dlcss">
<dt class="listcss-6">원산지</dt>
<dd class="listcss-7">
<p>${userProductVO.productOrigin}</p>
</dd>
</dl>

<dl class="dlcss">
<dt class="listcss-6">유통기한</dt>
<dd class="listcss-7">
<p>${userProductVO.productExpireDate}</p>
</dd>
</dl>

<div class="choice">
<div class="choice-1">
<dl class="choice-2">
<dt class="choice-3">상품 선택</dt>
<dd class="choice-4">
<div class="choice-5">
<div class="choice-6">
<span class="choice-7"> [${userProductVO.productBrand}] ${userProductVO.productName}</span>
</div>
<div class="choice-8">
<div class="choice-9">

<input type="hidden" id="productId" value="${userProductVO.productId}">

<select class="form-select" id="qty_choice" aria-label="Default select example" onchange="qty_mod()" >
  <option selected value="1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1개</option>
  <option value="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2개</option>
  <option value="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3개</option>
  <option value="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4개</option>
  <option value="5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5개</option>
  <option value="6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6개</option>
  <option value="7">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;7개</option>
  <option value="8">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;8개</option>
  <option value="9">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;9개</option>
  <option value="10">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;10개</option>

</select>


</div>
<div class="choice-11">


              <c:choose>
                    <c:when test="${userProductVO.productDiscount != 0}">
                              <fmt:formatNumber value='${userProductVO.productSalesPrice}' type='number' />원
                    </c:when>
                   
                   
                  <c:otherwise>
                          <fmt:formatNumber value="${userProductVO.productPrice}" type="number" />원
                  </c:otherwise>
              </c:choose>

</div>
</div>
</div>
</dd>
</dl>
</div>





</div>

<div class="choice-cart-Info">
    <div class="choice-cart" >
        <div class="choice-cart-2"  id="toDisplay" >
        <div class="choice-cart-text">
             <h6 class="choice-cart-text-content">상품을 장바구니에 담았습니다.</h6>
        </div>
        <div class="choice-button">

        <button type="button" class="choice-button-view" onclick="fn_shopping()">쇼핑 계속하기</button>
        <button type="button" class="choice-button-view" >장바구니 가기</button>

        </div>
        </div> 
    </div>
</div>
<div class="total">
<div class="total-2">
<div class="total-3">




<c:choose>
                    <c:when test="${userProductVO.productDiscount != 0}">
                    총 상품 금액:<span class="qty_total"> <fmt:formatNumber value='${userProductVO.productSalesPrice}' type='number' /></span>원
                     <!--<input type="text"  class="qty_total" value="${userProductVO.productSalesPrice}">원-->
                                            <input type="hidden" class="qty_hidden"  id="h_price" value="${userProductVO.productSalesPrice}"/>
                                            <input type="hidden" class="h_qty_total" />
                    </c:when>
                   
                   
                   <c:otherwise>
                            총 상품 금액:  <span class="qty_total"><fmt:formatNumber value='${userProductVO.productPrice}' type='number' /></span>원
                            <!--<input type="text"  class="qty_total" value="${userProductVO.productPrice}">-->
                                              <input type="hidden" class="qty_hidden"  id="h_price" value="${userProductVO.productPrice}"/>
                                              <input type="hidden" class="h_qty_total"  />
                                          </c:otherwise>
                                          
                   </c:choose>

</div>


</div>
</div>
<div class="circle">
<span class="circle-2">적립</span>
<span class="circle-3">구매 시 </span>
<span class="circle-3">&nbsp;100원</span>
<span class="circle-3">&nbsp;적립</span>
</div>

<div class="result">
<button type="button" class="resultbutton" width="56" height="56" radius="3">
<span class="heart">
<img src="${contextPath}/img/image_logo/heart_icon.png" class="heartimg">
</span>
</button>
<div class="cart">
<button type="button"   radius="3" class="cartbutton" onclick="add_cart('${userProductVO.productId}')">
<span class="cart-2">장바구니 담기</span>
</button>
 <div class="buy">
<button type="button"  radius="3" class="buybutton" onclick="fn_goToPay()">
<span class="buy-2">구매하기</span>
</button>
 </div>
</div>

</div>
</div>
</section>
</div>

</main>
</div>



<div class="how">
<span>이런 상품은 어떠신가요</span>
<div class="how-1" >

<!-- <c:forEach var="dimg" items="${userProductImglist}">
                <c:if test="${userProductVO.cateCode == '9002001' } ">
                  <img src="${contextPath}/download.do?fileName=${dimg.fileName}&productId=${userProductVO.productId}&cateCode=${userProductVO.cateCode}" alt="${dimg.fileName}" width="300px" height="300px">
                </c:if>
            </c:forEach> 
-->
<div class="how-2">
<img src="${contextPath}/img/image_food/mygumi.jpg" width="300" height="300">
<div class="howname">[오리온] 마이구미 청포도 번들팩(43.2g X 6봉지)</div>
<div class="howname">2,980원</div>
</div>



<div class="how-3" >
<img src="${contextPath}/img/image_food/sparklling.jpg" width="300" height="300">
<div class="howname">[KF365]무라벨 청포도알로에 스파클링(350ml X 24개)</div>
<div class="howname">11,900원</div>
</div>



<div class="how-4">
<img src="${contextPath}/img/image_food/vitajelly.jpg" width="300" height="300">
<div class="howname">[올키] 비타젤리 청포도맛(15일분)</div>
<div class="howname">12,900원</div>
</div>



</div>


</div>


<nav class="info">
<ul class="info-2" id="info-6">
<li class="info-3">
<a class="info-4">
<span class="info-5">상품설명</span>
</a>
</li>
<li class="info-3">
<a class="info-4">
<span class="info-5">상세정보</span>
</a>
</li>
<li class="info-3">
<a class="info-4">
<span class="info-5">후기</span>
</a>
</li>
<li class="info-3">
<a class="info-4">
<span class="info-5">상품문의</span>
</a>
</li>
</ul>
</nav>

<div class="homp">
<div class="homp-2" id="description">
<div class="homp-3">
<div class="homp-4">
<div class="goods-wrap">
<div class="goods-intro">
<div class="pic">
<c:forEach var="pimg" items="${userProductImglist}"> 
                <c:if test="${pimg.fileType =='detail_image1'}">
                  <img src="${contextPath}/download.do?fileName=${pimg.fileName}&productId=${userProductVO.productId}&cateCode=${userProductVO.cateCode}" alt="${pimg.fileName}" width="300px" height="300px">
                </c:if>
            </c:forEach>
<div class="context-last">
   <small>${userProductVO.productContentTitle}</small>
    <h3><c:choose>
         <c:when test="${userProductVO.deliveryType == 'reserve' }">[All Eating]
         </c:when>
        <c:when test="${userProductVO.deliveryType == 'normal' }">[${userProductVO.productBrand}]
         </c:when>
         </c:choose>
                   ${userProductVO.productName}</h3>
    <hr>
    <p>${userProductVO.productContent}</p>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>




</body>
</html>