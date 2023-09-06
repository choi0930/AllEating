<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" /> 
<%
 request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>글보기</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<!-- <style>
	#tr_btn_modify{
		position:relative;
	    left:+300px;
		display:none;
	}
	</style> -->
	<script type="text/javascript">
	 function backToList(obj){
		 obj.action="${contextPath}/owner/ownerinquirylist.do";
		 obj.submit();
	 }
	 
	 function fn_enable(obj){
		 document.getElementById("i_title").disabled=false;
		 document.getElementById("i_content").disabled=false;

	 }
	
	 function fn_modify_article(obj){
		 obj.action="${contextPath}/owner/updateArticle.do";
		 obj.submit();
	 }
	 
	 
	 function fn_reply_form(url, parentNO) {
		 	var form = document.createElement("form");
		 	form.setAttribute("method", "post");
		 	form.setAttribute("action", url);
		 var parentNOInput = document.createElement("input");
		 parentNOInput.setAttribute("type", "hidden");
		 parentNOInput.setAttribute("name", "parentNO");
		 parentNOInput.setAttribute("value", parentNO);
		 
		 form.appendChild(parentNOInput);
		 document.body.appendChild(form);
		 form.submit();
	 }
	 
	 function readURL(input){
		 if(input.files && input.files[0]){
			 var reader = new FileReader();
			 reader.onload = function (e){
				 $('#preview').attr('src', e.target.result);
			 }
			 reader.readAsDataURL(input.files[0]);
		 }
	 } 
	</script>
</head>
<body>
 <form name="frmArticle" method="GET" action="${contextPath}/owner/updateArticle.do"" >
 <table border="0" align="center" >

 	<tr>
 		<td width="150" align="center" bgcolor="#FF9933" >
 			작성자 아이디
 		</td>
 		<td>
 		<input type="text" value="${inquiryBoardVO.id}" name="writer" disabled />
 		</td>
 	</tr>
 	<tr>
 		<td width="150" align="center" bgcolor="#FF9933">
 			제목
 		</td>
 		<td>
 		 <input type="text" value="${inquiryBoardVO.title }" name="title" id="i_title" disabled />
 		</td>
 	</tr>

	 <tr>
		<td width="150" align="center" bgcolor="#FF9933">
			내용
		</td>
		<td>
		 <input type="text" value="${inquiryBoardVO.content }" name="content" id="i_content" disabled />
		</td>
	</tr>

 	
  <tr>
  		<td width="20%" align="center" bgcolor="#FF9933">
  			등록일자
  		</td>
  		<td>
  			<input type="text" value="<fmt:formatDate value="${inquiryBoardVO.writeDate}" />" disabled />
  		</td>
  	<tr id="tr_btn" >
  		<td colspan="2" align="center">
  		<input type="button" value="수정하기" onClick="fn_enable(this.form)">
		<input type="button" value="수정반영하기" onClick="fn_modify_article(frmArticle)" >
		<a class="product_del_btn" href="${ContextPath}/owner/removeArticle.do?articleNO=${inquiryBoardVO.articleNO}">삭제</a>
  		<input type="button" value="리스트로 돌아가기" onClick="backToList(this.form)">
  	    </td>
   </tr>
 </table>
 </form>
</body>
</html>