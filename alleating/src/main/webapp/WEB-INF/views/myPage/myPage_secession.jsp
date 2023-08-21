<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%
request.setCharacterEncoding("utf-8"); %>

<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<link
  href="${contextPath}/css/myPage_secession.css"
  rel="stylesheet"
  type="text/css"
/>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>찜한 상품</title>
  </head>
  <body>
    <div class="pwant">
      <div class="proW">
        <div class="want01"><h3>탈퇴하기</h3></div>
      </div>
      <div class="edit01">
        <div class="edit03">
          <div class="text02">
            <textarea
              class="text03"
              id="myPage_secession"
              name="secession"
              rows="12"
              cols="95"
            >
 우리 약관도 있구나...</textarea
            >
          </div>
        </div>
      </div>
      <form
        name="myPagesecession"
        method="post"
        action="${contextPath}/myPage/myPage_secession.do"
      >
        <div class="text04">
          <div class="form_end">
            <button class="join_censel_btn" onclick="fn_loginGO()">
              <span id="join_btn_text">취소</span>
            </button>
          </div>
          <div class="form_end">
            <button class="join_end_btn" onclick="fn_loginGO()">
              <span id="join_btn2_text">탈퇴 하기</span>
            </button>
          </div>
        </div>
      </form>
    </div>
  </body>
</html>
