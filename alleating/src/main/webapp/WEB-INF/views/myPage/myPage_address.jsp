<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%
request.setCharacterEncoding("utf-8"); %>

<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<link href="${contextPath}/css/myPage_ad.css" rel="stylesheet" type="text/css"/>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>찜한 상품</title>
  </head>
  <body>
	<div class="pwant">
		<div class="proW">
			<div class="want01"><h3>배송지 관리</h3></div>
			<div class="text01">배송지에 따라 상품정봉 및 배송유형이 달리질 수 있습니다.</div>
		</div>
		
	<table id="title" align = "center" border="1" width="100%" >
		<tr height="60" align="center" >
			<td id="title01">선택</td>
			<td id="title02">주소</td>
			<td id="title03">받으실 분</td>
			<td id="title04">연락처</td>
			<td id="title05">배송 유형</td>
			<td id="title06">수정</td>
		</tr>
	</table>		
	</div>	
  </body>
</html>