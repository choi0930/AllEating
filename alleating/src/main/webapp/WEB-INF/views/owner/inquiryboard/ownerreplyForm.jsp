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
	<title>답글쓰기 페이지</title>
	<script src="//code.jquery.com/jquery-3.3.1.js"></script>
	<script type="text/javascript">
		function readURL(input) {
			if(input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function (e) {
					$('#preview').attr('src', e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
		function backToList(obj){
			obj.action = "${contextPath}/board/listArticles.do";
			obj.submit();
		}
	</script>
</head>
<body>
 <h1>답글쓰기</h1>
  <form name="frmReply" method="post" action="${contextPath}/owner/addReply.do">
   <table>
	<input
                              type="hidden"
                              value="${ownerinquiry.parentNO}"
                              name="parentNO"
                            />
    <tr>
		<td align="right"> 작성자:&nbsp; </td>
		<td><input type="text" size="20" maxlength="100" name="writer" value="${loginMember.id}" readonly></input></td>
	</tr>	

    <tr>
    	<td align="right">제목:&nbsp; </td>
    	<td><input type="text" size="67" maxlength="500" name="title"></input></td>
    </tr>	
    <tr>
    	<td align="right" valign="top"><br>내용:&nbsp; </td>
    	<td><textarea name="content" rows="10" cols="65" maxlength="4000"></textarea></td>
    </tr>

    <tr>
    	<td align="right"></td>
    	<td>
    		<input type=submit value="답글반영하기" />
    		<input type=button value="취소'${ownerinquiry.parentNO}'"	onClick="backToList(this.form)"	/>
    	</td>	
    </tr>
   </table>
  </form>
</body>
</html>