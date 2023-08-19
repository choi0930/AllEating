<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%
request.setCharacterEncoding("utf-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<link
  href="${contextPath}/css/productexchange.css"
  rel="stylesheet"
  type="text/css"
/>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>취소 신청</title>
  </head>
  <body>
    <div class="proC">
      <div class="text01"><h4>반품 신청</h4></div>
      <div class="cancel_01">
        <div class="capture">
          <img
            src="${contextPath}/img/image_food/shinemuscat.JPG"
            width="120"
            height="120"
            alt="Image 2"
          />
        </div>
        <div class="qwe">
          <div class="detail_01"><h4>[All Eating] 샤인머스켓</h4></div>
          <div class="detail_01"><h5 id="asd">35,000원</h5></div>
          <div class="detail_01"><h5 id="asd">2개</h5></div>
        </div>
      </div>
      <form action="${contextPath}/myPage/productReturn.do" method="post">
        <div>
          <div class="reason">
            <select id="uclass">
              <option selected>반품 사유를 선택해주세요.</option>
                <option value="so">ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ</option>
                <option value="so">단숨 변심</option>
                <option value="so">주문 실수</option>
                <option value="so">파손 및 불량</option>
                <option value="so">오배송 및 지연</option>
                <option value="so">기타</option>
             </optgroup>
           </select>
         </div>
          <div class="text02">
            <textarea id="text03" name="productreturn_reason" rows="9" cols="95"></textarea>
         </div>
       </div>
      <div class="text04">
         <div class="form_end">
           <button class="join_censel_btn" onclick="fn_loginGO()">
             <span id="join_btn_text">취소</span>
            </button>
         </div>
       <div class="form_end">
         <button class="join_end_btn" onclick="fn_loginGO()">
           <span id="join_btn2_text">신청 하기</span>
          </button>
       </div>
      </div>
      </form>
    </div>
  </body>
</html>