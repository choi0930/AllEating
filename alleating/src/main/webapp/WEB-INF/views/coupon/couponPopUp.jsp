<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%
request.setCharacterEncoding("utf-8"); %>
<c:set var="couponList" value="${responseMap.allEatingOrderDetailes}" />
<!DOCTYPE html>
<html>
  <head>
    <title>배송지 변경 팝업창</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <style>
      #addressTable{
        width: 700px;
        margin:  30px auto;
        
      }
      #popuptitle tr td{
          font-size: 12px;
      }
      #popuptitle tr {
          vertical-align:  middle;
      }
      #addressTitle{
        margin-top: 20px;
        font-size: 29px;
        font-weight: bold;
        text-align: center;
      }
    </style>
  </head>
  <body>
    <div id="addressTitle">배송지 변경</div>
    <div id="addressTable">
    <table class="table table-hover" id="popuptitle" align="center" border="1" width="100%">
      <thead class="title">
        <tr height="60">
          <td>상품 이름</td>
          <td>적용가능한 쿠폰</td>
          <td></td>
        </tr>
      </thead>
      <tbody>
        <c:choose>
          <c:when test="${empty couponList}">
              <td colspan="6">쿠폰 없음</td>
          </c:when>
          <c:otherwise>
            <c:forEach var="couponInfo" items="${couponList}" varStatus="loop">
              <tr height="60">
               <td>[${couponInfo.productBrand}]<br>${couponInfo.productName}</td>
               <td>
           
             <select>
                  <c:forEach items="${couponInfo.couponList}" var="list">
                    <option>${list.coupon_name}/${list.couponDiscountRate}%</option>
                  </c:forEach>
                </select> 
               </td>
              </tr>
            </c:forEach>
          </c:otherwise>
        </c:choose>
       
      </tbody>
    </table>
  </div>
  </body>
</html>
