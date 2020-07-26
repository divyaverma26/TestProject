package com.tech.blog.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Connection;
import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Posts;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class AddPostServlet
 */
@WebServlet("/AddPostServlet")
public class AddPostServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		String pTitle=request.getParameter("pTitle");
		response.getWriter().println(pTitle);
		String pContent=request.getParameter("pContent");
      
		//getting current user id
		HttpSession session=request.getSession();
		User user=(User)session.getAttribute("currentUser");
	    
		Posts p=new Posts(pTitle,pContent,null,user.getId());
	    PostDao dao=new PostDao((Connection) ConnectionProvider.getCon()); 
        if(dao.savePost(p))	
        {
        	response.getWriter().println("done");
        }
        else
        {
        	response.getWriter().println("Not done");
        }
	}

}
