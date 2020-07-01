package Util;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionManager {

public static Connection getConnection() {
		
		String url="jdbc:postgresql://localhost:5432/hospital";
		String username="postgres";
		String password = "5418";
		Connection con = null;
	
			try {
				Class.forName("org.postgresql.Driver");
				con = DriverManager.getConnection(url, username, password);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("connection");
			return con;
	}
	
}
