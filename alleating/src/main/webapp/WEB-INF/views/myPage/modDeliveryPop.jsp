<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%
request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
  <head>
    <title>마이페이지 배송지관리 수정 팝업창</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <style>
  
      #addressTitle{
        margin-top: 20px;
        font-size: 29px;
        font-weight: bold;
        text-align: center;
      }
      .addressText {
        font-size: 12px;
      }
      
      .areaText {
        width: 90px;
      }
      .join_input_box {
        width: 60px;
        display: inline;
      }
      .phoneSelect {
        display: inline;
        width: 80px;
      }
      .modal_table td {
        padding: 15px 0px;
      }
      .modArea{
        width: 500px;
      margin: 0 auto;
    }
    </style>
    <script>
function sample6_execDaumPostcode() {
        new daum.Postcode({
          oncomplete: function (data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ""; // 주소 변수
            var extraAddr = ""; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === "R") {
              // 사용자가 도로명 주소를 선택했을 경우
              addr = data.roadAddress;
            } else {
              // 사용자가 지번 주소를 선택했을 경우(J)
              addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if (data.userSelectedType === "R") {
              // 법정동명이 있을 경우 추가한다. (법정리는 제외)
              // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
              if (data.bname !== "" && /[동|로|가]$/g.test(data.bname)) {
                extraAddr += data.bname;
              }
              // 건물명이 있고, 공동주택일 경우 추가한다.
              if (data.buildingName !== "" && data.apartment === "Y") {
                extraAddr +=
                  extraAddr !== ""
                    ? ", " + data.buildingName
                    : data.buildingName;
              }
              // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
              if (extraAddr !== "") {
                extraAddr = " (" + extraAddr + ")";
              }
              // 조합된 참고항목을 해당 필드에 넣는다.
              document.getElementById("sample6_extraAddress").value = extraAddr;
            } else {
              document.getElementById("sample6_extraAddress").value = "";
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById("sample6_postcode").value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
          },
        }).open();
      }
      $(document).ready(function () {
        $("#receiverHp1")
          .val("${deliveryAddressVO.receiver_hp1}")
          .attr("selected", "selected");
      });
      /*정보 보내기*/
      function selectItem(){

    var addressArr;
    var num = $('#h_num').val();
    var deliveryName = $('input[name=deliveryName]').val();
    var receiver_name = $('input[name=receiver_name]').val();
    var receiver_hp1 = $('#receiverHp1').val();
    var receiver_hp2 = $('input[name=receiver_hp2]').val();
    var receiver_hp3 = $('input[name=receiver_hp3]').val();
    var zipcode = $('input[name=zipcode]').val();
    var address = $('input[name=address]').val();
    var address2 = $('input[name=address2]').val();
    var address_detail = $('input[name=address_detail]').val();
   
    addressArr={
      num:num,
      deliveryName:deliveryName,
      receiver_name:receiver_name,
      receiver_hp1:receiver_hp1,
      receiver_hp2:receiver_hp2,
      receiver_hp3:receiver_hp3,
      zipcode:zipcode,
      address:address,
      address2:address2,
      address_detail:address_detail
    };
console.log(addressArr);
window.opener.fn_modAddress(addressArr);
window.close();
}
/*-------------------------------------------------------------------------*/
    </script>
  </head>
  <body>
    <div id="addressTitle">배송지 수정</div>
    <div class="modArea">
    <table class="modal_table">
      <tr>
        <input type="hidden" id="h_num" value="${deliveryAddressVO.num}" />
        <td class="areaText">주소별칭</td>
        <td>
          <input type="text" class="form-control" name="deliveryName" value="${deliveryAddressVO.deliveryName}"/>
        </td>
      </tr>
      <tr>
        <td class="areaText">받는분</td>
        <td>
          <input
            type="text"
            class="form-control"
            name="receiver_name"
            value="${deliveryAddressVO.receiver_name}"
          />
        </td>
      </tr>
      <tr>
        <td class="areaText">휴대폰</td>
        <td>
          <select name="receiver_hp1" id="receiverHp1" class="form-select phoneSelect">
            <option value="010">010</option>
            <option value="011">011</option>
            <option value="016">016</option>
            <option value="017">017</option>
            <option value="018">018</option>
            <option value="019">019</option>
          </select>
          -<input
            type="text"
            name="receiver_hp2"
            value="${deliveryAddressVO.receiver_hp2}"
            maxlength="4"
            class="form-control join_input_box"
            oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
          />-<input
            type="text"
            name="receiver_hp3"
            value="${deliveryAddressVO.receiver_hp3}"
            maxlength="4"
            class="form-control join_input_box"
            oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
          />
        </td>
      </tr>
      <tr>
        <td>
          <input
            type="text"
            class="form-control"
            id="sample6_postcode"
            name="zipcode"
            value="${deliveryAddressVO.zipcode}"
            placeholder="우편번호"
            readonly
          />
        </td>
        <td>
          <button
            class="btn btn-outline-secondary addressBtn"
            type="button"
            id="idCheckBtn"
            onclick="sample6_execDaumPostcode()"
          >
            우편번호 찾기
          </button>
        </td>
      </tr>
      <tr>
        <td colspan="2">
          <input
            type="text"
            class="form-control"
            id="sample6_address"
            name="address"
            value="${deliveryAddressVO.address}"
            placeholder="주소"
            readonly
          />
        </td>
      </tr>
      <tr>
        <td colspan="2">
          <input
            type="text"
            class="form-control"
            id="sample6_extraAddress"
            name="address2"
            value="${deliveryAddressVO.address2}"
            placeholder="참고항목"
            readonly
          />
        </td>
      </tr>
      <tr>
        <td colspan="2">
          <input
            type="text"
            class="form-control join_input_box2"
            id="sample6_detailAddress"
            name="address_detail"
            value="${deliveryAddressVO.address_detail}"
            placeholder="상세주소"
          />
        </td>
      </tr>
    </table>
  </div>
  <button onclick="selectItem()">수정하기</button>
  </body>
</html>
