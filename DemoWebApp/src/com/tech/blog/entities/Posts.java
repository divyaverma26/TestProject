package com.tech.blog.entities;

import java.sql.Timestamp;

public class Posts {
	  
   private int pid;
   private String pTitle;
   private String pContent;
   private Timestamp pDate;	
   private int userId;
   
   public Posts() {
		// TODO Auto-generated constructor stub
	}
   public Posts(int pid, String pTitle, String pContent, Timestamp pDate,int userId) {
		this.pid = pid;
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.pDate = pDate;
		this.userId=userId;
	}
    
   public Posts(String pTitle, String pContent, Timestamp pDate,int userId) {
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.pDate = pDate;
		this.userId= userId;
	}
   
   public Posts(int userId) {
		this.userId= userId;
	}
   
    public int getPid() {
	return pid;
     }
    public void setPid(int pid) {
	this.pid = pid;
     }
    public String getpTitle() {
	return pTitle;
     }
    public void setpTitle(String pTitle) {
	this.pTitle = pTitle;
     }
    public String getpContent() {
	return pContent;
     }
    public void setpContent(String pContent) {
	this.pContent = pContent;
     }
    public Timestamp getpDate() {
	return pDate;
     }
    public void setpDate(Timestamp pDate) {
	this.pDate = pDate;
     }
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
    
}


