<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.dao.PostsDAO" %>
    <%@ page import="com.dbconnection.DBConnect" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete Notes </title>
</head>
<body>
<%
	int note_id=Integer.parseInt(request.getParameter("note_id"));
	PostsDAO pd=new PostsDAO(DBConnect.getConn());
	
	if(pd.deleteNotes(note_id)){
		session.setAttribute("delete_note","true");
		response.sendRedirect("showNotes.jsp");
	}
	else{
		session.setAttribute("error_delete_note", "false");
		response.sendRedirect("showNotes.jsp");
	}

%>





</body>
</html>