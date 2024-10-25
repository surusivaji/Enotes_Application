<%@page import="org.jsp.enotes.models.User"%>
<%@page import="org.jsp.enotes.models.Notes"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Enotes - editnotes</title>
		<link rel="icon" href="<c:url value="/resources/images/notesicon.png"/>">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"/>
		<link rel="stylesheet" href="<c:url value="/resources/css/addnotes.css"/>">
		<link rel="stylesheet" href="<c:url value="/resources/css/homenavbar.css"/>">
		<style type="text/css">
			 .form-container {
							box-shadow: 0 0 3px 3px #9D9D9D;
							border: none;
			}
		</style>
	</head>
	<body>
		<%
			User user = (User) session.getAttribute("user");
			if (user==null) 
			{
				response.sendRedirect("signin");	
			}
			else 
			{%>
				<div class="home-navbar">
					<div class="navbar-right">
						<div class="logo">
							<a href="/Enotes/home"><i class="fa-solid fa-book"></i><span>Enotes</span></a>
						</div>
						<a href="/Enotes/home"><i class="fa-solid fa-house"></i>Home</a>
						<a href="/Enotes/addnotes"><i class="fa-solid fa-file-circle-plus"></i>Add notes</a>
						<a href="/Enotes/viewNotes"><i class="fa-solid fa-display"></i>View notes</a>
					</div>
					<div class="navbar-left">
						<a href="/Enotes/showUser"><i class="fa-solid fa-user"></i><%=user.getFullName()%></a>
						<a href="/Enotes/logout"><i class="fa-solid fa-right-from-bracket"></i>Logout</a>
					</div>
				</div>
			<%}
			Notes singleNotes = (Notes) session.getAttribute("singleNotes");
		%>
		<div class="form-container">
			<h1>Update Notes</h1>
			<form action="/Enotes/updateNotes" method="post" id="myForm">
				<input type="text" name="notesId" id="notesId" hidden="true" value="<%= singleNotes.getNotesId()%>"/>
				<div class="input-control">
					<label for="title">Title</label>
					<input type="text" name="title" id="title" value="<%= singleNotes.getTitle()%>"/>
				</div>
				<div class="input-control">
					<label for="description">Description</label>
					<textarea rows="10" cols="60" name="description" id="description">
						<%= singleNotes.getDescription()%>
					</textarea>
				</div>
				<div class="input-control">
					<input type="submit" value="edit" id="btn"/>
				</div>
			</form>
		</div>
		<script type="text/javascript">
		let descriptionValue = document.getElementById("description").value;
		document.getElementById("description").innerHTML = descriptionValue.trim();
		document.getElementById("myForm").addEventListener('submit', function(event){
			event.preventDefault();
			let title = document.getElementById("title").value;
			let description = document.getElementById("description").value;
			let isValid = true;
			document.getElementById("description").style.border = "2px solid black";
			document.getElementById("title").style.border = "2px solid black";
			if (title.trim()==="") {
				document.getElementById("title").style.border = "2px solid red";
				isValid = false;
			}
			if (description.trim()==="") {
				document.getElementById("description").style.border = "2px solid red";
				isValid = false;
			}
			if (isValid) {
				this.submit();
			}
		});
		</script>
	</body>
</html>