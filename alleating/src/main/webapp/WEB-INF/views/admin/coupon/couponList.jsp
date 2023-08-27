<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    <% request.setCharacterEncoding("utf-8"); %>
<!--  <c:set var="userMemberList" value="${memberMap.userMemberList}" />
  <c:set var="userTotal" value="${memberMap.userTotal}" />-->
<!DOCTYPE html>
<html>
<head>
    <title>관리자 쿠폰관리 페이지</title>
    <script>
      
    </script>
    <style>
        .topArea{
            display: flex;
        }
        .memberList{
            width: 840px;
           
        }
      .tapDateArea{
        display: flex;
        align-items: center
      }
      .memberSearchBtn{
        background-color: #000060;
            width: 50px;
            height: 38px;
            color: white;
            border: none;
            border-radius: 6px;
            margin: 0px 8px;
      }
      .statusText{
        font-weight: 800;
        padding: 0px 5px;
      }
      .selectArea{
        padding: 0px 10px;
      }
     .couponTable{
        overflow: initial;
     }
     .couponTables{
        width: 1200px;
     }
    #couponBtnArea{
        float: right;
    }
    #couponTitle{
        font-size: 27px;
        font-weight: bold;
    }
    #addCouponBtn{
        background-color: #000060;
    width: 110px;
    height: 38px;
    color: white;
    border: none;
    border-radius: 6px;
    margin: 0px 8px;
    }
    </style>
    <script>
        function fn_addCoupon(){
            location.href="${contextPath}/admin/addCouponForm.do";
        }
    </script>
</head>
<body>
    <div class="memberList">
       <div>
            <div id="couponTitle">쿠폰관리</div>
            <div id="couponBtnArea">
                <button id="addCouponBtn" onclick="fn_addCoupon()">쿠폰 생성</button>
            </div>
            <div class="topArea">
                
               
                <div>
                    <span class="statusText">쿠폰 현황</span>
                </div>
                <div>
                    <span class="statusText">현재 사용가능한 쿠폰을 조회합니다.</span>
                </div>
              
            </div>
            총  
            <div class="couponTable"><!--쿠폰 목록-->
                <table class="table adminProductTable table-hover couponTables">
                    <thead class="table-dark">
                        <tr>
                            <td >쿠폰ID</td>
                            <td >쿠폰이름</td>
                            <td >사용처</td>
                            <td >할인율</td>
                            <td >배포기간</td>
                            <td >사용기간</td>
                            <td></td>
                        </tr>
                    </thead>
                    <tbody>
                       <tr>
                        <td>1A3D2R4D1A1D1De1</td>
                        <td>사용가능한 쿠폰1</td>
                        <td>브로콜리·파프리카·양배추</td>
                        <td>20%</td>
                        <td>2023-08-27~2023-10-10</td>
                        <td>2023-08-27~2023-10-10</td>
                        <td><button>수정</button>
                            <button>삭제</button>
                        </td>
                       </tr>
                    </tbody>
                </table>
            </div><!--쿠폰 목록 끝-->



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
        <div>
            <div>쿠폰관리</div>
            <div class="topArea">
                <div>
                    <span class="statusText">쿠폰 현황</span>
                </div>
                <div>
                    <span class="statusText">현재 사용가능한 쿠폰을 조회합니다.</span>
                </div>
               
            </div>
            총  
            <div class="couponTable"><!--사용기간 만료된 혹은 삭제된 쿠폰 목록-->
                <table class="table adminProductTable table-hover couponTables" >
                    <thead class="table-dark">
                        <tr>
                            <td >쿠폰ID</td>
                            <td >쿠폰이름</td>
                            <td >사용처</td>
                            <td >할인율</td>
                            <td >배포기간</td>
                            <td >사용기간</td>
                            <td></td>
                        </tr>
                    </thead>
                    <tbody>
                       <tr>
                        <td>12313231</td>
                        <td>사용가능한 쿠폰1</td>
                        <td>브로콜리·파프리카·양배추</td>
                        <td>20%</td>
                        <td>2023-08-27~2023-10-10</td>
                        <td>2023-08-27~2023-10-10</td>
                        <td><button>수정</button>
                            <button>수정</button>
                        </td>
                       </tr>
                    </tbody>
                </table>
            </div><!--사용기간 만료된 혹은 삭제된 쿠폰 목록-->
        </div>       
    </div>
   
</body>
</html>


