<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>검색 키워드</title>
    <style>
        #search_keyWord{
          width: 1050px;
          margin: 50px auto;
          text-align: center;
        }
        #search_keyWord_text{
          font-size: 30px;
          font-weight:800;
          margin-top: 50px;
          line-height: 35px;
        }
    </style>
  </head>

  <body>
    <div id="search_keyWord"><!---->
        <span id="search_keyWord_text">'${searchKeyWord}'에 대한 검색 결과 입니다. </span>
    </div>
    
  </body>
</html>
