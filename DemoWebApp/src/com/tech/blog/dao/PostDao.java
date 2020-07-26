package com.tech.blog.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.*;

import com.mysql.jdbc.Connection;
import com.tech.blog.entities.Posts;
import com.tech.blog.helper.*;

public class PostDao{
	 Connection con;

public PostDao(Connection con2) {
	this.con=con2;
}
public boolean savePost(Posts p){
	boolean f=false;
	try
	{
       String query="insert into posts(pTitle,pContent,userId) values (?,?,?)";
	   PreparedStatement pstmt=this.con.prepareStatement(query);
	   pstmt.setString(1,p.getpTitle());
	   pstmt.setString(2,p.getpContent());
	   pstmt.setInt(3,p.getUserId());
	   pstmt.executeUpdate();
	   f=true;
	 }
	catch(Exception e){
		e.printStackTrace();
	                   }
	 return f;
}

//get all the posts,when expert logs in
public List<Posts> getAllPosts() {
    List<Posts> list = new ArrayList<Posts>();
    //fetch all the post
    try {
   System.out.println("Get All Posts were called");
        PreparedStatement p = con.prepareStatement("select * from posts order by pid desc");

        ResultSet set = p.executeQuery();

        while (set.next()) {
            int pid = set.getInt("pid");
            String pTitle = set.getString("pTitle");
            String pContent = set.getString("pContent");
            Timestamp date = set.getTimestamp("pDate");
            int userId = set.getInt("userId");
            Posts post = new Posts(pid,pTitle,pContent,date,userId);
            list.add(post);
            
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
    return list;
}


//fetch all post by userid,when user log in 
public List<Posts> getPostByUid(int userId) {
    List<Posts> list = new ArrayList<Posts>();
    //fetch all post by userid
    //fetch all the post
    try {

        PreparedStatement p = con.prepareStatement("select * from posts where userId=?");
        p.setInt(1, userId);
        ResultSet set = p.executeQuery();

        while (set.next()) {

            int pid = set.getInt("pid");
            String pTitle = set.getString("pTitle");
            String pContent = set.getString("pContent");
            Timestamp date = set.getTimestamp("pDate");
            int userid = set.getInt("userId");
            Posts post = new Posts(pid, pTitle, pContent,date,userid);
            list.add(post);
            
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
    return list;
}

public Posts getPostByPostId(int postId)
{
	Posts post=null;
	String q="select * from posts where pid=?";
	try{
		
	PreparedStatement p=this.con.prepareStatement(q);
	p.setInt(1,postId);
	ResultSet set=p.executeQuery();
	if(set.next()){
        int pid = set.getInt("pid");
        String pTitle = set.getString("pTitle");
        String pContent = set.getString("pContent");
        Timestamp date = set.getTimestamp("pDate");
        int userid = set.getInt("userId");
        post = new Posts(pid, pTitle, pContent,date,userid);
	}
	}catch (Exception e) {
        e.printStackTrace();
    }
    return post;
	
	

}
}
