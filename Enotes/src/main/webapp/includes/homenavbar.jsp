<%@page import="org.jsp.enotes.models.User"%>
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
		            <a href="home"><i class="fa-solid fa-book"></i><span>Enotes</span></a>
		        </div>
		        <a href="home"><i class="fa-solid fa-house"></i>Home</a>
		        <a href="addnotes"><i class="fa-solid fa-file-circle-plus"></i>Add notes</a>
		        <a href="viewNotes"><i class="fa-solid fa-display"></i>View notes</a>
		    </div>
		    <div class="navbar-left">
		        <a href="showUser"><i class="fa-solid fa-user"></i><%= user.getFullName() %></a>
		        <a href="logout"><i class="fa-solid fa-right-from-bracket"></i>Logout</a>
		    </div>
		</div>

	<%}
%>