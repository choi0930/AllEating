<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
	.announcement_02a {
    	width: 830px;
    	margin: 0px auto;
}
	.announcement_02a1{
		width: 100%;
    	padding: 50px 0px;
}
	.announcement_02a2 {
    font-weight: 700;
    font-size: 28px;
    color: rgb(51, 51, 51);
    line-height: 35px;
    text-align: center;
    letter-spacing: -1px;
}   
	.announcement_02a3 {
    margin-top: 5px;
    color: rgb(153, 153, 153);
    line-height: 20px;
    letter-spacing: -0.1px;
    text-align: center;
}

	.announcement_02b {
    margin-top: 20px;
    border-top: 2px solid rgb(51, 51, 51);
    color: rgb(51, 51, 51);
}

	.announcement_02b1 {
    display: flex;
    flex-direction: row;
    border-bottom: 1px solid rgb(244, 244, 244);
}
	.announcement_02b2{	
    width: 130px;
    padding: 13px 0px 13px 20px;
    background-color: rgb(247, 245, 248);
    border-top: 1px solid rgb(244, 244, 244);
    text-align: left;
    font-weight: 500;
}
	.announcement_02b3{
	
    padding-left: 25px;
    align-self: center;
}


	.announcement_02e {
    padding: 30px 10px 100px;
    border-bottom: 1px solid rgb(128, 128, 128);
}
	.announcement_02f{
    display: flex;
    left:30%;
    width: 100%;
    padding: 20px 0px;
    -webkit-box-pack: end;
    justify-content: flex-end;
}
	.announcement_02_button {
    display: block;
    padding: 0px 10px;
    text-align: center;
    overflow: hidden;
    width: 150px;
    height: 42px;
    border-radius: 0px;
    color: rgb(255, 255, 255);
    background-color: #041897;
    border: 0px none;
}
	.announcement_02_button1 {
    font-size: 13px;
}



</style>
<script>
	function fn_returnBordList(){
		location.href = "/admin/adminAnnouncement.do";
	}
</script>
<body>
	<div class="announcement_02a">
	<div class="announcement_02a1">
	<div class="announcement_02a2">공지사항</div>
	<div class="announcement_02a3">올잇팅의 새로운 소식들과 유용한 정보들을 한곳에서 확인하세요.</div>
	</div>

	<div class="announcement_02b">
	<div class="announcement_02b1">
	<div class="announcement_02b2">제목</div>
	<div class="announcement_02b3">${boardVO.title}</div>
	</div>
	
	
	<div class="announcement_02b1">
	<div class="announcement_02b2">작성자</div>
	<div class="announcement_02b3">AllEating</div>
	</div>

	
	<div class="announcement_02b1">
	<div class="announcement_02b2">작성일</div>
	<div class="announcement_02b3">${boardVO.writeDate}</div>
	</div>
	
	<div class="announcement_02e">
	<div>
	<p>
		${boardVO.content}
	</p>
	
	</div>
	</div>
	
	<div class="announcement_02f">
	<button class="announcement_02_button" type="button" width="150" height="42" radius="0" onclick="fn_returnBordList()">
	<span class="announcement_02_button1">목록</span>
	</button>
	</div>
	
</body>
</html>




















