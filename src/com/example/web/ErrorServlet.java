	package com.example.web;
import javax.servlet.http.*;
import java.io.*;
import javax.servlet.*;

public class ErrorServlet extends HttpServlet{
	public void doPost(HttpServletRequest  request,HttpServletResponse response)
	         throws IOException,ServletException{
				PrintWriter out=response.getWriter();
	         	out.println("hello visitor!In post");
	         	
	         }
	
}
