package com.situ.model;

import st.tool.FormatPager;

public class CateModel extends FormatPager {
	private Integer id;
	private String code;
	private String name;
	private String parentcode;
	private String note;
	
	
	
	
	public CateModel() {
		super();
	}
	
	public CateModel(String code, String name, String parentcode, String note) {
		super();
		this.code = code;
		this.name = name;
		this.parentcode = parentcode;
		this.note = note;
	}

	public CateModel(String code) {
		this.code = code;
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
	public String getParentcode() {
		return parentcode;
	}
	public void setParentcode(String parentcode) {
		this.parentcode = parentcode;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	
}
