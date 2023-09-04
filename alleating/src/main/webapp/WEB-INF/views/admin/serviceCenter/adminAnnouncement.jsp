<%@ page language="java" contentType="text/html; charset=UTF-8"
isELIgnored="false" pageEncoding="UTF-8"%> <%
request.setCharacterEncoding("utf-8"); %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 페이지</title>
<style>
	.announcement_01_1{
		font-weight:500;
		font-size: 24px;
		color: rgb(51,51,51);
		letter-spacing: -0.5px;
		line-height:48px;

}

	.announcement_01_2 {
    	display: flex;
    	width: 100%;    	
    	padding: 20px 0px;
    	border-bottom: 2px solid rgb(51, 51, 51);
    	border-top: 2px solid rgb(51, 51, 51);
}
	.announcement_01_3 {
    	flex-basis: 50px;
    	text-align: center;
    	line-height: 20px;
    	font-weight: 400;
    	color: rgb(51, 51, 51);
    	display: flex;
  		flex-direction: column;
}
    	
    .announcement_01_21 {
    	flex-basis: 50px;
    	text-align: center;
    	line-height: 20px;
    	font-weight: 400;
    	color: rgb(51, 51, 51);
}

	.announcement_01_22 {
   	 -webkit-box-flex: 1;
   		flex-grow: 1;
    	text-align: center;
   	 	line-height: 20px;
    	font-weight: 400;
    	color: rgb(51, 51, 51);
}
	.announcement_01_23 {
    flex-basis: 100px;
    text-align: center;
    line-height: 20px;
    font-weight: 400;
    color: rgb(51, 51, 51);
}

	.announcement_01_24 {
    flex-basis: 100px;
    text-align: center;
    line-height: 20px;
    font-weight: 400;
    color: rgb(51, 51, 51);
}



li {
    display: list-item;
    text-align: -webkit-match-parent;
}



	a{
    background-color: transparent;
    text-decoration: none;
    color: inherit;
}


	.announcement_01_31 {
    display: flex;
    flex-direction: row;
    border-bottom: 1px solid rgb(244, 244, 244);
}

	.announcement_01_32 {
    text-align: center;
    padding: 20px 0px;
    color: rgb(76, 76, 76);
    flex-basis: 50px;
}
	.announcement_01_33 {
    padding: 20px 0px 20px 20px;
    color: rgb(76, 76, 76);
    flex: 1 1 0%;
    text-align: left;
}
	.announcement_01_34 {
    text-align: center;
    padding: 20px 0px;
    color: rgb(76, 76, 76);
    flex-basis: 100px;
}	

	.announcement_01_35 {
    text-align: center;
    padding: 20px 0px;
    flex-basis: 100px;
    color: rgb(153, 153, 153);
}
	.all{
	width:840px;
	
	}
	ul{
	list-style:none;
	}
	
</style> 
</head>
<body>

<div class="all">
<h2 class="announcement_01_1">공지사항</h2>

<div class="announcement_01_2">
<div width="50" class=".announcement_01_21">번호</div>
<div class="announcement_01_22">제목</div>
<div width="100" class="announcement_01_23">작성자</div>
<div width="100" class="announcement_01_24">작성일</div>
</div>
<ul class="announcement_01_3">
<li>
<a href="">
<div class="announcement_01_31">
<div class="announcement_01_32">공지</div>
<div class="announcement_01_33">[안내]8월 배송 휴무 일정</div>
<div class="announcement_01_34">올잇팅</div>
<div class="announcement_01_35">2023.08.16</div>
</div>
</a>
</li>
<li>
<a href="">
<div class="announcement_01_31">
<div class="announcement_01_32">공지</div>
<div class="announcement_01_33">[안내]8월 배송 휴무 일정</div>
<div class="announcement_01_34">올잇팅</div>
<div class="announcement_01_35">2023.08.16</div>
</div>
</a>
<li>
<a href="">
<div class="announcement_01_31">
<div class="announcement_01_32">공지</div>
<div class="announcement_01_33">[안내]8월 배송 휴무 일정</div>
<div class="announcement_01_34">올잇팅</div>
<div class="announcement_01_35">2023.08.16</div>
</div>
</a>
</li>
<li>
<a href="">
<div class="announcement_01_31">
<div class="announcement_01_32">공지</div>
<div class="announcement_01_33">[안내]8월 배송 휴무 일정</div>
<div class="announcement_01_34">올잇팅</div>
<div class="announcement_01_35">2023.08.16</div>
</div>
</a>
</li>
<li>
<a href="">
<div class="announcement_01_31">
<div class="announcement_01_32">공지</div>
<div class="announcement_01_33">[안내]8월 배송 휴무 일정</div>
<div class="announcement_01_34">올잇팅</div>
<div class="announcement_01_35">2023.08.16</div>
</div>
</a>
</li>
</ul>
</div>

</body>
</html>