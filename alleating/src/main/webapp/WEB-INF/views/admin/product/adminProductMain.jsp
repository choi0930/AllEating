<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    <% request.setCharacterEncoding("utf-8"); %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
    <c:set var="productAdminProductList" value="${productMap.productAdminProductList}" />
    <c:set var="total" value="${productMap.total}" />
    <c:set var="ownerProductList" value="${productMap.ownerProductList}" />
    <c:set var="total2" value="${productMap.total2}" />
    <c:set var="ownerNameList" value="${productMap.ownerNameList}" />
    
       
<!DOCTYPE html>
<html>
<head>
    <title>관리자 상품관리 페이지</title>
    <script>
        $(document).ready(function(){
  
  $('ul.tabs li').click(function(){
    var tab_id = $(this).attr('data-tab');

    $('ul.tabs li').removeClass('active');
    $('.tab-content').removeClass('active');

    $(this).addClass('active');
    $("#"+tab_id).addClass('active');
  });


  $('#tab1').click(function(){
    location.href="/admin/productMain.do";
  });
  $('#tab2').click(function(){
    location.href="/admin/listProducts.do";
  });
})

function fn_goAddProduct(){
    location.href="/admin/adminAddProductForm.do";
}
    </script>
    <style>
        /* 탭 스타일 */
        .tabs {
            list-style: none;
            padding: 0;
        }
        .tab-link {
            display: inline-block;
            padding: 10px 20px;
            cursor: pointer;
            border-bottom: 2px solid #000060;
            margin-right: 5px;
        }
        .tab-link.active {
            background-color: #E1DDDB;
        }
        /* 탭 컨텐츠 스타일 */
        .tab-content {
            display: none;
        
        }
        .tab-content.active {
            display: block;
        }
        .tabContainer{
            width: 840px;
            margin: 0 auto;
        }
        .adminProductMain_status{

            display: flex;
        }
        .adminProductMain_searchBarArea{
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .adminProductMain_inputDateBOX{
            display: flex;
            align-items: center;
        }
        .adminProductMain_searchBTN{
            background-color: #000060;
            width: 50px;
            height: 38px;
            color: white;
            border: none;
            border-radius: 6px;
            margin: 0px 8px;
        }
        .adminProductMain_Dateinput{
            width: 120px;
        }
        .adminProductMain_dateArea{
            margin: 0px 10px;
        }
        .statusText{
            font-weight:800 ;
            padding: 0px 5px;
        }
        .adminProductMain_searchBarArea{
            margin: 20px 0px;
        }
        .overflowText{
            vertical-align: middle;
            overflow: hidden;  		
            white-space: nowrap; 		
            word-break:break-all;
            width: 190px;
            text-overflow: ellipsis;  	
        }
        .productTable{
            font-size: 14px;
            padding: 10px 10px;
            text-align: center;
           
        }
        .adminProductTable{
            vertical-align: middle;
        }
        p{
            margin: 0px;
        }
        .productTable_btn_group{
            display: flex;
            flex-direction: column;
        }
        .productDetailGOlink{
            cursor: pointer;
        }
        #addProduct_BTN{
            background-color: #000060;
            width: 120px;
            height: 36px;
            color: white;
            border: none;
            border-radius: 6px;
            margin: 0px 8px;
            position: absolute;
            top:-45px;
            right: 0px;
        }
        .tab_contents{
            position: relative;
          
        }
        .pageBottom{
            width: 600px;
            margin: 0 auto;
        }
    </style>
    <script>

    </script>
</head>
<body>
    <div class="tabContainer">
        <ul class="tabs">
            <li class="tab-link ${selectedTab == 'tab-1' ? 'active' : ''}" id="tab1" data-tab="tab-1">사업자 상품 관리</li>
            <li class="tab-link ${selectedTab == 'tab-2' ? 'active' : ''}" id="tab2" data-tab="tab-2">예약배송 상품 관리</li>
        </ul>

        <div id="tab-1" class="tab-content ${selectedTab == 'tab-1' ? 'active' : ''}">
            <div class="tab_contents">
                <div class="adminProductMain_searchBarArea"> <!--상품관리 상단-->
                    <div class="adminProductMain_status"><!--상품관리 판매상태 선택 select박스-->
                        <div class="statusText">
                            판매 상태
                        </div>
                        <div>
                            <select onchange="fn_productSelect()">
                                <option selected>전체</option>
                                <option>판매중</option>
                                <option>판매종료</option>
                                <option>승인요청</option>
                            </select>
                        </div>
                    </div>
                    <div class="adminProductMain_inputDateBOX"><!--조회할 일자 선택 및 검색 박스-->
                        <div class="statusText">
                            <span>조회기간</span>
                        </div>
                        <div class="adminProductMain_dateArea">
                            <input type="date" class="adminProductMain_Dateinput">
                            <span>~</span>
                            <input type="date" class="adminProductMain_Dateinput">
                        </div>
                        <div>
                            <input type="text" class="form-control">
                        </div>
                        <div>
                            <input class="adminProductMain_searchBTN" type="button" value="조회">
                        </div>
                    </div>
                </div><!--상품관리 상단끝 end adminProductMain_searchBarArea-->

                <div class="productTable"><!--사업자가 등록한 상품 목록-->
                    <table class="table adminProductTable table-hover">
                        <thead class="table-dark">
                            <tr onclick="location.href='/test.do?'" style="cursor: pointer;">
                                <td >상품ID</td>
                                <td >상품명</td>
                                <td >정가</td>
                                <td >할인가</td>
                                <td >판매상태</td>
                                <td >사업장명</td>
                                <td >등록일</td>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="owner" items="${ownerProductList}">
                                <tr onclick="location.href='/admin/productDetail.do?productId=${owner.productId}'" style="cursor: pointer;">
                                    <td >${owner.productId}</td>
                                    <td ><div class="overflowText">[${owner.productBrand}]${owner.productName}</div></td>
                                    <td ><fmt:formatNumber value="${owner.productPrice}" type="number" /></td>
                                        <c:choose>
                                            <c:when test="${owner.productDiscount == 0}">
                                                <td>없음</td>
                                            </c:when>
                                            <c:otherwise>
                                                <td>${owner.productDiscount}%</td>
                                            </c:otherwise>
                                        </c:choose>
                                        <c:choose>
                                            <c:when test="${owner.productStatus == 'sale'}">
                                                <td>판매중</td>
                                            </c:when>
                                            <c:when test="${owner.productStatus == 'sales_end'}">
                                                <td>판매종료</td>
                                            </c:when>
                                            <c:when test="${owner.productStatus == 'approval_request'}">
                                                <td>승인요청</td>
                                            </c:when>
                                            <c:when test="${owner.productStatus == 'declined'}">
                                                <td>승인거절</td>
                                            </c:when>
                                            <c:otherwise>
                                                <td>품절</td>
                                            </c:otherwise>
                                        </c:choose>
                                    <td>
                                        <c:set var="stopIteration" value="false" />

                                        <c:forEach var="member" items="${ownerNameList}">
                                            <c:if test="${stopIteration == false}">
                                                <c:if test="${member.id == owner.reg_id}">
                                                    ${member.owner_name}
                                                    <c:set var="stopIteration" value="true" />
                                                </c:if>
                                            </c:if>
                                        </c:forEach>
                                    </td>
                                    <td>${owner.creDate}</td>
                                </tr> 
                            </c:forEach>
                        </tbody>
                    </table>
                </div><!--사업자가 등록한 상품 목록-->

                <div class="pageBottom">
                    <c:if test="${total2 != null }">
                        <c:choose>
                            <c:when test="${total2 > 150 }">
                                <c:forEach var="page" begin="1" end="${(total2/15)+1}" step="1">
                                    <c:if test="${section >1 && page==1 }">
                                        <a class="no-uline" href="${contextPath}/admin/productMain.do?section=${section-1}&pageNum=${(section-1)*10 +1}">&nbsp; pre</a>
                                    </c:if>
                                    <a class="no-uline" href="${contextPath }/admin/productMain.do?section=${section}&pageNum=${page}">${(section-1)*15 + page }</a>
                                    <c:if test="${page == (total2/15)+1 }">
                                        <a class="no-uline" href="${contextPath }/admin/productMain.do?section=${section+1}&pageNum=${section*10+1 }">&nbsp; next</a>							
                                    </c:if>						
                                </c:forEach>
                            </c:when>
                            <c:when test="${total2 == 150 }">
                                <c:forEach var="page" begin="1" end="10" step="1">
                                    <a class="no-uline" href="${contextPath }/admin/productMain.do?section=${section }&pageNum=${page }">${page }</a>
                                </c:forEach>
                            </c:when>
                            <c:when test="${total2 < 150 }">
                                <c:forEach var="page" begin="1" end="${(total2/15)+1}" step="1">
                                    <c:choose>
                                        <c:when test="${page==pageNum }">
                                            <a class="sel-page" href="${contextPath }/admin/productMain.do?section=${section-1}&pageNum=${page}">${page }</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a class="no-uline" href="${contextPath }/admin/productMain.do?section=${section+1}&pageNum=${page }">${page }</a>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </c:when>
                        </c:choose>
                    </c:if> 
                </div>
            </div>
        </div>
        <div id="tab-2" class="tab-content ${selectedTab == 'tab-2' ? 'active' : ''}">
            <div class="tab_contents">
                <button id="addProduct_BTN" onclick="fn_goAddProduct()">등록하기</button>
                <div class="adminProductMain_searchBarArea"> <!--상품관리 상단-->
                    <div class="adminProductMain_status"><!--상품관리 판매상태 선택 select박스-->
                        <div class="statusText">
                            판매 상태
                        </div>
                        <div>
                            <select onchange="fn_productSelect()">
                                <option selected>전체</option>
                                <option>판매중</option>
                                <option>판매종료</option>
                            </select>
                        </div>
                    </div>
                    <div class="adminProductMain_inputDateBOX"><!--조회할 일자 선택 및 검색 박스-->
                        <div class="statusText">
                            <span>조회기간</span>
                        </div>
                        <div class="adminProductMain_dateArea">
                            <input type="date" class="adminProductMain_Dateinput">
                            <span>~</span>
                            <input type="date" class="adminProductMain_Dateinput">
                        </div>
                        <div>
                            <input type="text" class="form-control">
                        </div>
                        <div>
                            <input class="adminProductMain_searchBTN" type="button" value="조회">
                        </div>
                    </div>
                </div><!--상품관리 상단끝 end adminProductMain_searchBarArea-->
                
                <div class="productTable"><!--관리자가 등록한 상품 목록-->
                    <table class="table adminProductTable table-hover">
                        <thead class="table-dark">
                            <tr>
                                <td>상품ID</td>
                                <td>상품명</td>
                                <td>정가</td>
                                <td>할인가</td>
                                <td>판매상태</td>
                                <td>등록일</td>
                                <td>선택</td>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="adminProduct" items="${productAdminProductList}">
                            <tr>
                                <td class="productDetailGOlink" ><a href="${contextPath}/admin/productDetail.do?productId=${adminProduct.productId}"> ${adminProduct.productId}</a></td>
                                <td class="productDetailGOlink"><div class="overflowText">[${adminProduct.productBrand}]${adminProduct.productName}</div></td>
                                <td class="productDetailGOlink"><fmt:formatNumber value="${adminProduct.productPrice}" type="number" /></td>
                                <c:choose>
                                    <c:when test="${adminProduct.productDiscount == 0}">
                                        <td class="productDetailGOlink">없음</td>
                                    </c:when>
                                    <c:otherwise>
                                        <td class="productDetailGOlink">${adminProduct.productDiscount}%</td>
                                    </c:otherwise>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${adminProduct.productStatus == 'sale'}">
                                        <td class="productDetailGOlink">판매중</td>
                                    </c:when>
                                    <c:when test="${adminProduct.productStatus == 'sales_end'}">
                                        <td class="productDetailGOlink">판매종료</td>
                                    </c:when>
                                    <c:otherwise>
                                        <td class="productDetailGOlink">품절</td>
                                    </c:otherwise>
                                </c:choose>
                                <td class="productDetailGOlink">${adminProduct.creDate}</td>
                                <td>
                                    <div class="productTable_btn_group">
                                            <a href="#">수정하기<img src="${contextPath}/img/side/arrow-right-black.png" width="15px" style="vertical-align:baseline;"></a>
                                        <a href="#">삭제하기<img src="${contextPath}/img/side/arrow-right-black.png" width="15px" style="vertical-align:baseline;"></a>
                                    </div>
                                </td>
                            </tr> 
                        </c:forEach>
                        </tbody>
                        
                    </table>
                </div>
                <div class="pageBottom">
                    <c:if test="${total != null }">
                        <c:choose>
                            <c:when test="${total > 150 }">
                                <c:forEach var="page" begin="1" end="${(total/15)+1}" step="1">
                                    <c:if test="${section >1 && page==1 }">
                                        <a class="no-uline" href="${contextPath}/admin/listProducts.do?section=${section-1}&pageNum=${(section-1)*10 +1}">&nbsp; pre</a>
                                    </c:if>
                                    <a class="no-uline" href="${contextPath }/admin/listProducts.do?section=${section}&pageNum=${page}">${(section-1)*15 + page }</a>
                                    <c:if test="${page == (total/15)+1 }">
                                        <a class="no-uline" href="${contextPath }/admin/listProducts.do?section=${section+1}&pageNum=${section*10+1 }">&nbsp; next</a>							
                                    </c:if>						
                                </c:forEach>
                            </c:when>
                            <c:when test="${total == 150 }">
                                <c:forEach var="page" begin="1" end="10" step="1">
                                    <a class="no-uline" href="${contextPath }/admin/listProducts.do?section=${section }&pageNum=${page }">${page }</a>
                                </c:forEach>
                            </c:when>
                            <c:when test="${total < 150 }">
                                <c:forEach var="page" begin="1" end="${(total/15)+1}" step="1">
                                    <c:choose>
                                        <c:when test="${page==pageNum }">
                                            <a class="sel-page" href="${contextPath }/admin/listProducts.do?section=${section-1}&pageNum=${page}">${page }</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a class="no-uline" href="${contextPath }/admin/listProducts.do?section=${section+1}&pageNum=${page }">${page }</a>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </c:when>
                        </c:choose>
                    </c:if> 
                </div>
            </div>
        </div>
    </div>
   
</body>
</html>


