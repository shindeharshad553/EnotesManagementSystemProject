<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.container {
	height: 87%;
	background-color: pink;
}

.form-container {
	animation: fadeIn 1s ease-in-out;
}

@keyframes fadeIn {
	from { 
		opacity: 0;
		transform: translateY(-20px);
	}
	
	to {
		opacity: 1;
		transform: translateY(0);
	}
}
#submit-btn:hover {
	background-color: #0056b3;
	transform: scale(1.05);
}
</style>

<meta charset="UTF-8">
<title>Register</title>
<%@ include file="combinedLinks/allcssLinks.jsp"%>
<link rel="stylesheet" href="css/registerFormCss.css">
<link rel="stylesheet" href="css/navbarStyle.css">
</head>
<body>
	<%@ include file="allComponents/navbar.jsp"%>
	<div class="form-container">
		<form action="register" method="post">
			<label>First name</label> <input type="text" name="fname"> <label>Last
				name</label> <input type="text" name="lname"> <label>Email</label> <input
				type="email" name="email"> <label>Password</label> <input
				type="password" name="password">

			<button type="submit" id="submit-btn">Submit</button>
		</form>
	</div>
</body>
</html>