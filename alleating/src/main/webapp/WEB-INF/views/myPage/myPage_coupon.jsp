<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%
request.setCharacterEncoding("utf-8"); %>

<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<link
  href="${contextPath}/css/myPage_coupon.css"
  rel="stylesheet"
  type="text/css"
/>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>쿠폰</title>
  </head>
  <body>
    <div class="pwant">
      <div class="proW">
        <div class="want01"><h3>쿠폰</h3></div>
        <div class="text01">
          쿠폰은 적용 가능한 상품이<br />
          따로 적용되어 있는 경우 해당 상품 구매 시에만 사용이 가능합니다.
        </div>
      </div>

      <form
        name="editpwd"
        method="post"
        action="${contextPath}/myPage/myPage_coupon.do"
      >
        <div class="coupon01">
          <div class="text01">
            <div class="text02">
              <div class="form_info">
                <div class="form_value_box">
                  <div class="couptext01">
                    <div class="form_input_box">
                      <input
                        type="text"
                        class="form-control join_input_box"
                        id="coupon_id"
                        name="name"
                        placeholder="쿠폰 번호를 입력해주세요."
                      />
                    </div>
                    <div class="form_end">
                      <button class="join_end_btn" onclick="fn_loginGO()">
                        <span id="join_btn2_text">등록</span>
                      </button>
                    </div>
                  </div>
                  <span class="hideConditionText redText" id="join_name_ex"
                    >쿠폰에 하이픈'-'이 포함되어 있을경우, 반드시 하이븐'-'을
                    입력해주세요
                  </span>
                  <div id="nameCheckMessge"></div>
                </div>
                <div class="form_button_box"></div>
              </div>
            </div>
          </div>

          <table id="title001" align="center" border="1" width="100%">
            <thead class="title">
              <tr height="60" align="center">
                <td id="title01">날짜</td>
                <td id="title02">내용</td>
              </tr>
            </thead>
            <tbody>
              <tr height="60" align="center">
                <td id="title01">2023-08-21</td>
                <td id="title02">ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</td>
              </tr>
              <tr height="60" align="center">
                <td id="title01">2023-08-21</td>
                <td id="title02">ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</td>
              </tr>
            </tbody>
          </table>
        </div>
      </form>
    </div>
  </body>
</html>
