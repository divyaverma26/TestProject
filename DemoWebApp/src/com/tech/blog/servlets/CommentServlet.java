package com.tech.blog.servlets;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import com.mysql.jdbc.Connection;
import com.tech.blog.dao.*;
import com.tech.blog.entities.*;
import com.tech.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class CommentServlet
 */

@WebServlet("/CommentServlet")
public class CommentServlet extends HttpServlet{
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			try {
				response.setContentType("text/html;charset=UTF-8");
				String cContent=request.getParameter("cContent");
				int postId = Integer.parseInt(request.getParameter("pid"));
				System.out.println("Got current postid in CommentServelet "+postId+" disabled and comment is :" +cContent);
				  
				//getting current user id
				HttpSession session=request.getSession();
				User user=(User)session.getAttribute("currentUser");
				//Posts p=new Posts(user.getId()); 
				
				//Comments c=new Comments(cContent,postid,null,user.getId());
				Comments c=new Comments(cContent,postId,null,user.getId());
				CommentsDao dao=new CommentsDao((Connection) ConnectionProvider.getCon());
				
				System.out.println("Value of c received in saveComment is :" +dao.saveComment(c));
				if(dao.saveComment(c)==true)	
				{   
					System.out.println("Comment successfully saved");
					//response.getWriter().println("Comment saved successfully");
					//response.sendRedirect("Sucess.jsp");
					//return;
					
					RequestDispatcher dd = request.getRequestDispatcher("login.jsp");
                    dd.forward(request, response);
				}
				else
				{
					response.getWriter().println("Not done");
				}
				//response.sendRedirect("Sucess.jsp");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	 }
      

	}

