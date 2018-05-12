package com.example.web;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import org.myemail.service.*;

public class LogoutServlet extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		HttpSession session=request.getSession();
		MailService s=new MailService();
		if(session.getAttribute("user")!=null){
			session.invalidate();
			//s.closeUser();
		}
		response.sendRedirect("./");
		}
}