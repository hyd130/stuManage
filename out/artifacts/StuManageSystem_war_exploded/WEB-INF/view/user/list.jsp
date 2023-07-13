<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023/7/3
  Time: 21:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set  var="path" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
    <title>用户列表</title>
    <link rel="icon" href="${path}/static/favicon.ico">
    <link rel="stylesheet"
          href="${path}/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="${path}/static/admin/css/index.css">
    <link rel="stylesheet"
          href="${path}/static/admin/css/main.css">
    <link rel="stylesheet"
          href="${path}/static/admin/css/html.css">
    <script src="${path}/static/js/vue.min.js"></script>
    <script src="${path}/static/js/jquery-3.3.1.min.js"></script>
    <script src="${path}/static/bootstrap/js/bootstrap.bundle.js"></script>
    <script src="${path}/static/admin/js/config.js"></script>
    <script src="${path}/static/admin/js/script.js"></script>
    <script>

    </script>
    <style>
        th,tr,td{    border: 1px solid #ced4da;}
    </style>
</head>
<body>
<div id="app" class="d-flex">
    <jsp:include page="/WEB-INF/common/line.jsp" />
    <main>
        <jsp:include page="/WEB-INF/common/head.jsp" />
        <div id="body">
            <main>
                <div class="main">

                    <div class="form-control-lg">
                        <c:if test="${admin != null }">
                            <form class="form-inline float-left" action="UsersServlet?action=vagueQuery"
                                  method="post">
                                <div class="form-group" style="">
                                    <input type="text" name="key" value="${key}"
                                           class="form-control" placeholder="姓名">
                                </div>
                                <button type="submit" class="btn btn-primary">
                                    <i class="iconfont"></i>搜索
                                </button>
                            </form>
                        </c:if>

                            <button  class="btn btn-primary"  onclick="window.location.href='UsersServlet?action=toAddUser'" style="margin-left: 55%;">添加用户</button>

                    </div>






                    <div class="table-hover" style="margin-top: 50px;">
                        <table class="table">
                            <thead>
                            <tr>
                                <th scope="col">学号</th>
                                <th scope="col">手机号码</th>
                                <th scope="col">姓名</th>
                                <th scope="col">年龄</th>
                                <th scope="col">性别</th>
                                <th scope="col">所属班级</th>
                                <th scope="col">所属专业</th>
                                <th scope="col">所属院系</th>
                                <th scope="col">入学时间</th>
                                <th scope="col">是否毕业</th>
                                <th scope="col">操作</th>
                            </tr>
                            </thead>
                            <tbody>

                            <c:forEach items="${ulist}" var="data">
                                <tr>
                                    <td>${data.stu_num }</td>
                                    <td>${data.u_tel }</td>
                                    <td>${data.stu_name }</td>
                                    <td>${data.stu_age }</td>
                                    <td>${data.stu_sex }</td>
                                    <td>${data.stu_class }</td>
                                    <td>${data.stu_major }</td>
                                    <td>${data.stu_college }</td>
                                    <td>${data.stu_Intake }</td>
                                    <c:if test="${data.or_gradute=='1'}">
                                        <td>否</td>
                                    </c:if>
                                    <c:if test="${data.or_gradute=='2'}">
                                        <td>是</td>
                                    </c:if>
                                    <!-- <td><img src="/images/"  style="width:50px; height:50px; "></td> -->
                                    <td>
                                        <input id ="${data.stu_num}" value="${data.stu_num}" type="hidden" class="weui-input"/>
                                        <a class="btn btn-primary btn-sm"
                                           href="UserServlet?action=toUpdateUser&id=${data.stu_num }">修改</a>
                                        <c:if test="${admin != null }">
                                            <a  class="btn btn-danger btn-sm delete"
                                                href="javascript:;">删除</a>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>

                            </tbody>
                        </table>
                    </div>

                    <div class="page">
                        <ul class="pagination">
                            <li class="page-item"><a class="page-link"
                                                     href="UserServlet?action=UserList&p=1">首页</a></li>
                            <c:if test="${cp>1}">
                                <li class="page-item"><a class="page-link"
                                                         href="UserServlet?action=UserList&p=${cp-1}">上一页</a></li>
                            </c:if>
                            <c:forEach begin="${cp-2>1 ? (cp-2) :1}"
                                       end="${cp+2>tp?tp:(cp+2)}" var="e">
                                <%--            判断是否是当前页--%>
                                <c:if test="${cp==e}">
                                    <li class="page-item"><a class="page-link" style="background-color: #007bff;color:white"
                                                             href="UserServlet?action=UserList&p=${e}">${e}</a></li>
                                </c:if>
                                <c:if test="${cp!=e}">
                                    <li class="page-item"><a class="page-link"
                                                             href="UserServlet?action=UserList&p=${e}">${e}</a></li>
                                </c:if>
                            </c:forEach>
                            <c:if test="${cp<tp}">
                                <li class="page-item"><a class="page-link"
                                                         href="UserServlet?action=UserList&p=${cp+1}">下一页</a></li>
                            </c:if>
                            <li class="page-item"><a class="page-link"
                                                     href="UserServlet?action=UserList&p=${tp}">尾页</a></li>
                        </ul>

                    </div>
                </div>
            </main>
        </div>

    </main>
</div>
</body>
<script>


        $("#btnModal").click(function(){
            $('#myModal').modal();
        })


    $('a.delete').click(function(e){
        var id = $(e.currentTarget).parent().find('.weui-input').attr('id');
        if(confirm("确定删除吗?")){
            $.ajax({
                cache:true,
                url:"UserServlet?action=deleteUser",
                data:{"id": id},
                type:"post",
                async:false,
                success:function (data) {
                    console.log(data)
                    if (data == 'yes') {
                        alert("删除成功！");
                        document.location.reload();//当前页面
                    }else{
                        alert("删除失败！");
                    }
                }
            });
        }
    })

</script>
</html>
