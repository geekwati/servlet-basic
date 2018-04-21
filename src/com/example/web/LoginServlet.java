	package com.example.web;
import javax.servlet.http.*;
import java.io.*;
import javax.servlet.*;
import org.myemail.service.*;
import org.myemail.domain.*;
import java.util.List;

public class LoginServlet extends HttpServlet{
	
	public void doPost(HttpServletRequest  request,HttpServletResponse response) throws IOException,ServletException{
		String userName=request.getParameter("name");
		String password=request.getParameter("pwd");
		MailService s=new MailService();
		MailUser mu =null;
		PrintWriter out=response.getWriter();
		System.out.println("USER= "+userName );
		System.out.println("pwd= "+password);
		mu=MailUser.getUser(userName,password);
		mu=s.authenticateUser(mu);
		if(mu==null){
			
			request.setAttribute("error","Wrong username or password.Please try again!");
			RequestDispatcher view=request.getRequestDispatcher("index.jsp");
			view.forward(request,response);
		}
		else{
			HttpSession session=request.getSession();
			session.setAttribute("userName",userName);
			response.sendRedirect("./dashboard");
		}
		
	}
}
