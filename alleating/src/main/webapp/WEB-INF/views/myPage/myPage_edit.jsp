<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%
request.setCharacterEncoding("utf-8"); %>

<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<link
  href="${contextPath}/css/myPage_edit.css"
  rel="stylesheet"
  type="text/css"
/>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>개인 정보 수정</title>
  </head>
  <body>
    <div class="pwant">
      <div class="proW">
        <div class="want01"><h3>개인 정보 수정</h3></div>
        <div class="text01">
          비밀번호 재확인<br />
          회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한 번 입력
          해주세요.
        </div>
      </div>

      <form
        name="editpwd"
        method="post"
        action="${contextPath}/member/checkPasswordAndRedirect"
      >
        <div class="edit01">
          <div class="edit02">
            <label class="text02">비밀번호</label>
            <span class="redText">*</span>
          </div>
          <div class="edit03">
            <div class="edit_box">
              <input
                type="password"
                class="editpwd_box"
                id="edit_pwd"
                name="pwd"
              />
            </div>
          </div>
        </div>
        <div class="text04">
          <div class="form_end">
            <button class="join_end_btn" type="submit">
              <span id="join_btn2_text">확인하기</span>
            </button>
          </div>
        </div>
      </form>
    </div>
  </body>
</html>
