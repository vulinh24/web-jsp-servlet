package com.firstproject.DAO;

import java.util.ArrayList;

import com.firstproject.model.CartProductModel;

public class CartDisplayModel {
	
	private String user_username;
	private ArrayList<CartProductModel> products;
	
	public CartDisplayModel() {}
	
	public CartDisplayModel(String user_username, ArrayList<CartProductModel> products) {
		this.user_username = user_username;
		this.products = products;
	}
	public String getUser_username() {
		return user_username;
	}
	public void setUser_username(String user_username) {
		this.user_username = user_username;
	}
	public ArrayList<CartProductModel> getProducts() {
		return products;
	}
	public void setProducts(ArrayList<CartProductModel> products) {
		this.products = products;
	}
	
}
