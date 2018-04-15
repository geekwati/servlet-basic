package com.example.web;
import javax.servlet.http.*;
import java.io.*;
import javax.servlet.*;

public class SessionDestroyedServlet extends HttpServlet{
	

	public void doGet(HttpServletRequest  request,HttpServletResponse response)
	         throws IOException,ServletException{
	         	HttpSession session=request.getSession();
	         	session.invalidate();
	         	PrintWriter out=response.getWriter();
	         	out.println("session destroyed");
	         }
	
}
