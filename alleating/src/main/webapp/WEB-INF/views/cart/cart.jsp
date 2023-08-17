<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%
request.setCharacterEncoding("utf-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<link href="${contextPath}/css/cart_01.css" rel="stylesheet" type="text/css" />
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>장바구니</title>
    <script type="text/javascript">
/*       function checkAll() {
        if (document.getElementById("all").checked == true) {
          //id 를 사용하여 하나의 객체만을 호출
          for (var i = 0; i < 3; i++)
            document.getElementsByName("checkBox")[i].checked = true; //name 을 사용하여 배열 형태로 담아 호출
        }
        if (document.getElementById("all").checked == false) {
          for (var i = 0; i < 3; i++)
            document.getElementsByName("checkBox")[i].checked = false;
        }
      }
 */
      
  $(function(){
	  
	  $('#cartShowBtn').hide();

  $('#cartShowBtn').click(function() {
	  $('#cartHideBtn').show();
	 /*  $('#cartShowDiv').show(); */
      $('#cartShowBtn').hide();
    /*   $('#cartShowDiv').fadeIn(5000)
       $('#cartShowDiv').delay(5000) */
      // goodsBtn을 클릭하면 goodsDiv를 보여줘라
   
      $('#cartShowDiv').slideDown(500);
      
  })
   
  $('#cartHideBtn').click(function() {
	  $('#cartShowBtn').show();
	/*   $('#cartShowDiv').hide(); */
	  $('#cartHideBtn').hide();
	  $('#cartShowDiv').slideUp(500);
     
      // goodsBtn을 클릭하면 goodsDiv를 숨겨라
   
  })
   });
 
 
 /* $("div").fadeIn(1000).delay(1000).fadeOut(1000); */
 
/*  fadein 나타남 fadeout 사라짐 */
  </script>

      
     
   
  </head>
  <body>
    <div class="cart-main">
      <h3 class="cart-text01">장바구니</h3>
      <div id="cart-ch">
        <a href="${contextPath}/member/loginForm.do">선택삭제</a>
        <div class="header_top_bar"></div>
        <!--일자 바-->
        <a href="#">전체선택</a>
        <input type="checkbox" id="all" name="all" />
      </div>
     
      <div class="cart-text02">예약 배송 상품: 1개
      <div class="cartresult"> 
      <button type="button" id="cartShowBtn"><img src="${ContextPath }/img/image_icon/down.png" width="20px" height="20px" ></button>
     
       <button type="button" id="cartHideBtn"><img src="${ContextPath }/img/image_icon/up.png" width="20px" height="20px"></button>
      </div>
      </div>
      <div>
        <div>
         <div >
          <div class="cart-info" id="cartShowDiv" >
            <input type="checkbox" name="checkBox" />
            <img
              class="cart-image"
              src="${contextPath}/img/image_food/shinemuscat.JPG"
              alt="Image 1"
            />
            <div class="cart-text03">
              <h5>[All eating]<br />저탄소 샤인머스켓</h5>
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
          <div class="cart-text02">택배 배송 상품: 0개</div>
        </div>
      </div>
    </div>
  </body>
</html>
