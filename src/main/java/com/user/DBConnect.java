package com.user;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	private static String url = "jdbc:mysql://localhost:3306/stockworx";
	private static String dbusername = "root";
	private static String dbpassword = "Keizer@2002";
	private static Connection con;
	
	public static Connection getConnection() {
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			
			con = DriverManager.getConnection(url, dbusername, dbpassword);
			
		}catch(Exception e) {
			System.out.println("Database connection is not success");
		}
		
		return con;
	}
	
}
