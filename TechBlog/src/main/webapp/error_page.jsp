<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Sorry something went wrong</title>
		
		
		<!-- Bootstrap -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<link rel="stylesheet" href="CSS/mystyle.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="CSS/style.css">
		
		<style>
			.banner-background{
					clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 100%, 80% 94%, 50% 100%, 21% 93%, 0 100%, 0% 35%, 0 0);
			}
		</style>
		
	</head>
	<body>
		<div class="container text-center">
			<img alt="Error Image" src="Image/computer.png" class="image-fluid">
			<h3 class="display-3">Sorry! Something went wrong</h3>
			<br>
			<h4><%= exception%></h4>
			<br>
			<a href="home.jsp"><button class="btn btn-primary primary-background btn-lg bg-primary text-white mt-3">Home</button></a>
		</div>
	</body>
</html>