     <%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%
request.setCharacterEncoding("utf-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<c:set var="productVO" value="${productInfo.productVO}" /><!--상품정보-->
<c:set var="productImgList" value="${productInfo.productImgList}" /><!--이미지리스트-->
<c:set var="memberVO" value="${productInfo.memberVO}" /><!--등록자 정보-->
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>관리자 상품 상세페이지</title>
    <style>

      
      #ProductDetail_mainImg{
        float: left;
      }
      #prodcutDetail_info{
        width: 300px;
        float:left;
        margin-bottom:30px;
      }
      .clean{
        clear:both;
      }
      .productdetail_flex{
        display: flex;
        justify-content: space-between;
      }
      .top_bar{
        border-top: 2px solid #000060;
      }
      .productDetail_title{
        font-size: 27px;
        font-weight: 900;
      }
      #products{
        margin-top: 10px;
      }
      .productDetail_title{
        font-size: 20px;
      }
      .butt{
        display: flex;
    justify-content: flex-end;
    align-items: center; /* 수직 중앙 정렬을 위한 스타일 추가 */
    margin-top: 40px; /* 원하는 간격으로 조정 */
    margin-bottom:30px;
    margin-right: 180px;
   
      }
      .butt a {
        margin-left: 10px;
        background-color:#041897;
        color:white;
        padding-left: 10px;
        padding-right:10px;
        padding-top:5px;
        padding-bottom:5px;
       
      }
     
     
    </style>
    
    <script>
      /* 상품 상태 수정 */
      function fn_modify(productStatus){
        var productId = $('#productId').val();
        console.log(productId);
        $.ajax({
		        type: "POST",
		        async: true,
		        url: "/admin/modifyProductStatus.do",
		        data:{ productId: productId, 
                  productStatus: productStatus },
		        success:function(data){
              alert(data);
		          },
		        error:function(data){
			        alert("에러가 발생했습니다.");
		        }
	          });
      }
      /*----------상품 상태 수정 끝----------*/
    </script>
  </head>
  <body>
      <div>
        <div>
          <div>
            <c:choose>
              <c:when test="${productVO.join_type == 'owner'}">
                <span class="productDetail_title">사업자 상품 상세정보</span>
              </c:when>
              <c:otherwise>
                <span class="productDetail_title">관리자 상품 상세정보</span>
              </c:otherwise>
            </c:choose>
          </div>
          <div class="top_bar"></div>
        </div>  

        <div id="products">
          <div id="ProductDetail_mainImg">
            <div><span>메인 이미지</span></div>
          
            <c:forEach var="img" items="${productImgList}">
                <c:if test="${img.fileType =='main_image'}">
                  <img src="${contextPath}/download.do?fileName=${img.fileName}&productId=${productVO.productId}&cateCode=${productVO.cateCode}" alt="${productImgVO.fileName}" width="300px" height="300px" style="margin-right:40px;">
                </c:if>
            </c:forEach>
          </div>
          <input type="hidden" id="productId" value="${productVO.productId}">
          <div id="prodcutDetail_info">
          <ul>
            <li>
              <div class="productdetail_flex">
                <div>상품상태</div>
                <c:choose>
                  <c:when test="${productVO.productStatus == 'approval_request'}">
                    <div>승인 요청</div>
                  </c:when>
                  <c:when test="${productVO.productStatus == 'declined'}">
                    <div>승인 거절</div>
                  </c:when>
                  <c:when test="${productVO.productStatus == 'sale'}">
                    <div>판매중</div>
                  </c:when>
                  <c:when test="${productVO.productStatus == 'sales_end'}">
                    <div>판매 종료</div>
                  </c:when>
                  <c:otherwise>
                    <div>품절</div>
                  </c:otherwise>
                </c:choose>
              </div>
            </li>
            <li>
              <div class="productdetail_flex">
                <div>상품종류</div>
                <div>${productVO.cateCode}</div>
              </div>
            </li>
            <li>
              <div class="productdetail_flex">
                <div>브랜드</div>
                <div>${productVO.productBrand}</div>
              </div>
            </li>
            <li>
              <div class="productdetail_flex">
                <div>상품이름</div>
                <div>${productVO.productName}</div>
              </div>
            </li>
            <li>
              <div class="productdetail_flex">
                <div>상품가격</div>
                <div>${productVO.productPrice}</div>
              </div>
            </li>
            <li>
              <div class="productdetail_flex">
                <div>할인율</div>
                <div>${productVO.productDiscount}</div>
              </div>
            </li>
            <li>
              <div class="productdetail_flex">
                <div>할인 적용된 가격</div>
                <div>${productVO.productSalesPrice}</div>
              </div>
            </li>
            <li>
              <div class="productdetail_flex">
                <div>판매 단위</div>
                <div>${productVO.productUnit}</div>
              </div>
            </li>
            <li>
              <div class="productdetail_flex">
                <div>포장타입</div>
                <div>${productVO.productPackType}</div>
              </div>
            </li>
            <li>
              <div class="productdetail_flex">
                <div>중량/용량</div>
                <div>${productVO.productWeight}</div>
              </div>
            </li>
            <li>
              <div class="productdetail_flex">
                <div>원산지</div>
                <div>${productVO.productOrigin}</div>
              </div>
            </li>
            <li>
              <div class="productdetail_flex">
                <div>상품 총수량</div>
                <div>${productVO.productTotal}</div>
              </div>
            </li>
            <li>
              <div class="productdetail_flex">
                <div>유통기한</div>
                <div>${productVO.productExpireDate}</div>
              </div>
            </li>
            <li>
              <div class="productdetail_flex">
                <div>배송타입</div>
                <div>${productVO.deliveryType}</div>
              </div>
            </li>
            
            <li>
              <div class="productdetail_flex">
                <div>사업장명</div>
                <div>${memberVO.owner_name}</div>
              </div>
              
            </li>
            <li>
              <div class="productdetail_flex">
                <div>작성자</div>
                <div>${memberVO.name}[${productVO.reg_id}]</div>
              </div>
            </li>
            <li>
              <div class="productdetail_flex">
                <div>등록일</div>
                <div>${productVO.creDate}</div>
              </div>
            </li>
          </ul>
          </div>
        </div>
        <div class="clean"></div>
        <div>
          <c:forEach var="img" items="${productImgList}" varStatus="itemNum">

            <c:if test="${img.fileType != 'main_image' }">
              <div>제품 상세 이미지${itemNum.count-1}</div>
              <div>
                <img src="${contextPath}/download.do?fileName=${img.fileName}&productId=${productVO.productId}&cateCode=${productVO.cateCode}" alt="${productImgVO.fileName}" style="margin-bottom:50px;">
              </div>
            </c:if>
          
          </c:forEach>
        </div>

        <div>
          <div style="margin-bottom: 20px;"> 소개글 </div>
          <div style="margin-right:22%;">
            ${productVO.productContentTitle}
          </div>
          <div style="margin-bottom:30px;margin-right: 180px">
            ${productVO.productContent}
          </div>
        </div>

        <div class="butt">
          <c:choose>
            <c:when test="${productVO.join_type == 'owner'}">
              <span><a href="${contextPath}/admin/productMain.do">목록으로</a></span>
              <span><a href="javascript:fn_modify('declined');">승인거절</a></span>
              <span><a href="javascript:fn_modify('sale');">상품승인</a></span>
            </c:when>
            <c:otherwise>
              <div><a href="${contextPath}/admin/listProducts.do">목록으로</a></div>
            </c:otherwise>
          </c:choose>
        </div>
      </div>
  </body>
</html>

