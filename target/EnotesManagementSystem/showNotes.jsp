<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show notes</title>

<style>
html, body {
    margin: 0;
    padding: 0;
    height: 100%; /* Ensure full height for the viewport */
    display: flex;
    flex-direction: column;
}

.container {
	text-align: center;
	width: 80%;
	margin: 1rem 0;
	flex:1;
}

#container-heading {
	font-size: 2.3rem;
	font-weight: 500px;
}

.container-msg {
	height: 60%;
	text-align: start;
	padding: 1rem;
	border: 1px solid grey;
	border-radius: 0.2rem;
	margin:1rem;
}

.container-publish {
	font-size: 1rem;
	color: orange;
}

.container-butttons {
	height: 20%;
	width: 100%;
	display: flex;
	gap: 1rem;
	justify-content: center;
}

.btnD {
	height: 3rem;
	width: 5rem;
	border-radius: 0.5rem;
	color: white;
	border: none;
}
</style>

<%@ include file="combinedLinks/allcssLinks.jsp"%>
<link rel="stylesheet" href="css/navbarStyle.css">
<link rel="stylesheet" href="css/footerStyle.css">
</head>
<body>
	<%
	UserDetails CheckUser=(UserDetails)session.getAttribute("user");
	if(CheckUser!=null){
		%>
		<%@ page import="com.dao.PostsDAO, com.dbconnection.DBConnect, java.util.List, com.user.Posts, com.user.UserDetails" %>
		<%@ include file="allComponents/navbar.jsp" %>

			<div class="container">
			<p id="container-heading">Add Notes</p>
			<%
				PostsDAO obj=new PostsDAO(DBConnect.getConn());
				List<Posts> results =obj.getData(user.getId());
				String delete_note=(String)session.getAttribute("delete_note");
				String error_delete_note=(String)session.getAttribute("error_delete_note");
				if("true".equals(delete_note)){
					session.removeAttribute("delete_note"); %>
					<script type="text/javascript">
					alert("Note Deleted successfully!!!");
					</script>
				 <% }
				if("false".equals(error_delete_note)){
					session.removeAttribute("error_delete_note"); %>
					<script type="text/javascript">
					alert("Note not deleted!!!");
					</script>
				<%}
				for(Posts p:results){ 
				%>
				<div class="container-msg">
			        <p class="container-msg-title"><%=p.getTitle()%></p>
			        <p class="container-msg-notes"><%=p.getContent()%></p>
			        <p class="container-publish">Published by: <%=user.getName()+" "+user.getLname()%></p>
			        <p class="container-publish">Published Date: <%=p.getDate()%></p>
			        <div class="container-butttons">
			            <a href="delete.jsp?note_id=<%= p.getId()%>"><button class="btnD" style="background-color: #e84a6a;" type="submit">Delete</button></a>
			        <a href="edit.jsp?note_id=<%=p.getId()%>&title=<%=URLEncoder.encode(p.getTitle(), "UTF-8")%>&content=<%=URLEncoder.encode(p.getContent(), "UTF-8")%>">
    				<button class="btnD" style="background-color: #78daf5;" type="submit">Edit</button>
</a>
			        
			        </div>
		        </div>
				<% 
			}	
			%>
		</div>
		<footer class="footer">
			<%@ include file="allComponents/footerSection.jsp"%>
		</footer>
		<%}
	else{ %>
		<script type="text/javascript">
			alert("please login first");
			window.location.href="login.jsp";
		</script>
	<%}
	%>
</body>
</html>