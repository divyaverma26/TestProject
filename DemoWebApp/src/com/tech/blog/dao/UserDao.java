package com.tech.blog.dao;
import java.sql.*;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.entities.User;
public class UserDao {
private Connection con;
 
 public UserDao(Connection con){
	 this.con=con;
 }
 
//private Connection con=ConnectionProvider.getCon(); Alternate way
 //method to insert user to database:
 public boolean saveUser(User user) 
 {
		boolean f=false;
	try
	{
		//user-->database
       String query="insert into user(name,email,password) values (?,?,?)";
	   PreparedStatement ptsmt=this.con.prepareStatement(query);
	   ptsmt.setString(1,user.getName());
	   ptsmt.setString(2,user.getEmail());
	   ptsmt.setString(3,user.getPassword());
	   ptsmt.executeUpdate();
	   f=true;
	 }
	catch(Exception e){
		e.printStackTrace();
	                   }
	 return f;
 }

 public User getUserByEmailAndPassword(String email,String password){
	 User user=null;
	 try
	 {
		String query="select * from  user where email=? and password=?";
		PreparedStatement pstmt=con.prepareStatement(query);
		pstmt.setString(1,email);
		pstmt.setString(2,password);
		ResultSet set=pstmt.executeQuery();
		
		if(set.next())
		{
			user=new User();
			//data from db
			String name=set.getString("name");
			//set to user object
			user.setName(name);
			user.setId(set.getInt("id"));
			user.setEmail(set.getString("email"));
			user.setPassword(set.getString("password"));
			user.setDateTime(set.getTimestamp("rdate"));
			user.setProfile(set.getString("profile"));
		}
	 }catch(Exception e){
		 e.printStackTrace();
	 }
	 
	 return user;
 }
 
}
