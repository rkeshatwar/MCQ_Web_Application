<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<% Object result = request.getAttribute("result");
		if(result!=null) {
			int res = (Integer) result;
			
			if(res>0) {%> 
				<h1 align="center">Question Added Successfully</h1>
				<% request.getRequestDispatcher("AddQuestions.jsp").include(request, response);
			}else{%> 
			<h1 align="center">Something Went Wrong</h1>
			<% request.getRequestDispatcher("AddQuestions.jsp").include(request, response);
			}
		}%>
</body>
</html>