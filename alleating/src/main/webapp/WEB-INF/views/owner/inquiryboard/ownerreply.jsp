<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	 function backToList(obj){
		 obj.action="${contextPath}/owner/ownerinquirylist.do";
		 obj.submit();
	 }

</script>
</head>
<body>
<style>
	.admin_personal_q_addall{
	width:840px;
	padding-top: 15px;
}
	.admin_personal_q_adda{
	display: flex;
	flex-direction: row;
	width:100%;
	padding-bottom: 27px;
	-webkit-box-pack:justify;
	justify-content: space-between;
}
	.admin_personal_q_addb{
	display:flex;
	flex-direction:row;
	-webkit-box-align:center;
	align-items:center;
}

	.admin_personal_q_addb{
	font-weight: 500;
	font-size: 24px;
	color: rgb(51, 51, 51);
	letter-spacing: -0.5px;
	line-height: 48px;
	
}

	.admin_personal_q_addc{
	margin-bottom: 1px;
	}
	

	.admin_personal_q_addd {
    width: 840px;
    padding: 4px 20px;
    border-top: 2px solid rgb(51, 51, 51);
        padding-top: 25px;
}

	.admin_personal_q_adde{
	display: flex;
	padding: 12px 0px;
	-webkit-box-align: start;
	align-items; start;
}
	.admin_personal_q_adde1{
	 width: 140px;
    font-size: 14px;
    line-height: 44px;
}
	.admin_personal_q_adde2{
	color: red;
}
	.admin_personal_q_adde3{
	width:640px;	
}
	.admin_personal_q_adde4{
	display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
}
	.admin_personal_q_adde5{
	display:flex;
	-webkit-box-pack: justify;
	justify-content: space-between;	
}
	.admin_personal_q_adde6 {
    display: inline-flex;
    flex-direction: column;
    position: relative;
    min-width: 0px;
    padding: 0px;
    margin: 0px;
    border: 0px;
    vertical-align: top;
    width: 100%;
}
	.jss2 {
    font-family: Noto Sans;
    div.-mui-paper-root: [object Object];
}

	.css-eg1co4 {
    font-family: Roboto, Helvetica, Arial, sans-serif;
    font-weight: 400;
    line-height: 1.4375em;
    letter-spacing: 0.00938em;
    color: rgba(0, 0, 0, 0.87);
    box-sizing: border-box;
    cursor: text;
    display: inline-flex;
    -webkit-box-align: center;
    align-items: center;
    position: relative;
    font-size: 14px;
    height: 44px;
    border-color: rgb(221, 221, 221);
    border-radius: 0px;
}
	
	.css-qiwgdb.css-qiwgdb.css-qiwgdb {
    padding-right: 32px;
}
	.css-qiwgdb.MuiSelect-select {
    height: auto;
    min-height: 1.4375em;
    text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden;
}
	
	.css-qiwgdb {
    appearance: none;
    user-select: none;
    border-radius: 4px;
    cursor: pointer;
    font: inherit;
    letter-spacing: inherit;
    color: currentcolor;
    border: 0px;
    box-sizing: content-box;
    background: none;
    height: 1.4375em;
    margin: 0px;
    -webkit-tap-highlight-color: transparent;
    display: block;
    min-width: 0px;
    width: 100%;
    animation-name: mui-auto-fill-cancel;
    animation-duration: 10ms;
    padding: 16.5px 14px;
}

	.css-1k3x8v3 {
    bottom: 0px;
    left: 0px;
    position: absolute;
    opacity: 0;
    pointer-events: none;
    width: 100%;
    box-sizing: border-box;
}
	.jss2 .MuiSelect-iconOutlined {
    right: 10px;
}

	svg:not(:root) {
    overflow: hidden;
}    
    .css-1636szt {
    user-select: none;
    width: 1em;
    height: 1em;
    display: inline-block;
    fill: currentcolor;
    flex-shrink: 0;
    transition: fill 200ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
    font-size: 1.5rem;
    position: absolute;
    right: 7px;
    top: calc(50% - 0.5em);
    pointer-events: none;
    color: rgba(0, 0, 0, 0.54);
}

	.jss2 .MuiOutlinedInput-notchedOutline {
    border-color: #ddd !important;
}

	.css-igs3ac {
    text-align: left;
    position: absolute;
    inset: -5px 0px 0px;
    margin: 0px;
    padding: 0px 8px;
    pointer-events: none;
    border-radius: inherit;
    border-style: solid;
    border-width: 1px;
    overflow: hidden;
    min-width: 0%;
    border-color: rgba(0, 0, 0, 0.23);
}

	.css-nnbavb {
    float: unset;
    padding: 0px;
    line-height: 11px;
    transition: width 150ms cubic-bezier(0, 0, 0.2, 1) 0ms;
}

	img, legend {
    border: 0;
    vertical-align: top;
}

	.css-tzsjye {
    display: inline-flex;
    flex-direction: column;
    position: relative;
    min-width: 0px;
    padding: 0px;
    margin: 0px;
    border: 0px;
    vertical-align: top;
    width: 100%;
}
	.css-eg1co4.Mui-disabled {
    background-color: rgb(250, 250, 250);
}
	.css-eg1co4.Mui-disabled {
    color: rgba(0, 0, 0, 0.38);
    cursor: default;
}
	.css-eg1co4 {
    font-family: Roboto, Helvetica, Arial, sans-serif;
    font-weight: 400;
    line-height: 1.4375em;
    letter-spacing: 0.00938em;
    color: rgba(0, 0, 0, 0.87);
    box-sizing: border-box;
    cursor: text;
    display: inline-flex;
    -webkit-box-align: center;
    align-items: center;
    position: relative;
    font-size: 14px;
    height: 44px;
    border-color: rgb(221, 221, 221);
    border-radius: 0px;
}
	.css-qiwgdb.css-qiwgdb.css-qiwgdb {
    padding-right: 32px;
}
	.css-qiwgdb.Mui-disabled {
    opacity: 1;
    -webkit-text-fill-color: rgba(0, 0, 0, 0.38);
}
	.css-qiwgdb.MuiSelect-select {
    height: auto;
    min-height: 1.4375em;
    text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden;
}
	.css-qiwgdb.Mui-disabled {
    cursor: default;
}
	.css-qiwgdb {
    appearance: none;
    user-select: none;
    border-radius: 4px;
    cursor: pointer;
    font: inherit;
    letter-spacing: inherit;
    color: currentcolor;
    border: 0px;
    box-sizing: content-box;
    background: none;
    height: 1.4375em;
    margin: 0px;
    -webkit-tap-highlight-color: transparent;
    display: block;
    min-width: 0px;
    width: 100%;
    animation-name: mui-auto-fill-cancel;
    animation-duration: 10ms;
    padding: 16.5px 14px;
}    
    button[disabled], input[disabled] {
    cursor: default;
}
	.css-1k3x8v3 {
    bottom: 0px;
    left: 0px;
    position: absolute;
    opacity: 0;
    pointer-events: none;
    width: 100%;
    box-sizing: border-box;
}
	.jss2 .MuiSelect-iconOutlined {
    right: 10px;
}
	.css-1636szt.Mui-disabled {
    color: rgba(0, 0, 0, 0.26);
}
	svg:not(:root) {
    overflow: hidden;
}
	.css-1636szt {
    user-select: none;
    width: 1em;
    height: 1em;
    display: inline-block;
    fill: currentcolor;
    flex-shrink: 0;
    transition: fill 200ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
    font-size: 1.5rem;
    position: absolute;
    right: 7px;
    top: calc(50% - 0.5em);
    pointer-events: none;
    color: rgba(0, 0, 0, 0.54);
}
	.css-eg1co4.Mui-disabled .MuiOutlinedInput-notchedOutline {
    border-color: rgba(0, 0, 0, 0.26);
}
	.jss2 .MuiOutlinedInput-notchedOutline {
    border-color: #ddd !important;
}
	.css-igs3ac {
    text-align: left;
    position: absolute;
    inset: -5px 0px 0px;
    margin: 0px;
    padding: 0px 8px;
    pointer-events: none;
    border-radius: inherit;
    border-style: solid;
    border-width: 1px;
    overflow: hidden;
    min-width: 0%;
    border-color: rgba(0, 0, 0, 0.23);
}
	fieldset {
    margin: 0;
    padding: 0;
}

	.css-nnbavb {
    float: unset;
    padding: 0px;
    line-height: 11px;
    transition: width 150ms cubic-bezier(0, 0, 0.2, 1) 0ms;
}
	legend {
    display: block;
    padding-inline-start: 2px;
    padding-inline-end: 2px;
    border-width: initial;
    border-style: none;
    border-color: initial;
    border-image: initial;
}
	.admin_personal_q_addf {
    display: flex;
    padding: 12px 0px;
    -webkit-box-align: start;
    align-items: start;
}
	.admin_personal_q_addf1 {
    width: 140px;
    font-size: 14px;
    line-height: 44px;
}
	.admin_personal_q_addf2 {
    color: red;
}
	.admin_personal_q_addf3 {
    width: 640px;
}
	.admin_personal_q_addf4 {
    padding: 0px;
}
	.css-1waqr6j input {
    font-size: 14px;
}
	.css-1quw3ub {
    width: 100%;
    height: 44px;
    padding: 0px 11px 1px 15px;
    border-radius: 4px;
    border: 1px solid rgb(221, 221, 221);
    font-weight: 400;
    font-size: 16px;
    line-height: 42px;
    color: rgb(51, 51, 51);
    outline: none;
    box-sizing: border-box;
}
	.admin_personal_q_addg > div {
    padding-bottom: 0px;
}
	.admin_personal_q_addg1 {
    display: flex;
    padding: 12px 0px;
    -webkit-box-align: start;
    align-items: start;
}
	.admin_personal_q_addg2 {
    width: 140px;
    font-size: 14px;
    line-height: 44px;
}
	.css-hwfcu5 {
    color: red;
}
	.admin_personal_q_addg3{
    width: 640px;
}
	.admin_personal_q_addg5{
    position: relative;
    display: flex;
    flex-direction: column;
    height: 536px;
    background-color: rgb(255, 255, 255);
    border: 1px solid rgb(221, 221, 221);
    border-radius: 4px;
}
	.css-rm6te4 textarea {
    font-family: "Noto Sans", sans-serif;
}
	.css-5etceh {
    display: block;
    width: 100%;
    height: 100%;
    padding: 15px 16px;
    font-size: 16px;
    line-height: 21px;
    word-break: break-all;
    z-index: 1;
    background: none;
    border-radius: 4px;
    color: rgb(51, 51, 51);
    outline: none;
    resize: none;
    border: none;
}

	.admin_personal_q_addh {
    display: flex;
    padding: 12px 0px;
    -webkit-box-align: start;
    align-items: start;
}
	.admin_personal_q_addh1 {
    width: 140px;
    font-size: 14px;
    line-height: 44px;
}
	.admin_personal_q_addh2 {
    width: 640px;
}
	.admin_personal_q_addh3 {
    padding: 3px 0px 0px;
}
	.admin_personal_q_addh4 {
    display: flex;
    flex-flow: wrap;
    gap: 9px;
    font-size: 20px !important;
}
	.admin_personal_q_addh4 > div {
    height: 72px;
    width: auto;
}
	.css-j9ybaa {
    width: 100%;
    height: 100%;
    border: 1px solid rgb(221, 221, 221);
    border-radius: 6px;
}
	.css-175wokr span {
    font-size: 20px;
}
	.css-113ip0v {
    display: inline-block;
    width: 1.875rem;
    height: 1.875rem;
    background-image: url(data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzAiIGhlaWdodD0iMzAiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CiAgICA8ZyBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiPgogICAgICAgIDxwYXRoIGQ9Ik0wIDBoMzB2MzBIMHoiLz4KICAgICAgICA8ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSg0Ljc3OSA2LjExMSkiIHN0cm9rZT0iIzMzMyIgc3Ryb2tlLXdpZHRoPSIxLjMiPgogICAgICAgICAgICA8cGF0aCBkPSJNMTEuNzkyIDBjLjM5OSAwIC43MTcuMDU2Ljk1NS4xNy4xNzkuMDg0LjM0Ni4xOTkuNTAzLjM0NGwuMTUzLjE1NS42MzEuNzAzYy4xMjIuMTMuMjM0LjIzMy4zMzcuMzFhLjk1Ljk1IDAgMCAwIC4zNC4xNmMuMTI1LjAzMS4yOTIuMDQ3LjUwMy4wNDdsMi45MDYtLjAwM2MxLjI4NCAwIDIuMzI0IDEuMDYyIDIuMzI0IDIuMzd2MTEuMTUxYzAgMS4zMS0xLjA0IDIuMzctMi4zMjQgMi4zN0gyLjMyNGMtMS4yODMgMC0yLjMyNC0xLjA2LTIuMzI0LTIuMzdWNC4yNTdjMC0xLjMxIDEuMDQtMi4zNyAyLjMyNC0yLjM3aDIuOTgzYy4yNDUtLjAwOS40MzItLjA0NS41NTktLjEwOC4xMS0uMDU1LjIzLS4xNDUuMzYtLjI3bC4xMzQtLjEzNy42MzEtLjcwM2MuMi0uMjIuNDE4LS4zODcuNjU3LS41LjE5LS4wOS40MzItLjE0NC43MjUtLjE2Mkw4LjYwMyAwaDMuMTg5eiIvPgogICAgICAgICAgICA8Y2lyY2xlIGN4PSIxMC4xNDIiIGN5PSI5LjUyOSIgcj0iMy41NTYiLz4KICAgICAgICA8L2c+CiAgICA8L2c+Cjwvc3ZnPgo=);
    background-size: cover;
    background-position: center center;
    background-repeat: no-repeat;
}
	.css-eivff4 {
    display: none;
}
	.admin_personal_q_addh7 {
    margin: 11px 0px 7px;
    line-height: 16px;
    font-size: 13px;
    color: rgb(153, 153, 153);
    
    
    
	   
}
	.admin_personal_q_addh8 {
    display: flex;
    flex-direction: row;
    margin-top: 7px;
   
}
	.css-1xbds45::before {
    content: "•";
    margin-right: 3px;

}
	.admin_personal_q_addi {
    display: flex;
    flex-direction: row;
    margin-top: 7px;
	
}

	.admin_personal_q_addi2 {
    display: flex;
    -webkit-box-pack: center;
    justify-content: center;
    -webkit-box-align: center;
    align-items: center;
    padding-top: 40px;
    margin-top: -75px;
    margin-bottom: 130px;
}
	button[disabled], input[disabled] {
    cursor: default;
}

	.css-13kn1it {
    width: 160px;
    height: 56px;
    padding: 0px 10px;
    text-align: center;
    letter-spacing: 0px;
    font-size: 16px;
    line-height: 20px;
    color: white;
    cursor: pointer;
    background-color: rgb(221, 221, 221);
    font-family: "Noto Sans", sans-serif;
    font-weight: 500;
    border-radius: 3px !important;
}

.add_submit_btn{
	border: none;
    width: 183px;
    height: 55px;
    background: #000060;
    color: white;
	position: relative;
    left: 192px;
    bottom: 50px;
}

.add_submit_btn02{
	border: none;
    width: 183px;
    height: 55px;
    background: #000060;
    color: white;
    position: relative;
    left: 201px;
    bottom: 50px;
}



</style>



<div class="admin_personal_q_addall">
<div class="admin_personal_q_adda">
<div class="admin_personal_q_addb">
<h3 class="admin_personal_q_addc">답글 쓰기</h3>
</div>
</div>
<div class="admin_personal_q_addd">
<form name="frmReply" method="post" action="${contextPath}/owner/addReply.do">

<input type="hidden" name="parentNO" value="${parentNO}"/> 


<div class="admin_personal_q_adde">
<div class="admin_personal_q_adde1">
<label data-testid="label-text">
아이디
<span data-testid="label-required-text" class="admin_personal_q_adde2">*</span>
</label>
</div>
<div class="admin_personal_q_adde3">
<div class="admin_personal_q_adde4">
<div class="admin_personal_q_adde5">


<div>
<div class="admin_personal_q_adde6">


<input data-testid="input-box" id="inquiry-subject" name="id" value="${loginMember.id}" type="text" height="44" class="css-1quw3ub e1uzxhvi2" readonly>

</div>


</div>
</div>
<div class="admin_personal_q_adde5">
<div>
<div class="MuiFormControl-root css-tzsjye">
<div variant="outlined" class="MuiOutlinedInput-root MuiInputBase-root MuiInputBase-colorPrimary Mui-disabled MuiInputBase-formControl jss2 css-eg1co4">

<input aria-hidden="true" tabindex="-1" disabled="" class="MuiSelect-nativeInput css-1k3x8v3" value="">

<path d="M7 10l5 5 5-5z"></path></svg>

<legend class="css-nnbavb">
<span class="notranslate">​</span>
</legend>
</fieldset>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
<div class="admin_personal_q_addf">
<div class="admin_personal_q_addf1">
<label for="inquiry-subject" data-testid="label-text">
제목
<span data-testid="label-required-text" class="admin_personal_q_addf2">*</span>
</label>
</div>
<div class="admin_personal_q_addf3">
<div class="admin_personal_q_addf4">

<div height="44" class="css-t7kbxx e1uzxhvi3">
<input data-testid="input-box" id="inquiry-subject" name="title" type="text" height="44" class="css-1quw3ub e1uzxhvi2" >
</div>
</div>
</div>
</div>
<div class="admin_personal_q_addg">
<div class="admin_personal_q_addg1">
<div class="admin_personal_q_addg2">

<label for="inquiry-contents" data-testid="label-text">내용 <span data-testid="label-required-text" class="css-hwfcu5 e1vbjq4w0">*
</span></label>
</div>

<div class="admin_personal_q_addg3">
<div class="admin_personal_q_addg4">
<div class="admin_personal_q_addg5">

<textarea id="inquiry-contents" inputmode="text" aria-label="textarea-message" name="content"  class="css-5etceh e1tjt2bn1"></textarea>
</div>
</div>
</div>
</div>
</div>
<div class="admin_personal_q_addh">
<div class="admin_personal_q_addh1">
<label data-testid="label-text"></label>
</div>
<div class="admin_personal_q_addh2">
<div class="admin_personal_q_addh3">
<div class="admin_personal_q_addh4">
<div class="admin_personal_q_addh5">
<div class="admin_personal_q_addh6">

</div>
</div>
<div class="admin_personal_q_addh7">

</div>
</div>
</div>
</div>
</div>
<div class="admin_personal_q_addi2">
	<input type="button" value="목록으로" class="add_submit_btn" onClick="backToList(this.form)" >
	<input type="submit" value="답글 반영" class="add_submit_btn02">
</div>
</form>
</body>
</html>