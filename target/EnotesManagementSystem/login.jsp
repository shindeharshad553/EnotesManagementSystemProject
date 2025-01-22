<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>

<style>

	.form-container {
        background-color: white;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        animation: fadeIn 1s ease-in-out;
        width: 300px;
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
	.errorMsgDiv {
        height: 30px;
        width: 100%;
        background-color: pink;
        color: black;
        border-radius: 5px;
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 14px;
        margin-bottom: 10px;
        animation: slideIn 0.5s ease-out;
    }
 @keyframes slideIn {
        from {
            transform: translateX(-100%);
        }
        to {
            transform: translateX(0);
        }
    }

#submit-btn:hover {
        background-color: #0056b3;
        transform: scale(1.05);
    }

</style>
<%@ include file="combinedLinks/allcssLinks.jsp"%>
<link rel="stylesheet" href="css/navbarStyle.css">
<link rel="stylesheet" href="css/registerFormCss.css">
</head>
<body>
	<%@ include file="allComponents/navbar.jsp"%>
	<div class="form-container">
		<form action="loginCheck" method="post">
			<%
				HttpSession sesion = request.getSession();
				String invalidMsg = (String)session.getAttribute("inavlid-credentials");
				if(invalidMsg!=null){ %>
					<div class="errorMsgDiv">
					<p><%= invalidMsg%></p>
					</div>
				<%  session.removeAttribute("inavlid-credentials");
				 }
			%>
			<label>Username</label> 
				<input type="text" name="username"> 
			<label>Password</label>
				<input type="password" name="password">
			<button type="submit" id="submit-btn">Login</button>
		</form>
	</div>

</body>
</html>