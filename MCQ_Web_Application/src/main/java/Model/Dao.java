package Model;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class Dao {
	
	private static Connection con1 = Service2.getConnection();
	private static Connection con = Service.getConnection();
	public static String userType = null;
	
	public int registeration(Authentication a) {
		String addUser = "Insert into student values(?,?,?,?,?,?)";
		int count = 0;
		
		PreparedStatement pstm;
		try {
			pstm = con1.prepareStatement(addUser);
			pstm.setInt(1, 0);
			pstm.setString(2, a.getUserName());
			pstm.setString(3, a.getUserEmailId());
			pstm.setString(4, a.getContactNumber());
			pstm.setString(5, a.getGender());
			pstm.setString(6, a.getPassword());
			
			count = pstm.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	
	
	public boolean login(Authentication a) {
		userType = a.getUserType();
		String userData = a.getUserData();
		String password = a.getPassword();
		
		String checkUser1 = "Select * from "+userType+" where email='"+userData+"' and userpass='"+password+"'";
		String checkUser2 = "Select * from "+userType+" where contact='"+userData+"' and userpass='"+password+"'";
		boolean res = false;
		
		if(userData.contains("@")) {
			try {
				Statement stm = con1.createStatement();
				ResultSet rs = stm.executeQuery(checkUser1);
				if(rs.next()) {
					a.setPassword(rs.getString(6));
					System.out.println(rs.getString(6));
					res = true;
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}			
		} else {
			try {
				Statement stm = con1.createStatement();
				ResultSet rs = stm.executeQuery(checkUser2);
				if(rs.next()) {
					a.setPassword(rs.getString(6));
					res = true;
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}			
		}
		return res;
	}
	
	public void createTable(QuestionPaper q) {
		String createTable = "CREATE TABLE "+q.getQuestionPaperTitle()+" (q_Id INT AUTO_INCREMENT, question VARCHAR(400), option1 VARCHAR(400), option2 VARCHAR(400), option3 VARCHAR(400), option4 VARCHAR(400), answer INT, PRIMARY KEY (q_Id))";
		
		Statement stm;
		try {
			stm = con.createStatement();
			stm.executeUpdate(createTable);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static ArrayList<String> displayAllTables() {
		Connection con = Service.getConnection();
		ArrayList<String> tables = new ArrayList<String>();
		try {
			Statement stm = con.createStatement();
			ResultSet rs = stm.executeQuery("show tables");
			while (rs.next()){
				tables.add(rs.getString(1));				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return tables;
	}
	
	public int addQuestion (QuestionPaper q1) {
		String insertQuery = "insert into "+q1.getQuestionPaperTitle()+" values(?,?,?,?,?,?,?)";
		
		try {
			PreparedStatement pstm = con.prepareStatement(insertQuery);
			pstm.setInt(1, 0);
			pstm.setString(2, q1.getQuestion());
			pstm.setString(3, q1.getOption1());
			pstm.setString(4, q1.getOption2());
			pstm.setString(5, q1.getOption3());
			pstm.setString(6, q1.getOption4());
			pstm.setInt(7, q1.getAnswerKey());
			
			return pstm.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;		
	}
	
	public ArrayList<QuestionPaper> displayQuestions(QuestionPaper q2) {
		String displayQuery = "select * from "+q2.getQuestionPaperTitle();
		System.out.println(displayQuery);
		ArrayList<QuestionPaper> paper = new ArrayList<QuestionPaper>();
		try {
			PreparedStatement pstm = con.prepareStatement(displayQuery);
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				QuestionPaper qp = new QuestionPaper();
				qp.setqId(rs.getInt(1));
				qp.setQuestion(rs.getString(2));
				qp.setOption1(rs.getString(3));
				qp.setOption2(rs.getString(4));
				qp.setOption3(rs.getString(5));
				qp.setOption4(rs.getString(6));
				qp.setAnswerKey(rs.getInt(7));
				paper.add(qp);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return paper;
	}
	
	public void checkAnswer(QuestionPaper q3) {
		String displayQuery = "select * from "+q3.getQuestionPaperTitle();
		
	}
}
