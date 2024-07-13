package com.user;

public class User {
	private int id;
	private String name;
	private String role;
	private String email;
	private String phone;
	private String username;
	private String password;
	
	public User(int id, String name, String role, String email, String phone, String username, String password) {
		this.id = id;
		this.name = name;
		this.role = role;
		this.email = email;
		this.phone = phone;
		this.username = username;
		this.password = password;
	}
	
	public User() {
		
	}

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getRole() {
		return role;
	}

	public String getEmail() {
		return email;
	}

	public String getPhone() {
		return phone;
	}

	public String getUsername() {
		return username;
	}

	public String getPassword() {
		return password;
	}

}
