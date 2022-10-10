package com.tech.blog.entities;

public class Comments {
	private int c_id;
	private String c_content;
	private int p_id;
	private int user_id;
	public Comments(int c_id, String c_content, int p_id, int user_id) {
		super();
		this.c_id = c_id;
		this.c_content = c_content;
		this.p_id = p_id;
		this.user_id = user_id;
	}
	public Comments(String c_content, int p_id, int user_id) {
		super();
		this.c_content = c_content;
		this.p_id = p_id;
		this.user_id = user_id;
	}
	
	public Comments(String c_content) {
		super();
		this.c_content = c_content;
	}
	public Comments() {
		super();
	}
	public int getC_id() {
		return c_id;
	}
	public void setC_id(int c_id) {
		this.c_id = c_id;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public int getP_id() {
		return p_id;
	}
	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	
}
