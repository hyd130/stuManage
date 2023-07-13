package org.servlet;


import org.service.UsersService;
import org.vo.StudentInfo;
import org.vo.StuList;
import org.vo.TeachList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name="UsersServlet")
public class UsersServlet extends BaseServlet{


    UsersService uservice = new UsersService();

    protected void queryUsers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<StuList> list = uservice.queryUserlist();
        request.getSession().setAttribute("ulist",list);
        request.getRequestDispatcher("WEB-INF/view/user/list.jsp").forward(request,response);
    }

    protected void vagueQuery(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("key");

        List<StuList> list = uservice.vagueQuery(name);

        request.getSession().setAttribute("slist",list);
        request.getRequestDispatcher("WEB-INF/view/user/list.jsp").forward(request,response);

    }

    protected void queryTeachers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

       List<TeachList> tlist =  uservice.queryTeachers();
        request.getSession().setAttribute("tlist",tlist);
        request.getRequestDispatcher("WEB-INF/view/teachers/tlist.jsp").forward(request,response);
    }


    protected void queryStuInfo(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {

        String p = request.getParameter("p");// 接收页码
        String key = request.getParameter("key");// 模糊搜索
        System.out.print(p);
        int pageSize = 6;// 每页显示5条
        int pageNum = 1; // 默认第一页
        if (p != null) {
            pageNum = Integer.parseInt(p);
        }
        Map map = new HashMap<>();
        map.put("key", key);

        // 调用分页查询
        List<StudentInfo> uPageList = uservice.getUserPage(pageNum, pageSize, map);
        // 携带参数到页面
        request.setAttribute("list", uPageList); // 绑定参数
        int nums = uservice.queryUserCount(map); // 查询总数
        // 计算总页数
        int totalPage = (nums % pageSize == 0) ? (nums / pageSize) : (nums / pageSize + 1);
        request.setAttribute("cp", pageNum); // 当前页
        request.setAttribute("tp", totalPage); // 总页数
        request.setAttribute("key", key); // 总页数

        request.getRequestDispatcher("WEB-INF/view/students/stuList.jsp").forward(request,response);

    }

    protected void toAddUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.getRequestDispatcher("/WEB-INF/view/user/add.jsp").forward(request,response);

    }

    protected void addUsers(HttpServletRequest request, HttpServletResponse response){

            String u_num = request.getParameter("u_num");
            String u_name = request.getHeader("u_name");
            String u_paswd = request.getParameter("u_pwd");
            String u_phone = request.getParameter("u_phone");
            String sex = request.getParameter("sex");


    }
    protected void toUpdateUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = request.getParameter("id");
        StudentInfo data = uservice.queryUserByid(Integer.parseInt(id));
        request.setAttribute("data", data);
        request.getRequestDispatcher("/WEB-INF/view/user/update.jsp").forward(request, response);


    }


}
