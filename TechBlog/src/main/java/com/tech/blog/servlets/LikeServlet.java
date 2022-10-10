package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.blog.dao.LikeDao;
import com.tech.blog.helper.*;
/**
 * Servlet implementation class LikeServlet
 */
@WebServlet("/LikeServlet")
public class LikeServlet extends HttpServlet {
	
   
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String operation = request.getParameter("operation");
		int user_id = Integer.parseInt(request.getParameter("user_id"));
		int p_id = Integer.parseInt(request.getParameter("p_id"));
	
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
//		out.println("data from server");
//		out.println(operation);
//		out.println(user_id);
//		out.println(p_id);
		
		LikeDao likedao = new LikeDao(ConnectionProvider.getConnection());
		
		if(operation.equals("like")) {
			boolean check = likedao.insertLike(p_id, user_id);
			out.print(check);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String operation = request.getParameter("operation");
		int user_id = Integer.parseInt(request.getParameter("user_id"));
		int p_id = Integer.parseInt(request.getParameter("p_id"));
	
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		out.println("data from server");
		out.println(operation);
		out.println(user_id);
		out.println(p_id);
		
		LikeDao likedao = new LikeDao(ConnectionProvider.getConnection());
		
		if(operation.equals("like")) {
			boolean check = likedao.insertLike(p_id, user_id);
			out.print(check);
		}
	}

}
