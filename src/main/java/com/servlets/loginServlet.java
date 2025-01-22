package com.servlets;

import com.dbconnection.DBConnect;
import com.dao.UserDAO;
import java.sql.Connection;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.PrintWriter;
import jakarta.servlet.annotation.WebServlet;
import com.user.UserDetails;
@WebServlet("/loginCheck")
public class loginServlet extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse res) {

//			get the connection to the database
		Connection c = DBConnect.getConn();

//			fetch the values from the frontend 
		String user = req.getParameter("username");
		String pass = req.getParameter("password");
		UserDetails newuser=new UserDetails();
		newuser.setEmail(user);
		newuser.setPassword(pass);
		UserDAO u1=new UserDAO(c);

		try {
			UserDetails userD = u1.login(newuser);
			PrintWriter out = res.getWriter();
			if (userD!=null) {
				HttpSession session=req.getSession();
				session.setAttribute("user",userD);
				res.setContentType("text/html");
		        out.println("<html>");
		        out.println("<body>");
		        out.println("<script type='text/javascript'>");
		        out.println("alert('login successfully!!!');");
		        out.println("window.location.href='home.jsp'");
		        out.println("</script>");
		        out.println("</body>");
		        out.println("</html>");
			}
			else {
				HttpSession session=req.getSession();
				session.setAttribute("inavlid-credentials","Invalid username or password!!");
				res.sendRedirect("login.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
