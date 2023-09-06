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
	font-size:20px;}
	input:focus {outline:none;}
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
					<h3>작성한 후기</h3>
				</div>
			</div>
			<div>
				<div class="review01"></div>
			</div>
			<div class="review02">
				
			</div>
		</div>
			<div>
              <div>
              
				<c:forEach var="zlzl" items="${reviewWrittenList}">
					
						<input type="hidden" name="productId" value="${zlzl.productId}" readonly>   
					    <%-- <input type="hidden" name="order_seq_num" value="${zlzl.order_seq_num}">  --%>
					   <%--  <input type="hidden" name="review_ny" value="${zlzl.review_ny}"> --%>
						<div class="want_02">
							<div class="capture">

								<img
									src="${contextPath}/download2.do?fileName=${zlzl.fileName}&articleNO=${zlzl.articleNO}"
									alt="${zlzl.fileName}" width="150px" height="150px">
							</div>
						</div>
						<div class="qwe">
							<input type="text" class="productNaming" value="${zlzl.productBrand}" name="brand"readonly>
								<input type="text" class="productNaming" value="${zlzl.productName}" name="naming"readonly>
								<input type="text" class="productContent" value="${zlzl.content }" name="content"readonly>
							<%--  <input type="hidden" class="detail_01" value="[${review.productBrand}]${review.productName}"> --%>
						</div>


						<div class="text04">
							<div class="form_end">
								<button type="submit" class="review_btn">
									<span id="review_del_btn_text">후기 삭제</span>
								</button>
							</div>
						</div>
					
				</c:forEach>
				
				</div>


			</div>


		



	</div>
</body>
</html>
