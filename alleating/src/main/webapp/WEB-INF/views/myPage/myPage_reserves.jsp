<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%
request.setCharacterEncoding("utf-8"); %>

<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<link
  href="${contextPath}/css/myPage_reserves.css"
  rel="stylesheet"
  type="text/css"
/>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>적립금</title>
  </head>
  <body>
    <div class="myreview">
      <div class="pwant">
        <div class="proW">
          <div class="want01"><h3>적립금</h3></div>
        </div>
        <div>
          <div class="review01"></div>
        </div>
        <div class="review02">
          <div>
            <h5 class="text002">
              보유하고 계신 <br />적립금의 내역을 한 눈에 확인 하실 수 있습니다.
            </h5>
          </div>
        </div>
      </div>

      <table id="title001" align="center" border="1" width="100%">
        <thead class="title">
          <tr height="60" align="center">
            <td id="title01">날짜</td>
            <td id="title02">내용</td>
            <td id="title03">금액</td>
          </tr>
        </thead>
        <tbody>
          <tr height="60" align="center">
            <td id="title01">2023-08-21</td>
            <td id="title02">ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</td>
            <td id="title03">+350원</td>
          </tr>
          <tr height="60" align="center">
            <td id="title01">2023-08-21</td>
            <td id="title02">ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</td>
            <td id="title03">+350원</td>
          </tr>
        </tbody>
      </table>
    </div>
  </body>
</html>
