<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%
request.setCharacterEncoding("utf-8"); %>

<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<link
  href="${contextPath}/css/myPage_ad.css"
  rel="stylesheet"
  type="text/css"
/>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>배송지 관리</title>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
      /* 마이페이지: 배송지 추가 */
      function fn_addDeliveryAddress() {
        var deliveryName = $("input[name=deliveryName]").val();
        var receiver_name = $("input[name=receiver_name]").val();
        var receiver_hp1 = $("select[name=receiver_hp1]").val();
        var receiver_hp2 = $("input[name=receiver_hp2]").val();
        var receiver_hp3 = $("input[name=receiver_hp3]").val();
        var zipcode = $("input[name=zipcode]").val();
        var address = $("input[name=address]").val();
        var address2 = $("input[name=address2]").val();
        var address_detail = $("input[name=address_detail]").val();
        var addressInfo = {
          deliveryName: deliveryName,
          receiver_name: receiver_name,
          receiver_hp1: receiver_hp1,
          receiver_hp2: receiver_hp2,
          receiver_hp3: receiver_hp3,
          zipcode: zipcode,
          address: address,
          address2: address2,
          address_detail: address_detail,
        };
        $.ajax({
          type: "POST",
          async: true,
          url: "${contextPath}/myPage/myPage_addAddress.do",
          data: JSON.stringify(addressInfo),
          contentType: "application/json",
          dataType: "text",
          success: function (data) {
            $(".modal").hide();
            alert(data);
            location.href = "/myPage/myPage_address.do";
          },
          error: function (data) {
            alert("에러가 발생했습니다.");
          },
        });
      }
      /*------------------ 마이페이지: 배송지 추가 끝 ---------------------*/

      /* 마이페이지: 배송지 삭제 */
      function fn_delete(num) {
        var addressInfo = { num: num };
        $.ajax({
          type: "POST",
          async: true,
          url: "${contextPath}/myPage/myPage_delAddress.do",
          data: JSON.stringify(addressInfo),
          contentType: "application/json",
          dataType: "text",
          success: function (data) {
            $(".modal").hide();
            alert(data);
            location.href = "/myPage/myPage_address.do";
          },
          error: function (data) {
            alert("에러가 발생했습니다.");
          },
        });
      }
      /*---------------------- 마이페이지: 배송지 삭제 끝 ---------------------*/

      function fn_changeDefault() {
        var addressNum = $('input[name=addressNum]:checked').val();
        addressInfo = {num : addressNum};
        $.ajax({
          type: "POST",
          async: true,
          url: "${contextPath}/myPage/myPage_modDefaultAddress.do",
          data: JSON.stringify(addressInfo),
          contentType: "application/json",
          dataType: "text",
          success: function (data) {
            alert(data);
            location.href = "/myPage/myPage_address.do";
          },
          error: function (data) {
            alert("에러가 발생했습니다.");
          }
        });
      }
      /* 배송지 수정 팝업창 */
      function fn_modDeliveryAddress(num){
        let popUrl = "/myPage/modDeliveryPop.do?num="+num;
        let popOption = "width = 500px, height = 550px, top = 300px, left = 300px, scrollbars=yes";
        window.open(popUrl, "배송지 수정", popOption);
      }
 
      function fn_modAddress(addressArr){
        console.log(addressArr);
        $.ajax({
          type:"POST",
          async : true,
          url:"${contextPath}/myPage/modAddress.do",
          data: JSON.stringify(addressArr),
          contentType: "application/json",
          dataType:"text",
          success: function(data) {
            alert("배송지 수정 완료");
            console.log(data);
            location.href = "/myPage/myPage_address.do";
          },
          error: function (data) {
            alert("에러가 발생했습니다.");
          }
        });
      }
    </script>
    <style>
      .addressText {
        font-size: 12px;
      }
      .addressArea {
        margin: 0 auto;
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
      #title001 tr{
        border-bottom: 1px solid #e1ddde;
      }
      #title001 tr td{
        padding: 17px 10px;
      }
      .defaultAddressBtn{
        margin-top: 20px;
      }
    </style>
  </head>
  <body>
    <!-------------------------------------- Modal ----------------------------------------->
    <div
      class="modal fade"
      id="exampleModal"
      tabindex="-1"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="exampleModalLabel">배송지 추가</h1>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <div class="modal-body addressArea">
            <table class="modal_table">
              <tr>
                <td class="areaText">주소별칭</td>
                <td>
                  <input type="text" class="form-control" name="deliveryName" />
                </td>
              </tr>
              <tr>
                <td class="areaText">받는분</td>
                <td>
                  <input
                    type="text"
                    class="form-control"
                    name="receiver_name"
                  />
                </td>
              </tr>
              <tr>
                <td class="areaText">휴대폰</td>
                <td>
                  <select name="receiver_hp1" class="form-select phoneSelect">
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
                    maxlength="4"
                    class="form-control join_input_box"
                    oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
                  />-<input
                    type="text"
                    name="receiver_hp3"
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
                    placeholder="상세주소"
                  />
                </td>
              </tr>
            </table>
          </div>
          <div class="modal-footer">
            <button
              type="button"
              class="btn btn-secondary"
              data-bs-dismiss="modal"
            >
              닫기
            </button>
            <button
              type="button"
              class="btn btn-primary"
              onclick="fn_addDeliveryAddress()"
            >
              배송지 추가
            </button>
          </div>
        </div>
      </div>
    </div>
    <!--------------------------------------모달 끝------------------------------------------->

    <div class="pwant">
      <div class="proW">
        <div class="want01"><h3>배송지 관리</h3></div>
        <div class="form_input_box">
          <button
            type="button"
            class="btn btn-primary"
            data-bs-toggle="modal"
            data-bs-target="#exampleModal"
          >
            + 새 배송지 추가
          </button>
        </div>
        <div class="text01">
          배송지에 따라 상품정봉 및 배송유형이 달리질 수 있습니다.
        </div>
      </div>

      <table id="title001" align="center" border="1" width="100%">
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

              <c:choose>
                <c:when test="${addressInfo.default_address == 'y'}">
                  <td><button class="btn btn-outline-primary" onclick="fn_modDeliveryAddress('${addressInfo.num}')">수정</button></td>
                </c:when>
                <c:otherwise>
                  <td>
                    <button class="btn btn-outline-primary" onclick="fn_modDeliveryAddress('${addressInfo.num}')">수정</button>
                    <button onclick="fn_delete('${addressInfo.num}')" class="btn btn-outline-danger">
                      삭제
                    </button>
                  </td>
                </c:otherwise>
              </c:choose>
            </tr>
          </c:forEach>
        </tbody>
      </table>
      <div>
        <button class="btn btn-primary defaultAddressBtn" onclick="fn_changeDefault()">기본배송지 설정</button>
      </div>
    </div>
  </body>
</html>
