package packServices;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;


public class ConnectionDB {
	
	static Connection conn = null;
	
	//Create a database connection and return a "Statement"
	public static Statement connectToDataBase(){
		try {
			Class.forName("org.postgresql.Driver");
			
			String url = "jdbc:postgresql://localhost:5433/bankDB";

			conn = DriverManager.getConnection(url, "postgres", "123123" );
			Statement st = conn.createStatement();
			return st;
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return null;
	}
	
	//This function closes the connection
	public static void closeConnection(){
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
