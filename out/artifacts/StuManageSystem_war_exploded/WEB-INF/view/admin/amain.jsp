<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
    <link rel="stylesheet" href="${path}/static/bootstrap/css/bootstrap.min.css">
    <script type="text/javascript" src="${path}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${path}/static/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="${path}/static/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<!-- 导航栏部分 -->
<nav class="navbar navbar-inverse" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#example-navbar-collapse">
                <span class="sr-only">切换导航</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">
                <img src="" height="100%" />
            </a>
        </div>
        <div class="collapse navbar-collapse" id="example-navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a class="icon-bar" href="#">网站设置</a>
                </li>
                <li><a href="#">分类管理</a>
                </li>
                <li><a href="#">城市管理</a>
                </li>
                <li><a href="#">商品管理</a>
                </li>
                <li><a href="#">订单管理</a>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a>欢迎您,admin</a>
                </li>
                <li><a href="#">安全退出</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

</body>
<script>
</script>
</html>