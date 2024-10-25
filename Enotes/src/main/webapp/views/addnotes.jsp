<%@page import="org.jsp.enotes.models.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Enotes - add notes</title>
		<link rel="icon" href="<c:url value="/resources/images/notesicon.png"/>">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"/>
		<link rel="stylesheet" href="<c:url value="/resources/css/homenavbar.css"/>">
		<link rel="stylesheet" href="<c:url value="/resources/css/addnotes.css"/>">
		<style type="text/css">
			.form-container {
				box-shadow: 0 0 3px 3px #9D9D9D;
				border: none;
			}
		</style>
	</head>
	<body>
		<jsp:include page="/includes/homenavbar.jsp"></jsp:include>
		<% 
			User user = (User) session.getAttribute("user");
			if (user==null)
			{
				response.sendRedirect("signin");
			}
			String noteSuccess = (String) session.getAttribute("addNotes");
			if (noteSuccess!=null)
			{%>
				<p style="color:green;text-align:center; font-size:20px; position: relative; top: 20px;font-weight: 600"><%=noteSuccess%><i class="fa-solid fa-thumbs-up" style="margin-left:5px;font-size: 20px;"></i><i class="fa-solid fa-thumbs-up" style="margin-left: 3px;font-size:20px;"></i></p>
			<%  session.removeAttribute("addNotes");
			}
			String addNotesFail = (String) session.getAttribute("addNotesFail");
			if (addNotesFail!=null)
			{%>
				<p style="color:red;text-align:center; font-size:20px; position: relative; top: 10px;font-weight: bold"><%=addNotesFail %><i class="fa-solid fa-circle-exclamation"></i></p>
			<%  session.removeAttribute("addNotesFail");
			}
		%>
		
		<div class="form-container">
			<h1>Add Notes</h1>
			<form action="saveNotes" method="post" id="myForm">
				<div class="input-control">
					<label for="title">Title</label>
					<input type="text" name="title" id="title"/>
				</div>
				<div class="input-control">
					<label for="description">Description</label>
					<textarea rows="10" cols="60" name="description" id="description">
					</textarea>
				</div>
				<div class="input-control">
					<input type="submit" value="save" id="btn"/>
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