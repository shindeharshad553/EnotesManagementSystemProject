package com.servlets;

import com.dbconnection.DBConnect;
import com.dao.UserDAO;
import java.sql.Connection;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import jakarta.servlet.annotation.WebServlet;
import com.user.UserDetails;
@WebServlet("/register")
public class registerServlet extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse res) {

		Connection c = DBConnect.getConn();

		// Fetch the value from the frontEnd
		String firstName = req.getParameter("fname");
		String lastName = req.getParameter("lname");
		String email = req.getParameter("email");
		String password = req.getParameter("password");

		UserDetails newuser=new UserDetails();
		newuser.setName(firstName);
		newuser.setLname(lastName);
		newuser.setEmail(email);
		newuser.setPassword(password);
//		add the user data to the database 
		UserDAO u1 = new UserDAO(c);
		try {
			boolean isInserted = u1.addUser(newuser);
			if (isInserted) {
				PrintWriter out=res.getWriter();
					res.setContentType("text/html");
			        out.println("<html>");
			        out.println("<body>");
			        out.println("<script type='text/javascript'>");
			        out.println("alert('registered successfully!!!');");
			        out.println("window.location.href='login.jsp'");
			        out.println("</script>");
			        out.println("</body>");
			        out.println("</html>");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
