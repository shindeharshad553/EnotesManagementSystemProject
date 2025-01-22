package com.dao;

import com.user.Posts;
import com.dbconnection.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class PostsDAO {

	private Connection c;

	public PostsDAO(Connection c) {
		this.c = c;
	}

	public boolean addNotes(Posts p) throws Exception {
		PreparedStatement ps = c.prepareStatement("insert into posts (title,content,uid) values (?,?,?)");
		ps.setString(1, p.getTitle());
		ps.setString(2, p.getContent());
		ps.setInt(3, p.getUid());

		int result = ps.executeUpdate();
		if (result > 0)
			return true;
		return false;
	}

	public List<Posts> getData(int id) {
		List<Posts> results = new ArrayList<Posts>();
		try {
			PreparedStatement ps = c.prepareStatement("select * from posts where uid=? order by id desc");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Posts p = new Posts();
				p.setID(rs.getInt(1));
				p.setTitle(rs.getString(2));
				p.setContent(rs.getString(3));
				p.setDate(rs.getTimestamp(4));
				results.add(p);
			}
			return results;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return results;
	}

	public boolean editNotes(Posts p) {
		try {
			PreparedStatement ps = c.prepareStatement("Update posts set title=?,content=? where id=?");
			ps.setString(1, p.getTitle());
			ps.setString(2, p.getContent());
			ps.setInt(3, p.getId());
			if(ps.executeUpdate()>0) 
				return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
//	Method to update the notes 
	public boolean updateNotes(Posts p){
		try {
			PreparedStatement ps=c.prepareStatement("update posts set title=?,content=? where id=?");
			ps.setString(1, p.getTitle());
			ps.setString(2, p.getContent());
			ps.setInt(3,p.getId());
			if(ps.executeUpdate()>0)
				return true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	
//	method to delete notes
	
	public boolean deleteNotes(int note_id) {
		try {
			PreparedStatement ps=c.prepareStatement("delete from posts where id=?");
			ps.setInt(1, note_id);
			if(ps.executeUpdate()>0) {
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
}
