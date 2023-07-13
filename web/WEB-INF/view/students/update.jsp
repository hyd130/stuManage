<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023/7/3
  Time: 21:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
    <title>修改用户</title>
  <link rel="icon" href="${path}/static/favicon.ico">
  <link rel="stylesheet"
        href="${path}/static/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet"
        href="${path}/static/admin/css/index.css">
  <link rel="stylesheet"
        href="${path}/static/admin/css/main.css">
  <link rel="stylesheet"
        href="${path}/layui/css/layui.css">
  <link rel="stylesheet"
        href="${path}/static/admin/css/html.css">
  <script src="${path}/static/js/vue.min.js"></script>
  <script src="${path}/static/js/jquery-3.3.1.min.js"></script>
  <script src="${path}/static/bootstrap/js/bootstrap.bundle.js"></script>
  <script src="${path}/static/admin/js/config.js"></script>
  <script src="${path}/static/admin/js/script.js"></script>
  <script src="${path}/layui/layui.js"></script>
  <script  type="text/javascript" src="${path}/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
<div id="app" class="d-flex">
  <jsp:include page="/WEB-INF/common/line.jsp" />

  <main>
    <jsp:include page="/WEB-INF/common/head.jsp" />

    <div id="body">


      <main>
        <div class="main">

          <div class="title-box">
            <h5>修改用户</h5>
          </div>
          <div >
            <div class="row">
              <div class="col-5">
                <form id="saveForm" enctype="multipart/form-data" >
                  <input type="hidden" name="id" value="${data.id }">
                  <input type="hidden" name="img" value="${data.img }">


                  <div class="form-group">
                    <label>姓名</label> <input type="text" name="realname" value="${data.stu_name }"
                                               class="form-control"> <small
                          class="form-text text-muted"></small>
                  </div>

                  <div class="form-group">
                    <label>密码</label> <input type="text" name="pwd" value="${data.pwd }"
                                               class="form-control"> <small
                          class="form-text text-muted"></small>
                  </div>

                  <div class="form-group">
                    <label>手机号</label> <input type="text" name="phone" value="${data.phone }"
                                                 class="form-control"> <small
                          class="form-text text-muted"></small>
                  </div>

                  <div class="form-group">
                    <label>性别</label> <select name="sex" class="form-control">
                    <option value="男" <c:if test="${data.sex == '男'}">selected</c:if> >男</option>
                    <option value="女" <c:if test="${data.sex == '女'}">selected</c:if> >女</option>
                  </select> <small class="form-text text-muted"></small>
                  </div>


                  <div class="form-group">
                    <label>头像</label>
                    <img class="layui-upload-img"  src="/images/${data.img }" style="width:200px;height:100px;" id="demo1">
                    <input type="file" name="img" id="img" >
                    <small class="form-text text-muted"></small>
                  </div>


                </form>
              </div>
            </div>
          </div>

          <div class="submit-box">
            <button type="button" id="save" class="btn btn-primary">确定提交</button>
            <a type="button" href="UserServlet?action=UserList" class="btn btn-outline-secondary">返回</a>
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
      cache : true,
      type : "post",
      url : "UserServlet?action=updateUser",
      data : new FormData($('#saveForm')[0]),
      processData: false,
      contentType: false,
      //data : $("#saveForm").serialize(),
      async : false,
      success : function(e) {
        if (e == 'yes') {
          alert("修改成功！");
          window.parent.location.href = "UserServlet?action=UserList";
        } else {
          alert("修改失败！");
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
