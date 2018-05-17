	package com.example.web;
import javax.servlet.http.*;
import java.io.*;
import javax.servlet.*;
import org.myemail.service.*;
import org.myemail.domain.*;
import java.util.List;

public class CreateUserServlet extends HttpServlet{
	
	public void doPost(HttpServletRequest  request,HttpServletResponse response) throws IOException,ServletException{
		boolean b=false;
		String userName=request.getParameter("name");
		String password=request.getParameter("pwd");
		String pno=request.getParameter("pno");
		String emailid=request.getParameter("emailid");
		boolean validPno=true;
		long phoneNo=0;
		try{
			phoneNo=Long.valueOf(pno);
		}
		catch(NumberFormatException e){
			System.out.println("first");
			validPno=false;
		}
		if(pno.length()!=10){
			System.out.println("second");
			validPno=false;
		}

		
		System.out.println("USER= "+userName );
		System.out.println("pwd= "+password);
		System.out.println("pno="+ pno);
		System.out.println("emailid="+ emailid);
		System.out.println("validpno="+ validPno);
		System.out.println("long pno="+ phoneNo);
		if(!userName.isEmpty() && !password.isEmpty() &&  !emailid.isEmpty() && validPno){
			MailService s=new MailService();
			MailUser mu =null;
			PrintWriter out=response.getWriter();
			mu=MailUser.getUser(userName,password,pno,emailid);
			b=s.createUser(mu);
		}
		if(!b){
			
			request.setAttribute("error","Provide all required fields!");
			RequestDispatcher view=request.getRequestDispatcher("createUser.jsp");
			view.forward(request,response);
		}
		else{
			request.setAttribute("msg","User has been successfully created");
			RequestDispatcher view=request.getRequestDispatcher("index.jsp");
			view.forward(request,response);
		}
		
	}
}
