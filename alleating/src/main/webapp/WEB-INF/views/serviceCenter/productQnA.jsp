<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     
     <% request.setCharacterEncoding("utf-8"); %>
     <c:set var="contextPath" value="${pageContext.request.contextPath }" />
     <c:set var="QnAList" value="${userQnaInfo.QnAList}" />
<!DOCTYPE html>
<html>
<head>
<style>

	.frequent_q_01a {
	    width: 820px;
}
	.frequent_q_01b {
	    display: flex;
	    flex-direction: row;
	    width: 100%;
	    padding-bottom: 27px;
	    align-items: center;
}

	.frequent_q_01c {
	    display: flex;
	    flex-direction: row;
	    -webkit-box-align: center;
	    align-items: center;
}

	.frequent_q_01d {
    font-weight: 500;
    font-size: 24px;
    color: rgb(51, 51, 51);
    letter-spacing: -0.5px;
    line-height: 48px;
    margin-bottom:1px;
}

	.frequent_q_01e {
    display: flex;
    width: 100%;
    padding: 20px 0px;
    border-bottom: 1px solid rgb(51, 51, 51);
    border-top: 1px solid rgb(51, 51, 51);
}



	.frequent_q_01e2 {
    flex-basis: 550px;
    text-align: center;
    line-height: 20px;
    font-weight: 400;
    color: rgb(51, 51, 51);
}
	.frequent_q_01e3 {
    -webkit-box-flex: 1;
    flex-grow: 1;
    text-align: center;
    line-height: 20px;
    font-weight: 400;
    color: rgb(51, 51, 51);
}
	.frequent_q_01e4 {
    -webkit-box-flex: 1;
    flex-grow: 1;
    text-align: center;
    line-height: 20px;
    font-weight: 400;
    color: rgb(51, 51, 51);
}
	.frequent_q_01f3 {
    text-align: center;
    padding: 20px 0px;
    color: rgb(76, 76, 76);
    flex-basis: 70px;
    }
	ul{
	list-style:none;
	}
	
	.frequent_q_01f {
    display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    -webkit-flex-direction: column;
    -ms-flex-direction: column;
    flex-direction: column;
    padding-top: 15px;
}
	.frequent_q_01f1 {
   /*  cursor: pointer; */
    display: flex;
    align-items: center;
}

	.frequent_q_01f2 {
    display: flex;
    flex-direction: row;
    border-bottom: 1px solid rgb(244, 244, 244);
    position: relative;
    right: 42px;
}
	.frequent_q_01f3 {
    text-align: center;
    padding: 20px 22px;
    color: rgb(76, 76, 76);
    flex-basis: 497px;
}
	.frequent_q_01f4 {
    text-align: center;
    padding: 20px 20px;
    color: rgb(76, 76, 76);
    flex-basis: 130px;
}
	.frequent_q_01f5 {
    padding: 20px 0px 20px 20px;
    color: rgb(76, 76, 76);
    flex: 1 1 0%;
    text-align: left;
    padding-left: 35px;
}
	
	.frequent_q_all{
	width:840px;
	}
	
	dl.dlcss {
    display: flex;
    }
    .qnaInfo {
    padding-left: 15px;
    font-size: 15px;
    display: flex;
    align-items: center;
  
}
td.qnaTitle {
    
width: 345px;
}
td.qnaUser {
    
}

td.qnaDate {
    width: 185px;

}
th.th1 {
    padding-left: 15px;
}
th.th2 {
   padding-left: 330px;
}
th.th3 {
        padding-left: 150px;
}
th.th4 {
    padding-left: 65px;
}
.qna_add_btn{
border:none;
width:100px;
height:40px;
background:#000060;
color:white;
margin-left: 585px;} 
td{
text-align:center;}
td.frequent_q_01f1_1 {

   width: 170px;
}
	</style>
<title>Insert title here</title>
</head>
<body>

 
<form action="${contextPath}/serviceCenter/addQnAForm.do?productId=<%= request.getParameter("productId") %>">
    <input type="hidden" name="productId" value="<%= request.getParameter("productId") %>"/>
<div class="frequent_q_all">
	<div class="frequent_q_01a">
	
	<div class="frequent_q_01b">
	
	<div class="frequent_q_01c">
	
	<h2 class="frequent_q_01d">상품 문의</h2>
	</div>
	
	
<button class="qna_add_btn" type="submit">작성하기</button>

	</div>
	</div>
	</div>

<!-- 	<div class="frequent_q_01e">
<div class="frequent_q_01e3">상품 정보</div>
	<div width="200" class="frequent_q_01e2">제목</div>
	<div class="frequent_q_01e3">작성자</div>
	<div class="frequent_q_01e4">작성일</div>
	</div> -->
	
  <div class="qnaList">
  <table>
  <tr>
	<th class="th1">상품 정보</th>
	<th class="th2">제목</th>
	<th class="th3">작성자</th>
	<th class="th4">작성일</th>
	</tr>
	</table>
		<c:forEach var="qna" items="${QnAList}">
		
   <div class="qnaList_detail">

	<div class="frequent_q_01f">
	
	
	<div class="qnaInfo">
	<table>
	<tr>
	<td class="frequent_q_01f1"><img src="${contextPath}/download.do?fileName=${qna.fileName}&productId=${qna.productId}&cateCode=${qna.cateCode}" alt="${qna.fileName}" width="70px" height="70px"></div></td>
 <td class="frequent_q_01f1_1"><div>[${qna.productBrand}]</div> <div>${qna.productName}</div> </td>
<td class="qnaInfo_under">
<td class="qnaTitle">${qna.title }</td>
<td class="qnaUser">${qna.id }</td>
<td class="qnaDate">${qna.writeDate }</td>

</tr>
</table>
<!--<input type="hidden" name="productId" value="${qna.productId }"/>-->


</div>
	
		


    </div>
   </div>	
   
	</c:forEach>
	
	</form>
  </div>
	
	
<%-- 		<c:forEach var="qnaList" items="${productQnAResult}">
	<div class="qnaList">

	<ul class="frequent_q_01f">
	<li class="frequent_q_01f1">
	<div class="frequent_q_01f2"><img src="${contextPath}/download.do?fileName=${qnaList.fileName}&productId=${qnaList.productId}&cateCode=${qnaList.cateCode}" alt="${qnaList.fileName}" width="300px" height="300px"></div>	
	<div class="frequent_q_01f3"><a href="#">${qnaList.productBrand}${qnaList.productName}</a></div>
	<div class="frequent_q_01f4"> ${qnaList.productId } </div>
	<div class="frequent_q_01f5">${qnaList.productId }</div>
	</li>
	</ul>
	
	</div>	
	</c:forEach> --%>
	
	


</body>
</html>