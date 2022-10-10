<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.tech.blog.entities.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Page</title>

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

	
	<!-- successfull registration msg -->
	<%
	session.setMaxInactiveInterval(1);
	%>
	 <!--<script type="text/javascript">
	 function alertName(){
			var Msg ='<%=session.getAttribute("getAlert")%>';
		    if (Msg == "Yes") {
			 	alert("Form has been submitted");
		 	}
		    
		    if (Msg == "No") {
				 	alert("Somthing Went Wrong. User with this email is already registered");
			 }
		    
		    if (Msg == "Terms") {
				 	alert("Please Agree the Terms And Conditions");
			 }
	 }
	 </script>-->
	 
	 
	 
	 <!-- navbar -->
	<%@include file="navbar.jsp" %>
	
	
		
	<!-- register page -->
	
	<main class="primary-background banner-background mb-5" style="padding-bottom: 60px; padding-top: 5px;">
		<div class="container">
			<div class="col-md-8 offset-md-2">
				<div class="card m-5" style="box-shadow: 5px 10px 8px 3px rgba(0,0,0,0.19), 6px 6px 6px rgba(0,0,0,0.23);">
					<div class="card-header text-center primary-background text-white m-1 pt-4">
						<span class="fa fa-user-plus fa-2x"></span>
						<p>Register Here</p>
					</div>
					
					<!-- successful registration msg -->
					<%
					Message msg = (Message)session.getAttribute("message");
					if(msg!=null){
					%>
					
					<div class="alert <%= msg.getCssClass() %>"  role="alert">
						<%= msg.getContent() %>
						<br>
						<a href="login_page.jsp"><u>Login </u></a>if already registered.
					</div>
					
					<%	
					session.removeAttribute("message");
					}
					%>
					
					<div class="card-body">
						<form action="RegisterServlet" method="POST" id="reg-form">
							<div class="form-group">
						    <label for="user_name">Username</label>
						    <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter Username">
						 	</div>
						
						  <div class="form-group">
						    <label for="exampleInputEmail1">Email address</label>
						    <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
						    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
						  </div>
						  
						  <div class="form-group">
						    <label for="exampleInputPassword1">Password</label>
						    <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
						  </div>
						  
						   <div class="form-group">
						    <label for="gender">Select Gender</label>
						    <br>
						    <input type="radio"  id="gender" name="gender" value="male">Male
						   	<input type="radio"  id="gender" name="gender" value="female">Female
						  </div>
						  
						  <div class="form-group">
						  	<textarea class="form-control" rows="2" cols="30" name="about" placeholder="Enter Something About Yourself"></textarea>
						  </div>
						  
						  <div class="form-check">
						    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
						    <label class="form-check-label" for="exampleCheck1">Agree Terms & Conditions</label>
						  </div>
						  <br>
						  
						  <div class="container text-center" id="loader" style="display: none;">
						  	<span class="fa fa-spinner fa-pulse fa-2x"></span>
						  	<h3>Please Wait</h3>
						  </div>
						  <button id="submit-btn" name="submit" type="submit" class="btn btn-primary">Submit</button>
						</form>
					</div>
					
				</div>
			</div>
		</div>
	</main>
	
	
	<!-- JavaScript -->
		<script
	  	src="https://code.jquery.com/jquery-3.6.0.min.js"
	  	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	  	crossorigin="anonymous"></script></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
		<script>
			$(document).ready(function(){
				console.log("loaded.......")
				
				$('reg-form').on('submit',function(event){
					event.preventDefault();
					
					let form = new FormData(this);
					
					$("#submit-btn").hide();
					$("#loader").show();
					// send to regiterservlet
					
					$.ajax({
						url: "RegisterServlet",
						type: 'POST',
						data: form,
						success: function(data, textStatus, jqXHR){
							console.log(data)
							
							$("#submit-btn").show();
							$("#loader").hide();
						},
						error: function(jqXHR, textStatus, errorThrown){
							console.log(jqXHR)
							$("#submit-btn").show();
							$("#loader").hide();
						},
						processData: false,
						contentType: false
						
					});
				});
			});
		</script>
		<script type="text/javascript"> window.onload = alertName; </script>

</body>
</html>