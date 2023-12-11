package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Service {
	
	private static int count;
	static Connection con;
	
	public static Connection getConnection() {
		if(count==0) {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mcq","root","sql123");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		count++;
		return con;
	}
}
