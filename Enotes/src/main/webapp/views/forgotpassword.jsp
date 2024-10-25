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
			#failInfo {
				font-size: 17px;
				color: red;
				font-weight: bold;
				text-align: center;
				position: relative;
				top: 107px;
			}
		</style>
	</head>
	<body>
		<jsp:include page="/includes/navbar.jsp"></jsp:include>
			<%
				String forgotpasswordfail = (String) session.getAttribute("forgotpasswordfail");
				if (forgotpasswordfail!=null)
				{%>
					<p id="failInfo"><%=forgotpasswordfail%>👎👎👎</p>	
				<%  session.removeAttribute("forgotpasswordfail");
				}
			%>
			<div class="container">
				<h1>Forgot password</h1>
				<form action="findUser" method="post" id="myForm">
					<div class="input-container">
						<label for="mobile">Enter Mobile Number</label>
						<input type="text" name="mobile" id="mobile" autocomplete="off">
					</div>
					<div class="input-container">
						<label for="email">Enter Email</label>
						<input type="text" name="email" id="email" autocomplete="off">
					</div>
					<div class="input-container">
						<input type="submit" value="Continue" id="btn">
					</div>
				</form>
			</div>
			<script>
                document.getElementById("myForm").addEventListener('submit', function(event){
                event.preventDefault();
                let email = document.getElementById("mobile").value;
                let mobile = document.getElementById("email").value;
                let isValid = true;
                document.getElementById("mobile").style.border = "2px solid black";
                document.getElementById("email").style.border = "2px solid black";
                if (mobile.trim()==="") {
                    document.getElementById("email").style.border = "2px solid red";
                    isValid = false;
                }
                if (email.trim()==="") {
                    document.getElementById("mobile").style.border = "2px solid red";
                    isValid = false;
                }
                if (isValid) {
                    this.submit();
                }
            });
          </script>
		</body>
</html>