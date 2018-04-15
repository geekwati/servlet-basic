package com.example.web;
import javax.servlet.http.*;
import java.io.*;
import javax.servlet.*;

public class UserChoiceServlet extends HttpServlet{
	

	public void doGet(HttpServletRequest  request,HttpServletResponse response)
	         throws IOException,ServletException{
	         	HttpSession session=request.getSession();
	         	String name=request.getParameter("name");
	         	session.setAttribute("name",name);
				RequestDispatcher view=request.getRequestDispatcher("oldUser.jsp");
				view.forward(request,response);
	         }
	
}
