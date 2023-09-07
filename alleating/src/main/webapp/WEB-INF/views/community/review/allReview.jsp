<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("utf-8");
%>

<c:set var="contextPath" value="${pageContext.request.contextPath }" />




<link href="${contextPath}/css/myPage_review.css" rel="stylesheet"
	type="text/css" />

<!DOCTYPE html>
<html>
<head>
	<style>
	input{border:none;
	font-size:20px;
	text-align: center;}
	input:focus {outline:none;}
	
	img, svg {
    vertical-align: middle;
    margin-bottom: 15px;
}
	
	.want01 {
 /*    border-bottom:solid 3px #ABDFF1; */
        padding-top: 60px;
}

h3.want01_text {
    padding-left: 405px;
	    padding-bottom: 35px;
}
.allReviewBox{
padding-top:15px;
padding-bottom: 160px;
 display: grid;
        grid-template-columns: repeat(auto-fill,249px);
        gap: 31px 14px;
        width: 100%;}
        
        .capture {
    display: flex;
    flex-direction: column;
    align-items: center;
}
input.productNaming {
    font-size: 15px;
    color: slategray;
}
	</style>
<meta charset="UTF-8" />
<title>상품 후기</title>


</head>
<body>
	<div class="myreview">
		
		
				<div class="want01">
					<h3 class="want01_text">리뷰 전체 보기</h3>
				</div>
		
			<div>
              <div class="allReviewBox">
				<c:forEach var="glgl" items="${allReviewList}" >
					
						<input type="hidden" name="productId" value="${glgl.productId}">   
					    <%-- <input type="hidden" name="order_seq_num" value="${zlzl.order_seq_num}">  --%>
					   <%--  <input type="hidden" name="review_ny" value="${zlzl.review_ny}"> --%>
						<div class="want_02">
							<div class="capture">

								<img
									src="${contextPath}/download.do?fileName=${glgl.fileName}&productId=${glgl.productId}&cateCode=${glgl.cateCode}"
									alt="${glgl.fileName}" width="150px" height="150px">
									<input type="text" class="productNaming" value="${glgl.productBrand}" name="brand" readonly>
								<input type="text" class="productNaming" value="${glgl.productName}" name="naming" readonly>
								<input type="text" class="productContent" value="${glgl.content }" name="content" readonly>
							</div>
							
							<div class="qwe">
							
							<%--  <input type="hidden" class="detail_01" value="[${review.productBrand}]${review.productName}"> --%>
						</div>
						</div>
						


						
					
				</c:forEach>
				
				</div>


			</div>


		



	</div>
</body>
</html>
