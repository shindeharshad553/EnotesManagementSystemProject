<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add note page</title>
<%@  include file="combinedLinks/allcssLinks.jsp"%>
<link rel="stylesheet" href="css/navbarStyle.css">
<link rel="stylesheet" href="css/footerStyle.css">

<style>
* {
	margin: 0;
	padding: 0;
}

body {
	height: 100vh;
	width: 100vw;
}

.imageContainer {
	flex:1;
    height: 78%;
    width: 100%;
	background-image: url("https://images.unsplash.com/photo-1553729784-e91953dec042?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=1080");
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center;
    background-color: #f5f5f5;
}

.imageContainer_message{
	height:100%;
	width:100%;
	padding:8rem;
}
.start-btn {
	height: 40px;
	width: 116px;
	border-radius: 0.5rem;
	margin-bottom:0.3rem;
	border:none;
	background-color: #65b6f0;
}

.start-btn:hover{
	transform:scale(1.02);
	color:white;
}
</style>
</head>
<body>
	<%@ include file="allComponents/navbar.jsp"%>

<!--  form method="post" action="/addNotes">-->
	<div class="imageContainer text-center">
		<div class="imageContainer_message">
			<h3>Start taking your notes</h3>
			<a href="addNotes.jsp"><button  class="start-btn">Start Here</button></a>
		</div>
	</div>

<footer class="footer">
	<%@ include file="allComponents/footerSection.jsp"%>
</footer>
</body>
</html>