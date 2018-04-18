package com.example.web;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletContext;
import com.example.model.Dog;

public class ListenerTesterServlet extends HttpServlet{
	public void doGet(HttpServletRequest  request,HttpServletResponse response)
	         throws IOException,ServletException{
	         	response.setContentType("text/html");
	         	PrintWriter out=response.getWriter();
	         	out.println("    test context attribute set by listener");
	         	out.println("<br><br>");
	         	ServletContext ctx=getServletContext();
	         	//getServletContext() is a public method of GenericServlet Class
	         	Dog dog=(Dog)ctx.getAttribute("dog");//ctx.getAttribute(String) returns Object Type reference 
	         											//so we have to typecast
	         	out.println("    Dog's breed is: "+dog.getBreed());

	         }
}