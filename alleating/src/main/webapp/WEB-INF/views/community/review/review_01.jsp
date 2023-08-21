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


