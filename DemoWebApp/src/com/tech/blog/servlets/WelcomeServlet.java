package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class WelcomeServlet
 */
@WebServlet("/WelcomeServlet")
public class WelcomeServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 /*int i=Integer.parseInt(request.getParameter("i"));
	  int j=Integer.parseInt(request.getParameter("j"));
	  
	  int k=i+j;
	  
	  PrintWriter out=response.getWriter();
	  out.println("Sum of two numbers is " +k);*/
		
	String uname=request.getParameter("uname");
	String pass=request.getParameter("pass");
	
	if(uname.equals("divya") && pass.equals("divya261"))
	  {response.sendRedirect("Sucess.jsp");}
	 
	else 
	  {response.getWriter().print("Either username or password is incorrect.Enter again");
	    response.sendRedirect("WelcomeServlet");}
	}

}
