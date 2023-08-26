<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    <% request.setCharacterEncoding("utf-8"); %>
  <c:set var="userMemberList" value="${memberMap.ownerMemberList}" />
  <c:set var="userTotal" value="${memberMap.ownerTotal}" />
<!DOCTYPE html>
<html>
<head>
    <title>관리자 회원관리 페이지</title>
    <script>
        function fn_searchDate(){
            alert('test');
        }
    </script>
    <style>
        .topArea{
            display: flex;
            justify-content: space-between;
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
      table {
 
        width: 1200px;
  border-collapse: collapse;
 
}
th,
td {
  border: 1px solid #aaa;
  background-clip: padding-box;
  scroll-snap-align: start;
}
tbody tr:last-child th,
tbody tr:last-child td {
  border-bottom: 0;
}
thead {
  z-index: 1000;
  position: relative;
}
th,
td {
  padding: 0.6rem;

  text-align: left;
  margin: 0;
}
thead th {
  position: sticky;
  top: 0;
  border-top: 0;
  background-clip: padding-box;
  
}
thead th.pin {
  left: 0;
  z-index: 1001;
  border-left: 0;
}
tbody th {
  background-clip: padding-box;
  border-left: 0;
}
tbody {
  z-index: 10;
  position: relative;
}
tbody th {
  position: sticky;
  left: 0;
}
thead th,
tbody th {
  background-color: #f8f8f8;
}
.primary {
  overflow: scroll;
  overflow-y:hidden;
  scroll-snap-type: both mandatory;
  border: 1px solid #aaa;
  margin-top: 20px;
}
.phoneArea{
    width: 150px;
}
.aLink{
    cursor: pointer;
}
    </style>
    <script>

    </script>
</head>
<body>
    <div class="memberList">
       <div>
            <div class="topArea">
            <div class="tapDateArea">
                <div>
                    <span class="statusText">조회기간</span>
                </div>
                <div>
                    <input type="date" class="form-control"/>
                </div>
                <span>~</span>
                <div>
                    <input type="date" class="form-control" onchange="fn_searchDate()"/>
                </div>
            </div>
            <form>
            <div class="tapDateArea">
                    <div>
                        <span class="statusText">구분</span>
                    </div>
                    <div class="selectArea">
                         <select class="form-select">
                            <option>아이디</option>
                            <option>이름</option>
                         </select>
                    </div>
                    <div>
                        <input type="text" class="form-control"/>
                    </div>
                    <div>
                        <input class="memberSearchBtn" type="submit" value="검색" />
                    </div>
            </div>
            </form>
            </div>
            총 ${userTotal} 명
            <div role="region" aria-label="data table" tabindex="0" class="primary">
                <table>
                    <thead>
                      <tr>
                        <th class="pin">아이디</th>
                        <th>사업장명</th>
                        <th>사업장 전화번호</th>
                        <th>이메일</th>
                        <th>사업장 주소</th>
                        <th>성별</th>
                        <th>sms 수신 동의</th>
                        <th>eamil 수신 동의</th>
                        <th>회원 상태</th>
                        <th>가입일</th>
                      </tr>
                    </thead>
                        <c:forEach var="member" items="${userMemberList}" >
                            
                            <tr>
                                <th class="aLink"><a href = "${contextPath}/admin/memberDetail.do?id=${member.id}">${member.id}</a></th>
                                <td>${member.owner_name}</td>
                                <td>${member.hp}</td>
                                <td>${member.email}</td>
                                <td>${member.address}</td>
                                <c:choose>
                                    <c:when test="${member.gender == 'man'}">
                                        <td>남성</td>
                                    </c:when>
                                    <c:when test="${member.gender == 'woman'}">
                                        <td>여성</td>  
                                    </c:when>
                                    <c:otherwise>
                                        <td>선택안함</td>  
                                    </c:otherwise>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${member.sms_yn == 'N'}">
                                        <td>수신동의안함</td>
                                    </c:when>
                                    <c:otherwise>
                                        <td>동의</td>
                                    </c:otherwise>
                                </c:choose>    
                                <c:choose>
                                    <c:when test="${member.email_yn == 'Y'}">
                                        <td>수신동의</td>
                                    </c:when>
                                    <c:otherwise>
                                        <td>동의안함</td>
                                    </c:otherwise>
                                </c:choose>
                                
                                    <c:choose>
                                        <c:when test="${member.del_yn == 'N'}">
                                           <td> 활동중</td>
                                        </c:when>
                                        <c:otherwise>
                                           <td>탈퇴</td> 
                                        </c:otherwise>
                                    </c:choose>
                                
                                <td>${member.joinDate}</td>
                            </tr>
                        </c:forEach>
                    <tbody>
               
                    </tbody>
                  </table>
            </div>



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
   
</body>
</html>


