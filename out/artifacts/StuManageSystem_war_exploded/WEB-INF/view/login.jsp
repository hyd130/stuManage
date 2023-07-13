<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>登录</title>
    <link rel="stylesheet" href="<%=path%>/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="icon" href="<%=path%>/static/favicon.ico">
    <link rel="stylesheet" href="<%=path%>/static/admin/css/login.css">
    <script src="<%=path%>/static/js/vue.min.js"></script>
    <script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path%>/js/bootstrap.bundle.min.js"></script>
   <script type="text/javascript" src="<%=path%>/js/bootstrap.min.js"></script>

</head>
<style type="text/css">

    body{
        background: url("<%=path%>/static/images/236.png")
        no-repeat -40px 0;
    }
</style>
<body>

<div class="login" style="height:430px;margin-left: 6%;">

    <form id="saveForm">
        <h2>学校教学管理系统</h2>
        <div class="form-group">
        <label>用户名</label>         
            <input type="text" v-model="username" name="username" onblur="requsername();" id="username" class="form-control">
        </div>
        <div class="form-group">
            <label>密码</label>
            <input type="password" v-model="password" name ="password" onblur="requpasswd();" id="password" class="form-control form-control-lg" id="pwd">
        </div>
        <div class="form-group form-check">
           <input type="radio" class="form-check-input" name="type" value="0" id="exampleCheck2" checked>
            <label class="form-check-label" for="exampleCheck2">管理员</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <input type="radio" class="form-check-input" name="type" value="2" id="exampleCheck1" >
            <label class="form-check-label" for="exampleCheck1">教师</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <input type="radio" class="form-check-input" name="type" value="3" id="exampleCheck1" >
            <label class="form-check-label" for="exampleCheck1">学生</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            
        </div > 
        
        
       	<div style="height: 35px;">
       		  	<span id="myInputError" style="color: red;"></span>
       	</div>

        <button  type="button" :disabled="loading" @click="login" id="login" class="btn btn-primary btn-lg  btn-block">
            <span v-show="loading" class="spinner-grow spinner-grow-sm" role="status" aria-hidden="true"></span>
            立即登录
        </button>
            
    </form>
    <div class="form-group" style="margin-top: 8px;margin-left: 56px;">
    	<a href="#">没有账号? 点我去注册</a>
    </div>
</div>

</body>
<script>

		function requsername(){
			var username = $("#username").val();
			if(username == ''){
				$("#myInputError").text('用户名不能为空');
				
				$("#username").css({
				      'border-color': 'red'				      
				    });
				return false;
			}
			$("#username").css({
			      'border-color': 'green'
			      
			    });
			
			return true;
		}
		
		function requpasswd(){
			var password = $("#password").val();
			if(password == ''){
				$("#myInputError").text('密码不能为空');
				
				$("#password").css({
				      'border-color': 'red'				      
				    });
				return false;
			}
			
			$("#password").css({
			      'border-color': 'green'			      
			    });
			$("#myInputError").empty();
			return true;		
		}


	    $("#login").click(function(){
	    	var username = requsername();
	    	var password = requpasswd();
	    	
	    	if(!username || !password ){
	    		$("#username").css("border-color","red");
	    		$("#password").css("border-color","red");
	    		$("#myInputError").text('账号或密码不能为空');
	    		return  false;
	    	}
			//执行添加的操作ajax
			$.ajax({
				cache:true,
				type:"post",
				url:"LoginServlet?action=login",
				data:$("#saveForm").serialize(),
				async:false,
				success:function(e){
					if(e == '0'){
						$("#myInputError").empty();
						 window.parent.location.href="LoginServlet?action=toMain";
					}else if(e == "1"){
                        alert("登录成功");
						 window.parent.location.href="IndexServlet?action=toIndex";
                    }else if(e == "2"){
                        alert("登录成功");
						 window.parent.location.href="LoginServlet?action=toMain";
                   }else{ 
                	$("#username").css("border-color","red");
       	    		$("#password").css("border-color","red");
       	    		$("#myInputError").text('登录失败,账号或密码错误');
						
					}
				}
			})
		});
		   
</script>
</html>
