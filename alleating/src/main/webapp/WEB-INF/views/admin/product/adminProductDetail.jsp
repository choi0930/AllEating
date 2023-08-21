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
    </style>
    
    
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
                  <img src="${contextPath}/download.do?fileName=${img.fileName}&productId=${productVO.productId}&cateCode=${productVO.cateCode}" alt="${productImgVO.fileName}" width="300px" height="300px">
                </c:if>
            </c:forEach>
          </div>

          <div id="prodcutDetail_info">
          <ul>
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
                <img src="${contextPath}/download.do?fileName=${img.fileName}&productId=${productVO.productId}&cateCode=${productVO.cateCode}" alt="${productImgVO.fileName}">
              </div>
            </c:if>
          
          </c:forEach>
        </div>

        <div>
          <div>제품 소개글</div>
          <div>
            ${productVO.productContentTitle}
          </div>
          <div>
            ${productVO.productContent}
          </div>
        </div>
      </div>
  </body>
</html>