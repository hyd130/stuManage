<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023/7/4
  Time: 11:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set  var="path" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
    <title>新增用户</title>
    <link rel="icon" href="${path}/static/favicon.ico">
    <link rel="stylesheet"
          href="${path}/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="${path}/static/admin/css/index.css">
    <link rel="stylesheet"
          href="${path}/layui/css/layui.css">
    <link rel="stylesheet"
          href="${path}/static/admin/css/main.css">
    <link rel="stylesheet"
          href="${path}/static/admin/css/html.css">
    <script src="${path}/static/js/vue.min.js"></script>
    <script src="${path}/static/js/jquery-3.3.1.min.js"></script>
    <script src="${path}/static/bootstrap/js/bootstrap.bundle.js"></script>
    <script src="${path}/static/admin/js/config.js"></script>
    <script src="${path}/static/admin/js/script.js"></script>
    <script src="${path}/layui/layui.js"></script>
    <script  type="text/javascript" src="${path}/My97DatePicker/WdatePicker.js"></script>
    <style>
        iframe {
            width: 218px !important;
            height: 350px !important;
            position: absolute;
            z-index: 117;
            top: -97px !important;
            right: -500px !important;
            width: 100%;
            height: 100%;
            border: 0;
            padding-top: 60px;
        }
    </style>

</head>
<script>
    $(function() {
        const hrefArr = window.location.href.split('/');
        const name = hrefArr[hrefArr.length - 1];
        $('.menu a[href=\'' + name + '\']').addClass('active');
    });
</script>
<body>

<div id="app" class="d-flex">
    <jsp:include page="/WEB-INF/common/line.jsp" />

    <main>
        <jsp:include page="/WEB-INF/common/head.jsp" />

        <div id="body">
            <main>
                <div class="main">

                    <div class="title-box">
                        <h5>新增用户</h5>
                    </div>
                    <div >
                        <div class="row">
                            <div class="col-5">
                                <form id="saveForm" enctype="multipart/form-data" >

                                    <div class="form-group">
                                        <label>学号</label> <input type="text" name="u_num"
                                                                   class="form-control"> <small
                                            class="form-text text-muted"></small>
                                    </div>

                                    <div class="form-group">
                                        <label>姓名</label> <input type="text" name="u_name"
                                                                   class="form-control"> <small
                                            class="form-text text-muted"></small>
                                    </div>

                                    <div class="form-group">
                                        <label>性别</label> <select name="sex" class="form-control">
                                        <option value="男">男</option>
                                        <option value="女">女</option>
                                    </select> <small class="form-text text-muted"></small>
                                    </div>

                                    <div class="form-group">
                                        <label>年龄</label>
                                        <input type="text" name="age" class="form-control">
                                    </div>

                                    <div class="form-group">
                                        <label>密码</label> <input type="password" name="u_pwd"
                                                                   class="form-control"> <small
                                            class="form-text text-muted"></small>
                                    </div>

                                    <div class="form-group">
                                        <label>手机号</label> <input type="text" name="u_phone"
                                                                     class="form-control"> <small
                                            class="form-text text-muted"></small>
                                    </div>


                        </div>
                    </div>

                    <div class="submit-box">
                        <button type="button" id="save" class="btn btn-primary">确定提交</button>
                        <!--             <button type="button" onclick="window.history.back()" class="btn btn-outline-secondary">取消</button>
-->
                    </div>
                    </form>
                </div>
                </div>
            </main>
        </div>

    </main>
</div>

</body>
<script>
    $("#save").click(function() {
        $.ajax({
            cache:true,
            type : "post",
            url : "UsersServlet?action=addUsers",
            data : $("#saveForm").serialize(),
            //data : new FormData($('#saveForm')[0]),
           // processData: false,
            //contentType: false,
            async:false,
            success : function(e) {
                if (e == "yes") {
                    alert("新增成功！");
                    window.parent.location.href = "UserServlet?action=UserList";
                } else if (e == "isExist") {
                    alert("新增失败,学号重复");
                }else{
                    alert("新增失败");
                }
            }
        })
    });
</script>
<script>
    layui.use([ 'form','jquery','layer','laydate','upload' ], function() {
        var form = layui.form,
            layer = layui.layer,
            laydate = layui.laydate,
            upload = layui.upload,
            $= layui.jquery;
        form.render();//这句一定要加，占坑

        /*   laydate.render({
          elem: '#schoolTime'
        });
          laydate.render({
          elem: '#day'
        });  */
        $("#img").change(function () {
            //创建blob对象，浏览器将文件放入内存中，并生成标识
            var img_src = URL.createObjectURL($(this)[0].files[0]);
            //给img标检的src赋值
            document.getElementById("demo1").src=img_src;
            //URL.revokeObjectURL(img_src);// 手动 回收，
        });

    });


</script>
</html>
