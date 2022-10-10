package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.tech.blog.entities.Comments;

public class CommentDao {
	Connection con;

	public CommentDao(Connection con) {
		super();
		this.con = con;
	}
	
	public boolean addComments(String comment,int p_id,int user_id) {
		boolean check = false;
		
		try {
			String query = "INSERT INTO comments(c_content,p_id,user_id) VALUES(?,?,?)";
			
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, comment);
			pstmt.setInt(2, p_id);
			pstmt.setInt(3,p_id);
			
			pstmt.executeUpdate();
			
			check = true;
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("not able to add comment (CommentDao)");
			e.printStackTrace();
		}
		
		return check;
		
	}
	
	
	public boolean addCommentsWithUser(Comments comments) {
		boolean check = false;
		
		try {
			String query = "INSERT INTO comments(c_content,p_id,user_id) VALUES(?,?,?)";
			
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, comments.getC_content());
			pstmt.setInt(2, comments.getP_id());
			pstmt.setInt(3,comments.getUser_id());
			
			pstmt.executeUpdate();
			
			check = true;
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("not able to add comment (CommentDao)");
			e.printStackTrace();
		}
		
		return check;
		
	}
	
	
	public String getComments(int p_id) {
		try {
			String query = "SELECT * FROM comments WHERE p_id=?";
			
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1,p_id);
			
			ResultSet set = pstmt.executeQuery();
			
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("not able to fetch comments");
			e.printStackTrace();
		}
		
		return null;
		
	}
}
