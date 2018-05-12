package com.example.web;
import javax.servlet.http.*;
import java.io.*;
import javax.servlet.*;
import org.myemail.service.*;
import org.myemail.domain.*;
import java.util.List;
public class ShowMessageServlet extends HttpServlet{
	
	public void doPost(HttpServletRequest  request,HttpServletResponse response) throws IOException,ServletException{
		HttpSession session=request.getSession();

		if(session.getAttribute("user")==null){
			response.sendRedirect("./");
		}
		MailUser mu=(MailUser)session.getAttribute("user");
		MailService s=new MailService();
		Integer mId=Integer.parseInt(request.getParameter("mid"));
		String msgType=request.getParameter("msgtype");
		Message msg=s.getMessage(mId);
		request.setAttribute("msg",msg);
		request.setAttribute("msgtype",msgType);
		RequestDispatcher view=request.getRequestDispatcher("msgDetail.jsp");
		view.forward(request,response);
		//}
	}
}