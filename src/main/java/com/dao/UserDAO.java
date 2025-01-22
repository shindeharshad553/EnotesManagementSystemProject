package com.dao;

import java.sql.Connection;
import com.user.UserDetails;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UserDAO {
	public Connection c;

	public UserDAO(Connection c) {
		this.c = c;
	}

	public boolean addUser(UserDetails newuser) throws SQLException {
		PreparedStatement ps = c.prepareStatement("Insert into user (firstName,lastName,email,password)values(?,?,?,?)");
		ps.setString(1, newuser.getName());
		ps.setString(2, newuser.getLname());
		ps.setString(3, newuser.getEmail());
		ps.setString(4, newuser.getPassword());
		int count = ps.executeUpdate();
		if (count > 0)
			return true;
		return false;
	}

//	login user 
	public UserDetails login(UserDetails newuser) throws Exception {
		PreparedStatement ps = c.prepareStatement("select * from user where email=? and password=?");
		ps.setString(1, newuser.getEmail());
		ps.setString(2, newuser.getPassword());
		ResultSet rs = ps.executeQuery();
		UserDetails us=null;
		if (rs.next()) {
			us=new UserDetails();
			us.setName(rs.getString(1));
			us.setLname(rs.getString(2));
			us.setEmail(rs.getString(3));
			us.setPassword(rs.getString(4));
			us.setId(Integer.parseInt(rs.getString(5)));
		}
		return us;
	}
}
