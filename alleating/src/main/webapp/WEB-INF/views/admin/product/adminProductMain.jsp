<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <% request.setCharacterEncoding("utf-8"); %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
    <c:set var="productAdminProductList" value="${productMap['productAdminProductList']}" />
    <c:set var="total" value="${productMap['total']}" />
    <c:choose>
		<c:when test="${total%30 == 0}">
			<c:set var="totals2" value="${total/30}" />
		</c:when>	
		<c:otherwise>
			<c:set var="totals2" value="${total/30+1}" />
		</c:otherwise>
	</c:choose>
	
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
  })

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
    
    </style>
    <script>

    </script>
</head>
<body>
    <div class="tabContainer">
        <ul class="tabs">
            <li class="tab-link ${selectedTab == 'tab-1' ? 'active' : ''}" data-tab="tab-1">사업자 상품 관리</li>
            <li class="tab-link ${selectedTab == 'tab-2' ? 'active' : ''}" data-tab="tab-2">예약배송 상품 관리</li>
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
                            <tr onclick="location.href='/test.do?'" style="cursor: pointer;">
                                <td >100483</td>
                                <td ><div class="overflowText">[AllEating]저탄소 샤인머스캣</div></td>
                                <td >50,000</td>
                                <td >없음</td>
                                <td >판매중</td>
                                <td >올잇팅</td>
                                <td >2023-08-10</td>
                                
                            </tr> 
                       
                            <tr onclick="location.href='/test.do?'" style="cursor: pointer;">
                                <td>100483</td>
                                <td><div class="overflowText">[AllEating]저탄소 샤인머스캣</div></td>
                                <td>50,000원</td>
                                <td class="redText">40,000원</td>
                                <td >승인요청</td>
                                <td >올잇팅</td>
                                <td>2023-08-10</td>
                            </tr> 
                            <tr onclick="location.href='/test.do?'" style="cursor: pointer;">
                                <td>100483</td>
                                <td><div class="overflowText">[AllEating]저탄소 샤인머스캣[AllEating]저탄소 샤인머스캣[AllEating]저탄소 샤인머스캣[AllEating]저탄소 샤인머스캣[AllEating]저탄소 샤인머스캣</div></td>
                                <td>50,000원</td>
                                <td class="redText">40,000원</td>
                                <td>승인요청</td>
                                <td>올잇팅</td>
                                <td>2023-08-10</td>
                            </tr> 
                        </tbody>
                        
                    </table>
                </div><!--사업자가 등록한 상품 목록-->

                <c:choose>
                    <c:when test="${total>=40}">
                        <div id="page_wrap">
                            <c:forEach   var="page" begin="1" end="10" step="1" >
                                <c:if test="${section >1 && page==1 }">
                                     <a href="${contextPath}/member/listMembers.do?section=${section-1}&pageNum=${(section-1)*10 +1 }">&nbsp;pre &nbsp;</a>
                                </c:if>
                                     <a href="${contextPath}/member/listMembers.do?section=${section}&pageNum=${page}">${(section-1)*10 +page } </a>
                                <c:if test="${page ==10 }">
                                     <a href="${contextPath}/member/listMembers.do?section=${section+1}&pageNum=${section*10+1}">&nbsp; next</a>
                                </c:if> 
                             </c:forEach> 
                       </div>	
                    </c:when>
                       <c:when test="${total<40}">
                        <c:forEach   var="page" begin="1" end="${totals2}" step="1" >
                            <c:choose>
                                <c:when test="${page==pageNum}">
                                    <a href="${contextPath}/member/listMembers.do?section=${section}&pageNum=${page}">${(section-1)*10 +page } </a>
                                </c:when>
                                <c:otherwise>
                                    <a href="${contextPath}/member/listMembers.do?section=${section}&pageNum=${page}">${(section-1)*10 +page } </a>
                                </c:otherwise>
                            </c:choose>
                            
                        </c:forEach>
                    </c:when>
                </c:choose>
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
                                <td class="productDetailGOlink">${adminProduct.productId}</td>
                                <td class="productDetailGOlink"><div class="overflowText">[${adminProduct.productBrand}]${adminProduct.productName}</div></td>
                                <td class="productDetailGOlink">${adminProduct.productPrice}</td>
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
                <c:choose>
                    <c:when test="${total>=300}">
                        <div id="page_wrap">
                            <c:forEach   var="page" begin="1" end="10" step="1" >
                                <c:if test="${section >1 && page==1 }">
                                     <a href="${contextPath}/member/listMembers.do?section=${section-1}&pageNum=${(section-1)*10 +1 }">&nbsp;pre &nbsp;</a>
                                </c:if>
                                     <a href="${contextPath}/member/listMembers.do?section=${section}&pageNum=${page}">${(section-1)*10 +page } </a>
                                <c:if test="${page ==10 }">
                                     <a href="${contextPath}/member/listMembers.do?section=${section+1}&pageNum=${section*10+1}">&nbsp; next</a>
                                </c:if> 
                             </c:forEach> 
                       </div>	
                    </c:when>
                       <c:when test="${total < 300}">
                        <c:forEach   var="page" begin="1" end="${totals2}" step="1" >
                            <c:choose>
                                <c:when test="${page==pageNum}">
                                    <a href="${contextPath}/member/listMembers.do?section=${section}&pageNum=${page}">${(section-1)*10 +page } </a>
                                </c:when>
                                <c:otherwise>
                                    <a href="${contextPath}/member/listMembers.do?section=${section}&pageNum=${page}">${(section-1)*10 +page } </a>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </c:when>
                </c:choose>
            </div>
        </div>
    </div>
   ${totals2}
</body>
</html>


