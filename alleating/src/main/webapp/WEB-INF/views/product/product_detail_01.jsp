<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <% request.setCharacterEncoding("utf-8"); %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>


    <title>상품 상세페이지</title>
<link href="${contextPath}/css/product_detail_01.css" rel="stylesheet" type="text/css" />

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
var bDisplay = true;
function doDisplay(){
    var con = document.getElementById("toDisplay");
    if(con.style.display == "none"){
        con.style.display = "block";
    } else {
        con.style.display = "none";
    }
}

</script>


</head>
<body>
<div class="css-16c0d8l">
<main id="productinfo" class="productinfocss">
<div class="imagefood">
<img src="${contextPath}/img/image_food/shinemuscat.jpg">
</div>
<div id="list">
<section class="listcss">
<div class="listcss-1">번개배송<img src="${contextPath}/img/image_logo/thunder.png" height="30px">
<h1 class="listcss-2"> [All Eating] 저탄소 샤인머스캣</h1>
<h2 class="listcss-3">상큼함으로 무장한 연둣빛 포도</h2>
<h2>
<span class="listcss-sale">7</span><span class="listcss-sale">%</span>
<span class="listcss-4">13,990</span><span class="listcss-4">원</span>
</h2>
<span class="listcss-price">18,900원</span>
</div>
<div class="listcss-5">로그인 후, 적립 혜택이 제공됩니다.</div>


<div class="list">
<dl class="dlcss" id="dlcss-2">
<dt class="listcss-6">배송</dt>
<dd class="listcss-7">
<p>21시 전 주문 시 내일 아침 7시 전 도착</p>
</dd>
</dl>

<dl class="dlcss">
<dt class="listcss-6">판매자</dt>
<dd class="listcss-7">
<p>올잇팅</p>
</dd>
</dl>

<dl class="dlcss">
<dt class="listcss-6">포장타입</dt>
<dd class="listcss-7">
<p>냉장</p>
</dd>
</dl>

<dl class="dlcss">
<dt class="listcss-6">판매단위</dt>
<dd class="listcss-7">
<p>1팩</p>
</dd>
</dl>

<dl class="dlcss">
<dt class="listcss-6">중량/용량</dt>
<dd class="listcss-7">
<p>옵션별 상이</p>
</dd>
</dl>

<dl class="dlcss">
<dt class="listcss-6">원산지</dt>
<dd class="listcss-7">
<p>국산</p>
</dd>
</dl>

<dl class="dlcss">
<dt class="listcss-6">유통기한</dt>
<dd class="listcss-7">
<p>농산물로 별도의 유통기한은 없으나 가급적 빨리 섭취하기를 권장드립니다.</p>
</dd>
</dl>

<div class="choice">
<div class="choice-1">
<dl class="choice-2">
<dt class="choice-3">상품 선택</dt>
<dd class="choice-4">
<div class="choice-5">
<div class="choice-6">
<span class="choice-7"> [All Eating] 저탄소 샤인머스캣</span>
</div>
<div class="choice-8">
<div class="choice-9">
<button type="button" aria-label="수량내리기" disabled class="choicebutton-down"></button>
<div class="choice-10">1</div>
<button type="button" aria-label="수량올리기"  class="choicebutton-up"></button>
</div>
<div class="choice-11">
<span class="choice-12">13,900</span><span class="choice-12">원</span>
<span class="choice-13">11,610</span><span class="choice-13">원</span>
</div>
</div>
</div>
</dd>
</dl>
</div>





</div>

<div class="choice-cart-Info">
    <div class="choice-cart" >
        <div class="choice-cart-2"  id="toDisplay" style="display:none;">
        <div class="choice-cart-text">
             <h6 class="choice-cart-text-content">상품을 장바구니에 담았습니다.</h6>
        </div>
        <div class="choice-button">
        <button type="button" class="choice-button-view" onclick="location.href='${contextPath}/product/product_01.do'">쇼핑 계속하기</button>
        <button type="button" class="choice-button-view" onclick="location.href='${contextPath}/cart/myCart.do'">장바구니 가기</button>
        </div>
        </div> 
    </div>
</div>
<div class="total">
<div class="total-2">
<div class="total-3">
<span class="total-4">총 금액: </span>
<span class="total-4">0</span>
<span class="total-4">원</span>
</div>


</div>
</div>
<div class="circle">
<span class="circle-2">적립</span>
<span class="circle-3">구매 시 </span>
<span class="circle-3">0원</span>
<span class="circle-3">적립</span>
</div>

<div class="result">
<button type="button" class="resultbutton" width="56" height="56" radius="3">
<span class="heart">
<img src="${contextPath}/img/image_logo/heart_icon.png" class="heartimg">
</span>
</button>
<div class="cart">
<button type="button"   radius="3" class="cartbutton" onclick="doDisplay()">
<span class="cart-2">장바구니 담기</span>
</button>
 <div class="buy">
<button type="button"  radius="3" class="buybutton" onclick="location.href='${contextPath}/cart/pay_01.do'">
<span class="buy-2">구매하기</span>
</button>
 </div>
</div>

</div>
</div>
</section>
</div>

</main>
</div>



<div class="how">
<span>이런 상품은 어떠신가요</span>
<div class="how-1" >
<div class="how-2">
<img src="${contextPath}/img/image_food/mygumi.jpg" width="300" height="300">
<div class="howname">[오리온] 마이구미 청포도 번들팩(43.2g X 6봉지)</div>
<div class="howname">2,980원</div>
</div>



<div class="how-3" >
<img src="${contextPath}/img/image_food/sparklling.jpg" width="300" height="300">
<div class="howname">[KF365]무라벨 청포도알로에 스파클링(350ml X 24개)</div>
<div class="howname">11,900원</div>
</div>



<div class="how-4">
<img src="${contextPath}/img/image_food/vitajelly.jpg" width="300" height="300">
<div class="howname">[올키] 비타젤리 청포도맛(15일분)</div>
<div class="howname">12,900원</div>
</div>



</div>


</div>


<nav class="info">
<ul class="info-2" id="info-6">
<li class="info-3">
<a class="info-4">
<span class="info-5">상품설명</span>
</a>
</li>
<li class="info-3">
<a class="info-4">
<span class="info-5">상세정보</span>
</a>
</li>
<li class="info-3">
<a class="info-4">
<span class="info-5">후기</span>
</a>
</li>
<li class="info-3">
<a class="info-4">
<span class="info-5">상품문의</span>
</a>
</li>
</ul>
</nav>

<div class="homp">
<div class="homp-2" id="description">
<div class="homp-3">
<div class="homp-4">
<div class="goods-wrap">
<div class="goods-intro">
<div class="pic">
<img src="${contextPath}/img/image_food/shinemuscat_detail.jpg">
<div class="context-last">
   <small>상큼함으로 무장한 연둣빛 포도</small>
    <h3>[All Eating] 저탄소 샤인머스캣</h3>
    <hr>
    <p>샤인머스캣의 참맛을 아는 분이라면 머스캣이 나오는 시기를 손꼽아 기다리셨을 거예요. 거봉처럼 알이 굵고 매끈하며, 청포도처럼 청량한 단맛을 지닌 마성의 과일이니까요. 이번에는 꼼꼼히 엄선한 국내산 샤인머스캣을 준비했는데요. 큼지막한 알 사이즈에 한 번 놀라고, 톡 하고 터뜨렸을 때 입안 가득 퍼지는 과즙의 맛과 향에 두 번 놀랄 거예요. 1인 가구도 부담 없이 누릴 수 있는 샤인머스캣 한 송이, 그 천상의 맛을 손쉽게 경험하세요. </p>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>




</body>
</html>