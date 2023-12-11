<%@page import="Model.Dao"%>
<%@page import="Model.QuestionPaper"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MCQ Web Application</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<style type="text/css">
	body{
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
	}
	
	a{
		text-decoration: none;
	}

	.mainBox{
		width: 90%;
		margin: 20px 0;
		box-shadow: 0 0 5px black;
	}
	
	form{
		margin: 30px 0;
		width: 500px; 
		padding: 10px 30px; 
		border-radius: 10px;
		box-shadow: 0 0 5px black;
		display: flex;
		flex-direction: column;
		justify-content: center;
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
	<div align="center" class="mainBox">
		<form action="checkAnswer" method="post">
		<div>
			<% Object questions = request.getAttribute("paper");
			ArrayList<QuestionPaper> qp = (ArrayList<QuestionPaper>) questions;
			for(QuestionPaper data:qp) {%>
				<div align="left" style="width: 300px">
				<label><b>Q. <%= data.getQuestion() %></b></label><br>
				<input type="radio" name="<%= data.getqId()%>" value="1" required="required"> <%= data.getOption1() %><br>
				<input type="radio" name="<%= data.getqId()%>" value="2"> <%= data.getOption2() %><br>
				<input type="radio" name="<%= data.getqId()%>" value="3"> <%= data.getOption3() %><br>
				<input type="radio" name="<%= data.getqId()%>" value="4"> <%= data.getOption4() %><br><br>
				</div>
				<hr>
			<% } %>
			</div>
			<input type="submit" class="btn btn-outline-primary" value="Submit Test">
			<% request.setAttribute("tableName", qp.get(0).getQuestionPaperTitle()); %>
			
		</form>
		
	</div>
</body>
</html>