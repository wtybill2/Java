package com.situ.model;

public class cartModel {
	private Integer id;
	private String user_id;
	private String product_id;
	private String amount;
	private String ischecked;
	private String url;
	private String name;
	private String cost;
	
	
	
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCost() {
		return cost;
	}
	public void setCost(String cost) {
		this.cost = cost;
	}
	public String getIschecked() {
		return ischecked;
	}
	public void setIschecked(String ischecked) {
		this.ischecked = ischecked;
	}
	
	
	public cartModel() {
		super();
	}
	public cartModel( String user_id, String product_id, String amount,String ischecked) {
		super();
		
		this.user_id = user_id;
		this.product_id = product_id;
		this.amount = amount;
		this.ischecked = ischecked;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	
}
