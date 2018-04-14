	package com.example.web;
import javax.servlet.http.*;
import java.io.*;
import javax.servlet.*;

public class LifeCycleTesterServlet extends HttpServlet{
	int i=0;
	
	public void init(ServletConfig sconfig) throws ServletException{
		super.init(sconfig);
		System.out.println("init (config) initialization of servlet");		
		System.out.println("value of i in init(scconfig)="+i);
	}
	public void init(){
		System.out.println("init() initialization of servlet");
		System.out.println("value of i in init="+i);
		

	}
	public void service(HttpServletRequest  request,HttpServletResponse response)
		throws ServletException,IOException{
		System.out.println("service of servlet"+this);
		System.out.println(Thread.currentThread().getName());
		System.out.println(Thread.currentThread().hashCode());
		super.service(request,response);
	}

	public void doGet(HttpServletRequest  request,HttpServletResponse response)
	         throws IOException,ServletException{
	         	PrintWriter out=response.getWriter();
				out.println("doGet() of servlet");
				out.println("value of i in doGet="+i);
				System.out.println("value of i in doGet="+i);
				i++;
				
	         }
	public void destroy() {
		System.out.println("destruction of servlet");
		

	}
}
