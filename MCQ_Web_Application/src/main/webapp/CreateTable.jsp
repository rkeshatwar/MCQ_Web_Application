<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MCQ Test Project</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<style type="text/css">	
	.heading{
		margin-top: 20px;
		margin-bottom: 10px;
		text-decoration: underline;
		font-weight: 500;
	}
	
	a {
		text-decoration: none;
	}
	
	Form{
		height: 150px;
		width: 50%;
		padding: 10px 0;
		display: flex;
		flex-wrap: wrap;
		align-items: center;
		justify-content: center;
		border-radius: 10px;
		box-shadow: 0 0 5px black;
	}
	
	#inp {
		text-align: center;
	}
</style>
</head>
<body>
	<% request.getRequestDispatcher("Admin_Navbar.jsp").include(request, response);%>
	<div style="height: 80vh; display: flex; flex-direction: column; align-items: center; justify-content: center;">
	<div align="center" class="createForm">
		<h1 class="heading">CREATE PAPER</h1>
		<form action="createTable" method="post">
			<label>Enter Question Paper Title</label><br>
			<input type="text" id="inp" name="tableName"><br><br>
			<input type="submit" name="operation" class="btn btn-outline-success" value="Add Question Paper">
		</form>
	</div>
	</div>
	
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	
</body>
</html>