<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <% request.setCharacterEncoding("utf-8"); %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
    <link href="${contextPath}/css/find_pwd_02.css" rel="stylesheet" type="text/css" />
    <!DOCTYPE html>
<html>
<head>
    <title>비밀번호 재설정</title>
    <script>
      var passwdCheck = RegExp(
        /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,20}$/
      ); //비밀번호 유효성 검사
  $(function () {
        //비밀번호 일치 확인
        $("#alert-success").hide();
        $("#alert-danger").hide();
        $("input").keyup(function () {
          var pwd1 = $("#pwd1").val();
          var pwd2 = $("#pwd2").val();
          if (pwd1 != "" || pwd2 != "") {
            if (pwd1 == pwd2) {
              $("#alert-success").show();
              $("#alert-danger").hide();
              $("#alert-success").addClass("greenText");
            } else {
              $("#alert-success").hide();
              $("#alert-danger").show();
              $("#alert-danger").addClass("redText");
            }
          }
        });
        

        $("#pwdCheckMessage").hide();
        $("#pwd1").keyup(function () {
          //비밀번호 형식 검사
          if (passwdCheck.test($("#pwd1").val())) {
            $("#pwdCheckMessage").removeClass("redText");
            $("#pwdCheckMessage").addClass("greenText");
            console.log('아아');
          } else {
           console.log('아');
            $("#pwdCheckMessage").show();
            $("#pwdCheckMessage").text(
              "영문/숫자/특수문자(공백제외)포함 8자 이상 20이하"
            );
            $("#pwdCheckMessage").addClass("redText");
          }
        });

      });
       
      
      function fn_updatePwd(){
        if($('#pwd1').val() == ""){
			alert('비밀번호를 입력해주세요');
			setTimeout(function(){
			$('#pwd1').focus();
		});
			return false;
		}
		if($('#pwd2').val() == ""){
			alert('비밀번호확인을 입력해주세요');
			setTimeout(function(){
			$('#pwd2').focus();
			});
			return false;
		}
    if(!passwdCheck.test($('#pwd1').val())){
				alert('비밀번호 형식을 확인해주세요');
				setTimeout(function(){$('#pwd1').focus();});
				return false;
			}	
		if($('#pwd1').val() == $('#pwd2').val()){
			if(!passwdCheck.test($('#pwd1').val())){
				alert('비밀번호 형식을 확인해주세요');
				setTimeout(function(){$('#pwd1').focus();});
				return false;
			}	
		}
    document.updatePwdInfo.submit();
      }
    </script>
</head>
<body>
    <div class="pwdchangeresult">



<div class="pwdchange-detail">
<h1 class="pwdchange-title">비밀번호 재설정</h1>
<h5>고객님의 비밀번호를 재설정합니다.</h5>
</div>
<form name="updatePwdInfo" action="${contextPath}/member/updatePwdInfo.do" method="post" enctype="UTF-8">
<div class="pwdchangeform">
  <div style="margin-bottom: 30px;">
    <div class="form-floating" id="pwdchangeform-2">
        <input type="password" class="form-control" id="pwd1" name="pwd" placeholder="abc123">
        <label for="floatingPassword">비밀번호</label>
      </div>
      <div id="pwdCheckMessage"></div>
    </div>
      <div>
      <div class="form-floating" id="pwdchangeform-3">
        <input type="password" class="form-control" id="pwd2" placeholder="abc123">
        <label for="floatingPassword">비밀번호 확인</label>
      </div>
      <span id="alert-success">비밀번호가 일치합니다</span>
      <span id="alert-danger">비밀번호가 불일치합니다</span>
    </div>
      </div>



<div class="pwdchangeresult">
  <div class="pwdchangeresult-2">
    <button type="button"  radius="3" class="pwdchangeresultbutton" onclick="fn_updatePwd()">
    <span class="pwdchangeresultbutton-text">비밀번호 재설정</span>
    </button>
     </div>
   
        </div>
      </form>





</div>


    
    </body>
    </html>