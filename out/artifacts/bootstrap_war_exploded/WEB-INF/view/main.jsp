<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023/7/1
  Time: 10:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>Title</title>
    <link rel="icon" href="<%=path%>/static/favicon.ico">
    <link rel="stylesheet" href="<%=path%>/static/bootstrap/css/bootstrap.min.css" >
    <link rel="stylesheet" href="<%=path%>/static/admin/css/index.css" >
    <link rel="stylesheet" href="<%=path%>/static/admin/css/main.css" >
    <link rel="stylesheet" href="<%=path%>/static/admin/css/html.css" >
    <script src="<%=path%>/static/js/vue.min.js"></script>
    <script src="<%=path%>/static/js/jquery-3.3.1.min.js" ></script>
    <script src="<%=path%>/static/bootstrap/js/bootstrap.bundle.js" ></script>
    <script src="<%=path%>/static/admin/js/config.js" ></script>
    <script src="<%=path%>/static/admin/js/script.js" ></script>
</head>
<body>
<div id="app" class="d-flex">
    <jsp:include page="/WEB-INF/common/line.jsp" />
    <main>
        <jsp:include page="/WEB-INF/common/head.jsp" />
        <div id="body">
            <main>
            </main>
        </div>
    </main>
</div>

</body>
</html>
