package com.tech.blog.entities;

public class Categories {
	private int c_id;
	private String c_name;
	private String c_description;
	
	
	
	public Categories() {
		super();
	}
	public Categories(int c_id, String c_name, String c_description) {
		super();
		this.c_id = c_id;
		this.c_name = c_name;
		this.c_description = c_description;
	}
	public Categories(String c_name, String c_description) {
		super();
		this.c_name = c_name;
		this.c_description = c_description;
	}
	public int getC_id() {
		return c_id;
	}
	public void setC_id(int c_id) {
		this.c_id = c_id;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getC_description() {
		return c_description;
	}
	public void setC_description(String c_description) {
		this.c_description = c_description;
	}
	
	
	
}
