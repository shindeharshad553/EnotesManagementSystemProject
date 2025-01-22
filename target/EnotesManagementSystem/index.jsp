<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	 import ="com.user.UserDetails"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">

@keyframes slideInFromRight {
    from {
        background-position: 100% center; /* Start with the background off to the right */
        opacity: 0; /* Start transparent */
    }
    to {
        background-position: center center; /* End with the background centered */
        opacity: 1; /* Fully visible */
    }
}
	.mainSection {
	width:100%;
	height:78%;
	background-image:
		url(https://w0.peakpx.com/wallpaper/345/357/HD-wallpaper-the-book-and-the-notes-notebook-book-pen-reading.jpg);
	background-color:yellow;
	background-repeat: no-repeat;
	background-size: cover;
	background-position: 100% center; /* Start with the background off to the right */
    animation: slideInFromRight 1.5s ease-out; /* Apply the animation */

}


</style>
<title>Home Page</title>
<!-- Link the file that contains the references of all CSS and JS related files/libraries  -->
<%@  include file="combinedLinks/allcssLinks.jsp"%>
<link rel="stylesheet" href="css/navbarStyle.css">
<link rel="stylesheet" href="css/footerStyle.css">
</head>
<body>
	<%@ include file="allComponents/navbar.jsp" %>
	<div class="mainSection"></div>
	<footer class="footer">
		<%@ include file="allComponents/footerSection.jsp"%>
	</footer>
</body>
</html>