/**
 * 
 */
 	
 //로그인 버튼 눌렀을때 유효성 검사
function fn_loginGO(){
	var joinType = $('.joinCheck:checked').val()
	
	if(joinType == 'owner'){
		if($('#companyName').val()==""){
			alert('사업장명을 입력해주세요');
			setTimeout(function(){
			$('#companyName').focus();
			return false;
			});
		}
		if($('#companyNum').val()==""){
			alert('사업장 번호를 입력해주세요');
			setTimeout(function(){
			$('#companyNum').focus();
			});
			return false;
		}
		if($('#companyTel1').val()==""){
			alert('사업장 전화번호를 입력해주세요');
			setTimeout(function(){
			$('#companyTel1').focus();
			});
			return false;
		}
		if($('#companyTel2').val()==""){
			alert('사업장 전화번호를 입력해주세요');
			setTimeout(function(){
			$('#companyTel2').focus();
			});
			return false;
		}
		if($('#companyTel3').val()==""){
			alert('사업장 전화번호를 입력해주세요');
			setTimeout(function(){
			$('#companyTel3').focus();
		});
			return false;
		}
	}
		if($('#userId').val() == ""){
			alert('아이디를 입력해주세요');
			setTimeout(function(){
			$('#userId').focus();
			});
			return false;
		}
		if(!userIdCheck.test($('#userId').val())){
				alert("아이디: 6자 이상 16자 이하의 영문 혹은 영문과 숫자를 조합 해주세요");
				setTimeout(function(){
			$('#userId').focus();
			});
			return false;
		}
		
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
		if($('#pwd1').val() == $('#pwd2').val()){
		
			if(!passwdCheck.test($('#pwd1').val())){
				alert('비밀번호 형식을 확인해주세요');
				setTimeout(function(){$('#pwd1').focus();});
				return false;
			}
				
		}
		
		if($('#join_name').val() == ""){
			alert('이름을 입력해주세요');
			setTimeout(function(){
				$('#join_name').focus();
			});
			return false;
		}
		if($('#userEmail').val() == ""){
			alert('이메일을 입력해주세요');
			setTimeout(function(){
			$('#userEmail').focus();
			});
			return false;
		}	
		if($('#selects').val() == ""){
			alert('이메일을 입력해주세요');
			setTimeout(function(){
			$('#selects').focus();
			});
			return false;
		}
		if($('#email_check').val() == ""){
			alert('이메일 인증을 해주세요');
			setTimeout(function(){
			$('#email_check').focus();
			});
			return false;
		}
		if($('#hp1').val() == ""){
			alert('전화번호를 입력해주세요');
			setTimeout(function(){
			$('#hp1').focus();
			});
			return false;
		}
		if($('#hp2').val() == ""){
			alert('전화번호를 입력해주세요');
			setTimeout(function(){
			$('#hp2').focus();
			});
			return false;
		}
		if($('#hp3').val() == ""){
			alert('전화번호를 입력해주세요');
			setTimeout(function(){
			$('#hp3').focus();
			});
			return false;
		}
		if($('#sample6_postcode').val() == ""){
			alert('주소를 입력해주세요');
			setTimeout(function(){
			$('.addressBtn').focus();
			});
			return false;
		}
		
		if($('#sample6_detailAddress').val() == ""){
			alert('상세주소를 입력해주세요');
			setTimeout(function(){
			$('#sample6_detailAddress').focus();
		});
			return false;
		}
		if(document.getElementById('check1')== false){
			alert('이용약관 동의를 체크해주세요');
			setTimeout(function(){
			$('#check1').focus();
		});
			return false;
		}
		if(document.getElementById('check2')== false){
			alert('이용약관 동의를 체크해주세요');
			setTimeout(function(){
			$('#check2').focus();
			});
			return false;
		}
		if(document.getElementById('check3')== false){
			alert('개인정보 수집 이용·동의를 체크해주세요');
			setTimeout(function(){
			$('#check3').focus();
		});
			return false;
		}

	document.joinForm.submit();
}

//이메일 sms 수신동의 전체 체크
$(document).ready(function(){
//전체 체크박스 클릭
	$("#checkAll2").click(function() {
		if ($("#checkAll2").prop("checked")) {
			$(".testCheck2").prop("checked", true);
		} else {
			$(".testCheck2").prop("checked", false);
		}
	});
//전체 체크박스 선택중 체크박스 하나를 풀었을때 "전체" 체크해제
	$(".testCheck2").click(function() {
		if ($(".testCheck2:checked").length == 2) {
			$("#checkAll2").prop("checked", true);
		} else {
			$("#checkAll2").prop("checked", false);
		}
	});
});

//이용약관 동의 체크박스
$(document).ready(function(){
//전체 체크박스 클릭
	$("#checkAll").click(function() {
		if ($("#checkAll").prop("checked")) {
			$(".testCheck").prop("checked", true);
		} else {
			$(".testCheck").prop("checked", false);
		}
	});
//전체 체크박스 선택중 체크박스 하나를 풀었을때 "전체" 체크해제
	$(".testCheck").click(function() {
		if ($(".testCheck:checked").length == 7) {
			$("#checkAll").prop("checked", true);
		} else {
			$("#checkAll").prop("checked", false);
		}
	});
});

//사업자 회원가입 체크시
function fn_ownerInfoShow(){
	var joinType = $('.joinCheck:checked').val();
	console.log(joinType);
	if(joinType == 'owner'){
		$('.ownerInfo').css('display','block');
		$('.ownerInfoValue').attr('disabled', false);
		$('.owner_address').css('display','block');
		$('.user_address').css('display','none');
	} else {
		$('.ownerInfo').css('display','none');
		$('.ownerInfoValue').attr('disabled', true);
		$('.ownerInfoValue').val("");
		$('.owner_address').css('display','none');
		$('.user_address').css('display','block');
	}	
}
//이메일 select박스
function fn_select(){
	var text = $('#email_select').val();
	if((text =='self') || (text=='choose')){
		$('#selects').val("");
		$('#selects').attr('disabled', false);
	}
	else{
		$('#selects').val(text);
		$('#selects').attr('disabled', true);
	}

	}
	
		$(function(){
	$('#alert-success').hide();
	$('#alert-danger').hide();
	$("input").keyup(function(){
		var pwd1 = $('#pwd1').val();
		var pwd2 = $('#pwd2').val();
		if(pwd1 !="" || pwd2 != ""){
			if(pwd1 == pwd2){
				$('#alert-success').show();
				$('#alert-danger').hide();
				$('#alert-success').addClass("greenText");
			}else{
				$('#alert-success').hide();
				$('#alert-danger').show();
				$('#alert-danger').addClass("redText");
			}
		}
	});

	$('#idCheckMessage').hide();
	
	$('#userId').keyup(function(){
		if(userIdCheck.test($('#userId').val())){
			$('#idCheckMessage').removeClass("redText");
			$('#idCheckMessage').addClass("greenText");
		}else{
			$('#join_id_ex').hide();
			$('#idCheckMessage').show();
			$('#idCheckMessage').text('6자 이상 16자 이하의 영문 혹은 영문과 숫자를 조합');
			$('#idCheckMessage').addClass('redText');
		}
	});
	$('#pwdCheckMessage').hide();
	$('#pwd1').keyup(function(){
		if(passwdCheck.test($('#pwd1').val())){
			$('#pwdCheckMessage').removeClass("redText");
			$('#pwdCheckMessage').addClass("greenText");
			
		}else{
			$('#join_pwd_ex').hide();
			$('#pwdCheckMessage').show();
			$('#pwdCheckMessage').text('영문/숫자/특수문자(공백제외)포함 8자 이상 20이하');
			$('#pwdCheckMessage').addClass('redText');
		}
	});

	$('#nameCheckMessge').hide();
	$('#join_name').keyup(function(){
		if(('#join_name').val() != " "){
			$('#nameCheckMessge').hide();
			$('#join_name_ex').show();
		}else{
			$('#join_name_ex').hide();
			$('#nameCheckMessge').show();
			$('#nameCheckMessge').text('이름을 입력해주세요');
			$('#nameCheckMessge').addClass('redText');
		}
	});
});
