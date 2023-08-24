<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %> <%
request.setCharacterEncoding("utf-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<c:set
  var="resrve_product"
  value="${product_map.reserveProductList}"
/><!--예약배송 상품-->
<c:set var="normal_product" value="${product_map.normalProductList}" />
<!--일반배송 상품-->
<c:set var="reserveCount1" value="${product_map.reserveCount}" />
<c:set var="normalCount1" value="${product_map.normalCount}" />

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>장바구니</title>
    <link
      href="${contextPath}/css/cart_01.css"
      rel="stylesheet"
      type="text/css"
    />
    <script type="text/javascript">
      window.onload=function(){
        fn_productPrice();
      }
      $(function () {
        $("#cartShowBtn").hide();

        $("#cartShowBtn").click(function () {
          $("#cartHideBtn").show();
          /*  $('#cartShowDiv').show(); */
          $("#cartShowBtn").hide();
          /*   $('#cartShowDiv').fadeIn(5000)
           $('#cartShowDiv').delay(5000) */
          // goodsBtn을 클릭하면 goodsDiv를 보여줘라

          $("#cart-info-all").slideDown(500);
        });

        $("#cartHideBtn").click(function () {
          $("#cartShowBtn").show();
          /*   $('#cartShowDiv').hide(); */
          $("#cartHideBtn").hide();
          $("#cart-info-all").slideUp(500);

          // goodsBtn을 클릭하면 goodsDiv를 숨겨라
        });
      });

      $(function () {
        $("#generalcartShowBtn").hide();

        $("#generalcartShowBtn").click(function () {
          $("#generalcartHideBtn").show();
          /*  $('#cartShowDiv').show(); */
          $("#generalcartShowBtn").hide();
          /*   $('#cartShowDiv').fadeIn(5000)
          $('#cartShowDiv').delay(5000) */
          // goodsBtn을 클릭하면 goodsDiv를 보여줘라

          $("#cart-info-all2").slideDown(500);
        });

        $("#generalcartHideBtn").click(function () {
          $("#generalcartShowBtn").show();
          /*   $('#cartShowDiv').hide(); */
          $("#generalcartHideBtn").hide();
          $("#cart-info-all2").slideUp(500);

          // goodsBtn을 클릭하면 goodsDiv를 숨겨라
        });
      });

      //장바구니 체크박스
      $(document).ready(function () {
        var part = $(".individual_cart_checkbox").length;
        //전체 체크박스 클릭
        $("#cart-all-check").click(function () {
          if ($("#cart-all-check").prop("checked")) {
            $(".individual_cart_checkbox").prop("checked", true);
            fn_totalPrice();
          } else {
            $(".individual_cart_checkbox").prop("checked", false);
            fn_totalPrice();
          }
        });
        //전체 체크박스 선택중 체크박스 하나를 풀었을때 "전체" 체크해제

        $(".individual_cart_checkbox").click(function () {
          if ($(".individual_cart_checkbox:checked").length == part) {
            $("#cart-all-check").prop("checked", true);
            fn_totalPrice();  
          } else {
            $("#cart-all-check").prop("checked", false);
            fn_totalPrice();
          }
        });
      });

      
      /*qty 증가*/
      function fn_qty_up(cartId) {
        var qty = $("#qty" + cartId).val();

        ++qty;

        $("#qty" + cartId).attr("value", qty);
        var productId = $("#productId_" + cartId).val();

        $.ajax({
          type: "POST",
          async: false, // true로 변경
          url: "${contextPath}/cart/modifyCartQty.do",
          data: {
            cartId: cartId,
            productId: productId,
            cart_product_qty: qty,
            status: "up",
          },
          success: function (data, textStatus) {},
          error: function (data, textStatus) {
            alert("에러가 발생했습니다." + data);
          },
        }).done(function () {
          fn_productPrice(cartId);
        });
      }
      /*qty 감소*/
      function fn_qty_down(cartId) {
        var qty = $("#qty" + cartId).val();

        if (qty <= 1) {
          alert("1개이상 선택해야함");
          return false;
        }
        --qty;
        $("#qty" + cartId).attr("value", qty);
        var productId = $("#productId_" + cartId).val();

        $.ajax({
          type: "POST",
          async: false, // true로 변경
          url: "${contextPath}/cart/modifyCartQty.do",
          data: {
            cartId: cartId,
            productId: productId,
            cart_product_qty: qty,
            status: "down",
          },
          success: function (data, textStatus) {},
          error: function (data, textStatus) {
            alert("에러가 발생했습니다." + data);
          },
          complete: function (data, textStatus) {
            // 완료 처리 추가 가능
          },
        }).done(function () {
          fn_productPrice(cartId);
          
        });
      }
     
       
      function fn_productPrice(cartId) {
        
        var productPrice = $("#productPrice" + cartId).val();
        var qty = $("#qty" + cartId).val();
        var _prdouctPrice = Number(productPrice);
        var _qty = Number(qty);

        var total = _prdouctPrice * _qty;
        
        let result = total
          .toString()
          .replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
          $('#totalPrice'+cartId).val(total);
        $("#total_price_" + cartId).val(result);
        fn_totalPrice();
      }

      function fn_totalPrice(){
        var str = "";
                var sum = 0;
                var count = $(".chkbox:checked").length;
                for (var i = 0; i < count; i++) {
                    if ($(".chkbox")[i].checked == true) {
                        var cartId = $(".chkbox")[i].value;
                        var productPrice = $('#totalPrice'+cartId).val();
                        console.log(productPrice);
                        sum +=Number(productPrice);
                        
                    }
                }
                var deliveryPrice = 3000;
                var total = sum+deliveryPrice;
                
                $('#productCount').attr('value',count);
                $("#total_sum").attr('value',sum);
                $('#deliveryPrice').attr('value', deliveryPrice);
                $('#td').attr('value',total);
                
      }
      
      function getSelectedCheckboxValues(){
        var order_cart_qty;
	      var order_cart_id;
        var productId;
        var objForm = document.frm_order;
        var check_cartId = objForm.checked_cartId;
        var cart_product_qtyy = objForm.cart_product_qtyy;
        var length=check_cartId.length;
          if(length>1){
            for(var i=0; i<length; i++){
              if(check_cartId[i].checked==true){
                order_cart_id = check_cartId[i].value;
                order_cart_qty = cart_product_qtyy[i].value;
                productId = $('#productId_'+order_cart_id).val();
                cart_product_qtyy[i].value="";
                cart_product_qtyy[i].value = productId+":"+order_cart_qty; 
              }
            }
          } else{
            order_cart_id = check_cartId.value;
            order_cart_qty = cart_product_qtyy.value;
            productId = $('#productId_'+order_cart_id).val();
            cart_product_qtyy.value=productId+":"+order_cart_qty;
          }

          objForm.method="post";
          objForm.action="/order/orderAllCartProducts.do";
          objForm.submit();
          
      }


    </script>
    <style>
      .emptyProductMsg {
        text-align: center;
      }
      .product_salesPrice {
        text-align: right;
      }
      .line_text {
        font-size: 14px;
        color: #e1dddb;
        text-decoration: line-through;
      }
   
    </style>
  </head>
  <body>
  
      <div class="cart-main">
        <h3 class="cart-text01">장바구니</h3>
        <div id="cart-ch">
          <a href="javascript:getSelectedCheckboxValues()">선택삭제</a>
          <div class="header_top_bar"></div>
          <!--일자 바-->
          <a href="#">전체선택</a>
          <input type="checkbox" id="cart-all-check" />
        </div>

        <div class="cart-text02">
          예약 배송 상품: ${reserveCount1}개
          <div class="cartresult">
            <button type="button" id="cartShowBtn">
              <img
                src="${ContextPath }/img/image_icon/down.png"
                width="20px"
                height="20px"
              />
            </button>

            <button type="button" id="cartHideBtn">
              <img
                src="${ContextPath }/img/image_icon/up.png"
                width="20px"
                height="20px"
              />
            </button>
          </div>
        </div>
        <form name = "frm_order">
        <div>
          <div>
            <div id="cart-info-all">
              <c:choose>
                <c:when test="${empty resrve_product}">
                  <div class="emptyProductMsg">
                    장바구니에 담긴 상품이 없습니다.
                  </div>
                </c:when>
                <c:otherwise>
                  <c:forEach var="res" items="${resrve_product}">
                    <div id="cart-info">
                      <input
                        type="checkbox"
                        id="check${res.cartId}"
                        class="individual_cart_checkbox chkbox" 
                        value="${res.cartId}"
                        name="checked_cartId"
                        onchange="fn_totalPrice('${res.cartId}')"
                      />

                      <img
                        class="cart-image"
                        src="${contextPath}/download.do?fileName=${res.fileName}&productId=${res.productId}&cateCode=${res.cateCode}"
                      />
                      <div class="cart-text03">
                        <h5>[${res.productBrand}]<br />${res.productName}</h5>
                      </div>
                      <div class="choice-8">
                        <div class="cart-count">
                          <input
                            type="hidden"
                            id="productId_${res.cartId}"
                            value="${res.productId}"
                          />

                          <button
                            type="button"
                            aria-label="수량내리기"
                            class="cartbutton-down"
                            onclick="fn_qty_down('${res.cartId}');"
                          >
                            <img
                              src="${contextPath }/img/image_icon/minus.png"
                              width="25px"
                              height="25px"
                            />
                          </button>

                          <input
                            type="text"
                            class="inp"
                            id="qty${res.cartId}"
                            value="${res.cart_product_qty}"
                            name="cart_product_qtyy"
                            readonly
                            onchange="fn_productPrice('${res.cartId}')"
                          />
                          <button
                            type="button"
                            aria-label="수량올리기"
                            class="cartbutton-up"
                            onclick="fn_qty_up('${res.cartId}');"
                          >
                            <img
                              src="${contextPath }/img/image_icon/plus.png"
                              width="25px"
                              height="25px"
                            />
                          </button>
                        </div>
                        <div class="choice-11">
                          <c:choose>
                            <c:when test="${res.productDiscount>0}">
                              <input
                                id="discount_${res.cartId}"
                                type="hidden"
                                value="${res.productDiscount}"
                              />
                              <input
                                id="productPrice${res.cartId}"
                                type="hidden"
                                value="${res.productSalesPrice}"
                              />

                              <div>
                                <span class="redText"
                                  >${res.productDiscount}%</span
                                >
                              </div>
                              <div class="product_salesPrice">
                                <span class="choice-12">
                                <input  class="css0930" class="reservePrice" type="text"id="total_price_${res.cartId}"  value="${res.oneProductPrice}" readonly>
                                <input type="hidden" id="totalPrice${res.cartId}" value="">
                                </span>
                                <span class="choice-12">원</span>
                              </div>
                              <span class="choice-12 line_text"
                                ><fmt:formatNumber
                                  value="${res.productPrice}"
                                  type="number"
                                />원</span
                              >
                            </c:when>
                            <c:otherwise>
                              <input
                                id="productPrice${res.cartId}"
                                type="hidden"
                                value="${res.productPrice}"
                              />
                              <span
                                class="choice-12"
                                
                                ><input  class="css0930" class="reservePrice" type="text"id="total_price_${res.cartId}"  value="${res.oneProductPrice}" readonly>
                              <input type="hidden" id="totalPrice${res.cartId}" value=""> </span>
                              <span class="choice-12">원</span>
                            </c:otherwise>
                          </c:choose>
                        </div>
                      </div>
                    </div>
                  </c:forEach>
                </c:otherwise>
              </c:choose>

              <!--<div class="cart-cost">
                <h4><span id="reserve_product">13,990원</span> + <sapn id="reserve_product_deliveryPrice">3,000원</sapn> = <sapn id="reserve_product_total">16,990원</sapn></h4>
              </div>-->
            </div>
            <div class="cart-text02">
              택배 배송 상품: ${normalCount1}개
              <div class="cartresult">
                <button type="button" id="generalcartShowBtn">
                  <img
                    src="${ContextPath }/img/image_icon/down.png"
                    width="20px"
                    height="20px"
                  />
                </button>

                <button type="button" id="generalcartHideBtn">
                  <img
                    src="${ContextPath }/img/image_icon/up.png"
                    width="20px"
                    height="20px"
                  />
                </button>
              </div>
            </div>

            <div id="cart-info-all2">
              <c:choose>
                <c:when test="${empty normal_product}">
                  <div class="emptyProductMsg">
                    장바구니에 담긴 상품이 없습니다.
                  </div>
                </c:when>

                <c:otherwise>
                  <c:forEach var="normal" items="${normal_product}">
                    <div id="cart-info2">
                      <input
                        type="checkbox"
                        id="check${normal.cartId}"
                        class="individual_cart_checkbox chkbox"
                        value="${normal.cartId}"
                        name="checked_cartId"
                        onchange="fn_totalPrice('${normal.cartId}')"
                      />
                      <img
                        class="cart-image"
                        src="${contextPath}/download.do?fileName=${normal.fileName}&productId=${normal.productId}&cateCode=${normal.cateCode}"
                        alt="${normal.fileName}"
                      />
                      <div class="cart-text03">
                        <h5>
                          [${normal.productBrand}]<br />${normal.productName}
                        </h5>
                      </div>
                      <div class="choice-8">
                        <div class="cart-count">
                          <input
                            type="hidden"
                            id="productId_${normal.cartId}"
                            value="${normal.productId}"
                          />
                          <button
                            type="button"
                            aria-label="수량내리기"
                            class="cartbutton-down"
                            onclick="fn_qty_down('${normal.cartId}');"
                          >
                            <img
                              src="${contextPath }/img/image_icon/minus.png"
                              width="25px"
                              height="25px"
                            />
                          </button>
                          <input
                            type="text"
                            class="inp"
                            id="qty${normal.cartId}"
                            value="${normal.cart_product_qty}"
                            readonly
                            name="cart_product_qtyy"
                            onchange="fn_productPrice('${res.cartId}')"
                          />
                          <button
                            type="button"
                            aria-label="수량올리기"
                            class="cartbutton-up"
                            onclick="fn_qty_up('${normal.cartId}');"
                          >
                            <img
                              src="${contextPath }/img/image_icon/plus.png"
                              width="25px"
                              height="25px"
                            />
                          </button>
                        </div>
                        <div class="choice-11">
                          <c:choose>
                            <c:when test="${normal.productDiscount>0}">
                              <input
                                id="discount_${normal.cartId}"
                                type="hidden"
                                value="${normal.productDiscount}"
                              />
                              <input
                                id="productPrice${normal.cartId}"
                                type="hidden"
                                value="${normal.productSalesPrice}"
                              />
                              <div>
                                <span class="redText"
                                  >${normal.productDiscount}%</span
                                >
                              </div>
                              <div class="product_salesPrice">
                                <span
                                  class="choice-12"
                                 
                                >
                                <input  class="css0930" type="text"id="total_price_${normal.cartId}"  value="${normal.oneProductPrice}" readonly>
                                <input type="hidden" id="totalPrice${normal.cartId}" value=""></span>
                                </span>
                                <span class="choice-12">원</span>
                              </div>
                              <span class="choice-12 line_text"
                                ><fmt:formatNumber
                                  value="${normal.productPrice}"
                                  type="number"
                                />원</span
                              >
                            </c:when>
                            <c:otherwise>
                              <input
                                id="productPrice${normal.cartId}"
                                type="hidden"
                                value="${normal.productPrice}"
                              />
                              <span
                                class="choice-12"
                              
                                ><input  class="css0930" type="text"id="total_price_${normal.cartId}"  value="${normal.oneProductPrice}" readonly>
                                <input type="hidden" id="totalPrice${normal.cartId}" value=""></span>
                              <span class="choice-12">원</span>
                            </c:otherwise>
                          </c:choose>
                        </div>
                      </div>
                    </div>
                  </c:forEach>
                </c:otherwise>
              </c:choose>

              <!--<div class="cart-cost">
                <h4>18,900원 + 3,000원 = 21,900원</h4>
              </div>-->
            </div>
            <div class="cartblank"></div>
          </div>
        </div>
      </form>
      </div>
      
   




      
      
    </body>
 
</html>
