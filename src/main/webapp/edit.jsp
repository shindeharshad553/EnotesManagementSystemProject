<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.net.URLDecoder" %>
<html>
<head>
<meta charset="UTF-8">
<title>Edit notes</title>
<style>
.container {
	height: 78%;
	width: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.container-content {
	height: 80%;
	width: 80%;
	display: flex;
	flex-direction: column;
}

.add-btn {
	margin: auto;
	margin-top: 0.5rem;
	height: 3rem;
	width: 4rem;
	border-radius: 0.3rem;
	background-color: #76d9f5;
	border: none;
	cursor: pointer;
}

.add-btn:hover {
	background-color: #63c8e0;
}

h1 {
	text-align: center;
}
</style>

<%@ include file="combinedLinks/allcssLinks.jsp"%>
<link rel="stylesheet" href="css/navbarStyle.css">
<link rel="stylesheet" href="css/footerStyle.css">
</head>
<body>
	<%@ include file="allComponents/navbar.jsp"%>
	<%
	// Check if user is logged in, otherwise redirect to login page
	UserDetails checkUser = (UserDetails) session.getAttribute("user");
	if (checkUser == null) {
	%>
		<script type="text/javascript">
			alert("Please login first.");
			window.location.href = "login.jsp";
		</script>
	<%
	} else {
		String ispresent=(String)session.getAttribute("note_updated");
		if("true".equals(ispresent)){
			session.removeAttribute("note_updated");%>
			<script type="text/javascript">
			alert("Updated Successfully!!!!");
			window.location.href = "showNotes.jsp";
		</script>
	<%	}
		else{
	%>
	<form action="editNotes" method="post" class="container">
		<div class="container-content">
			<h1>Edit Your Notes</h1>
			<%
			UserDetails us = (UserDetails) session.getAttribute("user");
			int note_id=Integer.parseInt(request.getParameter("note_id"));
			
			String title=URLDecoder.decode(request.getParameter("title"));
			String content=URLDecoder.decode(request.getParameter("content"));
			%>
			<input type="hidden" value="<%= note_id%>" name="post_id">
			<label for="title">Note Title</label>
			<input type="text" id="title" class="form-control" name="title" required value="<%=title%>">

			<label for="content" style="margin-top: 1rem;">Note Content</label>
			<textarea id="content" class="form-control" rows="7" name="content" required ><%=content%></textarea>
			
			<button type="submit" class="add-btn">Edit</button>
		</div>
	</form>
	<footer class="footer">
		<%@ include file="allComponents/footerSection.jsp"%>
	</footer>
	<%
	}
	}
	%>
</body>
</html>
