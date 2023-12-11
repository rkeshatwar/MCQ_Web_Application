<%@page import="Model.Authentication"%>
<%@page import="Model.Dao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MCQ Test Project</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<style type="text/css">
	*{
		margin: 0;
		padding: 0;
		box-sizing: border-box;
	}
	
	.container{
		margin-top: 50px;
		margin-bottom: 50px;
		height: 75vh;
		width: 90%;
		display: flex;
		flex-wrap: wrap;
		align-items: center;
		justify-content: space-around;
	}
	
	.card{
		padding: 10px;
		margin-top: 10px;
		box-shadow: 0 0 5px black;
	}
	
	a{
		text-decoration: none;
	}
</style>
</head>
<body>
	<% String user = Dao.userType;
	if(user.equals("admins")) {
		request.getRequestDispatcher("Admin_Navbar.jsp").include(request, response);
	}else {
		request.getRequestDispatcher("Student_Navbar.jsp").include(request, response);
	}%>
	<% ArrayList<String> tables = Dao.displayAllTables();%>
	
	<form action="displayQuestions" method="post">
		<div class="container">
			<% for(String data:tables) { %>		
			<div align="center" class="card" style="width: 12rem;">
    			<div>
  					<h3><%= data %></h3>
  				</div>
  				<div class="card-body">
  					<img src="https://cdn-icons-png.flaticon.com/128/12942/12942847.png" height="100px" width="100px"><br><br>
    				<a href="CreateTable.jsp"><button type="submit" name="paper" class="btn btn-outline-primary" value="<%= data%>">Start Test</button></a>
  				</div>
			</div>
			<% } %>
		</div>
	</form>
</body>
</html>