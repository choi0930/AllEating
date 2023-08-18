<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
    <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
    *{
      margin: 0px;
      padding: 0px;
      box-sizing: border-box;
    }
    a{
        text-decoration:none;
        color: black;
    }
    .textColor1{
        color:#0C4A60;
    }
    .textColor2{
        color:#EF6C33;
    }
    .textColor3{
        color:#ABDFF1;
    }
    .textColor4{
        color:#E1DDDB;
    }
    .greenText{
        color:green;
    }
    .redText{
        color:red;
    }
#container{
width: 100%;
margin: 0px auto;
/*text-align:center;*/
border:0px solid #bcbcbc;
}


#content{
width:100%;
padding:5px;

float:left;
border: 0px solid #bcbcbc;}
#footer {
clear :both;
padding :5px;
border: 0px solid #bcbcbc;
background-color:#E1DDDB;}
#layouts{
    position: relative;
}
#contentLayout{
    width: 1050px;
    margin: 0 auto;
}
#quickMenu{
    display: none;
    z-index: 999;
    float: right;
    position: fixed;
    right: 0px;
    top:0px;
    width: 300px;
    height: 1000px;
    border-color: #0C4A60;
}
</style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<title><tiles:insertAttribute name="title"/></title>
</head>
<body>
<div id="container">
    <div id="header">
        <tiles:insertAttribute name="header"/>
    </div>
  
    <div id="banner">
      <tiles:insertAttribute name="banner"/>
    </div>
    <div id="layouts">
        <div id="contentLayout">
            <div id="content">
                <tiles:insertAttribute name="body"/>
            </div>
        </div>
        <div id="quickMenu">
            <tiles:insertAttribute name="quickMenu"/>
        </div>
    </div>
    
    <div id="footer">
        <tiles:insertAttribute name="footer"/>
    </div>
    
</div>
</body>
</html>