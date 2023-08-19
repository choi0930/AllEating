<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <% request.setCharacterEncoding("utf-8"); %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
    
<!DOCTYPE html>
<html>
<head>
    <style>
        /* 탭 스타일 */
        .tabs {
            list-style: none;
            padding: 0;
        }
        .tab-link {
            display: inline-block;
            padding: 10px 20px;
            cursor: pointer;
            
            border-bottom: 2px solid #000060;
            margin-right: 5px;
        }
        .tab-link.active {
            background-color: #E1DDDB;
        }
        /* 탭 컨텐츠 스타일 */
        .tab-content {
            display: none;
            padding: 20px;
        }
        .tab-content.active {
            display: block;
        }
        .tabContainer{
            width: 840px;
            margin: 0 auto;
        }
    </style>
    <script>
        $(document).ready(function(){
  
  $('ul.tabs li').click(function(){
    var tab_id = $(this).attr('data-tab');

    $('ul.tabs li').removeClass('active');
    $('.tab-content').removeClass('active');

    $(this).addClass('active');
    $("#"+tab_id).addClass('active');
  })

})
    </script>
</head>
<body>
    <div class="tabContainer">
        <ul class="tabs">
            <li class="tab-link ${selectedTab == 'tab-1' ? 'active' : ''}" data-tab="tab-1">사업자 상품 관리</li>
            <li class="tab-link ${selectedTab == 'tab-2' ? 'active' : ''}" data-tab="tab-2">예약배송 상품 관리</li>
            <li class="tab-link ${selectedTab == 'tab-3' ? 'active' : ''}" data-tab="tab-3"></li>
        </ul>

        <div id="tab-1" class="tab-content ${selectedTab == 'tab-1' ? 'active' : ''}">Tab Content 1</div>
        <div id="tab-2" class="tab-content ${selectedTab == 'tab-2' ? 'active' : ''}">Tab Content 2<a href="${contextPath}/test2.do">test</a></div>
        <div id="tab-3" class="tab-content ${selectedTab == 'tab-3' ? 'active' : ''}">Tab Content 3</div>
    </div>
   
</body>
</html>


