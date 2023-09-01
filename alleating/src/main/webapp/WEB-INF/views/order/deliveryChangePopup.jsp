<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%
request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
  <head>
    <title>배송지 변경 팝업창</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
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
    <script>
      $('.deliveryChangeBtn').click(function(){
        var checked = $('input[name=addressNum]:checked').val();
        $("#receiverName", opener.document).val($("#dliveryName_"+checked).val());
        $("#receiverHp", opener.document).val($("#reHp_"+checked).val());
        $("#zipcode", opener.document).val($("#zipcode_"+checked).val());
        $("#address", opener.document).val($("#address_"+checked).val());
        $("#address", opener.document).val($("#address_"+checked).val());
        var address2 = $('address2_'+checked).val();
        if(address2 != null){
          $("#address2", opener.document).val($("#address2_"+checked).val());
        }
        $("#addressDetail", opener.document).val($("#address_detail_"+checked).val());

        window.close();
      });
    </script>
  </head>
  <body>
    <div id="addressTitle">배송지 변경</div>
    <div id="addressTable">
    <table class="table table-hover" id="popuptitle" align="center" border="1" width="100%">
      <thead class="title">
        <tr height="60">
          <td></td>
          <td>배송지 이름</td>
          <td>받으실 분</td>
          <td>배송주소</td>
          <td>연락처</td>
          <td>관리</td>
        </tr>
      </thead>
      <tbody>
        <c:choose>
          <c:when test="${empty addressList}">
              <td colspan="6">배송지 없음</td>
          </c:when>
          <c:otherwise>
            <c:forEach var="addressInfo" items="${addressList}">
              <tr height="60">
                <td>
                  <input
                    class="form-check-input address_num"
                    type="radio"
                    value="${addressInfo.num}"
                    name="addressNum"
                    id="flexCheckDefault"
                  />
                </td>
                <c:choose>
                  <c:when test="${addressInfo.default_address == 'y'}">
                    <td>
                      <span class="redText">[기본배송지]</span><br />
                      <span id="dliveryName_${addressInfo.num}">${addressInfo.deliveryName}</span>
                    </td>
                  </c:when>
                  <c:otherwise>
                    <td><span id="dliveryName_${addressInfo.num}">${addressInfo.deliveryName}</span></td>
                  </c:otherwise>
                </c:choose>
                <td><span id="reName_${addressInfo.num}">${addressInfo.receiver_name}</span></td>
                <td class="addressText">
                  (<span id="zipcode_${addressInfo.num}">${addressInfo.zipcode}</span>)<br />
                  <span id="address_${addressInfo.num}">${addressInfo.address}</span>&nbsp;<span id="address2_${addressInfo.num}">${addressInfo.address2}</span><br />
                  <span id="address_detail_${addressInfo.num}">${addressInfo.address_detail}</span>
                </td>
                <td>
                  <span id="reHp_${addressInfo.num}">${addressInfo.receiver_hp1}-${addressInfo.receiver_hp2}-${addressInfo.receiver_hp3}</span>
                </td>
                <td>
                  <button class="deliveryChangeBtn">적용</button>
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
