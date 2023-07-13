<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023/7/2
  Time: 7:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
  <title></title>
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
  <script src="<${path}/static/admin/js/script.js"></script>
  <script>
    $(function() {
      const hrefArr = window.location.href.split('/');
      const name = hrefArr[hrefArr.length - 1];
      $('.menu a[href=\'' + name + '\']').addClass('active');
    });
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
          <div class="search">
            <c:if test="${admin != null }">
              <form class="form-inline float-left" action="UserServlet?action=UserList"
                    method="post">
                <div class="form-group">
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

          <div >
            <table class="table">
              <thead>
              <tr>
                <th scope="col">工号</th>
                <th scope="col">姓名</th>
                <th scope="col">性别</th>
                <th scope="col">年龄</th>
                <th scope="col">专业</th>
                <th scope="col">课程</th>
                <th scope="col">院系</th>
                <th scope="col">工作时间</th>
                <th scope="col">操作</th>
              </tr>
              </thead>
              <tbody>

              <c:forEach items="${tlist}" var="data">
                <tr>
                  <td>${data.u_num }</td>
                  <td>${data.tea_name }</td>
                  <td>${data.tea_sex }</td>
                  <td>${data.tea_age }</td>
                  <td>${data.tea_major }</td>
                  <td>${data.tea_course }</td>
                  <td>${data.tea_college}</td>
                  <td>${data.tea_worktime }</td>

                  <!-- <td><img src="/images/"  style="width:50px; height:50px; "></td> -->
                  <td>
                    <input id ="${data.u_num}" value="${data.u_num}" type="hidden" class="weui-input"/>
                    <a class="btn btn-primary btn-sm"
                       href="UserServlet?action=toUpdateUser&id=${data.u_num }">修改</a>
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
