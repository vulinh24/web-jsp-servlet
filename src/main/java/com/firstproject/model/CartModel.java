package com.firstproject.model;

public class CartModel {
	
	private String user_username;
	private Integer prod_id;
	private Integer amount;
	
	public CartModel(String user_username, Integer prod_id, Integer amount) {
		this.user_username = user_username;
		this.prod_id = prod_id;
		this.amount = amount;
	}
	
	public CartModel() {}
	
	public String getUser_username() {
		return user_username;
	}
	public void setUser_username(String user_username) {
		this.user_username = user_username;
	}
	
	public Integer getProd_id() {
		return prod_id;
	}
	public void setProd_id(Integer prod_id) {
		this.prod_id = prod_id;
	}
	public Integer getAmount() {
		return amount;
	}
	public void setAmount(Integer amount) {
		this.amount = amount;
	}
}
