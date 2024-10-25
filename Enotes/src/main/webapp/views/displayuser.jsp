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
		<link rel="stylesheet" href="<c:url value="/resources/css/displayuser.css"/>">
	</head>
	<body>
		<jsp:include page="/includes/homenavbar.jsp"></jsp:include>
		
		<%
			User user = (User) session.getAttribute("user");
		%>
		
		<%
			String updateUserSuccess = (String) session.getAttribute("updateUserSuccess");
			if (updateUserSuccess!=null) 
			{%>
				<p id="updateUserSuccess"><%=updateUserSuccess%>👍👍👍</p>	
			<% session.removeAttribute("updateUserSuccess"); 
			}
			String updateUserFailure = (String) session.getAttribute("updateUserFailure");
			if (updateUserFailure!=null)
			{%>
				<p id="updateUserFail"><%=updateUserFailure%>☠️☠️☠️</p>
			<% session.removeAttribute("updateUserFailure");
			}
			String removeUserFailure = (String) session.getAttribute("removeUserFailure");
			if (removeUserFailure!=null)
			{%>
				<p id="removeUserFailure"><%=removeUserFailure%>☠️☠️☠️</p>
			<% session.removeAttribute("removeUserFailure");
			}
		%>
		
		<div class="user-container">
			<h3>PROFILE</h3>
			<div class="profile-card">
				<img alt="profile" src="<c:url value="/resources/images/profile.png"/>">
			</div>
			
			<div class="user-info">
				<div class="info-container">
					<div class="input-control">
						<label for="fullName">FullName</label>
						<input type="text" id="fullName" name="fullName" value="<%=user.getFullName()%>" disabled="disabled">
					</div>
					<div class="input-control">
						<label for="mobileNumber">MobileNumber</label>
						<input type="text" id="mobileNumber" name="mobileNumber" value="<%=user.getMobile()%>" disabled="disabled">
					</div>
					<div class="input-control">
						<label for="email">Email</label>
						<input type="text" id="email" name="email" value="<%=user.getEmail()%>" disabled="disabled">
					</div>
				</div>
				<div class="info-container">
					<div class="input-control">
						<label for="password">Password</label>
						<input type="text" id="password" name="password" value="<%=user.getPassword()%>" disabled="disabled">
					</div>
					<div class="input-control">
						<label for="about">Education</label>
						<input type="text" id="about" name="about" value="<%=user.getEducation()%>" disabled="disabled">
					</div>
					<div class="button-control">
						<a href="editUser/<%=user.getUserId()%>"><input type="submit" value="Edit Account" id="edit"></a>
						<a href="removeUser/<%=user.getUserId()%>"><input type="submit" value="Delete Account" id="delete"></a>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>