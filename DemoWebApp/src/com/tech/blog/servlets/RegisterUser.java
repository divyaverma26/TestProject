
package com.tech.blog.servlets;

import java.sql.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class RegisterUser
 */
@WebServlet("/Register")
public class RegisterUser extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		   //TODO Auto-generated method stub
	       String uname=request.getParameter("uname");
	       String email=request.getParameter("email");
	       String pass=request.getParameter("pass");
	       //create user object and set all data to that object
	       User user=new User(uname,email,pass);
	       //create a userdao object
	       UserDao dao=new UserDao(ConnectionProvider.getCon()); //same as Line Con
	       
	      // UserDao dao=new UserDao();   Alternate way 
	       if(dao.saveUser(user))
	       {
	    	 response.getWriter().println("done");
	       }else
	       {
	         response.getWriter().println("error");
	       } 
	     //System.out.print("uname is" +uname+ "email" + "mobile" +mobile+ "pass" +pass);
	     
	     //response.getWriter().println(ConnectionProvider.getCon()); 
	     
	     /*Connection connection=ConnectionProvider.getCon();  Line Con
	     try {
			java.sql.PreparedStatement ps=connection.prepareStatement("insert into register values(?,?,?)");
		    ps.setString(1,uname);
		    ps.setString(2,email);
		    ps.setString(3,pass);
		    int i= ps.executeUpdate();
		    if (i>0)
		    	response.getWriter().println("Data Inserted");
		    else
		    	response.getWriter().println("Data Not Inserted");
	     } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	     */	     
	     
	}

}