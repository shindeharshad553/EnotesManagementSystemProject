<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Notes</title>
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
	%>
	<form action="addNotes" method="post" class="container">
		<div class="container-content">
			<h1>Add Your Notes</h1>
			<%
			UserDetails us = (UserDetails) session.getAttribute("user");
			%>
			<input type="hidden" name="uid" value="<%=us.getId()%>">

			<label for="title">Note Title</label>
			<input type="text" id="title" class="form-control" name="title" required placeholder="Enter note title">

			<label for="content" style="margin-top: 1rem;">Note Content</label>
			<textarea id="content" class="form-control" rows="7" name="content" required placeholder="Enter note content(255 characters only)"></textarea>

			<button type="submit" class="add-btn">Add</button>
		</div>
	</form>
	<footer class="footer">
		<%@ include file="allComponents/footerSection.jsp"%>
	</footer>
	<%
	}
	%>
</body>
</html>
