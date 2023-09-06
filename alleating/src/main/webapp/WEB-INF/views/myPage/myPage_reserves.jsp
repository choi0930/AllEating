<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%
request.setCharacterEncoding("utf-8"); %>

<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<link
  href="${contextPath}/css/myPage_reserves.css"
  rel="stylesheet"
  type="text/css"
/>

<!DOCTYPE html>
<html>
  <head>
  <style>
  .myreview {
    padding-left: 15px;
}
  h5.rewardText {
    font-size: 13px;
    margin-left: -410px;
    color: lightgray;
    padding-top: 7px;
}
.rewardBox {
    padding-top: 80px;
    border-bottom: #000060 3px solid;
    display: flex;
    align-items: center;
    padding-bottom: 5px;
}
.rewardBox_2 {
    padding-left: 15px;
}
h5.rewardBox_2_text {
    font-size: 15px;
    color: gray;
}
.rewardList {
    padding-top: 30px;
}

th.th1 {
    width: 450px;
}
th.th2 {
    width: 150px;
}
th.th3 {
    width: 215px;
}td.rewardContent {width: 450px;
}
td.rewardUsePoint { width: 150px;
}
td.rewardCreDate {    width: 215px;
}
th, td {text-align: center;
padding-top:15px;
padding-bottom:15px;}
table.reviewTbl1 {
    border: 1px solid black;
    color: white;
    background: black;
}
table.reviewTbl2 {
    border-bottom: 1px solid black;
      border-left: 1px solid black;
        border-right: 1px solid black;
}
.rewardBox_1_text {
    padding-left: 10px;
}
  </style>
    <meta charset="UTF-8" />
    <title>적립금</title>
  </head>
  <body>
    <div class="myreview">
      <div class="rewardBox">
        <div class="rewardBox_1">
          <div class="rewardBox_1_text"><h3>적립금</h3></div>
        </div>
        
        <div class="rewardBox_2">
            <h5 class="rewardBox_2_text">
              보유하고 계신 적립금의 내역을 한 눈에 확인 하실 수 있습니다.
            </h5>
        </div>
      </div>

  <div class="rewardList">
  <table class="reviewTbl1">
  <tr>
	<th class="th1">내용</th>
	<th class="th2">금액</th>
	<th class="th3">날짜</th>
	</tr>
	</table>
		<c:forEach var="reward" items="${UserRewardList}">
		
   <div class="rewardList_detail">

	<div class="reward_1">
	
	
	<div class="rewardInfo">
	<table class="reviewTbl2">
	<tr>
<td class="rewardContent">${reward.content}</td> 
<td class="rewardUsePoint">${reward.usePoint }</td>
<td class="rewardCreDate">${reward.creDate }</td>
</tr>
</table>
<input type="hidden" name="id" value="${reward.id }"/>

</div>
	
    </div>
   </div>	
   
	</c:forEach>
	 </div>



    </div>
  </body>
</html>
