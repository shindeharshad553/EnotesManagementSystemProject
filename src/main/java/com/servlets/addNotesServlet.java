package com.servlets;
import jakarta.servlet.annotation.WebServlet;

import java.io.PrintWriter;
import java.sql.Connection;

import com.dbconnection.DBConnect;
import com.user.Posts;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.dao.PostsDAO;
@WebServlet("/addNotes")
public class addNotesServlet extends HttpServlet {

	protected void doPost(HttpServletRequest req,HttpServletResponse res) {
		String title=req.getParameter("title");
		String content=req.getParameter("content");
		int uid=Integer.parseInt(req.getParameter("uid"));
		
		
//		place this value into the post POJO class
		
		Posts p=new Posts();
		p.setTitle(title);
		p.setContent(content);
		p.setUid(uid);
		
		Connection c=DBConnect.getConn();
		PostsDAO post=new PostsDAO(c);
		try {
			if(post.addNotes(p)) {
				HttpSession session=req.getSession();
				session.setAttribute("post",p);
				//after successfully adding the post show success message and remove all the content from input fields
				res.setContentType("text/html");
				PrintWriter out=res.getWriter();
		        out.println("<html>");
		        out.println("<body>");
		        out.println("<script type='text/javascript'>");
		        out.println("alert('notes added successfully!!!');");
		        out.println("window.location.href='home.jsp'");
		        out.println("</script>");
		        out.println("</body>");
		        out.println("</html>");
			}
			else
				System.out.println("error");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
