package com.example.web;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class LogoutServlet extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		HttpSession session=request.getSession();
		if(session.getAttribute("userName")!=null){
			session.invalidate();
		}
		response.sendRedirect("./");
		}
}