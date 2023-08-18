<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%
request.setCharacterEncoding("utf-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<link
  href="${contextPath}/css/owner01.css"
  rel="stylesheet"
  type="text/css"
/>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>ownermain.jsp</title>
   
    <script type="text/javascript">
      $(function () {
        $(".op10").hide();
        $("#salecb").click(function () {
          $(".op10").toggle();
        });
      });


      var cnt = 0;
      function fn_addFile() {
        if (cnt == 0) {
          $("#d_file").append(
            "<br>" +
            "<input type='file' name='main_image' id='f_main_image' onchange='readURL(this, \"#preview" + cnt + "\")'/>" +
            "<img id='preview" + cnt + "' src='#' width='200' height='200' />"
            +"<br>" 
          );
        } else {
          $("#d_file").append(
            "<br>" +
            "<input type='file' name='detail_image" + cnt + "' onchange='readURL(this, \"#preview" + cnt + "\")'/>" +
            "<img id='preview" + cnt + "' src='#' width='200' height='200' />"
            +"<br>" 
          );
        }
        cnt++;
      }

      function readURL(input, previewId) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $(previewId).attr('src', e.target.result);
      };
      reader.readAsDataURL(input.files[0]);
    }
  }
    </script>
  </head>
  <body>
    <div class="ownermain">
      <div class="ownertext01"><h4>상품등록</h4></div>
      <form action="${contextPath}/owner/addproduct.do" method="post" encType="multipart/form-data">
         <input type="hidden" name="deliveryType" value="normal"/>
        <div class="ownertext02">
          <div class="op01">
            <div class="fixed_join">상품종류</div>
            <div class="ownerbox">
              <select id="uclass">
                <option selected>상품분류 선택</option>
                <optgroup label="채소">
                  <option value="901001">친환경</option>
                  <option value="901002">고구마 · 감자 · 당근</option>
                  <option value="901003">시금치 · 쌈채소 · 나물</option>
                  <option value="901004">브로콜리 · 파프리카 · 양배추</option>
                  <option value="901005">양파 · 대파 · 마늘 · 배추</option>
                  <option value="901006">오이 · 호박 · 고추</option>
                  <option value="901007">콩나물 · 버섯</option>
                  <option value="901008"></option>
                </optgroup>

                <optgroup label="과일 · 견과 · 쌀">
                  <option value="902">국산과일</option>
                  <option value="so">수입과일</option>
                  <option value="so">쌀 · 잡곡</option>
                  <option value="so">견과류</option>
                  <option value="so">간편과일</option>
                  <option value="so"></option>
                </optgroup>

                <optgroup label="수산 · 해산 · 건어물">
                  <option value="so">생선류</option>
                  <option value="so">반건류</option>
                  <option value="so">오징어 · 낙지 · 문어</option>
                  <option value="so">새우 · 게 · 랍스터</option>
                  <option value="so">해산물 · 조개류</option>
                  <option value="so">김 · 미역 · 해조류</option>
                  <option value="so">건어물 · 다시팩</option>
                  <option value="so"></option>
                </optgroup>

                <optgroup label="정육 · 계란">
                  <option value="so">국내산 · 소고기</option>
                  <option value="so">수입산 · 소고기</option>
                  <option value="so">돼지고기</option>
                  <option value="so">닭 · 오리고기</option>
                  <option value="so">양고기</option>
                  <option value="so">양념육 · 돈까스</option>
                  <option value="so">계란류</option>
                  <option value="so"></option>
                </optgroup>

                <optgroup label="국 · 반찬 · 메인요리">
                  <option value="so">국 · 탕 · 찌개</option>
                  <option value="so">밀키트 · 메인요리</option>
                  <option value="so">밑반찬</option>
                  <option value="so">김치 · 젓갈 · 장류</option>
                  <option value="so">베이컨 · 햄 · 통조림</option>
                  <option value="so">두부 · 어묵 · 부침개</option>
                  <option value="so"></option>
                </optgroup>

                <optgroup label="샐러드 · 간편식">
                  <option value="so">샐러드 · 닭가슴살</option>
                  <option value="so">도시락 · 밥류</option>
                  <option value="so">파스타 · 면류</option>
                  <option value="so">떡볶이 · 튀김 · 순대</option>
                  <option value="so">폭립 · 떡갈비 · 안주</option>
                  <option value="so">죽 · 스프 · 카레</option>
                  <option value="so">선식 · 시리얼</option>
                  <option value="so"></option>
                </optgroup>

                <optgroup label="면 · 양념 · 오일">
                  <option value="so">파스타 · 면류</option>
                  <option value="so">식초 · 소스 · 드레싱</option>
                  <option value="so">양념 · 액젓 · 장류</option>
                  <option value="so">식용유 · 참기름 · 오일</option>
                  <option value="so">소금 · 설탕 · 향신료</option>
                  <option value="so">밀가루 · 가루 · 믹스</option>
                  <option value="so"></option>
                </optgroup>

                <optgroup label="생수 · 음료 · 우유 · 커피">
                  <option value="so">생수 · 탄산수</option>
                  <option value="so">음료 · 주스</option>
                  <option value="so">우유 · 두유 · 요거트</option>
                  <option value="so">커피</option>
                </optgroup>
              </select>
            </div>
            <div class="nonebox"></div>
          </div>
          <div class="op01">
       
            <div class="fixed_join">상품이름</div>
            <div class="ownerbox">
              <input name="onwerproduct_name" type="text" size="20" />
            </div>
            <div class="nonebox"></div>
          </div>
          <div class="op01">
            <div class="fixed_join">상품가격</div>
            <div class="ownerbox">
              <input name="onwerproduct_price" type="text" size="20" />
            </div>
            <div class="dodo"> 원
              <input type="checkbox" name="checkBox" id="salecb" />할인율 입력
            </div>
          </div>
          <div class="op10">
             <div class="fixed_join">할인율</div>
                <div class="ownerbox">
                 <input name="onwerproduct_unit" id="saletd" type="text" size="20"/>
                </div>
                 <div class="dodo">%</div>  
          </div> 
          <div class="op01">
            <div class="fixed_join">판매단위</div>
            <div class="ownerbox">
              <input name="onwerproduct_unit" type="text" size="20" />
            </div>
          </div>
          <div class="op01">
            <div class="fixed_join">포장타입</div>
            <div class="ownerbox">
              <select id="uclass">
                <option value="qwe">냉동</option>
                <option value="qwe">냉장</option>
                <option value="qwe">상온</option>
              </select>
            </div>
          </div>
          <div class="op01">
            <div class="fixed_join">중량/용량</div>
            <div class="ownerbox">
              <input name="onwerproduct_weight" type="text" size="20" />
            </div>
          </div>
          <div class="op01">
            <div class="fixed_join">원산지</div>
            <div class="ownerbox">
              <input name="onwerproduct_origin" type="text" size="20" />
            </div>
          </div>
          <div class="op01">
            <div class="fixed_join">총수량</div>

            <div class="ownerbox">
              <input name="onwerproduct_quantity" type="text" size="20" />
            </div>
          </div>
          <div class="op01">
            <div class="fixed_join">유통기한</div>
            <div class="ownerbox">
              <input name="onwerproduct_expiration" type="text" size="20" />
            </div>
            <div class="dodo">일</div>
          </div>
        </div>

        <div class="tab_content" id="tab7">
          <div class="ownertext03"><h4>상품이미지</h4></div>
          <div class="ownertext04">
            <div>
              <div class="op02">
                <div class="op03">
                <div class="op04">메인 이미지 <br>
                  <input type="file" name="imageFileName" id="imgInp" onchange = "readURL(this, '#preview');" /></div>
                  <div><img id = "preview" src ="#" width= 200 height=200 /></div>
                </div> 
                  <div class="op06"><input type="button" id="opbt" value="파일 추가" onClick="fn_addFile()"/> 상세 이미지</div>
                          
              <div>
                <div id="d_file"></div>
              </div>
            </div>
          </div>
        </div>
        </div>
        <div class="form_end">
          <button class="join_end_btn" onclick="fn_loginGO()">
            <span id="join_btn_text">등록하기</span>
          </button>
        </div>
      </form>
    </div>
  </body>
</html>
