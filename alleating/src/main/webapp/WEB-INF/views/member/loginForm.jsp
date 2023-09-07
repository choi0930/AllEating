<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"  isELIgnored="false" %>
<%
request.setCharacterEncoding("utf-8");
%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
    <c:set var="contextPath" value="${pageContext.request.contextPath}"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
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
<script>

document.addEventListener("keyup", function(event) {
    if (event.keyCode === 13) { // Enter 키의 keyCode는 13입니다.
      fn_loginDO(); // 로그인 함수 호출
    }
  });
  

	function fn_loginDO(){
		var _id = $('#floatingInput').val();
		var _pwd = $('#floatingPassword').val();

		if(_id == ""){
			alert("아이디를 입력해주세요");
			$('#floatingInput').focus();
			return false;
		}
		if(_pwd == ""){
			alert("비밀번호를 입력해주세요");
			$('#floatingPassword').focus();
			return false;
		}

		var form = document.createElement("form");
		form.setAttribute("charset","UTF-8");
		form.setAttribute("method","POST");
		form.setAttribute("action", "/member/login.do");

		var hiddenField = document.createElement("input");
		hiddenField.setAttribute("type","hidden");
		hiddenField.setAttribute("name", "id");
		hiddenField.setAttribute("value", _id);
		form.appendChild(hiddenField);

		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "pwd");
		hiddenField.setAttribute("value", _pwd);
		form.appendChild(hiddenField);

		document.body.appendChild(form);
         form.submit();
		 document.getElementById("form").remove();
	}
	var failed = new URLSearchParams(window.location.search).get('result');
		
		if (failed === 'loginFailed') {
		  alert('로그인에 실패했습니다. 아이디와 비밀번호를 확인해주세요.');
		}
</script>

</head>
<body>
<div align="center" class="to">
<img src ="${contextPath}/img/image_logo/alleating_logo_background_X.png" style = "width:200px; height:150px;"/>
	<!--<div id="loginTitle">로그인</div>-->
	<div class="com_tab_con" style="display: block;">

<div class="form-floating mb-3">
  <input type="text" class="form-control" id="floatingInput"  placeholder="아이디">
  <label for="floatingInput" class="loginInputText">아이디</label>
</div>
<div class="form-floating">
  <input type="password" class="form-control" id="floatingPassword"  placeholder="비밀번호">
  <label for="floatingPassword" class="loginInputText">비밀번호</label>
</div>
	</div>
			<div class="find_id_pw_box">
				<ul class="tab_box">
					<li><a href="${contextPath}/member/memberForm.do">회원가입</a></li>
					<li><div class="join_bar"></div></li>
      				<li><a href="${contextPath}/member/find_id_01.do">아이디찾기</a></li>
					<li><div class="join_bar"></div></li>
					<li><a href="${contextPath}/member/find_pwd_01.do">비밀번호찾기</a></li>
		    	</ul>
		    </div>
			
			<div class="loginButtonBox">
				<button class="loginBtn" onclick="fn_loginDO()">로그인</button>
			</div>
		
			<br>
			<div>
			<ul id="snsLoginIconGroup">
				<li>
					<a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=22821e5743829f1eb421764701cb07c1&redirect_uri=http://localhost:8080/member/kakao.do">
						<span class="loginKokoIcon"></span>
						<span class="loginSnsText">카카오 로그인</span>
					</a>
				</li>
			</ul>
			
			<!-- 카카오 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
Kakao.init('1d89484c3196a79b77c9f71ffa39d4ef'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
			var kakaoid=response.id;
			console.log(response);
			
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
//카카오로그아웃  
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }  
</script>
			</div>
			<!-- <div class="login_nomemberOderSearch">
				<a href="#"><span>비회원 조회하기</span></a>
			</div> -->
	
		
		
	</div>
		</div>
		
</body>
</html>