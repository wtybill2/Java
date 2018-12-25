package com.situ.model;

import st.tool.FormatPager;

public class UserModel extends FormatPager {
	private Integer id;
	private String code;
	private String name;
	private String pass;
	private String role;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public UserModel() {
		super();
	}
	public UserModel(String code, String name, String pass) {
		super();
		this.code = code;
		this.name = name;
		this.pass = pass;
	}
	
	
	public UserModel(String code, String name, String pass, String role) {
		super();
		this.code = code;
		this.name = name;
		this.pass = pass;
		this.role = role;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
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
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}

	

}
