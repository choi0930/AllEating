<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<% request.setCharacterEncoding("utf-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<c:set var="resrve_product" value="${product_map.reserveProductList}" />
<c:set var="normal_product" value="${product_map.normalProductList}" />

<link href="${contextPath}/css/cart_01.css" rel="stylesheet" type="text/css" />

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>장바구니</title>
    <script type="text/javascript">

      
  $(function(){
	  
	  $('#cartShowBtn').hide();

  $('#cartShowBtn').click(function() {
	  $('#cartHideBtn').show();
	 /*  $('#cartShowDiv').show(); */
      $('#cartShowBtn').hide();
    /*   $('#cartShowDiv').fadeIn(5000)
       $('#cartShowDiv').delay(5000) */
      // goodsBtn을 클릭하면 goodsDiv를 보여줘라
   
      $('#cart-info-all').slideDown(500);
      
  })
   
  $('#cartHideBtn').click(function() {
	  $('#cartShowBtn').show();
	/*   $('#cartShowDiv').hide(); */
	  $('#cartHideBtn').hide();
	  $('#cart-info-all').slideUp(500);
     
      // goodsBtn을 클릭하면 goodsDiv를 숨겨라
   
  })
   });
 
 $(function(){
	  
	  $('#generalcartShowBtn').hide();

 $('#generalcartShowBtn').click(function() {
	  $('#generalcartHideBtn').show();
	 /*  $('#cartShowDiv').show(); */
     $('#generalcartShowBtn').hide();
   /*   $('#cartShowDiv').fadeIn(5000)
      $('#cartShowDiv').delay(5000) */
     // goodsBtn을 클릭하면 goodsDiv를 보여줘라
  
     $('#cart-info-all2').slideDown(500);
     
 })
  
 $('#generalcartHideBtn').click(function() {
	  $('#generalcartShowBtn').show();
	/*   $('#cartShowDiv').hide(); */
	  $('#generalcartHideBtn').hide();
	  $('#cart-info-all2').slideUp(500);
    
     // goodsBtn을 클릭하면 goodsDiv를 숨겨라
  
 })
  });
 
 

 


/* 
	var check = false; 
	function CheckAll(){ 
		var chk = document.getElementsByName("chk[]"); 
		if(check == false){ 
			check = true; 
			for(var i=0; i<chk.length;i++){ 
				chk[i].checked = true;//모두 체크 
				document.getElementById("cart-all-check").checked = true;

			} //for
		}else{ 
			check = false; 
			for(var i=0; i<chk.length;i++){ 
				chk[i].checked = false;//모두 해제 
				document.getElementById("cart-all-check").checked = false;
			}//for
		}
	} */


	
	//이메일 sms 수신동의 전체 체크
	$(document).ready(function(){
		var part = $('.individual_cart_checkbox').length;
	//전체 체크박스 클릭
		$("#cart-all-check").click(function() {
			if ($("#cart-all-check").prop("checked")) {
				$(".individual_cart_checkbox").prop("checked", true);
			} else {
				$(".individual_cart_checkbox").prop("checked", false);
			}
		});
	//전체 체크박스 선택중 체크박스 하나를 풀었을때 "전체" 체크해제
		
		$(".individual_cart_checkbox").click(function() {
			if ($(".individual_cart_checkbox:checked").length == part) {
				$("#cart-all-check").prop("checked", true);
			} else {
				$("#cart-all-check").prop("checked", false);
			}
		});
	});
 
 
 
 /* $("div").fadeIn(1000).delay(1000).fadeOut(1000); */
 
/*  fadein 나타남 fadeout 사라짐 */
 


   
	$(document).ready(function() {
  // "수량 증가" 버튼 클릭 이벤트 처리
  $(".cartbutton-up").click(function() {
    var inputField = $(this).siblings(".inp");
    var currentValue = parseInt(inputField.val());
    
    if (!isNaN(currentValue)) {
      inputField.val(currentValue + 1);
    }
  });
  
  // "수량 감소" 버튼 클릭 이벤트 처리
  $(".cartbutton-down").click(function() {
    var inputField = $(this).siblings(".inp");
    var currentValue = parseInt(inputField.val());
    
    if (!isNaN(currentValue) && currentValue > 1) {
      inputField.val(currentValue - 1);
    }
  });
});


</script>
<style>
  .emptyProductMsg{
    text-align: center;
  }
</style>
      
     

  </head>
  <body>
    <div class="cart-main">
      <h3 class="cart-text01">장바구니</h3>
      <div id="cart-ch">
        <a href="${contextPath}/member/loginForm.do">선택삭제</a>
        <div class="header_top_bar"></div>
        <!--일자 바-->
        <a href="#">전체선택</a>
        <input type="checkbox"  id="cart-all-check"  />
      </div>
     
      <div class="cart-text02">예약 배송 상품: 1개
      <div class="cartresult"> 
      <button type="button" id="cartShowBtn"><img src="${ContextPath }/img/image_icon/down.png" width="20px" height="20px" ></button>
     
       <button type="button" id="cartHideBtn"><img src="${ContextPath }/img/image_icon/up.png" width="20px" height="20px"></button>
      </div>
      </div>
      <div>
        <div>
         <div id="cart-info-all" >
          <c:choose>
            <c:when test="${empty resrve_product}">
              <div class="emptyProductMsg">장바구니에 담긴 상품이 없습니다.</div>
            </c:when>
            <c:when test="${not empty resrve_product}">
              <forEach var="re" items="${resrve_product}">
                <div id="cart-info"  >
                  <input type="checkbox"  class="individual_cart_checkbox" value="${re.cartId}" />
                  <img
                    class="cart-image"
                    src="${contextPath}/download.do?fileName=${re.fileName}&productId=${re.productId}&cateCode=${re.cateCode}"
                    alt="${re.fileName}"
                  />
                  <div class="cart-text03">
                    <h5>[${re.productBrand}]<br />${re.productName}</h5>
                  </div>
                  <div class="choice-8">
                    <div class="cart-count">
                      <button
                        type="button" aria-label="수량내리기"   class="cartbutton-down" ><img src="${contextPath }/img/image_icon/minus.png" width="25px" height="25px"></button>
                         <input type="text" class="inp" value="${re.cart_product_qty}" readonly />
                      <button type="button" aria-label="수량올리기" class="cartbutton-up" ><img src="${contextPath }/img/image_icon/plus.png" width="25px" height="25px"></button>
                    </div>
                    <div class="choice-11">
                      <span class="choice-12">${re.productPrice}</span>
                      <span class="choice-12">원</span>
                    </div>
                  </div>
                </div>
                </forEach>
            </c:when>
          </c:choose>
          
          <div id="cart-info"  >
            <input type="checkbox"  class="individual_cart_checkbox" value="1" readonly/>
            <img
              class="cart-image"
              src="${contextPath}/img/image_food/shinemuscat.JPG"
              alt="Image 1"
            />
            <div class="cart-text03">
              <h5>[All Eating]<br />저탄소 샤인머스켓</h5>
            </div>
            <div class="choice-8">
              <div class="cart-count">
                <button
                  type="button" aria-label="수량내리기"   class="cartbutton-down" ><img src="${contextPath }/img/image_icon/minus.png" width="25px" height="25px"></button>
                   <input type="text" class="inp" value="1" readonly />
                <button type="button" aria-label="수량올리기" class="cartbutton-up" ><img src="${contextPath }/img/image_icon/plus.png" width="25px" height="25px"></button>
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
          <div class="cart-text02">택배 배송 상품: 0개
           <div class="cartresult"> 
      <button type="button" id="generalcartShowBtn"><img src="${ContextPath }/img/image_icon/down.png" width="20px" height="20px" ></button>
     
       <button type="button" id="generalcartHideBtn"><img src="${ContextPath }/img/image_icon/up.png" width="20px" height="20px"></button>
      </div>
          </div>
                <div id="cart-info-all2">
                  <c:choose>
                    <c:when test="${empty normal_product}">
                      <div class="emptyProductMsg">장바구니에 담긴 상품이 없습니다.</div>
                    </c:when>
                    <c:otherwise>
                      <forEach var="normal" items="${normal_product}">
                        <div id="cart-info2"  >
                          <input type="checkbox"  class="individual_cart_checkbox" value="${normal.cartId}" />
                          <img
                            class="cart-image"
                            src="${contextPath}/download.do?fileName=${normal.fileName}&productId=${normal.productId}&cateCode=${normal.cateCode}"
                            alt="${normal.fileName}"
                          />
                          <div class="cart-text03">
                            <h5>[${normal.productBrand}]<br />${normal.productName}</h5>
                          </div>
                          <div class="choice-8">
                            <div class="cart-count">
                              <button
                                type="button" aria-label="수량내리기"   class="cartbutton-down" ><img src="${contextPath }/img/image_icon/minus.png" width="25px" height="25px"></button>
                                 <input type="text" class="inp" value="${normal.cart_product_qty}" readonly />
                              <button type="button" aria-label="수량올리기" class="cartbutton-up" ><img src="${contextPath }/img/image_icon/plus.png" width="25px" height="25px"></button>
                            </div>
                            <div class="choice-11">
                              <span class="choice-12">${normal.productPrice}</span>
                              <span class="choice-12">원</span>
                            </div>
                          </div>
                        </div>
                        </forEach>
                    </c:otherwise>
                  </c:choose>
                  

          <div id="cart-info2" >
            <input type="checkbox" class="individual_cart_checkbox"  />
            <img
              class="cart-image"
              src="${contextPath}/img/image_food/peach.JPG" alt="Image 1" />
            <div class="cart-text03">
              <h5>[서형이네]<br />천중도 백도 복숭아</h5>
            </div>
            <div class="choice-8">
              <div class="cart-count">
                <button
                  type="button" aria-label="수량내리기"  class="cartbutton-down" ><img src="${contextPath }/img/image_icon/minus.png" width="25px" height="25px"></button>
                    <input type="text" class="inp" value="1" />           
                <button type="button" aria-label="수량올리기" class="cartbutton-up" ><img src="${contextPath }/img/image_icon/plus.png" width="25px" height="25px"></button>
              </div>
              <div class="choice-11">
                <span class="choice-12">18,900</span
                ><span class="choice-12">원</span>
              </div>
            </div>
          </div>
          <div class="cart-cost">
            <h4>18,900원 + 3,000원 = 21,900원</h4>
          </div>
          
          
          
         </div>
         <div class=cartblank></div>
        </div>
      </div>
    </div>
  </body>
</html>
