package com.tech.blog.helper;
import java.sql.*;

public class ConnectionProvider {
	private static Connection con=null;
	static Statement stmt=null;
	public static Connection getCon()
	{
		try{ 
			if(con==null) 
			{
    		  Class.forName("com.mysql.jdbc.Driver");
	          System.out.println("Driver loaded");
	          con=DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog","root","divya261");
	          System.out.println("Connection established"); 
	         return con;
			}
			else
			{
				return con;
			
			}
		}	
		 catch(ClassNotFoundException e)
	     {
		 e.printStackTrace();
	     }
	     catch(SQLException e)
	     {
		 e.printStackTrace();
	     }
		return con;
		}
 
}
