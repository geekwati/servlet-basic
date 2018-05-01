	package com.example.web;
import javax.servlet.http.*;
import java.io.*;
import javax.servlet.*;
import org.myemail.service.*;
import org.myemail.domain.*;
import java.util.List;

public class SaveMessageServlet extends HttpServlet{
	
	public void doPost(HttpServletRequest  request,HttpServletResponse response) throws IOException,ServletException{
		String toUserId=request.getParameter("toUserId");
		String subject=request.getParameter("subject");
		String body=request.getParameter("body");
		MailService s=new MailService();
		HttpSession session=request.getSession();
		MailUser loginUser=(MailUser)session.getAttribute("user");
		/*MailUser toUser =MailUser.getUser(toUserName);
		toUser=s.authenticateUser(toUser);
		*/System.out.println("hello");
		System.out.println(body);
		System.out.println(subject);
		System.out.println(loginUser.userId);
		System.out.println("touseridsds="+toUserId);
		boolean statusOfMail;
		if(body.isEmpty()||subject.isEmpty())
			statusOfMail=false;
		else{
			Message msg=Message.getMessage(body,subject,loginUser.userId,Integer.parseInt(toUserId));
			statusOfMail=s.createMessage(msg);
		}
		String error;
		if(statusOfMail){

			error="Your mail has been successfully sent.";
			System.out.println(error);
			session.setAttribute("message-status",error);
			response.setStatus(200);
			response.setHeader("Location", "./dashboard");

		}

		else{
			error="Error while email sending!";
			System.out.println(error);
			response.setStatus(500);
			session.setAttribute("message-status",error);
			//request.setAttribute("toUser",toUserId);
			//request.setAttribute("body",body);
			//request.setAttribute("subject",subject);
			RequestDispatcher view=request.getRequestDispatcher("/compose");
			view.forward(request,response);
		}
		
	}
}