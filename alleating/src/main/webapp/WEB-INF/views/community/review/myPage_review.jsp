<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("utf-8");
%>

<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<c:set var="reviewList" value="${userReviewInfo.reviewList}" />



<link href="${contextPath}/css/myPage_review.css" rel="stylesheet"
	type="text/css" />

<!DOCTYPE html>
<html>
<head>
	<style>
		.reviewBox {
    padding-top: 15px;
    padding-bottom: 100px;
}
.productNaming {
    border: none;
    font-size: 30px;
	</style>
<meta charset="UTF-8" />
<title>상품 후기</title>
<script>
	$(document).ready(function() {
		$("ul.tabs li").click(function() {
			var tab_id = $(this).attr("data-tab");

			$("ul.tabs li").removeClass("active");
			$(".tab-content").removeClass("active");

			$(this).addClass("active");
			$("#" + tab_id).addClass("active");
		});
	});

	function fn_goAddProduct() {
		location.href = "/admin/adminAddProductForm.do";
	}
</script>
</head>
<body>
	<div class="myreview">
		<div class="pwant">
			<div class="proW">
				<div class="want01">
					<h3>작성 가능한 후기</h3>
				</div>
			</div>
			<div>
				<div class="review01"></div>
			</div>
			<div class="review02">
				
			</div>
		</div>
			<div class="reviewBox">

				<c:forEach var="review" items="${reviewList}">
					<form action="/myPage/myPage_reviewForm.do" method="get" encType="multipart/form-data">
						<input type="hidden" name="productId" value="${review.productId}">   
					    <input type="hidden" name="order_seq_num" value="${review.order_seq_num}">
					    <input type="hidden" name="review_ny" value="${review.review_ny}">
						<div class="want_02">
							<div class="capture">

								<img
									src="${contextPath}/download.do?fileName=${review.fileName}&productId=${review.productId}&cateCode=${review.cateCode}"
									alt="${review.fileName}" width="150px" height="150px">
							</div>
						</div>
						<div class="qwe">
							<input type="text" class="productNaming" value="[${review.productBrand}]" name="brand" readonly>
								<input type="text" class="productNaming" value="${review.productName}" name="naming" readonly>
				
						</div>


						<div class="text04">
							<div class="form_end">
								<button type="submit" class="review_btn">
									<span id="review_add_btn_text">후기 쓰기</span>
								</button>
							</div>
						</div>
					</form>
				</c:forEach>


			</div>


		



	</div>
</body>
</html>
