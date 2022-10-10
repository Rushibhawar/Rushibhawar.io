package com.tech.blog.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.tech.blog.entities.Categories;
import com.tech.blog.entities.Post;

public class PostDao {
	Connection con;

	public PostDao(Connection con) {
		super();
		this.con = con;
	}
	
	public ArrayList<Categories> getAllCategories(){
		ArrayList<Categories> list = new ArrayList<>();
		
		try {
			String query = "SELECT * FROM categories";
			Statement stmt = con.createStatement();
			
			ResultSet set = stmt.executeQuery(query);
			
			while(set.next()) {
				int c_id = set.getInt("c_id");
				String c_name = set.getString("c_name");
				String c_description = set.getString("c_description");
				
				Categories category = new Categories(c_id,c_name,c_description);
				list.add(category);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("not able to get Categories(PostDao)");
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	
	public boolean savePost(Post post) {
		boolean check = false;
		try {
			String query = "INSERT INTO post(p_title,p_content,p_code,p_pic,c_id,user_id) VALUES(?,?,?,?,?,?)";
			
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, post.getP_title());
			pstmt.setString(2, post.getP_content());
			pstmt.setString(3, post.getP_code());
			pstmt.setString(4, post.getP_pic());
			pstmt.setInt(5, post.getC_id());
			pstmt.setInt(6, post.getUser_id());
			
			//execute
			pstmt.executeUpdate();
			
			check = true;
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Post was not saved(PostDao)");
			e.printStackTrace();
		}
		
		return check;
		
	}
	
	
	//Get All posts
	public List<Post> getAllPost(){
		
		List<Post> list = new ArrayList<>();
				
		try {
			String query = "SELECT * FROM post ORDER BY p_id DESC";
			
			PreparedStatement pstmt = con.prepareStatement(query);
			ResultSet set = pstmt.executeQuery();
			
			while(set.next()) {
				int p_id = set.getInt("p_id");
				String p_title = set.getString("p_title");
				String p_content = set.getString("p_content");
				String p_code = set.getString("p_code");
				String p_pic = set.getString("p_pic");
				Timestamp p_date = set.getTimestamp("p_date");
				int c_id = set.getInt("c_id");
				int user_id = set.getInt("user_id");
				Post post = new Post(p_id, p_title, p_content, p_code, p_pic, null, c_id, user_id);
				
				list.add(post);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Post not able to get(PoatDao)");
			e.printStackTrace();
		}
		
		return list;
		
		
	}
	
	public List<Post> getPostByCatId(int cat_id){
		List<Post> list = new ArrayList<>();
		
		try {
			String query = "SELECT * FROM post WHERE c_id = ?";
			
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, cat_id);
			ResultSet set = pstmt.executeQuery();
			
			while(set.next()) {
				int p_id = set.getInt("p_id");
				String p_title = set.getString("p_title");
				String p_content = set.getString("p_content");
				String p_code = set.getString("p_code");
				String p_pic = set.getString("p_pic");
				Timestamp p_date = set.getTimestamp("p_date");
				int user_id = set.getInt("user_id");
				Post post = new Post(p_id, p_title, p_content, p_code, p_pic, p_date, cat_id, user_id);
				
				list.add(post);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Post not able to get(PoatDao)");
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	public Post getPostByPostId(int p_id) {
		Post post = null;
		try {
			String query = "SELECT * FROM post WHERE p_id=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, p_id);
			
			ResultSet set = pstmt.executeQuery();
			
			if(set.next()) {
				int post_id = set.getInt("p_id");
				String p_title = set.getString("p_title");
				String p_content = set.getString("p_content");
				String p_code = set.getString("p_code");
				String p_pic = set.getString("p_pic");
				Timestamp p_date = set.getTimestamp("p_date");
				int c_id = set.getInt("c_id");
				int user_id = set.getInt("user_id");
				post = new Post(post_id, p_title, p_content, p_code, p_pic, p_date, c_id, user_id);
				
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Not able to get Post info using id(PostDao)");
			e.printStackTrace();
		}
		return post;
		
	}
	
}
