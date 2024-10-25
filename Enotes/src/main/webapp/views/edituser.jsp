<%@page import="org.jsp.enotes.models.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Enotes - Display User</title>
		<link rel="icon" href="<c:url value="/resources/images/notesicon.png"/>">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"/>
		<link rel="stylesheet" href="<c:url value="/resources/css/homenavbar.css"/>">
		<link rel="stylesheet" href="<c:url value="/resources/css/edituser.css"/>">
	</head>
	<body>
		<%
			User user1 = (User) session.getAttribute("user");
			if (user1==null) 
			{
				response.sendRedirect("signin");	
			}
			else 
			{%>
				<div class="home-navbar">
					<div class="navbar-right">
						<div class="logo">
							<a href="home"><i class="fa-solid fa-book"></i><span>Enotes</span></a>
						</div>
						<a href="/Enotes/home"><i class="fa-solid fa-house"></i>Home</a>
						<a href="/Enotes/addnotes"><i class="fa-solid fa-file-circle-plus"></i>Add notes</a>
						<a href="/Enotes/viewNotes"><i class="fa-solid fa-display"></i>View notes</a>
					</div>
					<div class="navbar-left">
						<a href="/Enotes/showUser"><i class="fa-solid fa-user"></i><%=user1.getFullName()%></a>
						<a href="/Enotes/logout"><i class="fa-solid fa-right-from-bracket"></i>Logout</a>
					</div>
				</div>
			<%}
		%>
		
		<%
			User user = (User) session.getAttribute("updateUser");
		%>
		
		<div class="user-container">
			<h3>PROFILE</h3>
			<div class="profile-card">
				<img alt="profile" src="<c:url value="/resources/images/profile.png"/>">
			</div>
			
			<form action="/Enotes/updateUser" method="post" id="myForm">
				<div class="info-container">
					<div class="input-control">
						<input type="text" id="userid" name="userId" value="<%=user.getUserId()%>" hidden="true">
						<label for="fullName">FullName</label>
						<input type="text" id="fullName" name="fullName" value="<%=user.getFullName()%>" required>
					</div>
					<div class="input-control">
						<label for="mobile">MobileNumber</label>
						<input type="text" id="mobile" name="mobile" value="<%=user.getMobile()%>" required>
					</div>
					<div class="input-control">
						<label for="email">Email</label>
						<input type="text" id="email" name="email" value="<%=user.getEmail()%>" required>
					</div>
				</div>
				
				<div class="info-container">
					<div class="input-control">
						<label for="password">Password</label>
						<input type="text" id="password" name="password" value="<%=user.getPassword()%>" required>
					</div>
					<div class="input-control">
						<label for="education">Education</label>
						<input type="text" id="education" name="education" value="<%=user.getEducation()%>" required>
					</div>
					<div class="button-control">
						<input type="submit" value="Update" id="update">
						<a href="/Enotes/cancelUser"><input type="button" value="Cancel" id="cancel"></a>
					</div>
				</div>
			</form>
		</div>
		<script type="text/javascript">
			document.getElementById("myForm").addEventListener('submit', function(event) {
	            event.preventDefault();
	            let name = document.getElementById("fullName").value;
	            let password = document.getElementById("password").value;
	            let email = document.getElementById("email").value;
	            let mobile = document.getElementById("mobile").value;
	            let education = document.getElementById("education").value;
	
	            document.getElementById("fullName").style.border = "2px solid black";
	            document.getElementById("password").style.border = "2px solid black";
	            document.getElementById("email").style.border = "2px solid black";
	            document.getElementById("password").style.border = "2px solid black";
	            document.getElementById("education").style.border = "2px solid black";
	
	            let isValid = true;
	
	            if (name.trim()==="") {
	                document.getElementById("fullName").style.border = "2px solid red";
	                isValid = false;
	            }
	
	            const nameRegex = /^[a-zA-Z\s]+$/;
	            if (!nameRegex.test(name)) {
	                document.getElementById("fullName").style.border = "2px solid red";
	                isValid = false;
	            }
	
	            if (password.trim()==="") {
	                document.getElementById("password").style.border = "2px solid red";
	                isValid = false;
	            }
	            const passwordRegex = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{5,}$/;
	            if (!passwordRegex.test(password)) {
	                document.getElementById("password").style.border = "2px solid red";
	                isValid = false;
	            }
	            if (email.trim()==="") {
	                document.getElementById("email").style.border = "2px solid red";
	                isValid = false;
	            }
	            const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
	            if (!emailRegex.test(email)) {
	                document.getElementById("email").style.border = "2px solid red";
	                isValid = false;
	            }
	            if (mobile.trim()==="") {
	                document.getElementById("mobile").style.border = "2px solid red";
	                isValid = false;
	            }
	            const numberRegex =  /^[0-9]{10}$/;
	            if (!numberRegex.test(mobile)) {
	                document.getElementById("mobile").style.border = "2px solid red";
	                isValid = false;
	            }
	            if (education.trim()==="") {
	                document.getElementById("education").style.border = "2px solid red";
	                isValid = false;
	            }
	            if (isValid) {
	                this.submit();
	            }
	    	});
		</script>
	</body>
</html>