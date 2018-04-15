package com.example.web;
import javax.servlet.http.*;
import java.io.*;
import javax.servlet.*;

public class UserColorSetServlet extends HttpServlet{
	

	public void doGet(HttpServletRequest  request,HttpServletResponse response)
	         throws IOException,ServletException{
	         	HttpSession session=request.getSession();
	         	String color=request.getParameter("color");
	         	session.setAttribute("color",color);
				RequestDispatcher view=request.getRequestDispatcher("byeUser.jsp");
				view.forward(request,response);
	         }
	
}
