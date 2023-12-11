package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Authentication;
import Model.Dao;
import Model.QuestionPaper;

@WebServlet(urlPatterns = {"/registerationLink","/loginLink","/createTable","/addQuestions","/displayQuestions","/checkAnswer"})
public class Controller extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getServletPath();
		
		switch (url) {
		case "/registerationLink" :
			registeration(req, resp);
			break;
		case "/loginLink" :
			login(req, resp);
			break;
		case "/createTable": 
			createTabel(req, resp);
			break;
		case "/addQuestions":
			addQuestions(req, resp);
			break;
		case "/displayQuestions":
			displayQuestions(req, resp);
			break;
		case "/checkAnswer":
			checkAnswer(req, resp);
			break;
		default:
			throw new IllegalArgumentException("Unexpected value: " + url);
		}
	}
	
	String message = null;
	
	void registeration(HttpServletRequest req, HttpServletResponse resp) {
		String name = req.getParameter("userName");
		String email = req.getParameter("userEmailId");
		String contact = req.getParameter("contactNumber");
		String gender = req.getParameter("gender");
		String pass = req.getParameter("password1");
		
		Authentication auth = new Authentication();
		auth.setUserName(name);
		auth.setUserEmailId(email);
		auth.setContactNumber(contact);
		auth.setGender(gender);
		auth.setPassword(pass);
		
		Dao dao = new Dao();
		int count = dao.registeration(auth);
		
		if(count>0) {
			try {
				message = "Registration Successful";
				req.setAttribute("message", message);
				req.getRequestDispatcher("Login.jsp").forward(req, resp);
			} catch (ServletException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	void login(HttpServletRequest req, HttpServletResponse resp) {
		String userType = req.getParameter("userType");
		String userData = req.getParameter("userData");
		String userPassword = req.getParameter("userPassword");
		
		Authentication auth = new  Authentication();
		
		auth.setUserType(userType);
		auth.setUserData(userData);
		auth.setPassword(userPassword);
		
		Dao dao = new Dao();
		boolean res = dao.login(auth);
		
		if(userType.equals("admins")) {
			if(res && userPassword.equals(auth.getPassword())) {
				try {
					req.getRequestDispatcher("Admin.jsp").forward(req, resp);
				} catch (ServletException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else {
				try {
					message = "Invalid UserId or Password";
					req.setAttribute("message", message);
					req.getRequestDispatcher("Login.jsp").forward(req, resp);
				} catch (ServletException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		} else {
			if(res && userPassword.equals(auth.getPassword())) {
				try {
					Dao d1 = new Dao();
					ArrayList<String> tables = d1.displayAllTables();
				
					req.setAttribute("tables", tables);
					req.getRequestDispatcher("display.jsp").forward(req, resp);
				} catch (ServletException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else {
				try {
					message = "Invalid UserId or Password";
					req.setAttribute("message", message);
					req.getRequestDispatcher("Login.jsp").forward(req, resp);
				} catch (ServletException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}
	
	void createTabel(HttpServletRequest req, HttpServletResponse resp) {
		String tableName = req.getParameter("tableName");
		String operation = req.getParameter("operation");

		QuestionPaper q1 = new QuestionPaper();
		q1.setQuestionPaperTitle(tableName);
		
		if(operation.equals("Add Question Paper")) {		
			Dao d1 = new Dao();
			d1.createTable(q1);
		
			req.setAttribute("tableName", tableName);
			try {
				req.getRequestDispatcher("AddQuestions.jsp").forward(req, resp);
			} catch (ServletException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			Dao d1 = new Dao();
			ArrayList<QuestionPaper> paper = d1.displayQuestions(q1);
			try {
				req.setAttribute("paper", paper);
				req.getRequestDispatcher("displayQuestions.jsp").forward(req, resp);
			} catch (ServletException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	void addQuestions(HttpServletRequest req, HttpServletResponse resp) {
		String tableName = req.getParameter("tableName");
		String question = req.getParameter("question");
		String option1 = req.getParameter("option1");
		String option2 = req.getParameter("option2");
		String option3 = req.getParameter("option3");
		String option4 = req.getParameter("option4");
		String answerKey = req.getParameter("answerKey");
		
		req.setAttribute("tableName", tableName);
		
		QuestionPaper q1 = new QuestionPaper();
		q1.setQuestionPaperTitle(tableName);
		q1.setQuestion(question);
		q1.setOption1(option1);
		q1.setOption2(option2);
		q1.setOption3(option3);
		q1.setOption4(option4);
		q1.setAnswerKey(Integer.parseInt(answerKey));
		
		
		Dao dao = new Dao();
		int result = dao.addQuestion(q1);
		
		req.setAttribute("result", result);
		try {
			req.getRequestDispatcher("Result.jsp").forward(req, resp);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	String selectedTable;
	
	void displayQuestions(HttpServletRequest req, HttpServletResponse resp) {
		String tableName = req.getParameter("paper");
		selectedTable = tableName;
		
		QuestionPaper q1 = new QuestionPaper();
		q1.setQuestionPaperTitle(tableName);
		
		Dao dao = new Dao();
		ArrayList<QuestionPaper> paper = dao.displayQuestions(q1);
		req.setAttribute("paper", paper);
		try {
			req.getRequestDispatcher("displayQuestions.jsp").forward(req, resp);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	void checkAnswer (HttpServletRequest req, HttpServletResponse resp) {
		String tableName= selectedTable;
		int count=0;
		QuestionPaper q1=new QuestionPaper();
		q1.setQuestionPaperTitle(tableName);
		
		ArrayList<QuestionPaper> data=new Dao().displayQuestions(q1);
		ArrayList<String> userAnswerList=new ArrayList<String>();
		
		for(QuestionPaper result:data) {
			String questionId=result.getqId()+"";
			String tempAnswer=result.getAnswerKey()+"";
			
			String userAnswer=req.getParameter(questionId);
			userAnswerList.add(userAnswer);
			
			if(userAnswer.equals(tempAnswer)) {
				count++;
			}
			
		}		
		
		req.setAttribute("USERANSWERLIST", userAnswerList);
		req.setAttribute("CORRECTANSWERLIST", data);
		
		try {
			req.getRequestDispatcher("DisplayAnswer.jsp").forward(req, resp);;
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
