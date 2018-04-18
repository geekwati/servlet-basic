package com.example.model;
import javax.servlet.ServletContextListener;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;


public class MyServletContextListener implements ServletContextListener{
	public void contextInitialized(ServletContextEvent event){
		ServletContext ctx=event.getServletContext();
		String dogBreed=ctx.getInitParameter("breed");
		Dog d=new Dog(dogBreed);
		ctx.setAttribute("dog",d);//ctx.setAttribute(String,Object);

	}
	public void contextDestroyed(ServletContextEvent event){
		//no code required
		/*because when application destroyed everything of webapp automatically destroyed 
		including Dog class
		but we have to write this because ServletContextListener is an interface
		so we must give its definition 
		even blank definition satisfy compiler on interface behalf*/
	}
}
