<%@ page import="com.user.UserDetails"%>
<nav class="navbar">
	<div class="navbar-container">
		<div class="firstPart">
			<a href="#" class="navbar-logo"><i class="bi bi-mortarboard"></i>&nbsp
				E Notes</a>
			<ul class="navbar-menu">
				<li><a href="home.jsp"
					class="navbar-link"><i class="bi bi-house"></i>&nbsp Home</a></li>
				<li><a href="addNotes.jsp" class="navbar-link"><i class="bi bi-plus"></i>&nbsp Add
						Note</a></li>
				<li><a href="showNotes.jsp"
					class="navbar-link"><i class="bi bi-journal"></i>&nbsp Show Note</a></li>
			</ul>
		</div>
	</div>
		<div class="navbar-buttons">

			<!-- If user is already loged in then we can show the Welcome msg  -->
			<%
			session = request.getSession();
			UserDetails user = (UserDetails) session.getAttribute("user");
			if (user != null) {
			%>
			<a href="" data-toggle="modal" data-target="#exampleModal"><button
					type="button" class="btn">
					<i class="bi bi-person-circle"></i>&nbsp
					<%=user.getName()%></button></a> 
					<a href="logout.jsp"><button type="submit" class="btn">
						<i class="bi bi-pencil-square"></i>&nbsp Logout
				</button></a>
				
				<!-- Modal -->
		<div class="modal" id="exampleModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">User Details</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="container text-center">
							<i class="bi bi-people-fill"></i>
							<table>
								<tr>
									<th>User Id :</th>
									<td><%=user.getId()%></td>
								<tr>
								<tr>
									<th>Full Name :</th>
									<td><%=user.getName() + " " + user.getLname()%></td>
								<tr>
								<tr>
									<th>Mail Id :</th>
									<td><%=user.getEmail() %></td>
								<tr>
							</table>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btnc btn-secondary"
							data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
				
			<%
			} else {
			%>
			<a href="login.jsp"><button type="submit" class="btn">
					<i class="bi bi-person-circle"></i>&nbsp Login
				</button></a> <a href="register.jsp"><button type="submit" class="btn">
					<i class="bi bi-person-plus-fill"></i>&nbsp Register
				</button></a>
			<%
			}
			%>
		</div>
	</div>
</nav>
