<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <% request.setCharacterEncoding("utf-8"); %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
    
<!DOCTYPE html>
<html>
<head>

<title>리뷰</title>
<style>
    #from{
        width:200px;

    }
    #to{
        width:200px;

    }
    .review_top {
    display: flex;
    justify-content: space-evenly;
    border-bottom: 1px solid #000060;
    padding-bottom: 15px;
    align-items: center;
}




ul {
   list-style: none;
}

body {
   text-align: left;
   font-size: 14px;
   color: #555;
   line-height: 1.6;
   font-family: 'NanumGothic', sans-serif;
   font-weight: 400;
   letter-spacing: -1px;
}

div {
   display: block;
}

.review_01a {
   width: 100%;
   margin-top: 60px;
   margin-bottom: 60px;
}

.review_01a1 {
   margin-bottom: 20px !important;
}

.review_01b2 {
   text-align: right !important;
}

.mb50 {
   margin-bottom: 50px !important;
}

.btn_basic.green {
   background-color: #409b29;
   color: #fff;
       margin-right: 680px;
}

.btn_basic {
   display: inline-block;
   min-width: 136px;
   height: 37px;
   line-height: 37px;
   border: 1px solid #469731;
   color: #409b29;
   text-align: center;
   font-size: 16px;
   font-weight: bold;
   position: relative;
   border-radius: 3px;
   padding: 0 10px;
}



.review_01b {
   font-size: 30px;
   font-weight: bold;
   color: #1c1c1c;
   line-height: 1;
   margin-bottom: 25px;
   text-align: center;
}

.review_01c {
   width: 1240px;
   margin: 0 auto;
   position: relative;
}

.review_01c1 {
   padding-bottom: 80px !important;
}

.review_01c2 {
   position: absolute;
   border: 1px solid #dfdfdf;
   top: 0;
   right: 0;
   border-radius: 3px;
   width: 205px;
   height: 37px;
   line-height: 37px;
   overflow: hidden;
}

option {
   font-weight: normal;
   display: block;
   white-space-collapse: collapse;
   text-wrap: nowrap;
   min-height: 1.2em;
   padding: 0px 2px 1px;
}

.bbs_search_box .btn_search {
   width: 37px;
   height: 100%;
   position: absolute;
   background-color: #777;
   text-indent: -9999px;
   right: 0;
   top: 0;
}

.mt10 {
   margin-top: 10px !important;
}

.review_01d {
   width: 100%;
   border-top: 2px solid #5ca748;
}

.new_bbs_review_box li {
   padding: 20px;
   display: flex;
   justify-content: space-between;
   border-bottom: 1px solid #dfdfdf;
}

.review_list_box .top_info {
   display: flex;
   width: 100%;
   font-size: 13px;
   color: #888;
   align-items: center;
}

.review_list_box .top_info span {
   margin-right: 15px;
   position: relative;
}

.new_bbs_review_box li .txt_box {
   width: 100%;
}

.review_list_box .top_info span a.prod_name {
   cursor: pointer;
}





.review_list_box .top_info>span::after {
   content: "";
   display: inline-block;
   width: 1px;
   height: 8px;
   position: absolute;
   right: -8px;
   background-color: #ddd;
   top: 50%;
   margin-top: -4px;
}

body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, span, form,
   fieldset, p, button, address, table, tbody, tfoot, thead, th, tr,
   tdvideo, tt {
   margin: 0;
   padding: 0;
   box-sizing: border-box;
}



.review_01all{
width:840px;
}




</style>
<link href="${contextPath}/css/product_01.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  <script>
  $( function() {
    var dateFormat = "mm/dd/yy",
      from = $( "#from" )
        .datepicker({
          defaultDate: "+1w",
          changeMonth: true,
          numberOfMonths: 3
        })
        .on( "change", function() {
          to.datepicker( "option", "minDate", getDate( this ) );
        }),
      to = $( "#to" ).datepicker({
        defaultDate: "+1w",
        changeMonth: true,
        numberOfMonths: 3
      })
      .on( "change", function() {
        from.datepicker( "option", "maxDate", getDate( this ) );
      });
 
    function getDate( element ) {
      var date;
      try {
        date = $.datepicker.parseDate( dateFormat, element.value );
      } catch( error ) {
        date = null;
      }
 
      return date;
    }
  } );
  </script>
</head>
<body>

<div class="reivew_main">
 <div class="review_top">
    <div class="review_sort">구분</div>
    <div class="review_inqueryPeriod">조회 기간</div>
     <input type="text" class="form-control" id="from" name="from" placeholder="From" >
     <input type="text" class="form-control" id="to" name="to" placeholder="To">
    </div> 
  <div class="review_under">
  <ul class="new_bbs_review_box mt10">
         <li class="review_list_box no_more">
            <div class="txt_box" style="flex: 1">
               <div class="top_info">
                  <span class="name"> " 김건**** " </span> <span class="date">
                     "2023-08-21" </span> <span> <a class="prod_name" target="_blank"
                     href="http://https://www.kurly.com/goods/5063578">대추 방울토마토</a>
                  </span>
               </div>
               <a href="javascript:void(0)" class="comment_box dotdot">
                  <div class="comment">
                     <div class="txt" id="txt_01">실수로 방울토마토 시켰는데 아주 맛있어요</div>
                  </div> <span class="more"> <span class="on">더보기</span> <span
                     class="off">닫기</span>
               </span>
               </a>

            </div>
         </li>



         <li class="review_list_box no_more">
            <div class="txt_box" style="flex: 1">
               <div class="top_info">
                  <span class="name"> " 김건**** " </span> <span class="date">
                     "2023-08-21" </span> <span> <a class="prod_name" target="_blank"
                     href="http://https://www.kurly.com/goods/5063578">대추 방울토마토</a>
                  </span>
               </div>
               <a href="javascript:void(0)" class="comment_box dotdot">
                  <div class="comment">
                     <div class="txt" id="txt_01">실수로 방울토마토 시켰는데 아주 맛있어요</div>
                  </div> <span class="more"> <span class="on">더보기</span> <span
                     class="off">닫기</span>
               </span>
               </a>

            </div>
         </li>
         
            <li class="review_list_box no_more">
            <div class="txt_box" style="flex: 1">
               <div class="top_info">
                  <span class="name"> " 김건**** " </span> <span class="date">
                     "2023-08-21" </span> <span> <a class="prod_name" target="_blank"
                     href="http://https://www.kurly.com/goods/5063578">대추 방울토마토</a>
                  </span>
               </div>
               <a href="javascript:void(0)" class="comment_box dotdot">
                  <div class="comment">
                     <div class="txt" id="txt_01">실수로 방울토마토 시켰는데 아주 맛있어요</div>
                  </div> <span class="more"> <span class="on">더보기</span> <span
                     class="off">닫기</span>
               </span>
               </a>

            </div>
         </li>
         
            <li class="review_list_box no_more">
            <div class="txt_box" style="flex: 1">
               <div class="top_info">
                  <span class="name"> " 김건**** " </span> <span class="date">
                     "2023-08-21" </span> <span> <a class="prod_name" target="_blank"
                     href="http://https://www.kurly.com/goods/5063578">대추 방울토마토</a>
                  </span>
               </div>
               <a href="javascript:void(0)" class="comment_box dotdot">
                  <div class="comment">
                     <div class="txt" id="txt_01">실수로 방울토마토 시켰는데 아주 맛있어요</div>
                  </div> <span class="more"> <span class="on">더보기</span> <span
                     class="off">닫기</span>
               </span>
               </a>

            </div>
         </li>
         
            <li class="review_list_box no_more">
            <div class="txt_box" style="flex: 1">
               <div class="top_info">
                  <span class="name"> " 김건**** " </span> <span class="date">
                     "2023-08-21" </span> <span> <a class="prod_name" target="_blank"
                     href="http://https://www.kurly.com/goods/5063578">대추 방울토마토</a>
                  </span>
               </div>
               <a href="javascript:void(0)" class="comment_box dotdot">
                  <div class="comment">
                     <div class="txt" id="txt_01">실수로 방울토마토 시켰는데 아주 맛있어요</div>
                  </div> <span class="more"> <span class="on">더보기</span> <span
                     class="off">닫기</span>
               </span>
               </a>

            </div>
         </li>
         
            <li class="review_list_box no_more">
            <div class="txt_box" style="flex: 1">
               <div class="top_info">
                  <span class="name"> " 김건**** " </span> <span class="date">
                     "2023-08-21" </span> <span> <a class="prod_name" target="_blank"
                     href="http://https://www.kurly.com/goods/5063578">대추 방울토마토</a>
                  </span>
               </div>
               <a href="javascript:void(0)" class="comment_box dotdot">
                  <div class="comment">
                     <div class="txt" id="txt_01">실수로 방울토마토 시켰는데 아주 맛있어요</div>
                  </div> <span class="more"> <span class="on">더보기</span> <span
                     class="off">닫기</span>
               </span>
               </a>

            </div>
         </li>
         
            <li class="review_list_box no_more">
            <div class="txt_box" style="flex: 1">
               <div class="top_info">
                  <span class="name"> " 김건**** " </span> <span class="date">
                     "2023-08-21" </span> <span> <a class="prod_name" target="_blank"
                     href="http://https://www.kurly.com/goods/5063578">대추 방울토마토</a>
                  </span>
               </div>
               <a href="javascript:void(0)" class="comment_box dotdot">
                  <div class="comment">
                     <div class="txt" id="txt_01">실수로 방울토마토 시켰는데 아주 맛있어요</div>
                  </div> <span class="more"> <span class="on">더보기</span> <span
                     class="off">닫기</span>
               </span>
               </a>

            </div>
         </li>


      </ul>
  </div>
   


 





<div class="productpaging">
        <a class="productpaging-2"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAkAAAAHCAQAAABwkq/rAAAAHUlEQVR42mNgAIPi/8X/kWkwA8SE0UQIMJAsCKMBBzk27fqtkcYAAAAASUVORK5CYII=" alt="처음 페이지로 이동하기 아이콘"></a>
        <a class="productpaging-2"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUAAAAHCAQAAABqrk9lAAAAGElEQVR42mNgAIPi/8X/4QwwE5PBQJADAAKSG3cyVhtXAAAAAElFTkSuQmCC" alt="이전 페이지로 이동하기 아이콘"></a>
        <a class="productpaging-3">1</a>
        <a class="productpaging-2">2</a>
        <a class="productpaging-2"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUAAAAHCAQAAABqrk9lAAAAGUlEQVR42mMo/l/8nwECQEwCHEwGhAlRBgA2mht3SwgzrwAAAABJRU5ErkJggg==" alt="다음 페이지로 이동하기 아이콘"></a>
        <a class="productpaging-2"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAkAAAAHCAQAAABwkq/rAAAAIElEQVR42mMo/l/8n4GBgQFGQ5kgDowmQZCwAMImhDkAb0k27Zcisn8AAAAASUVORK5CYII=" alt="마지막 페이지로 이동하기 아이콘"></a>
 </div>
</div>

</body>
</html>


