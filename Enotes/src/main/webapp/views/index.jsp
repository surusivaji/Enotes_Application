<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Enotes</title>
		<link rel="icon" href="<c:url value="/resources/images/notesicon.png"/>">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"/>
		<link rel="stylesheet" href="<c:url value="/resources/css/index.css"/>"/>
		<style type="text/css">
			.logo p {
				position: relative;
				top: 8px;
			}
		</style>
	</head>
	<body>
		<jsp:include page="/includes/navbar.jsp"></jsp:include>
		<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
  			<div class="carousel-indicators">
    			<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    			<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    			<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  			</div>
  			<div class="carousel-inner">
    			<div class="carousel-item active">
      				<img src="<c:url value="/resources/images/enotesbg-3.jpg"/>" class="d-block w-100" alt="image not found" height="625px">
    			</div>
    			<div class="carousel-item">
      				<img src="<c:url value="/resources/images/enotesbg-1.jpg"/>" class="d-block w-100" alt="image not found" height="625px">
    			</div>
    			<div class="carousel-item">
      				<img src="<c:url value="/resources/images/enotesbg-2.jpg"/>" class="d-block w-100" alt="image not found" height="625px">
    			</div>
 		 	</div>
  		 	<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
    			<span class="visually-hidden">Previous</span>
  		 	</button>
  		 	<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    			<span class="carousel-control-next-icon" aria-hidden="true"></span>
   				<span class="visually-hidden">Next</span>
  			</button>
		</div>
		
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
	</body>
</html>
