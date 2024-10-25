<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Enotes - Signin</title>
		<link rel="icon" href="<c:url value="/resources/images/notesicon.png"/>">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"/>
		<link rel="stylesheet" href="<c:url value="/resources/css/index.css"/>"/>
		<link rel="stylesheet" href="<c:url value="/resources/css/signin.css"/>"/>
		<style type="text/css">
			.container {
				height: 370px;
				box-shadow: 0 0 3px 3px #9D9D9D;
			}
			.container h1 {
				height: 105px;
			}
			#forgot {
				font-size: 17px;
				text-align: right;
			}
		</style>
	</head>
	<body>
		<jsp:include page="/includes/navbar.jsp"></jsp:include>
			<%
				String accountCreationSuccess = (String) session.getAttribute("accountsuccess");
				if (accountCreationSuccess!=null) 
				{%>
					<p style="font-size:20px; color:green; text-align:center; position: relative; top: 60px;font-weight: bold"><%=accountCreationSuccess%>😎😎😎</p>
				<%  session.removeAttribute("accountsuccess");
				}
				String loginFail = (String) session.getAttribute("loginFailed");
				if (loginFail!=null) 
				{%>
					<p style="font-size:20px; color:red; text-align:center; position: relative; top: 60px;font-weight: bold"><%=loginFail%>😡😡😡</p>
				<%  session.removeAttribute("loginFailed");
				}
				String logoutInfo = (String) session.getAttribute("logoutInfo");
				if (logoutInfo!=null) 
				{%>
					<p style="font-size:20px; color:red; text-align:center; position: relative; top: 60px;font-weight: bold"><%=logoutInfo%>😡😡😡</p>
				<% 	session.removeAttribute("logoutInfo");
				}
				String removeUserSuccess = (String) session.getAttribute("removeUserSuccess");
				if (removeUserSuccess!=null) 
				{%>
					<p style="font-size:20px; color:red; text-align:center; position: relative; top: 60px;font-weight: bold"><%=removeUserSuccess%>☠️☠️☠️</p>
				<% 	session.removeAttribute("removeUserSuccess");
				}
				String changePasswordSuccess = (String) session.getAttribute("changePasswordSuccess");
				if (changePasswordSuccess!=null) 
				{%>
					<p style="font-size:20px; color:green; text-align:center; position: relative; top: 60px;font-weight: bold"><%=changePasswordSuccess%>😎😎😎</p>
				<%  session.removeAttribute("changePasswordSuccess");
				}
				String changePasswordFail = (String) session.getAttribute("changePasswordFail");
				if (changePasswordFail!=null) 
				{%>
					<p style="font-size:20px; color:red; text-align:center; position: relative; top: 60px;font-weight: bold"><%=changePasswordFail%>😡😡😡</p>
				<%  session.removeAttribute("changePasswordFail");
				}
			%>
			<div class="container">
				<h1>Sign in</h1>
				<form action="loginUser" method="post" id="myForm">
					<div class="input-container">
						<label for="email">Enter Email</label>
						<input type="text" name="email" id="email" autocomplete="off">
					</div>
					<div class="input-container">
						<label for="password">Enter Password</label>
						<input type="password" name="password" id="password" autocomplete="off">
						<a href="forgotPassword" id="forgot">Forgot password</a>
					</div>
					<div class="input-container">
						<input type="submit" value="Login" id="btn">
						<p>I don't account?<a href="signup">create account</a></p>
					</div>
				</form>
			</div>
			<script>
                document.getElementById("myForm").addEventListener('submit', function(event){
                event.preventDefault();
                let email = document.getElementById("email").value;
                let password = document.getElementById("password").value;
                let isValid = true;
                document.getElementById("email").style.border = "2px solid black";
                document.getElementById("password").style.border = "2px solid black";
                if (email.trim()==="") {
                    document.getElementById("email").style.border = "2px solid red";
                    isValid = false;
                }
                if (password.trim()==="") {
                    document.getElementById("password").style.border = "2px solid red";
                    isValid = false;
                }
                if (isValid) {
                    this.submit();
                }
            });
          </script>
		</body>
</html>