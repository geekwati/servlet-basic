package com.example.web;
import javax.servlet.http.*;
import java.io.*;
import javax.servlet.*;
import org.myemail.service.*;
import org.myemail.domain.*;
import java.util.*;
public class ComposeServlet extends HttpServlet{
	
	public void doGet(HttpServletRequest  request,HttpServletResponse response) throws IOException,ServletException{
		HttpSession session=request.getSession();
		if(session.getAttribute("user")==null){
			response.sendRedirect("./");
		}
		else
		{
			MailUser mu=new MailUser();
			MailService s=new MailService();
			List<MailUser> recipientList=s.recipientUsers(mu);
			MailUser loginUser=(MailUser)session.getAttribute("user");
			Iterator<MailUser> recipientIter=recipientList.listIterator();  
			while(recipientIter.hasNext()) {
				/* for each does not work here because 
				in foreach we can't able to  remove current value of list*/
				MailUser recipientUser = recipientIter.next();
				if(recipientUser.userName.equals(loginUser.userName))
					recipientIter.remove();
			}
			Collections.sort(recipientList);//implicitly calls MailUser class compareTo() method
			request.setAttribute("recipientList",recipientList);
			RequestDispatcher view=request.getRequestDispatcher("compose.jsp");
			view.forward(request,response);
		}
	}
}