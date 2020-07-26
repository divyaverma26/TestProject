package com.tech.blog.dao;
import java.sql.*;
import java.util.*;
import com.mysql.jdbc.Connection;
import com.tech.blog.entities.Comments;
import com.tech.blog.entities.Posts;
import com.tech.blog.helper.*;

public class CommentsDao {
	Connection con;
	
  public CommentsDao(Connection con) {
		this.con = con;
	}

   public boolean saveComment(Comments c)
   {  boolean f=true;
	   try {
		String q="insert into comments(ccontent,pid,uid) values (?,?,?)";
		   PreparedStatement p=this.con.prepareStatement(q);
		   p.setString(1,c.getCcontent());
		   p.setInt(2,c.getPid());
		   p.setInt(3,c.getUid());
		   f=true;
		   int i=p.executeUpdate();
		   System.out.println("value of return variable 'f' after saving comment :" +f);
	      } catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();}
		return f;
	}
	

	   
   }

