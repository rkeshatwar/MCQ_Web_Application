<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MCQ Web Application</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<style type="text/css">
	a {
		text-decoration: none;
	}
	
	.container{
		margin-top: 50px;
		height: 75vh;
		width: 90%;
		display: flex;
		flex-wrap: wrap;
		align-items: center;
		justify-content: space-around;
	}
	
	.card{
		padding: 10px;
		box-shadow: 0 0 5px black;
	}
</style>
</head>
<body>
	<% request.getRequestDispatcher("Admin_Navbar.jsp").include(request, response); %>
    
    <div class="container">
    	<div align="center" class="card" style="width: 15rem;">
    		<div>
  				<img src="https://cdn-icons-png.flaticon.com/128/4806/4806846.png" height="150px" width="150px">
  			</div>
  			<div class="card-body">
    			<a href="CreateTable.jsp"><button class="btn btn-outline-primary">Create Paper</button></a>
  			</div>
		</div>
		
		
		<div align="center" class="card" style="width: 15rem;">
			<div>
  				<img src="https://cdn-icons-png.flaticon.com/128/10789/10789764.png" height="150px" width="150px">
  			</div>
  			<div class="card-body">
    			<a href="display.jsp"><button class="btn btn-outline-primary">View Paper</button></a>
  			</div>
		</div>		
		
		
    	<div align="center" class="card" style="width: 15rem;">
    		<div>
  				<img src="https://cdn-icons-png.flaticon.com/128/4067/4067765.png" height="150px" width="150px">
  			</div>
  			<div class="card-body">
    			<a href="AddQuestions.jsp"><button class="btn btn-outline-primary">Update Paper</button></a>
  			</div>
		</div>
    </div>

</body>
</html>