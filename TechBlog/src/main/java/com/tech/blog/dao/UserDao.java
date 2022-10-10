package com.tech.blog.dao;

import java.sql.*;

import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

public class UserDao {
	private Connection con;

	public UserDao(Connection con) {
		super();
		this.con = con;
	}
	
	// method to insert details into database
	//storing user registration details
	public boolean saveUser(User user) {
		boolean f = false;
		int rows_updated;
		try {
			
//			con = ConnectionProvider.getConnection();
			
			//query
			String query = "INSERT INTO user_details(user_name,email,password,gender,about) VALUES(?,?,?,?,?)";
			
			PreparedStatement pstmt = this.con.prepareStatement(query);
			//set ? string
			pstmt.setString(1, user.getUser_name());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getGender());
			pstmt.setString(5, user.getAbout());
			
			
			rows_updated = pstmt.executeUpdate();
			f = true;
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("not able to insert");
			e.printStackTrace();
		}
		return f;
	}
	
	
	//fetch user for login
		public User getUserByEmailAndPassword(String email,String password) {
			User user = null;
			
			try {
				String query = "SELECT * FROM user_details WHERE email=? AND password=?";
				
				//prepare statement
				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.setString(1, email);
				pstmt.setString(2, password);
				
				ResultSet set = pstmt.executeQuery();
				
				//set conatins only one user if user has registered so we take if condition to check if set has next value
				//else if there no user then we have User user object set to null so it will return null
				if(set.next()) {
					
					//int user_id = set.getInt("user_id");
					String user_name = set.getString("user_name");
					String user_email = set.getString("email");
					String user_password = set.getString("password");
					String gender = set.getString("gender");
					String about = set.getString("about");
					
					
					user = new User(user_name,user_email,user_password,gender,about);
					
					//user_id
					user.setUser_id(set.getInt("user_id"));
					//profile
					user.setProfile(set.getString("profile"));
				}
				
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("User not found");
				e.printStackTrace();
			}
			
			return user;
			
		}

		
	//update function
		public boolean updateUser(User user) {
			boolean check = false;
			try {
				
				//query
				String query = "UPDATE user_details SET user_name=? , email=? , password=? , about=? , profile=? WHERE user_id=?";
				
				//statement
				PreparedStatement pstmt = con.prepareStatement(query);
				//set ?
				pstmt.setString(1, user.getUser_name());
				pstmt.setString(2, user.getEmail());
				pstmt.setString(3, user.getPassword());
				pstmt.setString(4, user.getAbout());
				pstmt.setString(5, user.getProfile());
				//id
				pstmt.setInt(6, user.getUser_id());
				
				pstmt.executeUpdate();
				check = true;
				
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("user was not updated");
				e.printStackTrace();
			}
			return check;
		}
		
		
		public User getUserByUserId(int user_id) {
			
			User user = null;
			try {
				String query = "SELECT * FROM user_details WHERE user_id = ?";
				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.setInt(1, user_id);
				ResultSet set = pstmt.executeQuery();
				
				if(set.next()){
					String user_name = set.getString("user_name");
					String user_email = set.getString("email");
					String user_password = set.getString("password");
					String gender = set.getString("gender");
					String about = set.getString("about");
					
					
					user = new User(user_name,user_email,user_password,gender,about);
					
					//user_id
					user.setUser_id(set.getInt("user_id"));
					//profile
					user.setProfile(set.getString("profile"));
				}
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("user was not updated");
				e.printStackTrace();
			}
			return user;
			
		}
}
