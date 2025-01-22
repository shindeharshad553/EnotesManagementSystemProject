package com.servlets;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/deleteNotes")
public class deleteNotes extends HttpServlet{
	protected void service(HttpServletRequest req,HttpServletResponse res) {
		System.out.println("calling");
	}
}
