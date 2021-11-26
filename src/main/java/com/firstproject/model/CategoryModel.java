package com.firstproject.model;

public class CategoryModel {
	
	private Integer cate_id;
	private String cate_name;
	
	public CategoryModel() {}
	public CategoryModel(Integer cate_id, String cate_name) {
		this.cate_id = cate_id;
		this.cate_name = cate_name;
	}
	
	public Integer getCate_id() {
		return cate_id;
	}
	public void setCate_id(Integer cate_id) {
		this.cate_id = cate_id;
	}
	public String getCate_name() {
		return cate_name;
	}
	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}
	
}
