package com.supellex.entity;

public class product {
	private int idproduct;
	private int price;
	private String description;
	private String product_titel;
	private int product_rate;
	private String category;
	private String adding_date;
	private int discount;
	
	
	
	
	public product(int idproduct, int price, String description, String product_titel, int product_rate,
			String category, String adding_date,int discount) {
		super();
		this.idproduct = idproduct;
		this.price = price;
		this.description = description;
		this.product_titel = product_titel;
		this.product_rate = product_rate;
		this.category = category;
		this.adding_date = adding_date;
		this.discount=discount;
	}
	
	
	public int getIdproduct() {
		return idproduct;
	}
	public void setIdproduct(int idproduct) {
		this.idproduct = idproduct;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getProduct_titel() {
		return product_titel;
	}
	public void setProduct_titel(String product_titel) {
		this.product_titel = product_titel;
	}
	public int getProduct_rate() {
		return product_rate;
	}
	
	public void setProduct_rate(int product_rate) {
		this.product_rate = product_rate;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getAdding_date() {
		return adding_date;
	}
	public void setAdding_date(String adding_date) {
		this.adding_date = adding_date;
	}
	public int getdiscount() {
		return discount;
	}
	public void setdiscount(int discount) {
		this.discount = discount;
	}

}
