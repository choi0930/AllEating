<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%
request.setCharacterEncoding("utf-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<c:set var="pdVO" value="${producteditInfo.pdVO}" />
<c:set var="pdlist" value="${producteditInfo.pdlist}" />
<c:set var="ownerVO" value="${producteditInfo.ownerVO}" />
<link href="${contextPath}/css/Modowner.css" rel="stylesheet" type="text/css" />

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>ownermain.jsp</title>
    <script type="text/javascript">


function fn_enable01() {
  changeImageByType('main_image');
}

function fn_enable02() {
  changeImageByType('detail_image1');
}

function changeImageByType(imageType) {
  var fileInput = $("<input type='file' accept='image/*' />");
  fileInput.on("change", function () {
    var selectedImage = this.files[0];
    if (selectedImage) {
      var newImageURL = URL.createObjectURL(selectedImage);
      var previewImg;
      if (imageType === 'main_image') {
        previewImg = $(".qwe_0"); // 메인 이미지 미리보기 엘리먼트 선택
      } else if (imageType === 'detail_image1') {
        previewImg = $(".qwe_1"); // 상세 이미지 미리보기 엘리먼트 선택
      }
      previewImg.attr("src", newImageURL); // 이미지의 src 속성을 선택한 이미지로 변경
    }
  });
  fileInput.click();
}

  $(document).ready(function () {
  // 초기화 시에 할인율 입력란의 값을 저장
  $("#saletd").data("originalValue", $("#saletd").val());

  // 체크박스가 변경될 때의 동작 설정
  $("#salecb").change(function () {
    if (this.checked) {
      $(".op10").show();
    } else {
      $(".op10").hide();
      // 체크가 해제되면 할인율 입력란을 원래 값으로 복구
      $("#saletd").val($("#saletd").data("originalValue"));
    }
  });

  // 페이지 로드 시 체크박스의 초기 상태에 따라 할인율 입력란 보이기/숨기기 설정
  if ($("#salecb").prop("checked")) {
    $(".op10").show();
  } else {
    $(".op10").hide();
  }
  
  // 할인율 입력란의 값이 변경될 때 원래 값을 업데이트
  $("#saletd").change(function () {
    $(this).data("originalValue", $(this).val());
  });
});

      $(document).ready(function () {
        $("#cateCode").val("${pdVO.cateCode}").attr("selected", "selected");
      });

      $(document).ready(function () {
        $("#uclass")
          .val("${pdVO.productPackType}")
          .attr("selected", "selected");
      });

      var cnt = 0;
      function fn_addFile() {
        if (cnt == 0) {
          $("#d_file").append(
            "<br>" +
              "<input type='file' name='main_image' id='f_main_image' onchange='readURL(this, \"#preview" +
              cnt +
              "\")'/>" +
              "<img id='preview" +
              cnt +
              "' src='#' width='200' height='200' />" +
              "<br>"
          );
        } else {
          $("#d_file").append(
            "<br>" +
              "<input type='file' name='detail_image" +
              cnt +
              "' onchange='readURL(this, \"#preview" +
              cnt +
              "\")'/>" +
              "<img id='preview" +
              cnt +
              "' src='#' width='200' height='200' />" +
              "<br>"
          );
        }
        cnt++;
      }

      function readURL(input, previewId) {
        if (input.files && input.files[0]) {
          var reader = new FileReader();
          reader.onload = function (e) {
            $(previewId).attr("src", e.target.result);
          };
          reader.readAsDataURL(input.files[0]);
        }
      }
    </script>
  </head>
  <body>
    <div class="ownermain">
      <div class="ownertext01"><h4>상품 정보 수정</h4></div>
      <form
        action="${contextPath}/owner/addNewProduct.do"
        method="post"
        encType="multipart/form-data"
      >
        <div class="ownertext02">
          <div class="op01">
            <div class="fixed_join">상품종류</div>
            <div class="ownerbox">
              <select id="cateCode" name="cateCode">
                <option selected>상품분류 선택</option>
                <optgroup label="채소">
                  <option value="901001">친환경</option>
                  <option value="901002">고구마 · 감자 · 당근</option>
                  <option value="901003">시금치 · 쌈채소 · 나물</option>
                  <option value="901004">브로콜리 · 파프리카 · 양배추</option>
                  <option value="901005">양파 · 대파 · 마늘 · 배추</option>
                  <option value="901006">오이 · 호박 · 고추</option>
                  <option value="901007">콩나물 · 버섯</option>
                </optgroup>

                <optgroup label="과일 · 견과 · 쌀">
                  <option value="902001">국산과일</option>
                  <option value="902002">수입과일</option>
                  <option value="902004">냉동·건과일</option>
                  <option value="902005">견과류</option>
                  <option value="902006">쌀·잡곡</option>
                </optgroup>

                <optgroup label="수산 · 해산 · 건어물">
                  <option value="903001">생선류</option>
                  <option value="903002">반건류</option>
                  <option value="903003">오징어·낙지·문어</option>
                  <option value="903004">새우·게·랍스터</option>
                  <option value="903005">해산물·조개류</option>
                  <option value="903006">김·미역·해조류</option>
                  <option value="903007">건어물·다시팩</option>
                </optgroup>

                <optgroup label="정육 · 계란">
                  <option value="904001">국내산 소고기</option>
                  <option value="904002">수입산 소고기</option>
                  <option value="904003">돼지고기</option>
                  <option value="904004">닭·오리고기</option>
                  <option value="904005">양고기</option>
                  <option value="904006">양념육·돈까스</option>
                  <option value="904007">계란류</option>
                </optgroup>

                <optgroup label="국 · 반찬 · 메인요리">
                  <option value="905001">국·탕·찌개</option>
                  <option value="905002">밀키트·메인요리</option>
                  <option value="905003">밑반찬</option>
                  <option value="905004">김치·젓갈·장류</option>
                  <option value="905005">두부·어묵·부침개</option>
                  <option value="905006">베이컨·햄·통조림</option>
                </optgroup>

                <optgroup label="샐러드 · 간편식">
                  <option value="906001">샐러드·닭가슴살</option>
                  <option value="906002">도시락·밥류</option>
                  <option value="906003">파스타·면류</option>
                  <option value="906004">떡볶이·튀김·순대</option>
                  <option value="906005">폭립·떡갈비·안주</option>
                  <option value="906006">죽·스프·카레</option>
                  <option value="906007">선식·시리얼</option>
                </optgroup>

                <optgroup label="면 · 양념 · 오일">
                  <option value="907001">파스타·면류</option>
                  <option value="907002">식초·소스·드레싱</option>
                  <option value="907003">양념·액젓·장류</option>
                  <option value="907004">식용유·참기름·오일</option>
                  <option value="907005">소금·설탕·향신료</option>
                  <option value="907006">밀가루·가루·믹스</option>
                </optgroup>

                <optgroup label="생수 · 음료 · 우유 · 커피">
                  <option value="908001">생수·탄산수</option>
                  <option value="908002">음료·주스</option>
                  <option value="908003">우유·두유·요거트</option>
                  <option value="908004">커피</option>
                </optgroup>
              </select>
            </div>
            <div class="nonebox"></div>
          </div>
          <div class="op01">
            <div class="fixed_join">브랜드명</div>
            <div class="ownerbox">
              <input
                id="productBrand"
                name="productBrand"
                type="text"
                size="20"
                value="${pdVO.productBrand}"
              />
            </div>
          </div>

          <div class="op01">
            <div class="fixed_join">상품이름</div>
            <div class="ownerbox">
              <input
                name="productName"
                type="text"
                size="20"
                value="${pdVO.productName}"
              />
            </div>
            <div class="nonebox"></div>
          </div>
          <div class="op01">
            <div class="fixed_join">상품가격</div>
            <div class="ownerbox">
              <input
                name="productPrice"
                type="text"
                size="20"
                value="${pdVO.productPrice}"
              />
            </div>
            <div class="dodo">
              원
              <input
                type="checkbox"
                name="discount"
                id="salecb"
                value="y"
                <c:choose>
                  <c:when test="${pdVO.productDiscount > 0 }">
                    checked="checked"
                  </c:when>
                  <c:when test="${pdVO.productDiscount == 0 }">
                  </c:when>
                </c:choose>
              />할인율 입력
            </div>
          </div>
          <div class="op10">
            <div class="fixed_join">할인율</div>
            <div class="ownerbox">
              <input
                id="saletd"
                type="text"
                name="productDiscount"
                size="20"
                value="${pdVO.productDiscount}"
                
              />
            </div>
            <div class="dodo">%</div>
          </div>
          <div class="op01">
            <div class="fixed_join">판매단위</div>
            <div class="ownerbox">
              <input
                name="productUnit"
                type="text"
                size="20"
                value="${pdVO.productUnit}"
              />
            </div>
          </div>
          <div class="op01">
            <div class="fixed_join">포장타입</div>
            <div class="ownerbox">
              <select id="uclass" name="productPackType">
                <option value="냉동">냉동</option>
                <option value="냉장">냉장</option>
                <option value="상온">상온</option>
              </select>
            </div>
          </div>
          <div class="op01">
            <div class="fixed_join">중량/용량</div>
            <div class="ownerbox">
              <input
                name="productWeight"
                type="text"
                size="20"
                value="${pdVO.productWeight}"
              />
            </div>
          </div>
          <div class="op01">
            <div class="fixed_join">원산지</div>
            <div class="ownerbox">
              <input
                name="productOrigin"
                type="text"
                size="20"
                value="${pdVO.productOrigin}"
              />
            </div>
          </div>
          <div class="op01">
            <div class="fixed_join">총수량</div>

            <div class="ownerbox">
              <input
                name="productTotal"
                type="text"
                size="20"
                value="${pdVO.productTotal}"
              />
            </div>
          </div>
          <div class="op01">
            <div class="fixed_join">유통기한</div>
            <div class="ownerbox">
              <input
                name="productExpireDate"
                type="text"
                size="20"
                value="${pdVO.productExpireDate}"
              />
            </div>
            <div class="dodo"></div>
          </div>

          <div class="op01">
            <div class="fixed_join">소제목</div>
            <div class="ownerbox">
              <input
                name="productContentTitle"
                type="text"
                size="20"
                value="${pdVO.productContentTitle}"
              />
            </div>
          </div>

          <div class="op01">
            <div class="fixed_join">내용</div>
            <div class="ownerbox">
              <input
                name="productContent"
                type="text"
                size="20"
                value="${pdVO.productContent}"
              />
            </div>
          </div>
          <div class="tab_content" id="tab7">
            <div class="ownertext03"><h4>상품이미지</h4></div>
            <div class="ownertext04">
              <div>
                <div class="op02">
                  <div class="op03">
                    <div class="op06">
                      <input
                        type="button"
                        id="opbt"
                        value="파일 추가"
                        onClick="fn_addFile()"
                      />
                      상세 이미지
                    </div>
                    <div class="pdeditimg">
                      <c:forEach var="imageFileName" items="${pdlist}" varStatus="i">
                       <div class="pdimg"> 
                        <img
                          class="qwe_${i.index}"
                          src="${contextPath}/download.do?fileName=${imageFileName.fileName}&productId=${pdVO.productId}&cateCode=${pdVO.cateCode}&fileType=${imageFileName.fileType}"
                          width="200"
                          height="200"
                        /> 
                        <c:choose>
                          <c:when test="${imageFileName.fileType == 'main_image' }">
                            <input id="asd" type="button" value="수정하기(메인)" onClick="fn_enable01()">
                          </c:when>
                          <c:when test="${imageFileName.fileType == 'detail_image1' }">
                            <input id="asd" type="button" value="수정하기(상세)" onClick="fn_enable02()">
                          </c:when>
                        </c:choose>
                      </div>
                      </c:forEach>
                    </div>
                    <div>
                      <div id="d_file"></div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="form_end">
            <button class="join_end_btn" onclick="fn_loginGO()">
              <span id="join_btn_text">수정하기</span>
            </button>
          </div>
        </div>
      </form>
    </div>
  </body>
</html>
