<%@page import="Model.Dao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MCQ Web Application</title>
<style type="text/css">
	body a{
		text-decoration: none;
	}
	.heading {
		margin-top: 10px;
		text-decoration: underline;
	}
	
	form{
		height: auto;
		width: 25%;
		padding: 10px 0;
		display: flex;
		flex-wrap: wrap;
		align-items: center;
		justify-content: center;
		border-radius: 10px;
		box-shadow: 0 0 5px black;
	}

	#que {
		text-align: center;
		width: 200px;
	}
	
	#title {
		font-weight: bold;
		text-decoration: underline;
		text-align: center;
		width: 200px;
	}
	
	.opt {
		accent-color: #8df002;
	}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
	<% String user = Dao.userType;
	if(user.equals("admins")) {
		request.getRequestDispatcher("Admin_Navbar.jsp").include(request, response);
	}else {
		request.getRequestDispatcher("Student_Navbar.jsp").include(request, response);
	}%>
	
	<div align="center">
	<h1 class="heading">UPDATE PAPER</h1>
	<form action="addQuestions" method="post">
	<div align="center">
		<label>Enter Question Paper Title :</label><br>
		<input type="text" id="title" name="tableName" 
		<%if(request.getAttribute("tableName")!=null) { %>
		value="<%= request.getAttribute("tableName")%>"
		<%} %>>
		<br>
		<label>Enter Question :</label>
		<br>
		<input type="text" id="que" name="question" required="required">
		<br><br>
		<input type="radio" class="opt" name="answerKey" value="1" required="required"> <input type="text" name="option1" placeholder="option 1" required="required">
		<br><br>
		<input type="radio" class="opt" name="answerKey" value="2"> <input type="text" name="option2" placeholder="option 2" required="required">
		<br><br>
		<input type="radio" class="opt" name="answerKey" value="3"> <input type="text" name="option3" placeholder="option 3" required="required">
		<br><br>
		<input type="radio" class="opt" name="answerKey" value="4"> <input type="text" name="option4" placeholder="option 4" required="required">
		<br><br>
		<input type="submit" class="btn btn-outline-primary" value="Add Questikon">
	</div>
	</form>
	</div>
</body>
</html>