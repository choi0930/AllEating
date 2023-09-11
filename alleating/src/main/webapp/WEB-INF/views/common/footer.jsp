<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>하단 부분</title>
    <style>
      #footer {
        font-size: 15px;
        text-align: center;
      }
      #footer div {
        display: inline-block; /* 가로로 나열하기 위해 block레벨 요소를 inline-block레벨로 전환 */
      
        position: relative;
       
        text-align: LEFT;
      }
      #address {
        text-decoration: none;
        text-color: black;
      }
      #right {
        margin-top: 30px;
        height: 200px;
        width: 300px;
      }
      .first {
        flex-direction: column;
        align-items: center;
      }
      .second {
        flex-direction: column;
        align-items: center;
        padding-bottom: 20px;
      }
      .third {
        flex-direction: column;
        align-items: center;
      }
      .footerlogo {
        bottom: 54px;
      }
      #footer2{
        width: 1050px;
      }
    </style>
  </head>

  <body>
    <div id="footer2">
    <div id="footer">
      <div class="footerlogo">
        <img
          src="${contextPath}/img/image_logo/alleating_logo_background_X.jpg"
          width="200px"
        />
      </div>
      <div>
        <p>
          법인명(상호): All Eating | 123-45-678910<br />
          공동 대표 이사: 최현진, 박건태, 류서형, 조승기<br />
          <a href="#" id="address"
            >주소: 대전광역시 서구 대덕대로 182 오라클빌딩 10층 1005호<br
          /></a>
          통신판매업: 제 2023-대전둔산-0123456호<br />
          채용문의: alleating@test.com
        </p>
      </div>
    </div>

    <div id="right">
      <div class="fist">
        <p>
          <b>Service Center<br /></b>
          042-476-2111<br />
        </p>
      </div>
      <div class="second">
        <button type="button" class="btn btn-outline-secondary">
          공지사항
        </button>
        <button type="button" class="btn btn-outline-secondary">1:1문의</button>
      </div>
      <!--<div class="third">
        <img
          src="${contextPath}/img/image_sns/instagram_logo.png"
          width="50px"
          height="50px"
        />
        <img
          src="${contextPath}/img/image_sns/facebook_logo.png"
          width="50px"
          height="50px"
        />
        <img
          src="${contextPath}/img/image_sns/youtube_logo.png"
          width="50px"
          height="50px"
        />
      </div>-->    </div>
  </div>
  </body>
</html>
