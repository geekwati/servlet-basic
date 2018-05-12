package com.example.web;
import javax.servlet.http.*;
import java.io.*;
import javax.servlet.*;
import org.myemail.service.*;
import org.myemail.domain.*;
import java.util.List;
public class GetMessageServlet extends HttpServlet{
	
	public void doGet(HttpServletRequest  request,HttpServletResponse response) throws IOException,ServletException{
		HttpSession session=request.getSession();
		if(session.getAttribute("user")==null){
			response.sendRedirect("./");
		}
		MailUser mu=(MailUser)session.getAttribute("user");
		MailService s=new MailService();
		List<Message> msgList=s.getMessages(request.getParameter("box"),mu);
		request.setAttribute("msgList",msgList);
		for(Message msg : msgList) {
			System.out.print("<tr><td>"+msg.mBody+"</td>");
			System.out.print("<td>"+msg.mSubject+"</td>");
			System.out.print("<td>"+msg.fromUserId+"</td>");
			System.out.print("<td>"+msg.dateTime+"</td></tr>");
		}
		RequestDispatcher view=request.getRequestDispatcher("msgDisplay.jsp");
		view.include(request,response);
		//}
	}
}