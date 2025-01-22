<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.user.UserDetails" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logout</title>
</head>
<body>
	<%
		UserDetails User=(UserDetails)session.getAttribute("user");
		if(User!=null){
			session.removeAttribute("user");
			response.sendRedirect("index.jsp");
		}
	%>
</body>
</html>