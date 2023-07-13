package org.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.service.UsersService;
import org.vo.Users;

@WebServlet(name="LoginServlet")
public class LoginServlet extends BaseServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	 protected void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   
		  //清空登录记录
	      request.getSession().invalidate();
	      //进行登录操作
	      String username = request.getParameter("username");
	      String password = request.getParameter("password");
	      String type = request.getParameter("type");
	      
	      Users user = new Users();
	      if(!username.isEmpty() && !password.isEmpty() && !type.isEmpty()) {
	    	  user.setU_tel(username);
	    	  user.setU_paswd(password);
	    	  user.setU_type(type);
	      }
   
	      UsersService uservice = new UsersService();
	      Users list =  uservice.queryUserAll(user);
	      
	     
	      if(list != null) {
	    	  if("0".equals(list.getU_type())) {
	    		  response.getWriter().print("0");
	    	  }else if("1".equals(list.getU_type())) {
	    		  response.getWriter().print("1");
	    	  }else if("2".equals(list.getU_type())) {
	    		  response.getWriter().print("2");
	    	  }
	    	  request.getSession().setAttribute("admin",list);
	      }else {
	    	  response.getWriter().print("error");
	      }

	      response.getWriter().close();
	  }
	 
	 
	protected void toMain(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.getRequestDispatcher("WEB-INF/view/main.jsp").forward(request, response);
		
	}
}
