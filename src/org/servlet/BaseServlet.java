package org.servlet;

import java.io.IOException;
import java.lang.reflect.Method;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BaseServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 String action=req.getParameter("action");
	        try {
	            Method method=this.getClass().getDeclaredMethod(action, HttpServletRequest.class, HttpServletResponse.class);//通过反射来调用业务，优化ifelse
	            method.invoke(this,req,resp);//调用目标业务，方法

	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	}
	
	
	
}
