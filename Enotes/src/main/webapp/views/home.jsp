<%@page import="org.jsp.enotes.models.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Enotes - Home</title>
	    <link rel="icon" href="<c:url value='/resources/images/notesicon.png'/>">
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	    <link rel="stylesheet" href="<c:url value="/resources/css/homenavbar.css"/>">
	</head>
	<body>

		<jsp:include page="/includes/homenavbar.jsp"></jsp:include>
		
		<%
		    User user = (User) session.getAttribute("user");
		    if (user == null) {
		        response.sendRedirect("signin");
		    }
		%>
		
		<!-- Carousel -->
		<div id="carouselExampleControlsNoTouching" class="carousel slide" data-bs-touch="false" data-bs-interval="false">
		    <div class="carousel-inner">
		        <div class="carousel-item active">
		            <img src="<c:url value='/resources/images/enotesbg-2.jpg'/>" class="d-block w-100" alt="image not found" height="625px">
		        </div>
		        <div class="carousel-item">
		            <img src="<c:url value='/resources/images/enotesbg-1.jpg'/>" class="d-block w-100" alt="image not found" height="625px">
		        </div>
		        <div class="carousel-item">
		            <img src="<c:url value='/resources/images/enotesbg-3.jpg'/>" class="d-block w-100" alt="image not found" height="625px">
		        </div>
		    </div>
		    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControlsNoTouching" data-bs-slide="prev">
		        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		        <span class="visually-hidden">Previous</span>
		    </button>
		    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControlsNoTouching" data-bs-slide="next">
		        <span class="carousel-control-next-icon" aria-hidden="true"></span>
		        <span class="visually-hidden">Next</span>
		    </button>
		</div>
		
		<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>
</html>
