<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, User-scalable=no" />
<title>餐厅点餐系统</title>
<link rel="icon" href="favicon.ico" type="image/ico">
<meta name="keywords" content="后台管理系统HTML模板">
<meta name="description" content="基于Bootstrap v3.3.7的后台管理系统的HTML模板。">
<meta name="author" content="yinqi">

<link rel="icon" href="<%=path%>/static/favicon.ico">
<link rel="stylesheet"
	href="<%=path%>/static/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=path%>/static/admin/css/index.css">
<link rel="stylesheet"
	href="<%=path%>/static/admin/css/main.css">
<link rel="stylesheet"
	href="<%=path%>/static/admin/css/html.css">
<script src="<%=path%>/static/js/vue.min.js"></script>
<script src="<%=path%>/static/js/jquery-3.3.1.min.js"></script>
<script src="<%=path%>/static/bootstrap/js/bootstrap.bundle.js"></script>
<script src="<%=path%>/static/admin/js/config.js"></script>
<script src="<%=path%>/static/admin/js/script.js"></script>
<script type="text/javascript"
	src="<%=path%>/resource/My97DatePicker/WdatePicker.js"></script>
<script>
	$(function() {
		const hrefArr = window.location.href.split('/');
		const name = hrefArr[hrefArr.length - 1];
		$('.menu a[href=\'' + name + '\']').addClass('active');
	});
</script>
<style>
.main {
	overflow-y: auto;
}

.info .card {
	min-height: 330px;
}

.User .card {
	min-height: 500px;
}

.card h5 {
	margin-bottom: 20px;
}

.main ul li {
	margin-bottom: 3px;
}
</style>
<!-- <style>
td {
	text-align: center;
}

th {
	text-align: center;
}
</style> -->
</head>
<nav>
	<div class="logo">
		<h4>教务管理系统</h4>
	</div>
	<ul class="menu">
		<li><a href="LoginServlet?action=toMain"><i class="iconfont mr-1">&#xe6a2;</i>首页</a></li>
		<c:if test="${admin !=null }">
		
		   <li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe6e0;</i>用户管理<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="UsersServlet?action=queryStuInfo">用户列表</a></li>
				<li><a href="UserServlet?action=toAddUser">添加用户</a></li>
			</ul></li>
		<li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe69d;</i>餐品分类管理<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="CategoryServlet?action=CategoryList">餐品分类列表</a></li>
				<li><a href="CategoryServlet?action=toAddCategory">去新增餐品分类</a></li>
			</ul></li>
		<li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe69d;</i>商家管理<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="MerchantServlet?action=MerchantList">商家信息列表</a></li>
				<li><a href="MerchantServlet?action=toAddMerchant">去新增商家</a></li>
			</ul></li>

			<li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe69d;</i>公告管理<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="BoardServlet?action=BoardList">公告列表</a></li>
				<li><a href="BoardServlet?action=toAddBoard">去新增公告</a></li>
			</ul>
			</li>
			

			<li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe69d;</i>评论管理<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="CommentsServlet?action=CommentsList">评论列表</a></li>
			</ul>
			</li>

	<!-- 
		<li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe69d;</i>图表统计管理<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="LoginServlet?action=toEcharts">图表统计</a></li>
			</ul>
			</li>  -->


			<li><a class="top-menu" href="javascript:;"><i
					class="iconfont mr-1">&#xe6e0;</i>个人信息<i
					class="iconfont arrow float-right">&#xe66c;</i></a>
				<ul class="sub-menu">
					<li><a href="UserServlet?action=toUpdateAdmin">修改密码</a></li>
				</ul></li>
		
		</c:if>
		
	<c:if test="${merchant !=null }">
		
		<li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe69d;</i>商家管理<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="MerchantServlet?action=MerchantList">商家列表</a></li>
			</ul></li>
			
			
			<li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe69d;</i>餐品管理<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="GoodsServlet?action=GoodsList">餐品列表</a></li>
				<li><a href="GoodsServlet?action=toAddGoods">去新增餐品</a></li>
			</ul>
			</li>
			
				
			<li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe69d;</i>订单管理<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="OrdersServlet?action=OrdersList">订单列表</a></li>
			</ul>
			</li>

		</c:if>
		

		<li><a href="LoginServlet?action=loginOut"><i class="iconfont mr-1">&#xe68c;</i>退出登录</a>
		</li> 
	</ul>
</nav>