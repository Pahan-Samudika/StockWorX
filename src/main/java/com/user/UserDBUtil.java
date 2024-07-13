package com.user;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UserDBUtil {
	public static List<User> validate(String username,String password){
		ArrayList<User> user = new ArrayList<>();
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try { 
			
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			String sql = "SELECT * FROM user WHERE username = '"+username+"'AND password = '"+password+"'";
			
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String role = rs.getString(3);
				String email = rs.getString(4);
				String phone = rs.getString(5);
				String un = rs.getString(6);
				String pw = rs.getString(7);
				
				User u = new User(id,name,role,email,phone,un,pw);
				user.add(u);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return user;
	}

	public static boolean adduser(String username,String password,String name,String email,String phone,String role) {
		boolean isSuccess = false;

		Connection con = null;
		Statement stmt = null;

		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();

			String sql = "INSERT INTO user VALUES (0,'"+name+"','"+role+"','"+email+"','"+phone+"','"+username+"','"+password+"')";

			int rs = stmt.executeUpdate(sql);

			if(rs > 0) {
				isSuccess = true;
			}
			else {
				isSuccess = false;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
	
	public static List<User> viewUser(){
		List<User> user = new ArrayList<>();
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "SELECT * FROM user";

			rs = stmt.executeQuery(sql);

			while(rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String role = rs.getString(3);
				String email = rs.getString(4);
				String phone = rs.getString(5);
				String un = rs.getString(6);
				String pw = rs.getString(7);

				User u = new User(id,name,role,email,phone,un,pw);
				user.add(u);
			}

		}catch(Exception e) {
			e.printStackTrace();
		}

		return user;
	}

	public static boolean deleteUser(String userId) {
		
		boolean isSuccess = false;

		Connection con = null;
		Statement stmt = null;

		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();

			String sql = "DELETE FROM user WHERE id = '"+userId+"'";

			int rs = stmt.executeUpdate(sql);

			if(rs > 0) {
				isSuccess = true;
			}
			else {
				isSuccess = false;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}

	
	public static boolean editUser(String userId, String username, String password, String name, String email, String phone, String role){

		boolean isSuccess = false;

		Connection con = null;
		Statement stmt = null;

		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();

			String sql = "UPDATE user SET username = '" + username + "', password = '" + password + "', name = '" + name + "', email = '" + email + "', phone = '" + phone + "', role = '" + role + "' WHERE id = '" + userId + "'";

			int rs = stmt.executeUpdate(sql);

			if(rs > 0) {
				isSuccess = true;
			}
			else {
				isSuccess = false;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return isSuccess;

	}
	

	public static List<User> viewUser(String uid){
		List<User> user = new ArrayList<>();
		
		int userId = Integer.parseInt(uid);		
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "SELECT * FROM user WHERE id='"+userId+"'";

			rs = stmt.executeQuery(sql);

			while(rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String role = rs.getString(3);
				String email = rs.getString(4);
				String phone = rs.getString(5);
				String un = rs.getString(6);
				String pw = rs.getString(7);

				User u = new User(id,name,role,email,phone,un,pw);
				user.add(u);
			}

		}catch(Exception e) {
			e.printStackTrace();
		}

		return user;
	}
}

