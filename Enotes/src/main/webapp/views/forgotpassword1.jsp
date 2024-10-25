<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Enotes - Forgot password</title>
		<link rel="icon" href="<c:url value="/resources/images/notesicon.png"/>">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"/>
		<link rel="stylesheet" href="<c:url value="/resources/css/index.css"/>"/>
		<link rel="stylesheet" href="<c:url value="/resources/css/signin.css"/>"/>
		<style type="text/css">
			.container {
				position: relative;
				top: 50px;
				height: 345px;
				box-shadow: 0 0 3px 3px #9D9D9D;
				border: none;
			}
			#forgot {
				font-size: 17px;
				text-align: right;
			}
			.container h1 {
				word-spacing: 3px;
			}
		</style>
	</head>
	<body>
		<jsp:include page="/includes/navbar.jsp"></jsp:include>
			<%
				String email = (String) session.getAttribute("userEmail");
				if (email==null) 
				{
					response.sendRedirect("signin");
				}
			%>
			<div class="container">
				<h1>Forgot password</h1>
				<form action="changePassword" method="post" id="myForm">
					<div class="input-container">
						<input type="text" name="email" id="email" value="<%=email%>" hidden="true"/>
						<label for="password">Enter New Password</label>
						<input type="text" name="password" id="password" autocomplete="off">
					</div>
					<div class="input-container">
						<label for="confirmpassword">Enter Confirm Password</label>
						<input type="text" name="confirmpassword" id="confirmpassword" autocomplete="off">
					</div>
					<div class="input-container">
						<input type="submit" value="Update Password" id="btn">
					</div>
				</form>
			</div>
			<script>
               document.getElementById("myForm").addEventListener('submit', function(event){
                event.preventDefault();
                let password = document.getElementById("password").value;
                let confirmpassword = document.getElementById("confirmpassword").value;
                let isValid = true;
                document.getElementById("password").style.border = "2px solid black";
                document.getElementById("confirmpassword").style.border = "2px solid black";
                if (password.trim()==="") {
                    document.getElementById("password").style.border = "2px solid red";
                    isValid = false;
                }
                if (confirmpassword.trim()==="") {
                    document.getElementById("confirmpassword").style.border = "2px solid red";
                    isValid = false;
                }
                if (isValid) {
                    this.submit();
                }
            });
          </script>
		</body>
</html>