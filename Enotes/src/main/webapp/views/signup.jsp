<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Enotes - Signup</title>
		<link rel="icon" href="<c:url value="/resources/images/notesicon.png"/>">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"/>
		<link rel="stylesheet" href="<c:url value="/resources/css/indexpage.css"/>"/>
		<link rel="stylesheet" href="<c:url value="/resources/css/signup.css"/>"/>
		<style type="text/css">
			.container {
				box-shadow: 0 0 3px 3px #9D9D9D;
				border: none;
			}
		</style>
	</head>
	<body>
		<jsp:include page="/includes/navbar.jsp"></jsp:include>
			<%
				String accountCreationFailed = (String) session.getAttribute("accountfail");
				if (accountCreationFailed!=null) 
				{%>
					<p style="color:red;text-align:center; font-size:20px; position: relative; top: 10px;font-weight: bold"><%=accountCreationFailed %>😡😡😡</p>
				<%  session.removeAttribute("accountfail");
				}
			%>
			<div class="container">
				<h1>Sign up</h1>
				<form action="register" method="post" id="myForm">
					<div class="input-container">
						<label for="fullName">Enter Full Name</label>
						<input type="text" name="fullName" id="fullName" autocomplete="off">
					</div>
					<div class="input-container">
						<label for="email">Enter email</label>
						<input type="text" name="email" id="email" autocomplete="off">
					</div>
					<div class="input-container">
						<label for="mobile">Enter Mobile Number</label>
						<input type="tel" name="mobile" id="mobile" autocomplete="off">
					</div>
					<div class="input-container">
						<label for="education">Enter Education</label>
						<input type="text" name="education" id="education" autocomplete="off">
					</div>
					<div class="input-container">
						<label for="password">Enter Password</label>
						<input type="password" name="password" id="password" autocomplete="off">
					</div>
					<div class="input-container">
						<input type="submit" value="Register" id="btn">
						<p>Already have an account?<a href="signin">Singin</a></p>
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