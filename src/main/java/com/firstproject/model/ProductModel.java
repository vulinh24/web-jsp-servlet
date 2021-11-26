package com.firstproject.model;

public class ProductModel {
	
	private Integer prod_id;
	private String prod_name;
	private Float prod_price;
	private String prod_imgurl;
	private String prod_description;
	private Integer cate_id;

	public ProductModel() {
	}

	public ProductModel(Integer prod_id, String prod_name, Float prod_price, String prod_imgurl, String prod_description,
			Integer cate_id) {
		this.prod_id = prod_id;
		this.prod_name = prod_name;
		this.prod_price = prod_price;
		this.prod_imgurl = prod_imgurl;
		this.prod_description = prod_description;
		this.cate_id = cate_id;
	}
	
	public int getProd_id() {
		return prod_id;
	}

	public void setProd_id(Integer prod_id) {
		this.prod_id = prod_id;
	}

	public String getProd_name() {
		return prod_name;
	}

	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}

	public Float getProd_price() {
		return prod_price;
	}

	public void setProd_price(Float prod_price) {
		this.prod_price = prod_price;
	}

	public String getProd_imgurl() {
		return prod_imgurl;
	}

	public void setProd_imgurl(String prod_imgurl) {
		this.prod_imgurl = prod_imgurl;
	}

	public String getProd_description() {
		return prod_description;
	}

	public void setProd_description(String prod_description) {
		this.prod_description = prod_description;
	}

	public Integer getCate_id() {
		return cate_id;
	}

	public void setCate_id(Integer cate_id) {
		this.cate_id = cate_id;
	}

}
