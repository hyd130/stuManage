package org.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter(filterName = "LoginFilter")
public class LoginFilter implements Filter{

	 	private String errorPage="index.jsp";
	    
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		    HttpServletRequest request = (HttpServletRequest)req;
	        HttpServletResponse response = (HttpServletResponse)resp;
	        HttpSession session = request.getSession();

	        Object admin = session.getAttribute("admin");
	        PrintWriter out = response.getWriter();
	        if(admin != null){

	            chain.doFilter(request,response);

	        } else{

	            out.println("您还未登陆，三秒钟后跳转至登录页面");

	            //out.println("<script language='javascript'>alert('你还未登录');");

	            response.setHeader("refresh","3;/WEB-INF/view/login.jsp");

	            //response.sendRedirect("/pages/users/login.jsp");

	            //request.getRequestDispatcher("/pages/users/login.jsp").forward(request,response);

	        }
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	
	
}
