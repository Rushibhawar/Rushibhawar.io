package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;


@WebServlet("/LoginPageServlet")
public class LoginPageServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		//out.println("Inside login servlet");
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		UserDao dao = new UserDao(ConnectionProvider.getConnection());
		//now dao has a function getUserByEmailAndPassword which return User type so
		User user = dao.getUserByEmailAndPassword(email, password);
		
		if(user == null) {
			//error
			//out.println("invalid details"); instead of printing error we can display error msg in login page itself =>
			//create Message object
			Message msg = new Message("Invalid Details!  User does not exist","error","alert-danger");
			HttpSession session = request.getSession();
			session.setAttribute("message", msg);
			//now redirect to login_page.jsp
			response.sendRedirect("login_page.jsp");
			
		}
		else {
			//login success
			HttpSession session =request.getSession();
			session.setAttribute("currentUser", user);
			response.sendRedirect("profile_page.jsp");
		}
	}	

}
