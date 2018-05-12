package com.example.web;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.myemail.domain.*;
import org.myemail.service.*;
public class MyFilter implements Filter{
	public void init(FilterConfig fConfig) throws ServletException {

	}  
	      
	public void doFilter(ServletRequest req,ServletResponse resp,FilterChain chain) 
	throws IOException, ServletException {  
	          
	    HttpServletRequest httpReq=(HttpServletRequest)req;
	    HttpServletResponse httpResp=(HttpServletResponse)resp;
	    HttpSession session=httpReq.getSession();
	    MailService s=new MailService();
		/*if(session.getAttribute("user")==null){
			httpResp.sendRedirect("./");
		}*/
		System.out.println("&&&&exception&&&&");
		try{
			MailUser mu=(MailUser)session.getAttribute("user");
		}
		catch(ClassCastException e){
			session.invalidate();
			httpResp.sendRedirect("./index.jsp");
		}


	    chain.doFilter(req, resp);//sends request to next resource  
	}  
	
	public void destroy() {
		
	}  
	  
}	