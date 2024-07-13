package com.feedback;

public class Feedback {
	private int id;
	private String msg;
	private int user_id;
	private String created_at;
	
	public Feedback(int id, String msg, int user_id, String created_at) {
		this.id = id;
		this.msg = msg;
		this.user_id = user_id;
		this.created_at = created_at;
	}

	public int getId() {
		return id;
	}

	public String getMsg() {
		return msg;
	}

	public int getUser_id() {
		return user_id;
	}

	public String getCreated_at() {
		return created_at;
	}
	
}
