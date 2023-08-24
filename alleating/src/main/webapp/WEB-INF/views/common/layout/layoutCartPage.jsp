<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false" %> <%@ taglib
uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />

    <script>
      //pay_02 배송요청사항 선택
      function fn_deliveryMsgSelect() {
        var text = $(".dliveryRequest_select").val();
        if (text == "self") {
          $("#deliveryRequest").val("");
          $("#deliveryRequest").attr("readonly", false);
        } else {
          $("#deliveryRequest").val(text);
          $("#deliveryRequest").attr("readonly", true);
        }
      }
    </script>
    <style>
      * {
        margin: 0px;
        padding: 0px;
        box-sizing: border-box;
      }
      a {
        text-decoration: none;
        color: black;
      }
      .textColor1 {
        color: #0c4a60;
      }
      .textColor2 {
        color: #ef6c33;
      }
      .textColor3 {
        color: #abdff1;
      }
      .textColor4 {
        color: #e1dddb;
      }
      .greenText {
        color: green;
      }
      .redText {
        color: red;
      }
      .css0930 {
        border: none;
        text-align: right;
        width: 120px;
        outline: none;
      }
      #container {
        width: 100%;
        margin: 0px auto;
        /*text-align:center;*/
        border: 0px solid #bcbcbc;
      }

      #sidebar-left {
        margin: 110px 0px 10px 10px;
        width: 210px;
        height: 700px;
        padding: 5px;
        float: left;
        border: 0px solid #bcbcbc;
        font-size: 10px;
      }
      #content {
        width: 840px;
        padding: 5px;
        float: left;
        border: 0px solid #bcbcbc;
      }
      #footer {
        clear: both;
        padding: 5px;
        border: 0px solid #bcbcbc;
        background-color: #e1dddb;
      }
      #layouts {
        position: relative;
      }
      #contentLayout {
        width: 1100px;
        margin: 0 auto;
      }
      #quickMenu {
        display: none;
        z-index: 999;
        float: right;
        position: fixed;
        right: 0px;
        top: 0px;
        width: 300px;
        height: 1000px;
        border-color: #0c4a60;
      }
    </style>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
      crossorigin="anonymous"
    />
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"
      integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    ></script>
    <link
      href="${contextPath}/css/pay_02.css"
      rel="stylesheet"
      type="text/css"
    />
    <title><tiles:insertAttribute name="title"/></title>
  </head>
  <body>
    <div id="container">
      <div id="header">
        <tiles:insertAttribute name="header" />
      </div>
      <div id="layouts">
        <div id="contentLayout">
          <div id="content">
            <tiles:insertAttribute name="body" />
          </div>
          <div id="sidebar-left">
            <tiles:insertAttribute name="side" />
          </div>
        </div>
        <div id="quickMenu">
          <tiles:insertAttribute name="quickMenu" />
        </div>
      </div>

      <div id="footer">
        <tiles:insertAttribute name="footer" />
      </div>
    </div>
  </body>
</html>
