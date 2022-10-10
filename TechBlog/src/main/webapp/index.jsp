<%@page import="com.tech.blog.helper.ConnectionProvider,java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page errorPage="error_page.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="CSS/mystyle.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="CSS/style.css">

<style>
	.banner-background{
	}
</style>

</head>
<body>
	<!-- navbar -->
	<%@include file="navbar.jsp" %>
	
	<!-- banner -->
	<div class="container-fluid p-0 m-0  banner-background">
		<div class="jumbotron primary-background text-white">
			<div class="container">
				<h3 class="display-3" style="text-shadow: 3px 3px 5px black;" >Welcome To TECH BLOG</h3>
				<h3>TECH BLOG <span class="	fa fa-edit"></span> </h3>
				<p>World of Tech</p>
				<p>A programming language is a type of written language that tells computers what to do. Examples are: Python, Ruby, Java, JavaScript, C, C++, and C#. Programming languages are used to write all computer programs and computer software. A programming language is like a set of instructions that the computer follows to do something.
				</p>
				
				<a href="register_page.jsp"><button class="btn btn-outline-dark "><span class="	fa fa-user-plus" ></span> Lets Start! Its Free </button></a>
				<a href="login_page.jsp"><button class="btn btn-outline-dark ">Login <span class="fa fa-user-circle-o"></span></button></a>
			</div>
		</div>
	</div>
	
	
   <!-- cards -->
   <div class="container">
   		<!-- row 1 -->
   		<div class="row mb-4">
   			<!-- coloumn 1 -->
   			<div class="col-md-4">
   				<div class="card " >
				  <img class="card-img-top" src="https://favtutor.com/resources/images/uploads/Java_Projects_for_Beginners.jpg" alt="Java image ">
				  	<div class="card-body">
					    <h5 class="card-title">Java Programing</h5>
					    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					    <a href="login_page.jsp" class="btn btn- primary-background bg-primary text-white">Read more</a>
				 	</div>
				</div>
   			</div>
   			
   			<!-- coloumn 2 -->
   			<div class="col-md-4">
   				<div class="card" >
				  <img class="card-img-top" src="https://contentstatic.techgig.com/photo/79386213/5-myths-around-python-programming-language-that-every-programmer-must-know.jpg?88712" alt="Python image ">
				  	<div class="card-body">
					    <h5 class="card-title">Python Programing</h5>
					    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					    <a href="login_page.jsp" class="btn btn-primary primary-background bg-primary text-white">Read more</a>
				 	</div>
				</div>
   			</div>
   			
   			<!-- coloumn 3 -->
   			<div class="col-md-4">
   				<div class="card" >
				  <img class="card-img-top" src="https://miro.medium.com/max/750/1*7iBCNSO8w2BHGUdiW39vjw.jpeg" alt="Javascript image ">
				  	<div class="card-body">
					    <h5 class="card-title">Javascript</h5>
					    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					    <a href="login_page.jsp" class="btn btn-primary primary-background bg-primary text-white">Read more</a>
				 	</div>
				</div>
   			</div>
   			
   		</div>
   		
   		<!-- row 2 -->
   		<div class="row">
   			<!-- coloumn 1 -->
   			<div class="col-md-4">
   				<div class="card" >
				  <img class="card-img-top" src="https://dz2cdn1.dzone.com/storage/temp/12434269-spring-framework-01.jpg" alt="Spring image ">
				  	<div class="card-body">
					    <h5 class="card-title">Spring Framework</h5>
					    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					    <a href="login_page.jsp" class="btn btn-primary primary-background bg-primary text-white">Read more</a>
				 	</div>
				</div>
   			</div>
   			
   			<!-- coloumn 2 -->
   			<div class="col-md-4">
   				<div class="card" >
				  <img class="card-img-top" src="https://bs-uploads.toptal.io/blackfish-uploads/components/blog_post_page/content/cover_image_file/cover_image/907884/retina_1708x683_cover-0816-C__Mistakes-Waldek_Newsletter-8ca5fb6eacb673aaad1fe4bfaf4ce205-2f26062f759e8698edd8c5d77b82b992.png" alt="C++ image ">
				  	<div class="card-body">
					    <h5 class="card-title">C++ </h5>
					    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					    <a href="login_page.jsp" class="btn btn-primary primary-background bg-primary text-white">Read more</a>
				 	</div>
				</div>
   			</div>
   			
   			<!-- coloumn 3 -->
   			<div class="col-md-4">
   				<div class="card" >
				  <img class="card-img-top" src="https://mnlabs.in/wp-content/uploads/2020/06/htmlcss.jpg" alt="HTML&CSS image ">
				  	<div class="card-body">
					    <h5 class="card-title">HTML and CSS</h5>
					    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					    <a href="login_page.jsp" class="btn btn-primary primary-background bg-primary text-white">Read more</a>
				 	</div>
				</div>
   			</div>
   			
   		</div>
   </div>
	
	<!-- JavaScript -->
	<script
  src="https://code.jquery.com/jquery-3.6.0.min.js"
  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
  crossorigin="anonymous"></script></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	

</body>
</html>