package com.firstproject.model;

public class UserModel {
	
	String user_username;
	String user_password;
	String user_authorization;
	
	public UserModel() {}
	
	public UserModel(String username, String password, String authorization) {
		this.user_username = username;
		this.user_password = password;
		this.user_authorization = authorization;
	}

	public String getUser_username() {
		return user_username;
	}

	public void setUser_username(String user_username) {
		this.user_username = user_username;
	}

	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}

	public String getUser_authorization() {
		return user_authorization;
	}

	public void setUser_authorization(String user_authorization) {
		this.user_authorization = user_authorization;
	}
	
	

}
