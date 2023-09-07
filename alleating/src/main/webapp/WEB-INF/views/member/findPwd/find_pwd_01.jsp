<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <% request.setCharacterEncoding("utf-8"); %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
    <link href="${contextPath}/css/find_pwd_01.css" rel="stylesheet" type="text/css" />
    <!DOCTYPE html>
<html>
<head>
    <title>비밀번호 찾기</title>
    <script>
      function fn_findPassword(){
        var id = $('input[name=id]').val();
        var email = $('input[name=email]').val();
        var member = {
          id:id,
          email:email
        }
        $.ajax({
    		type : "POST",
    		async : true, 
    		url : "/member/find_pwd_02.do",
    		data: JSON.stringify(member),
        contentType: "application/json; charset=UTF-8",
        dataType:"text",
    		success : function(data) {
          if(data=='true'){
            location.href="/member/fin_pwd.do";
          }else{
            alert("가입 시 입력한 회원 정보가 맞는지 다시 한번 확인해 주세요.");
          }
               
    		},
    		error : function(data, textStatus) {
    			alert("오류 발생");
    		}
    	}); //end ajax	
      }

    </script>
</head>
<body>
    <div class="findpwd">
<div class="findpwd-detail">
<h1 class="findpwd-title">비밀번호 찾기</h1>
</div>
<div class="findform">
  <div class="form-floating" id="findform-4">
    <input type="text" class="form-control" id="floatingInput" placeholder="id" name="id">
    <label for="floatingInput">아이디</label>
  </div>
  
  <!--<div class="form-floating" id="findform-5">
    <input type="text" class="form-control" id="floatingInput" placeholder="name">
    <label for="floatingInput">이름</label>
  </div>-->
  <div class="form-floating" id="findform-6">
    <input type="text" class="form-control" id="floatingInput" placeholder="id@example.com" name="email">
    <label for="floatingInput">이메일</label>
    <!--<button type="button"  radius="3" class="emailrequestbutton">
        <span class="emailrequestbutton-text">인증번호 받기</span>
        </button>-->
  </div>
  <!--<div class="form-floating" id="findform-7">
    <input type="text" class="form-control" id="floatingInput" placeholder="111111" >
    <label for="floatingInput">인증번호 6자리 숫자 입력</label>
  </div>-->




  
  <div class="findpwd-next">
    <button type="button"  radius="3" class="findbutton" onclick="fn_findPassword()">
    <span class="findbutton-text">다음</span>
    </button>
     </div>
</div>





</div>

    </div>
    </body>
    </html>