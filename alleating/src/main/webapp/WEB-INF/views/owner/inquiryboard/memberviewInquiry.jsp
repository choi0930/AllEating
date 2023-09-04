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
		 document.getElementById("i_imageFileName").disabled=false;
		 //document.getElementById("tr_btn_modify").style.display="block";
		 //document.getElementById("tr_btn").style.display="none";
	 }
	
	 function fn_modify_article(obj){
		 obj.action="${contextPath}/board/modArticle.do";
		 obj.submit();
	 }
	 
	 function fn_remove_article(url,articleNO){
		 var form = document.createElement("form");
		 form.setAttribute("method", "post");
		 form.setAttribute("action", url);
		 var articleNOInput = document.createElement("input");
		 articleNOInput.setAttribute("type", "hidden");
		 articleNOInput.setAttribute("name", "articleNO");
		 articleNOInput.setAttribute("value", articleNO);
		 
		 form.appendChild(articleNOInput);
		 document.body.appendChild(form);
		 form.submit();
	 }
	 
	 function fn_reply_form(url, parentNO) {
		 	var form = document.createElement("form");
		 	form.setAttribute("method", "get");
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
 <form name="frmArticle" method="post" action="${contextPath}" >
 <table border="0" align="center" >
 	<tr>
 		<td width="150" align="center" bgcolor="#FF9933">
 		글번호
 		</td>
 		<td>
 		 <input type="text" value="${inquiryBoardVO.articleNO }" disabled />
 		 <input type="hidden" name="articleNO" value="${inquiryBoardVO.articleNO}" />
		 
 		</td>
 	</tr>
 	<tr>
 		<td width="150" align="center" bgcolor="#FF9933">
 			작성자 아이디
 		</td>
 		<td>
 		<input type="text" value="${inquiryBoardVO.id }" name="writer" disabled />
 		</td>
 	</tr>
 	<tr>
 		<td width="150" align="center" bgcolor="#FF9933">
 			이름
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
		 <input type="text" value="${inquiryBoardVO.content }" name="content"  disabled />
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
  		<input type="button" value="리스트로 돌아가기" onClick="backToList(this.form)">
		<input type="button" value="답글쓰기" onClick="fn_reply_form('${contextPath}/owner/memberreplyForm.do', '${inquiryBoardVO.articleNO}')">
  	    </td>
   </tr>
 </table>
 </form>
</body>
</html>