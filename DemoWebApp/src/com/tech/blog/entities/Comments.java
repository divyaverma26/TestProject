package com.tech.blog.entities;

import java.sql.Timestamp;


/*This module is under construction*/
public class Comments{
	   private int commentid;
	   private String ccontent;
	   private Timestamp cdate;	
	   private int uid;
	   private int pid;
	   
	   public Comments(){
			// TODO Auto-generated constructor stub
		}
	   
	   public Comments(String ccontent,int pid,Timestamp pDate,int uid) {
			this.ccontent = ccontent;
            this.pid=pid;
			this.uid=uid;
			this.cdate=cdate;
	   }	
	   
	   public Comments(int commentid,String ccontent,int pid,Timestamp pDate,int uid) {
			this.commentid=commentid;
			this.ccontent = ccontent;
            this.pid=pid;
			this.uid=uid;
			this.cdate=cdate;
		}

	public int getCommentid() {
		return commentid;
	}

	public void setCommentid(int commentid) {
		this.commentid = commentid;
	}
 
	public String getCcontent() {
		return ccontent;
	}

	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	} 

	public Timestamp getCdate() {
		return cdate;
	}

	public void setCdate(Timestamp cdate) {
		this.cdate = cdate;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}
	  
}
