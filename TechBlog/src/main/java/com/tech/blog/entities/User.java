package com.tech.blog.entities;

import java.sql.*;
import java.security.Timestamp;

public class User {
	private int user_id;
	private String user_name;
	private String email;
	private String password;
	private String gender;
	private String about;
	private String profile;
	private Timestamp rdate;
	
	public User(int user_id, String user_name, String email, String password, String gender, String about,
			Timestamp rdate) {
		super();
		this.user_id = user_id;
		this.user_name = user_name;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.about = about;
		this.rdate = rdate;
	}
	
	public User(String user_name, String email, String password, String gender, String about) {
		super();
		this.user_name = user_name;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.about = about;
	
	}
	
	
	public User(int user_id, String user_name, String email, String password, String gender, String about) {
		super();
		this.user_id = user_id;
		this.user_name = user_name;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.about = about;
	}

	public User() {
		
	}

	//geter setter

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAbout() {
		return about;
	}

	public void setAbout(String about) {
		this.about = about;
	}

	public Timestamp getRdate() {
		return rdate;
	}

	public void setRdate(Timestamp rdate) {
		this.rdate = rdate;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}
	
	
	
}
