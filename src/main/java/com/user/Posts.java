package com.user;

import java.sql.Timestamp;
import java.util.Date;

public class Posts {

	private int uid;
	private String title;
	private String content;
	private int id;
	private Date date;

//	getters and setters 

	public String getTitle() {
		return title;
	}

	public String getContent() {
		return content;
	}

	public int getId() {
		return id;
	}

	public int getUid() {
		return uid;
	}

	public Date getDate() {
		return date;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setID(int id) {
		this.id = id;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}
}
