<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <% request.setCharacterEncoding("utf-8"); %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
    <c:set var="userProductVO" value="${userProductInfo.userProductVO}" /><!--상품정보-->
<c:set var="userProductImglist" value="${userProductInfo.userProductImglist}" /><!--이미지리스트-->
    
<!DOCTYPE html>
<html>
<head>


    <title>상품 상세페이지</title>
<link href="${contextPath}/css/product_detail_01.css" rel="stylesheet" type="text/css" />

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
var bDisplay = true;
function doDisplay(){
    var con = document.getElementById("toDisplay");
    if(con.style.display == "none"){
        con.style.display = "block";
    } else {
        con.style.display = "none";
    }
}

</script>


</head>
<body>


<div class="container">
      
  <table class="table table-striped">
    <thead>
      <tr>
        <th>번호</th>
        <th>제목</th>
        <th>내용</th>
        <th>작성자</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><input id="productName" type="text" value="${${newProductInfo.productName }" readonly="readonly"></td>
 
      </tr>
      <tr>
    </tbody>
  </table>
</div>



</body>
</html>