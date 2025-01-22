package com.user;

public class UserDetails {
	private int id;
	private String name;
	private String lname;
	private String email;
	private String password;


	public String getName() {
		return name;
	}

	public int getId() {
		return id;
	}

	public String getLname() {
		return lname;
	}

	public String getEmail() {
		return email;
	}

	public String getPassword() {
		return password;
	}

	public void setId(int id) {
		this.id=id;
	}
	
	public void setName(String name) {
		this.name = name;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
