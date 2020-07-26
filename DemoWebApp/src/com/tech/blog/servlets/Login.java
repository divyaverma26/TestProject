package com.tech.blog.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String uname=request.getParameter("uname");
	     String pass=request.getParameter("pass");
	     
	     UserDao dao=new UserDao(ConnectionProvider.getCon());
	     
	     User u=dao.getUserByEmailAndPassword(uname, pass);
	     
	     if(u==null){
	    	 //login error.......
	    	  // response.getWriter().println("Invalid User name or password");
	         Message msg=new Message("Invalid User name or password","error","alert-danger");
	         HttpSession s=request.getSession();
	         s.setAttribute("msg",msg);
	         response.sendRedirect("Login.jsp");
	     }
	     else
	     {
	    	 //session will remain active until user has closed browser
	    	 HttpSession s=request.getSession();
	    	 s.setAttribute("currentUser",u);
	    	 response.sendRedirect("profile.jsp");
	     }
	    /* Connection connection=ConnectionProvider.getCon();
	     java.sql.PreparedStatement ps;
		   try{
			ps = connection.prepareStatement("select * from register where uname=? and pass=?");
		
	        ps.setString(1,uname);
		    ps.setString(2,pass);
		    ResultSet rs=ps.executeQuery();
		   if(rs.next())
		     {
			  //response.sendRedirect("Sucess.jsp"); 
			  RequestDispatcher rd=request.getRequestDispatcher("Sucess.jsp");
			  rd.forward(request, response);
		     }
			else
		     {
		      RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");
		      response.getWriter().println("Invalid User name or password");
		      rd.include(request, response);
		     } 
		       }
		   catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		}
		 
	}


