<%--
  Created by IntelliJ IDEA.
  User: h
  Date: 11/24/17
  Time: 12:41 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>许愿墙</title>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="css/animate.min.css"/>
    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <link rel="stylesheet" href="http://v3.bootcss.com/examples/jumbotron-narrow/jumbotron-narrow.css" />
    <link rel="stylesheet" href="css/index.css" />
    <script src="https://code.jquery.com/jquery.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	<script src="js/prefixfree.min.js"></script>
</head>

<body>
<div class="container" style="max-width: 100%">
    <div class="header clearfix">
        <nav>
            <ul class="nav nav-pills pull-right">
                <c:if test="${ empty username}"><li role="presentation" id="islogin" islogin="false" class="active"><a href="./login">登录</a></li></c:if>
                <c:if test="${! empty username}">
                    <input type="hidden" id="username_input" value="${username}" />
                    <li id="islogin" islogin="true" role="presentation" class="active"><a href="#">${username}</a></li>
                    <li role="presentation"><a id="logout" href="#">注销</a></li>
                </c:if>

            </ul>
        </nav>
        <h3 style="color: white" class="text-muted">许愿墙- Web软件开发课程作业</h3>
    </div>

    <script>
        $(document).ready(function(){
            $("#logout").click(function(){
                var username = $("#username_input").val();
                console.log(username);
                $.ajax({
                    url:"./user/logout",
                    data:{"name":username},
                    success:function(r){
                        console.info(r);
                        window.location.reload();
                    }
                });
            });

        });
    </script>

<div  style="height:10px">
<span class='light light-1'></span>
  <span class='light light-2'></span>
  <span class='light light-3'></span>
  <span class='light light-4'></span>
  <span class='light light-5'></span>
  <span class='light light-6'></span>
  <span class='light light-7'></span>
  <span class='light light-8'></span>
  <span class='light light-9'></span>
  <span class='light light-10'></span>
  <span class='light light-11'></span>
  <span class='light light-12'></span>
  <span class='light light-13'></span>
  <span class='light light-14'></span>
  <span class='light light-15'></span>
  <span class='light light-16'></span>
  <span class='light light-17'></span>
  <span class='light light-18'></span>
  <span class='light light-19'></span>
  <span class='light light-20'></span>
  <span class='light light-21'></span>
  <span class='light light-22'></span>
  <span class='light light-23'></span>
  <span class='light light-24'></span>
  <span class='light light-25'></span>
  <span class='light light-26'></span>
  <span class='light light-27'></span>
  <span class='light light-28'></span>
  <span class='light light-29'></span>
  <span class='light light-30'></span>
  <span class='light light-31'></span>
  <span class='light light-32'></span>
  <span class='light light-33'></span>
  <span class='light light-34'></span>
  <span class='light light-35'></span>
  <span class='light light-36'></span>
  <span class='light light-37'></span>
  <span class='light light-38'></span>
  <span class='light light-39'></span>
  <span class='light light-40'></span>
  <span class='light light-41'></span>
  <span class='light light-42'></span>
  <span class='light light-43'></span>
  <span class='light light-44'></span>
  <span class='light light-45'></span>
  <span class='light light-46'></span>
  <span class='light light-47'></span>
  <span class='light light-48'></span>
  <span class='light light-49'></span>
  <span class='light light-50'></span>
  <span class='light light-51'></span>
  <span class='light light-52'></span>
  <span class='light light-53'></span>
  <span class='light light-54'></span>
  <span class='light light-55'></span>
  <span class='light light-56'></span>
  <span class='light light-57'></span>
  <span class='light light-58'></span>
  <span class='light light-59'></span>
  <span class='light light-60'></span>
</div>
