<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %> <%
request.setCharacterEncoding("utf-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!--예약배송 상품-->
<c:set var="resrve_product" value="${product_map.reserveProductList}" />
<c:set var="reserveCount1" value="${product_map.reserveCount}" />

<!--일반배송 상품-->
<c:set var="normal_product" value="${product_map.normalProductList}" />
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
        fn_totalPrice();
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

      
      /*장바구니 수량 증가*/
      function fn_qty_up(cartId) {
        var qty = $("#qty" + cartId).val();

        if(qty >= 10){
          alert("10개이상 선택 할 수 없습니다.");
          return false;
        }
        ++qty;

        $("#qty" + cartId).attr("value", qty);
        var productId = $("#productId_" + cartId).val();

        $.ajax({
          type: "POST",
          async: true, 
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
      /*---------------------------------------------------------*/

      /*장바구니 수량 감소*/
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
          async: true, 
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
     /*---------------------------------------------------------*/


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
        $("#total_price_" + cartId).text(result);
        fn_totalPrice();
      }
      /* 체크한 상품만 계산*/
      function fn_totalPrice(){
        var str = "";
                var sum = 0;
                var deliveryPrice;
                var count = $(".chkbox:checked").length;
                if(count>0){
                  deliveryPrice = 3000;
                }else{
                  deliveryPrice = 0;
                }
               
                $('input:checkbox[name=checked_cartId]:checked').each(function (index) {
                /*for (var i = 0; i < count; i++) {
                    if ($(".chkbox")[i].checked == true) {
                        var cartId = $(".chkbox")[i].value;
                        var productPrice = $('#totalPrice'+cartId).val();
                        console.log(productPrice);
                        sum +=Number(productPrice);
                    }
                }*/
                  var cartId = $(this).val();
                  console.log(cartId);
                  var productPrice = $('#totalPrice'+cartId).val();
                  sum +=Number(productPrice);
              });
                var total = sum+deliveryPrice;
                
                var _total = total .toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
                var _sum = sum .toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
                var _deliveryPrice = deliveryPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","); 
                $('#productCount').attr('value',count);
                $("#total_sum").text(_sum);
                $('#deliveryPrice').text(_deliveryPrice);
                $('#td').text(_total);

                $('#h_productCount').attr('value',count);
                $("#h_total_sum").attr('value',sum);
                $('#h_deliveryPrice').attr('value', deliveryPrice);
                $('#h_td').attr('value',total);
                
      }
      /*---------------------------------------------------------------------------*/

      /*체크한 상품만 결제페이지로 이동*/
      function getcheck(){
        var checkCartId;
        var productId;
        var productName;
        var productQty;
        var productDiscount;
        var productPrice;
        var cateCode;
        var fileName;
        var deliveryType;
        var productBrand;
        var allEatingOrderDetailes = [];

        var length = $('input:checkbox[name=checked_cartId]:checked').length;
        if(length == 0){
              alert('최소 한개의 상품을 선택해 주세요.');
              return false;
            }
        $('input:checkbox[name=checked_cartId]:checked').each(function (index) {
         
    	      checkCartId=$(this).val();
            
             productId = $('#productId_' + checkCartId).val();
             productName = $('#productName_' + checkCartId).val();
             productPrice = $('#productPrice' + checkCartId).val();
             productDiscount = $('#discount_' + checkCartId).val();
             productQty = $('#qty' + checkCartId).val();
             cateCode = $('#cateCode_' + checkCartId).val();
             fileName = $('#fileName_' + checkCartId).val();
             deliveryType = $('#h_deliveryType'+ checkCartId).val();
             productBrand = $('#h_productBrand'+checkCartId).val();

             allEatingOrderDetailes.push({
              productId: productId,
              productName: productName,
              productPrice: productPrice,
              productDiscount: productDiscount,
              productQty: productQty,
              cateCode: cateCode,
              fileName :fileName,
              deliveryType : deliveryType,
              productBrand : productBrand
             });
      
          });
          $.ajax({
        type: "POST",
        url: "${contextPath}/order/orderAllCartProducts.do",
        data: JSON.stringify(allEatingOrderDetailes),
        contentType: "application/json;charset=UTF-8",
        success: function (response) {
            console.log("서버 응답 성공");
          location.href="/order/pay_02.do";
        },
        error: function (error) {
            console.error("오류 발생:", error);
        }
    });
        } 
        /*---------------------------------------------------------------------------*/
         
      /* 체크한 상품 선택 삭제 */
        function selectDelete(){
        var cartId;
        var cartArray =[];
        
        $('input:checkbox[name=checked_cartId]:checked').each(function (index) {
           cartId = $(this).val();
          cartArray.push({"cartId":cartId});
        });
        console.log(cartArray);
        
        var del = confirm("선택하신 상품을 장바구니에서 삭제하시겠습니까?");
  if(del){
        $.ajax({
        type: "POST",
        url: "${contextPath}/cart/removeProductArray.do",
        data: JSON.stringify(cartArray),
        contentType: "application/json;charset=UTF-8",
        success: function (response) {
          alert(response);
          location.href="/cart/myCart.do";
        },
        error: function (error) {
            console.error("오류 발생:", error);
        }
      
    });
  }//end if
      }   
      /*----------------------------------------------------------------------------*/
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
          <a href="javascript:selectDelete()">선택삭제</a>
          <div class="header_top_bar"></div>
          <!--일자 바-->
          전체선택
          <input type="checkbox" id="cart-all-check" checked />
        </div>
        <form name = "frm_order">
          
          <input type="hidden" id="h_productCount" value="" />
          <input type="hidden" id="h_total_sum" value="" />
          <input type="hidden" id="h_deliveryPrice" value="" />
          <input type="hidden" id="h_td" value="" />
          

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
                        checked
                        />

                      <img
                        class="cart-image"
                        src="${contextPath}/download.do?fileName=${res.fileName}&productId=${res.productId}&cateCode=${res.cateCode}"
                      />
                      <input type="hidden" id="cateCode_${res.cartId}" value="${res.cateCode}" />
                      <input type="hidden" id="productName_${res.cartId}" value="${res.productName}"/>
                      <input type="hidden" id="fileName_${res.cartId}" value="${res.fileName}"/>
                      <input type="hidden" id="h_deliveryType${res.cartId}" value="${res.deliveryType}" />
                      <input type="hidden" id="h_productBrand${res.cartId}" value="${res.productBrand}"  /> 
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
                                <span class="choice-12" id="total_price_${res.cartId}">
                                  <fmt:formatNumber value="${res.oneProductPrice}" type="number" />
                                </span>
                                <input type="hidden" id="totalPrice${res.cartId}" value="${res.oneProductPrice}">
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
                              id="discount_${res.cartId}"
                              type="hidden"
                              value="${res.productDiscount}"
                            />
                              <input
                                id="productPrice${res.cartId}"
                                type="hidden"
                                value="${res.productPrice}"
                              />
                             
                              <span class="choice-12" id="total_price_${res.cartId}">
                                <fmt:formatNumber value="${res.oneProductPrice}" type="number" />
                               </span>
                              <span class="choice-12">원</span>
                              <input type="hidden" id="totalPrice${res.cartId}" value="${res.oneProductPrice}">
                            </c:otherwise>
                          </c:choose>
                        </div>
                      </div>
                      <div class="cartDelBtn">
                        <a href="${contextPath}/cart/removeProduct.do?cartId=${res.cartId}">
                          <img src="${contextPath}/img/image_icon/free-icon-x.png" width="30px" height="30px"/>
                        </a>
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
                        checked
                      />
                      <img
                        class="cart-image"
                        src="${contextPath}/download.do?fileName=${normal.fileName}&productId=${normal.productId}&cateCode=${normal.cateCode}"
                        alt="${normal.fileName}"
                      />
                      <input type="hidden" id="h_deliveryType${normal.cartId}" value="${normal.deliveryType}" />
                      <input type="hidden" id="cateCode_${normal.cartId}" value="${normal.cateCode}" />
                      <input type="hidden" id="productName_${normal.cartId}" value="${normal.productName}"/>
                      <input type="hidden" id="fileName_${normal.cartId}" value="${normal.fileName}"/>
                      <input type="hidden" id="h_productBrand${normal.cartId}" value="${normal.productBrand}"  /> 
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
                                <span class="choice-12" id="total_price_${normal.cartId}">
                                  <fmt:formatNumber value="${normal.oneProductPrice}" type="number" />
                                </span>
                                <input type="hidden" id="totalPrice${normal.cartId}" value="${normal.oneProductPrice}">
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
                              id="discount_${normal.cartId}"
                              type="hidden"
                              value="${normal.productDiscount}"
                            />
                              <input
                                id="productPrice${normal.cartId}"
                                type="hidden"
                                value="${normal.productPrice}"
                              />
                              <span class="choice-12" id="total_price_${normal.cartId}">
                                <fmt:formatNumber value="${normal.oneProductPrice}" type="number" />
                              </span>
                              <input type="hidden" id="totalPrice${normal.cartId}" value="${normal.oneProductPrice}">
                              <span class="choice-12">원</span>
                            </c:otherwise>
                          </c:choose>
                        </div>
                      </div>
                      <div class="cartDelBtn">
                        <a href="${contextPath}/cart/removeProduct.do?cartId=${normal.cartId}">
                          <img src="${contextPath}/img/image_icon/free-icon-x.png" width="30px" height="30px"/>
                        </a>
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
