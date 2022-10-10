package com.tech.blog.helper;

import java.sql.*;
public class ConnectionProvider {
	private static Connection con;
	
	public static Connection getConnection() {
		try {
			//load Driver
			Class.forName("org.postgresql.Driver");
			
			//get connection
			String url = "jdbc:postgresql://localhost:5432/techblog";
			String user = "postgres";
			String password = "1213";
			con = DriverManager.getConnection(url,user,password);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("not able to load driver class");
			e.printStackTrace();
		}
		return con;
	}
}
