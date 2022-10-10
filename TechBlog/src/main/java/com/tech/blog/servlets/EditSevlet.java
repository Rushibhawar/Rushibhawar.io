package com.tech.blog.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.helper.*;
import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;

/**
 * Servlet implementation class EditSevlet
 */
//because the input is a multi part data such as image
@MultipartConfig
@WebServlet("/EditSevlet")
public class EditSevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


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
		
		String email = request.getParameter("email");
		String user_name = request.getParameter("user_name");
		String password = request.getParameter("password");
		String about = request.getParameter("about");
		//for profile picture the image will be stored inside the object of Part
		Part part = request.getPart("profile-pic");
		String imageNameWithExtension = part.getSubmittedFileName(); //Part has a method which gives the image name with extension
		
		//get user from session
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("currentUser");
		
		user.setEmail(email);
		user.setUser_name(user_name);
		user.setPassword(password);
		user.setAbout(about);
		user.setProfile(imageNameWithExtension);
		
		//we have to update in database the above details 
		//so create UserDao object which has upadateUser function 
		//first get connection
		UserDao userDao = new UserDao(ConnectionProvider.getConnection());
		//then 
		boolean ans = userDao.updateUser(user);
		
		if(ans == true) {
			out.println("updated");
			Message msg = new Message("Profile details has been updated","success","alert-success");
			session.setAttribute("message", msg);
			//now we have to get the path in order to save or delete profile photo
			String path = request.getRealPath("/")+"pictures"+File.separator+user.getProfile();
			
			HelperFile.deleteFile(path);
			
			if(HelperFile.saveFile(part.getInputStream(), path)) {
				out.println("profile updated");
				msg = new Message("Profile picture has been updated","success","alert-success");
				session.setAttribute("message", msg);
				
			}
			else {
				out.println("profile not  updated");
				msg = new Message("Profile picture was not updated","error","alert-danger");
				session.setAttribute("message", msg);
				
			}
		}
		else {
			out.println("not updated");
			Message msg = new Message("Something went wrong","error","alert-danger");
			session.setAttribute("message", msg);
			
		}
		// then we have to redirect to same page to display error or success msg
		response.sendRedirect("profile_page.jsp");
	}

}
