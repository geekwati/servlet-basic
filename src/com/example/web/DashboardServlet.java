package com.example.web;
import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;

public class DashboardServlet extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
		
		HttpSession session=request.getSession();
		
		if(session.getAttribute("userName")==null){
		
			RequestDispatcher view=request.getRequestDispatcher("index.jsp");
			view.forward(request,response);
		}
		else{
		RequestDispatcher view=request.getRequestDispatcher("dashboard.jsp");
		view.forward(request,response);
	}
	}
} 