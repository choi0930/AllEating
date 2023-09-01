<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>

function readURL(input) {
if (input.files && input.files[0]) {
var reader = new FileReader();
reader.onload = function (e) {
  $('#reviewImgAdd').attr('src', e.target.result);
};
reader.readAsDataURL(input.files[0]);
}
}
</script>

<style>


.content_foot_pb {
    padding-bottom: 80px !important;
}

.content_box {
    width: 1240px;
    margin: 0 auto;
    position: relative;
}

/* ul {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
} */

.bbs_vtype > ul > li.between {
    justify-content: space-between;
}

.bbs_vtype > ul > li {
    border-bottom: 1px solid #dedede;
    display: flex;
    padding: 14px 14px 14px 25px;
}

.bbs_vtype dd {
    flex: 1;
}

.cate {
    background-color: #041897;
    display: inline-block;
    width: 48px;
    height: 18px;
    font-size: 13px;
    color: #fff;
    text-align: center;
    line-height: 18px;
    margin-right: 6px;
    font-weight: normal;
    border-radius: 3px;
    font-size: 12px;
}

.bbs_vtype dl {
    display: flex;
    min-width: 50%;
    flex: 1;
}


.bbs_vtype dt {
    color: #888;
    margin-right: 25px;
    flex-shrink: 0;
}

p {
    word-break: break-word;
}

.eventallz{
width:840px;
}

.last-section {
    text-align:left;
    
}

.back-button {
    margin-top: 20px;
    padding: 10px 20px;
    font-size: 16px;

    
}
.busection{
	display: flex;
    justify-content: flex-end; /* 버튼을 화면 오른쪽으로 정렬 */
    align-items: center; /* 버튼을 세로 중앙 정렬 */
}

</style>


</head>
<body>

<div class="eventallz">
<div id="cotainer" style="padding-top: 0px;">
<div class="content_box content_foot_pb">

<form action="${contextPath}/myPage/completeReview.do" method="post" enctype="multipart/form-data">
<input type="hidden" name="id" value="${loginMember.id}">
<input type="hidden" name="productId" value="<%= request.getParameter("productId") %>">
<div class="bbs_vtype">



<ul>



<li class="between">
<dl>
<dt>브랜드</dt>
<dd><input name="productBrand" type="text" value="<%= request.getParameter("brand") %> "/></dd>
</dl>
</li>

<li class="between">
<dl>
<dt>상품명</dt>
<dd><input name="productName" type="text" value="<%= request.getParameter("naming") %>"/> </dd>
</dl>
</li>

<li class="between">
<dl>
<dt>작성자</dt>

<dd><input type="text" value="${loginMember.name}"/></dd>
<dd> </dd>

</dl>
</li>
 
 <li style="border-bottom: 0px solid #dedede;">
<dl>
<dt>내용</dt>
<dd> <!--  <input name="content" type="text"/>  --><textarea name="content" cols="30" rows="5"></textarea></dd>
</dl>
</li>
</ul>



 <div class="op06"><input type="file" name="fileName" value="파일 추가" onChange="readURL(this);" /></div>
<div><img id="reviewImgAdd"/></div> 
</div>





 

 <div class="busection">
  <button class="add_review_btn" type="submit">작성하기</button> 
 </div>
 
 </form>
 </div>
 
 </div>
 
 
 </div>

 
 
 
 
 


</body>
</html>