package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LikeDao {
	Connection con;
	
	public LikeDao(Connection con) {
		super();
		this.con = con;
	}

	public boolean insertLike(int p_id, int user_id) {
		boolean check = false;
		try {
			String query = "INSERT INTO like_table(p_id,user_id) VALUES(?,?)";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1,p_id);
			pstmt.setInt(2, user_id);
			
			pstmt.executeUpdate();
			
			check = true;
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("like was not inserted (LikeDao)");
			e.printStackTrace();
		
		}
		return check;
		
	}
	
	public int countLikeOnPost(int p_id) {
		int count = 0;
		
		try {
			String query = "SELECT COUNT(*) FROM like_table WHERE p_id=?";
			
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1,p_id);
			
			ResultSet set = pstmt.executeQuery();
			
			if(set.next()) {
				count = set.getInt(1);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("cannot count like (LikeDao)");
			e.printStackTrace();
		}
		
		return count;
		
	}
	
	public boolean isLikedByUser(int p_id,int user_id) {
		boolean check = false;
		
		try {
			String query = "SELECT * FROM like_table WHERE p_id=? AND user_id=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			ResultSet set =  pstmt.executeQuery();
			
			if(set.next()) {
				check = true;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("not liked by user LikeDao");
			e.printStackTrace();
		}
		
		return check;
	}
	
	public boolean dislike(int p_id,int user_id) {
		boolean check = false;
		
		try {
			String query = "DELETE FROM like_table WHERE p_id=? AND user_id=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1,p_id);
			pstmt.setInt(2, user_id);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("was not disliked LikeDao");
			e.printStackTrace();
		}
		
		return check;
		
	}
}
