<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%
request.setCharacterEncoding("utf-8"); %>

<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<link
  href="${contextPath}/css/myPage_04.css"
  rel="stylesheet"
  type="text/css"
/>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>상품 문의</title>
  </head>
  <body>
    <div class="pwant">
      <div class="proW">
        <div class="want01"><h3>상품 문의</h3></div>
        <div class="text01">
          상품에 대한 문의를 남기는 곳입니다.<br />
          해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수
          있습니다.<br />
          배송관련, 주문 관련 문의 및 요청 사항은 올잇팅 내 1:1문의에 남겨주시기
          바랍니다.
        </div>
      </div>

      <table id="title001" align="center" border="1" width="100%">
        <thead class="title">
          <tr height="60" align="center">
            <td id="title01">아이디</td>
            <td id="title02">제목</td>
            <td id="title03">작성일</td>
            <td id="title04">답변 상태</td>
          </tr>
        </thead>
        <tbody>
          <tr height="60" align="center">
            <td id="title01">whtmdrl</td>
            <td id="title02">ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</td>
            <td id="title03">2023-08-21</td>
            <td id="title04">완</td>
          </tr>
          <tr height="60" align="center">
            <td id="title01">whtmdrl</td>
            <td id="title02">ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</td>
            <td id="title03">2023-08-21</td>
            <td id="title04">완</td>
          </tr>
        </tbody>
      </table>
    </div>
  </body>
</html>
