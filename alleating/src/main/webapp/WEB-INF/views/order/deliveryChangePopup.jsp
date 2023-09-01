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
      function selectItem(){

    var resArr = new Array();
    var a;
    

$("input[name='addressNum']:checked").each(function(index) {
var num = $(this).val();
//var resObj = new Object();
// $tr = $("#tr_"+num);
// resObj.deliveryName             = $tr.find("input[name=deliveryName']").val();
// resObj.receiver_name            = $tr.find("input[name='receiver_name']").val();
// resObj.zipcode           = $tr.find("input[name='zipcode']").val();
// resObj.address         = $tr.find("input[name='address']").val();
// resObj.address2     = $tr.find("input[name='address2']").val();
// resObj.address_detail     = $tr.find("input[name='address_detail']").val();
// resObj.receiver_hp = $tr.find("input[name='receiver_hp']").val();
var deliveryName = $('#receiver_name_'+num).val();
var zipcode = $('#zipcode_'+num).val();
var address = $('#address_'+num).val();
var address2 = $('#address2_'+num).val();
var address_detail = $('#address_detail_'+num).val();
var receiver_hp = $('#receiver_hp_'+num).val();
 console.log(deliveryName);
var _address = zipcode+"</br>"+address+address2+"</br>"+address_detail
resArr.push(deliveryName);
resArr.push(_address);
resArr.push(receiver_hp);

console.log(resArr);
});
window.opener.setResList(resArr);
window.close();
}
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
              <tr id="tr_${addressInfo.num}" height="60">
                <td>
                  <input type="hidden" id="receiver_name_${addressInfo.num}" value="${addressInfo.receiver_name}" />
                  <input type="hidden" id="zipcode_${addressInfo.num}" value="${addressInfo.zipcode}" />
                  <input type="hidden" id="address_${addressInfo.num}" value="${addressInfo.address}" />
                  <input type="hidden" id="address2_${addressInfo.num}" value="${addressInfo.address2}" />
                  <input type="hidden" id="address_detail_${addressInfo.num}" value="${addressInfo.address_detail}" />
                  <input type="hidden" id="receiver_hp_${addressInfo.num}" value="${addressInfo.receiver_hp1}-${addressInfo.receiver_hp2}-${addressInfo.receiver_hp3}" />
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
                      ${addressInfo.deliveryName}
                    </td>
                  </c:when>
                  <c:otherwise>
                    <td>${addressInfo.deliveryName}</td>
                  </c:otherwise>
                </c:choose>
                <td>${addressInfo.receiver_name}</td>
                <td class="addressText">
                  (${addressInfo.zipcode})<br />
                  ${addressInfo.address}&nbsp;${addressInfo.address2}<br />
                  ${addressInfo.address_detail}
                </td>
                <td>
                  ${addressInfo.receiver_hp1}-${addressInfo.receiver_hp2}-${addressInfo.receiver_hp3}
                </td>
                <td>
                  <button class="deliveryChangeBtn" onclick="selectItem()">적용</button>
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
