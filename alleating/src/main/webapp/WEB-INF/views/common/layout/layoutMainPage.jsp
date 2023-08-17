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

#sidebar-left{
width:20%;
height:700px;
padding:5px;
float: left;
background-color:#FFFFFF;
border: 0px solid #bcbcbc;
font-size:10px;}
#content{
width:80%;
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
    <div id="carouselExampleDark" class="carousel carousel-dark slide">
        <div class="carousel-indicators">
          <button
            type="button"
            data-bs-target="#carouselExampleDark"
            data-bs-slide-to="0"
            class="active"
            aria-current="true"
            aria-label="Slide 1"
          ></button>
          <button
            type="button"
            data-bs-target="#carouselExampleDark"
            data-bs-slide-to="1"
            aria-label="Slide 2"
          ></button>
          <button
            type="button"
            data-bs-target="#carouselExampleDark"
            data-bs-slide-to="2"
            aria-label="Slide 3"
          ></button>
        </div>
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img
              src="${contextPath}/img/image_banner/food2.png"
              height="350px"
              width="1900px"
              alt="..."
            />
            <div class="carousel-caption d-none d-md-block"></div>
          </div>
          <div class="carousel-item">
            <img
              src="${contextPath}/img/image_banner/food.png"
              height="350px"
              width="1900px"
              alt="..."
            />
            <div class="carousel-caption d-none d-md-block"></div>
          </div>
          <div class="carousel-item">
            <img
              src="${contextPath}/img/image_banner/food3.png"
              height="350px"
              width="1900px"
              alt="..."
            />
            <div class="carousel-caption d-none d-md-block"></div>
          </div>
        </div>
        <button
          class="carousel-control-prev"
          type="button"
          data-bs-target="#carouselExampleDark"
          data-bs-slide="prev"
        >
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button
          class="carousel-control-next"
          type="button"
          data-bs-target="#carouselExampleDark"
          data-bs-slide="next"
        >
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
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