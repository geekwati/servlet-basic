	package com.example.web;
import javax.servlet.http.*;
import java.io.*;
import javax.servlet.*;

public class CheckServlet extends HttpServlet{
	public void init(){
		System.out.println("initialization of servlet");
	}
	
	public void service(HttpServletRequest  request,HttpServletResponse response)
	         throws IOException,ServletException{
	         	response.setContentType("text/html");
	         	PrintWriter out=response.getWriter();
	         	out.println("hi visitor!In service");
	         	System.out.println("of servlet");
	         }
	public void doGet(HttpServletRequest  request,HttpServletResponse response)
	         throws IOException,ServletException{
	         	
				PrintWriter out=response.getWriter();
	         	out.println("hello visitor!In Get");
	         	
	         }
	public void doPost(HttpServletRequest  request,HttpServletResponse response)
	         throws IOException,ServletException{
				PrintWriter out=response.getWriter();
	         	out.println("hello visitor!In post");
	         	
	         }
	
}
