<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <% request.setCharacterEncoding("utf-8"); %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
	<link
  href="${contextPath}/css/ownerinquiry.css"
  rel="stylesheet"
  type="text/css"
/>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>글목록창</title>
</head>
<body>
<div class="ownerproductinquiry">	
	<div class="adminProductMain_searchBarArea">
		<!--상품관리 상단-->

		<div class="adminProductMain_inputDateBOX">
		  <!--조회할 일자 선택 및 검색 박스-->
		  <div class="statusText">
			<span>조회기간</span>
		  </div>
		  <div class="adminProductMain_dateArea">
			<input type="date" class="adminProductMain_Dateinput" />
			<span>~</span>
			<input type="date" class="adminProductMain_Dateinput" />
		  </div>
		  <div>
			<input type="text" class="form-control" />
		  </div>
		  <div>
			<input
			  class="adminProductMain_searchBTN"
			  type="button"
			  value="조회"
			/>
		  </div>
		</div>
	  </div>
	  <!--상품관리 상단끝 end adminProductMain_searchBarArea-->
	<table align = "center" border="1" width="99%" >
		<tr height="10" align="center" bgcolor="lightgreen">
			<td>번호</td>
			<td>아이디</td>
			<td>제목</td>
			<td>작성일</td>
		</tr>
	<c:choose>
	 <c:when test="${ownerinquirylist == null }">
	  <tr height="10">
	   <td colspan="4">
	   	<p align="center">
	   		<b><span style="font-size:9pt;">등록된 글이 없습니다.</span></b>
	   	</p>
	   </td>
	  </tr>	
	 </c:when>
	 <c:when test="${ownerinquirylist != null}" >
	  <c:forEach var="article" items="${ownerinquirylist}" varStatus="articleNum">
	   <tr align="center">
	    <td width="5%">${articleNum.count}</td>
	    <td width="10%">${article.id}</td>
	    <td align='left' width="35%">
	     <span style="padding-right:30px"></span>
	      <c:choose>
	       <c:when test='${article.level > 1 }'>
	        <c:forEach begin="1" end="${article.level}" step="1">
	        	<span style="padding-left:20px"></span>
	        </c:forEach>
	        <span style="font-size:12px;">[답변]</span>
	         <a class='cls1' href="${contextPath}/owner/viewArticle.do?articleNO=${article.articleNO}">${article.title}</a>
	        </c:when>
	        <c:otherwise>
	         <a class='cls1' href="${contextPath}/owner/memviewArticle.do?articleNO=${article.articleNO}">${article.title}</a>
	        </c:otherwise>
	       </c:choose>
	      </td>
	      <td width="10%">${article.writeDate}</td>
	      </tr> 
	  </c:forEach>
	   </c:when>
	   </c:choose>
	</table>
	<a
	class="cls1"
	href='${contextPath}/owner/OwnerInquiryForm.do'
	><p class="cls2">글쓰기</p></a
  >
</div>
</body>
</html>

