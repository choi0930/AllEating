<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"  isELIgnored="false" %>
<%
    request.setCharacterEncoding("utf-8");
    %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/> 
<!DOCTYPE html>
<html>
<head>



<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<style>


.find_id_pw_box input {
    width: 100%;
    height: 35px;
    padding: 0 10px;
    border-radius: 4px;
}

input[type="text"], input[type="password"], input[type="search"], input[type="tel"], input[type="email"], input[type="number"] {
    margin: 1px 0;
    padding: 5px 3px 4px 3px;
    height: 30px;
    border: 1px solid #cacaca;
    border-radius: 0;
}
.btn_basic.green {
    background-color: #409b29;
    color: #fff;
}
.btn_basic.green1 {
    background-color: #041897;
    color: #fff;
    }


.to {
	width: 500px;
	margin: 20px auto;
    text-align: center;
	
  }

.find_id_pw_box ul a { 
	text-decoration:none;
	color:black;
 }
 

.kakao{
border:none;
background-color:#FFFFFF;}
 

#css-123 {
margin-bottom:15px;
width:400;}
#css-456 {
width:400;}

.tab_box{
	
	display: flex;
float:right;
align-items: center
}

.join_bar{
	width: 1px;
    height: 20px;
    margin: 0px 12px;
    background-color: rgb(217, 217, 217);
}
.find_id_pw_box{
	padding: 10px 0px 10px;
}
.loginButtonBox{
	margin-top: 30px;
}
.loginBtn{
	border: none;
    display: block;
    width: 100%;
    min-height: 70px;
    height: auto;
    background: #000060;
    color: #fff;
    font-size: 21px;
    letter-spacing: -0.3px;
    line-height: 1.2;
}
.loginKokoIcon{
	display: inline-block;
	background-image: url(${contextPath}/img/image_icon/icon.png);
    background-position: -61px -164px;
    width: 51px;
    height: 51px;
}
#snsLoginIconGroup{
	display: table;
    table-layout: fixed;
    width: 100%;
}
.loginSnsText{
	display: block;
    margin-top: 5px;
    font-size: 11px;
    line-height: 1.5;
    color: #666;
    letter-spacing: -0.5px;
}
.login_nomemberOderSearch{
	padding-top:10px;
 border-top: 1px solid #041897;
	margin-top: 10px;
	margin-bottom: 50px;
}
#loginTitle{
	margin-top: 100px;
	font-size: 30px;
	font-weight: bold;
}
.loginInputText{
	color:#666;
}
</style>


<div class="no">	
	<section class="se">
		
	</section>
</div>

<div align="center" class="to">
<img src ="${contextPath}/img/image_logo/alleating_logo_background_X.png" style = "width:200px; height:150px;"/>
	<!--<div id="loginTitle">로그인</div>-->
	<div class="com_tab_con" style="display: block;">
	
	<div class="form-floating mb-3">
  <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com">
  <label for="floatingInput" class="loginInputText">아이디</label>
</div>
<div class="form-floating">
  <input type="password" class="form-control" id="floatingPassword" placeholder="Password">
  <label for="floatingPassword" class="loginInputText">비밀번호</label>
</div>
	
	
	
			<!-- <input type="text" name="id" id="main_id" value="" class="mb5" placeholder="아이디">
			<br>
			<input type="password" maxlength="16" name="pw" id="main_pw" value="" placeholder="비밀번호"> -->
	</div>
			<div class="find_id_pw_box">
				<ul class="tab_box">
					<li><a href="./join.php">회원가입</a></li>
					<li><div class="join_bar"></div></li>
      				<li><a href="./login.php?r=idpw&amp;inbox=1">아이디찾기</a></li>
					<li><div class="join_bar"></div></li>
					<li><a href="./login.php?r=idpw&amp;inbox=3">비밀번호찾기</a></li>
		    	</ul>
		    </div>
			<!--
			<div class="d-grid gap-2 col-6 mx-auto" id="css-123">  <div class="btn_box txt_center">
				<button class="btn btn-primary" >로그인</button>    <button class="btn_basic green1">로그인</button> 
			</div>-->
			<!--
			<div class="d-grid gap-2 col-6 mx-auto" id="css-456">
				<button class="btn btn-light">회원가입</button>  <button class="btn_basic green2"> 
			</div>-->
			<div class="loginButtonBox">
				<button class="loginBtn"><span>로그인</span></button>
			</div>
			<br>
			<div>
			<!-- <div class="btn_box txt_center"> -->
			<ul id="snsLoginIconGroup">
				<li>
					<a href="#">
						<span class="loginKokoIcon"></span>
						<span class="loginSnsText">카카오 로그인</span>
					</a>
				</li>
			</ul>
			</div>
			<div class="login_nomemberOderSearch">
				<a href="#"><span>비회원 조회하기</span></a>
			</div>
	
		
		
	</div>
		</div>
		
</body>
</html>