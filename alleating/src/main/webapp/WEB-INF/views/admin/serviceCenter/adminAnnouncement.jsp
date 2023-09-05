<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %> <%
request.setCharacterEncoding("utf-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<c:set var="adminBoardList" value="${boardMap.adminBoardList}" /> <!--공지사항 리스트-->
	<c:set var="total" value="${boardMap.boardTotal}" /> <!--공지사항 총 개수-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 관리 페이지</title>
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
	align-items: center;
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
    
    color: rgb(153, 153, 153);
}
	.all{
	width:840px;
	
	}
	ul{
	list-style:none;
	}
	.emptyBoard{
		display: flex;
		height: 80px;
		align-items: center;
		justify-content: center;
	}
	.pageBottom{
		margin-top: 10px;
		text-align: center;
	}
	.boardAddBtn{
		
		background-color: #000060;
    	width: 150px;
    	height: 38px;
    	color: white;
    	border: none;
    	border-radius: 6px;
    	margin: 0px 8px;
	}
	.addBtnArea{
		text-align: right;
		margin-bottom: 15px;
	}
</style>
<script>
	function fn_goAddBoard(){
		location.href = "/admin/addAnnouncementForm.do";
	}
	function fn_delBoard(articleNO){
		$.ajax({
			type:"POST",
			async:true,
			url: "/admin/delBoard.do",
			data: {articleNO: articleNO},
			success: function(data){
				alert('공지사항 글이 삭제 되었습니다');
				location.href="/admin/adminAnnouncement.do";
			},
			error: function(data){
				alert("에러가 발생했습니다.");
			}
		});
	}
</script> 
</head>
<body>
	<h2 class="announcement_01_1">공지사항</h2>
	<div class="addBtnArea">
		<button class="boardAddBtn" onclick="fn_goAddBoard()">공지사항 등록</button>
	</div>
	<div class="announcement_01_2">
	<div  class=".announcement_01_21">번호</div>
	<div class="announcement_01_22">제목</div>
	<div  class="announcement_01_23">작성자</div>
	<div  class="announcement_01_24">작성일</div>
	<div  class="announcement_01_24">관리</div>
	</div>

	<ul class="announcement_01_3">
		<c:choose>
			<c:when test="${empty adminBoardList}">
				<li>
					<div class="announcement_01_31 emptyBoard">
						공지사항이 없습니다.
					</div>
				</li>
			</c:when>
			<c:otherwise>
				<c:forEach var="board" items="${adminBoardList}">
					<li>	
						<a href="#">
							<div class="announcement_01_31">
								<div class="announcement_01_32"><a href="${contextPath}/admin/adminAnnouncement_detail.do?articleNO=${board.articleNO}">${board.articleNO}</a></div>
								<div class="announcement_01_33"><a href="${contextPath}/admin/adminAnnouncement_detail.do?articleNO=${board.articleNO}">${board.title}</a></div>
								<div class="announcement_01_34"><a href="${contextPath}/admin/adminAnnouncement_detail.do?articleNO=${board.articleNO}">AllEating</a></div>
								<div class="announcement_01_35">${board.writeDate}</div>
								<div class="announcement_01_35"><button class="btn btn-outline-warning">수정</button><button  class="btn btn-outline-danger" onclick="fn_delBoard('${board.articleNO}')">삭제</button></div>
							</div>
						</a>
					</li>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</ul>
	<div class="pageBottom">
		<c:if test="${total != null }">
		  <c:choose>
			<c:when test="${total > 200 }">
			  <c:forEach var="page" begin="1" end="${(total/20)+1}" step="1">
				<c:if test="${section >1 && page==1 }">
				  <a
					class="no-uline"
					href="${contextPath}/admin/adminAnnouncement.do?section=${section-1}&pageNum=${(section-1)*10 +1}"
					>&nbsp; pre</a
				  >
				</c:if>
				<a
				  class="no-uline"
				  href="${contextPath}/admin/adminAnnouncement.do?section=${section}&pageNum=${page}"
				  >${(section-1)*5 + page }</a
				>
				<c:if test="${page == (total/20)+1 }">
				  <a
					class="no-uline"
					href="${contextPath}/admin/adminAnnouncement.do?section=${section+1}&pageNum=${section*10+1 }"
					>&nbsp; next</a
				  >
				</c:if>
			  </c:forEach>
			</c:when>
			<c:when test="${total == 200 }">
			  <c:forEach var="page" begin="1" end="10" step="1">
				<a
				  class="no-uline"
				  href="${contextPath}/admin/adminAnnouncement.do?section=${section }&pageNum=${page }"
				  >${page }</a
				>
			  </c:forEach>
			</c:when>
			<c:when test="${total < 200 }">
			  <c:forEach var="page" begin="1" end="${(total/20)+1}" step="1">
				<c:choose>
				  <c:when test="${page==pageNum }">
					<a
					  class="sel-page"
					  href="${contextPath}/admin/adminAnnouncement.do?section=${section-1}&pageNum=${page}"
					  >${page }</a
					>
				  </c:when>
				  <c:otherwise>
					<a
					  class="no-uline"
					  href="${contextPath}/admin/adminAnnouncement.do?section=${section+1}&pageNum=${page }"
					  >${page }</a
					>
				  </c:otherwise>
				</c:choose>
			  </c:forEach>
			</c:when>
		  </c:choose>
		</c:if>
	  </div>

</body>
</html>