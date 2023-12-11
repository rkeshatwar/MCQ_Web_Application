<%@page import="Model.Dao"%>
<%@page import="Model.QuestionPaper"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Controller.Controller"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MCQ Web Application</title>
<link rel="stylesheet" href="./Navbar.css">
</head>
<body style="height: auto;">
	<% String user = Dao.userType;
	if(user.equals("admins")) {
		request.getRequestDispatcher("Admin_Navbar.jsp").include(request, response);
	}else {
		request.getRequestDispatcher("Student_Navbar.jsp").include(request, response);
	}%>
    
	<div align="center" style="padding-top: 20px">
	<div align="left" style="width: 600px; padding: 2px 30px; box-shadow: 0 0 5px black">
		<%  Object demo=request.getAttribute("USERANSWERLIST");
		ArrayList<String> userAnswer=(ArrayList<String>)demo;
	   
		Object temp=request.getAttribute("CORRECTANSWERLIST");
	   	int correctAns = 0, totalAns = 0;
		%>
		<% if(temp!=null){
			ArrayList<QuestionPaper> result=(ArrayList<QuestionPaper>)temp;
			int i=0;
			for(QuestionPaper q:result){
				int j=1;
			%>
			<% String answer=(q.getAnswerKey()+"");
			if(userAnswer.get(i).equals(answer)){ %>
				<div align="left" style="width: 300px">
					<h4 style="color:green">Q<%= q.getqId() %>. <%=q.getQuestion()%></h4>
					<label><%=j %>. </label><%= q.getOption1() %><% j++; %><br>
					<label><%=j %>. </label><%= q.getOption2() %><% j++; %><br>
					<label><%=j %>. </label><%= q.getOption3() %><% j++; %><br>
					<label><%=j %>. </label><%= q.getOption4() %><% j++; %>
					<h5 >Answer is -> <%= q.getAnswerKey() %></h5>
				</div>
				<hr>
			<% correctAns++;
			}else{ %>
				<div align="left" style="width: 300px">
					<h4 style="color:red">Q<%= q.getqId() %>. <%=q.getQuestion()%></h4>
					<label><%=j %>. </label><%=q.getOption1() %><% j++; %><br>
					<label><%=j %>. </label><%=q.getOption2() %><% j++; %><br>
					<label><%=j %>. </label><%=q.getOption3() %><% j++; %><br>
					<label><%=j %>. </label><%=q.getOption4() %><% j++; %>
					<h5 >Answer is -> <%= q.getAnswerKey() %></h5>
				</div>
				<hr>
			<%}
			 i++; totalAns++;
			}
		}%>
		<% if((correctAns*100/totalAns)>=40) {%>
				<h1 align="center" style="color: green; text-decoration: underline;">Result-><%= correctAns%>/<%= totalAns%></h1>
		<%}else { %>
				<h1 align="center" style="color: red; text-decoration: underline;">Result-><%= correctAns%>/<%= totalAns%></h1>
		<%} %>
	</div>
	</div>
</body>
</html>