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
		
		//response.setContentType("application/json");

		PrintWriter out = response.getWriter();

		String msgStatus;
		Boolean success;
		if(statusOfMail){
			success = true;
			msgStatus="Your mail has been successfully sent.";
			
			System.out.println(msgStatus);
			session.setAttribute("message-status",msgStatus);

		} else {
			success = false;
			msgStatus="Error while sending email!";
			System.out.println(msgStatus);
		}
		
		out.print(String.format("{\"success\":\"%s\", \"msgStatus\":\"%s\"}", success, msgStatus));
		out.flush();
	}
}