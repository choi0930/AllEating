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
<title>상품 문의 등록창</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function readURL(input){
		if (input.files && input.files[0]){
			var reader = new FileReader();
			reader.onload = function (e){
				$('#preview').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	function backToList(obj){
		obj.action = "${contextPath}/owner/ownerinquirylist.do";
		obj.submit();
	}
	var cnt=1;
	
	function fn_addFile(){
		$("#d_file").append("<br>"+"<input type='file' name='file"+cnt+"' />");
		cnt++;
	}
</script>
 <title>글쓰기창</title>
</head>
<body>
	<h1 style = "text-align:center">상품문의</h1>
	<form name = "articleForm" method = "post"
								action = "${contextPath}/owner/addOwnerInquiry.do">
	<table border = "0" align = "center">

		<tr>
			<td align = "right"> 제목: </td>
			<td colspan = "2"><input type = "text" size = "30" maxlength="200"
													name="title"/></td>
		</tr>
		<tr>
			<td align = "right"> 내용: </td>
			<td colspan = "2"><input type = "text" size = "30" maxlength="200"
													name="content"/></td>
		</tr>
		<tr>
			<td colspan="4"><div id="d_file"></div></td>
		</tr>
		<tr>
			<td align = "right"></td>
			<td colspan ="2">
				<input type = "submit" value ="학생등록"/>
				<input type = "button" value = "목록보기" onClick = "backToList(this.form)" />
			</td>
		</tr>																				
	</table>							
</form>
</body>
</html>