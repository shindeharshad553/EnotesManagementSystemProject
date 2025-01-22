package com.servlets;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;

import java.io.PrintWriter;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.dao.PostsDAO;
import com.dbconnection.DBConnect;
import com.user.Posts;
@WebServlet("/editNotes")
public class editNotes extends HttpServlet {
	protected void service(HttpServletRequest req, HttpServletResponse res) throws IOException {

		int post_id = Integer.parseInt(req.getParameter("post_id"));
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
//		create the POJO of posts 
		Posts p=new Posts();
		p.setID(post_id);
		p.setTitle(title);
		p.setContent(content);
		
		
		PostsDAO pd=new PostsDAO(DBConnect.getConn());
		
		PrintWriter out=res.getWriter();
		HttpSession session =req.getSession();
		if(pd.updateNotes(p)) {
			session.setAttribute("note_updated","true");
			res.sendRedirect("edit.jsp");
		}
		else
			out.println("Problem");

	}
}
