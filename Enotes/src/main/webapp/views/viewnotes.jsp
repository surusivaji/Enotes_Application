<%@page import="java.util.List"%>
<%@page import="java.sql.Date"%>
<%@page import="org.jsp.enotes.models.Notes"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Enotes - display notes</title>
		<link rel="icon" href="<c:url value="/resources/images/notesicon.png"/>">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"/>
		<link rel="stylesheet" href="<c:url value="/resources/css/homenavbar.css"/>">	
		<link rel="stylesheet" href="<c:url value="/resources/css/viewnotes.css"/>">	
	</head>
	<body>
		<jsp:include page="/includes/homenavbar.jsp"></jsp:include>
		<h1 id="displayNotesHeading">Display Notes</h1>
		 <%
			String updationSuccess = (String) session.getAttribute("updateSuccess");
			if (updationSuccess!=null)
			{%>
				<p id="updationSuccess"><%=updationSuccess%>👍👍👍</p>
			<%  session.removeAttribute("updateSuccess");
			}
			String updationFailed = (String) session.getAttribute("updateFailed");
			if (updationFailed!=null) 
			{%>
				<p id="updationFailed"><%=updationFailed%>👎👎👎</p>
			<% session.removeAttribute("updateFailed");
			}
			String deleteSuccess = (String) session.getAttribute("deleteSuccess");
			if (deleteSuccess!=null)
			{%>
				<p id="deleteMessage"><%= deleteSuccess%>☠️☠️☠️</p>
			<% session.removeAttribute("deleteSuccess");
		}%>
		<% List<Notes> notes = (List<Notes>) session.getAttribute("displayAllNotes"); %>
		<div class="main-container">
			<%
				for (Notes note : notes) 
				{%>
					<div class="box-container">
						<div class="notes-logo">
							<img src="<c:url value="/resources/images/notesicon.png"/>" alt="notesicon" height="60px" width="60px">
						</div>
						<p id="title"><span>Title: </span><%=note.getTitle() %></p>
						<p id="description-hceading">Description: </p>
						<p id="description"><%=note.getDescription() %></p> 
						<p id="date-heading">Publish date: 
							<span>
								<% Date date = note.getDate(); %>
								<%= date %>
							</span>
						</p>
						<div class="button-container">
							<a href="editNotes/<%=note.getNotesId()%>"><input type="button" value="Edit" id="edit" class="btn"></a>
							<a href="removeNotes/<%=note.getNotesId()%>"><input type="button" value="Remove" id="remove" class="btn"></a>
						</div>
					</div>	
				<%}
			%>
		</div>
	</body>
</html>