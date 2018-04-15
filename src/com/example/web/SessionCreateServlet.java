	package com.example.web;
import javax.servlet.http.*;
import java.io.*;
import javax.servlet.*;

public class SessionCreateServlet extends HttpServlet{
	

	public void doGet(HttpServletRequest  request,HttpServletResponse response)
	         throws IOException,ServletException{
	         	HttpSession session=request.getSession();
	         	RequestDispatcher view;
	         	if(session.isNew()){
	         		view=request.getRequestDispatcher("newUser.jsp");
	         	}
	         	else{
	         		view=request.getRequestDispatcher("oldUser.jsp");	
	         	}
	         	view.include(request,response);
	         }
	
}
