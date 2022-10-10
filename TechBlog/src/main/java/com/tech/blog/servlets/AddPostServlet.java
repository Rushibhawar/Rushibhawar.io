package com.tech.blog.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.HelperFile;

/**
 * Servlet implementation class AddPostServlet
 */
@MultipartConfig
@WebServlet("/AddPostServlet")
public class AddPostServlet extends HttpServlet {
	

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		int c_id = Integer.parseInt(request.getParameter("c_id"));
		String p_title = request.getParameter("p_title");
		String p_content = request.getParameter("p_content");
		String p_code = request.getParameter("p_code");
		
		Part part = request.getPart("p_pic");
//		String imageNameWithExtention = part.getSubmittedFileName();
		
		//getting current user_id
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("currentUser");
		int user_id = user.getUser_id();
		
		Post post = new Post(p_title, p_content, p_code, part.getSubmittedFileName(), null, c_id, user_id);
		PostDao dao = new PostDao(ConnectionProvider.getConnection());
		if(dao.savePost(post) == true) {
			
			//adding profile
			String path = request.getRealPath("/")+"blog_pictures"+File.separator+part.getSubmittedFileName();
			HelperFile.saveFile(part.getInputStream(), path); 
			
			//success msg
			out.println("Post added");
//			Message msg = new Message("Blog posted successfully","successs","alert-success");
//			session.setAttribute("message", msg);
//			
		}
		else {
			out.println("Post not added");
//			Message msg = new Message("Something went wrong","error","alert-danger");
//			session.setAttribute("message", msg);
//			
		}

	}

}
