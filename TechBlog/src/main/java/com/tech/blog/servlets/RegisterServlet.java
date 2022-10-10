package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class RegisterServlet
 */
@MultipartConfig
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		
		//create session object to diplay is details where successfully saved or not
		HttpSession session = request.getSession();
		
		//fetch form data
		String check = request.getParameter("check");		
		
		if(check == null) {
			//out.println("<p>Please Agree the Terms And Conditions<p>");
			//session.setAttribute("getAlert", "Terms");//Just initialize a random variable.
			//response.sendRedirect("register_page.jsp");
			 
			 //instead using javascript we can do it with jsp just like in login page
			 Message msg = new Message("Please accept the terms and conditions","error","alert-danger");
			 session.setAttribute("message", msg);
			 response.sendRedirect("register_page.jsp");
		}
		else {
			 String user_name = request.getParameter("user_name");
			 String email = request.getParameter("email");
			 String password = request.getParameter("password");
			 String gender = request.getParameter("gender");
			 String about = request.getParameter("about");
			 
			 //create User object and set data
			 User user = new User(user_name,email,password,gender,about);
			 
			 //create UserDao object
			 UserDao dao = new UserDao(ConnectionProvider.getConnection());
			 boolean insert = dao.saveUser(user);
			 
			 if(insert == true) {
				 //out.println("<link rel='stylesheet' href='CSS/style.css'>");
				 //out.println("<style>.register_success{text-align:center;color:white;background: #ba68c8;margin-bottom:0px}</style><h3 class='register_success primary_background'>Registered Successfully</h3>");
				 
				// RequestDispatcher rd = request.getRequestDispatcher("register_page.jsp");
				
//				 out.println("<head><script>"
//				 		+ "function fun(){"
//				 		+ "alert('Registered Successfully')"
//				 		+ "}"
//				 		+ "</script></head>"
//				 		+ "<body onload='fun();'></body>");
				 //rd.include(request, response);
				 
				 //we use session to display if form has been submitted
				 
				 //session.setAttribute("getAlert", "Yes");//Just initialize a random variable.
				 //response.sendRedirect("login_page.jsp");
				 
				 //response.sendRedirect("register_page.jsp");
				 
				 //jsp method
				 Message msg = new Message("Registered Successfully. Please login to continue","success","alert-success");
				 session.setAttribute("message", msg);
				 response.sendRedirect("login_page.jsp");
				 
			 }
			 else {
				// out.println("Something Went Wrong");
				 
				 //Javascript method
				 //session.setAttribute("getAlert", "No");//Just initialize a random variable.
				 //response.sendRedirect("register_page.jsp");
				 
				 //jsp method
				 Message msg = new Message("Something went wrong. Try again","error","alert-danger");
				 session.setAttribute("message", msg);
				 response.sendRedirect("register_page.jsp");
			 }
		}
	}

}
