package com.situ.model;

import st.tool.FormatPager;

public class productModel extends FormatPager{
	private Integer id;
	private String code;
	private String name;
	private String cost;

	private Integer sum;
	private String state;
	private String product_type;
	private String product_typeName;
	private String product_type1;
	private String url;
	private String type;
	public String getType() {
		return type;
	}
	
	public void setType(String type) {
		this.type = type;
	}
	public productModel() {
		super();
	}
	
	public productModel(String code, String name, String cost , Integer sum, String state, String product_type) {
		super();
		this.code = code;
		this.name = name;
		this.cost = cost;
		
		this.sum = sum;
		this.state = state;
		this.product_type = product_type;
	}


	public productModel(String code, String saveName,String String) {
		super();
		this.code = code;
		this.url = saveName;
		this.type= String;
	}

	

	

	

	public productModel(String code, String name) {
		super();
		this.code = code;
		this.name = name;
	}

	public String getProduct_typeName() {
		return product_typeName;
	}

	public void setProduct_typeName(String product_typeName) {
		this.product_typeName = product_typeName;
	}

	public String getProduct_type1() {
		return product_type1;
	}

	public void setProduct_type1(String product_type1) {
		this.product_type1 = product_type1;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
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
	
	public Integer getSum() {
		return sum;
	}
	public void setSum(Integer sum) {
		this.sum = sum;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getProduct_type() {
		return product_type;
	}
	public void setProduct_type(String product_type) {
		this.product_type = product_type;
	}
	
}
