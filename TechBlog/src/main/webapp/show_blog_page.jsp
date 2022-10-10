<%@page import="com.tech.blog.entities.*,com.tech.blog.dao.*,com.tech.blog.helper.*,java.util.*" %>
<%@page errorPage="error_page.jsp" %>
<%
	User user = (User)session.getAttribute("currentUser");
	if(user == null){
		response.sendRedirect("login_page.jsp");
	}

%>

<%
	int p_id = Integer.parseInt(request.getParameter("p_id"));
	PostDao dao = new PostDao(ConnectionProvider.getConnection());

	Post post = dao.getPostByPostId(p_id);
	
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><%=post.getP_title() %></title>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="CSS/mystyle.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="CSS/style.css">

<style>
	.banner-background{
	}
	.post-title{
		font-weight:400;
		font-size: 30px;
	}
	.post-content{
		text-indent:20%;
		text-spacing: 1px;
		font-weight:280;
		font-size: 25px;
	}
	.post-date{
		font-style: italic;
		
	}
	.post-user-info{
		font-weight:200;
		font-size: 20px;
		font-style: italic;
	}
	.row-user{
		margin: 5px;
		border-style: solid;
		border-bottom-width: thin;
		border-left-width: 0px;
		border-right-width: 0px;
		border-top-width: 0px;
	}
	body{
		background:url(https://cdn-media-1.freecodecamp.org/imgr/MJAkxbh.png);   ;
		background-size: 150px;
		background-attachment: fixed;
		
	}
</style>

</head>
<body>

	<!-- navbar start -->
	<nav class="navbar navbar-expand-lg  navbar-dark  primary-background">
	  <a class="navbar-brand" href="index.jsp"> <span class="	fa fa-edit"></span> TECH BLOG </a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	
	  <div class="collapse navbar-collapse" id="navbarSupportedContent">
	    <ul class="navbar-nav mr-auto">
	      <li class="nav-item active">
	        <a class="nav-link" href="profile_page.jsp">Home <span class="sr-only">(current)</span></a>
	      </li>
	      <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	         <span class="fa fa-folder-open-o"></span> Categories
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	          <a class="dropdown-item" href="#">Programing Language</a>
	          <a class="dropdown-item" href="#">Project implementation</a>
	          <div class="dropdown-divider"></div>
	          <a class="dropdown-item" href="#">Data Structures</a>
	        </div>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="#"> <span class="	fa fa-phone"></span> Contact</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="login_page.jsp"> <span class="	fa fa-user-circle-o "></span> Login</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"> <span class="		fa fa-book"  ></span> Post</a>
	      </li>
	    </ul>
	    <ul class="navbar-nav mr-right">
	    	<li class="nav-item active">
		        <a class="nav-link" href="#!" data-toggle="modal" data-target="#exampleModal"> <span class="fa fa-user-o "></span>  <%= user.getUser_name() %>  </a>
		    </li>
	    
		    <li class="nav-item">
		        <a class="nav-link" href="LogoutServlet"> <span class="	fa fa-user-times  "></span> Logout </a>
		    </li>
	    </ul>
	  </div>
	</nav>
	<!-- end of navbar -->
	
	
	<!-- start of main content of body-->
	
	<div class="container">
		<div class="row my-5">
			<div class="col-md-15 offset-md-1" style="box-shadow: 5px 10px 7px 4px rgba(0,0,0,0.19), 6px 6px 6px rgba(0,0,0,0.23);">
				<div class="card">
					<div class="card-header " style="background: #e1bee7;">
						<h4 class="post-title"><%= post.getP_title() %></h4>
					</div>
					<!-- body -->
					<div class="card-body">
						<!-- image -->
						<div class="image" style="display: flex;justify-content: center;">
							<img style="width:70%; height:70%;" class="card-img-top my-2" src="blog_pictures/<%=post.getP_pic() %>" alt="Blog post image">
						</div>
						<br><br>
						<!-- user and posted date -->
						<div class="row row-user">
							<div class="col-md-8">
								<% UserDao userdao = new UserDao(ConnectionProvider.getConnection());
								%>
								<p class="post-user-info">Posted by : <a href="#"><%=userdao.getUserByUserId(post.getUser_id()).getUser_name() %></a></p>
							</div>
							<div class="col-md-4">
								<p class="post-date">Posted on: <%=post.getP_date().toLocaleString() %></p>
							</div>
						</div>
						
						<br><br>
						<p style="font-size: 35px;"><%= post.getP_title() %></p>
						<div style="font-size: 20px;" class="card-content">
							<p class="post-content"><%= post.getP_content() %></p>
							<br>
							<br>
							<!-- code... -->
							<p class="post-code" >Code:</p>
							<div>
								<pre><%=post.getP_code() %></pre>
							</div>
						</div>
					</div>
					<!-- footer -->
					
					<div class="card-footer "  style="background:#e1bee7;">
						
						<%
							LikeDao likedao = new LikeDao(ConnectionProvider.getConnection());
						%>
					
						<a onclick="doLike(<%=post.getP_id() %>,<%=user.getUser_id()%>)" href="#" class="btn btn-outline-primary btn-sm "> <i class="fa fa-thumbs-o-up "></i><span class="like-counter" ><%=likedao.countLikeOnPost(post.getP_id()) %></span> </a>
						<a href="#" data-toggle="modal" data-target="#add-comment-modal" class="btn btn-outline-primary btn-sm "> <span class="fa fa-commenting-o  " >20</span> </a>
					</div>
					
				</div>
			</div>
		</div>
	</div>
	
	
	
	<!-- end of main content of body-->
	
	
	<!-- start of profile model -->

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header primary-background text-white text-center">
	        <h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <div class="container text-center">
	        	<img alt="profile img" src="pictures/<%= user.getProfile() %>" class="img-fluid" style="border-radius: 50%; max-width:100px; height:100px">
	        	<h5 class="modal-title" id="exampleModalLabel"><%= user.getUser_name() %></h5>
	        	<br>
	        	<!-- Details -->
	        	<div id="profile-details">
		        	<table class="table">
					  <tbody>
					    <tr>
					      <th scope="row">Id</th>
					      <td><%= user.getUser_id() %></td>
					    </tr>
					    <tr>
					      <th scope="row">Email</th>
					      <td><%= user.getEmail() %></td>
					    </tr>
					    <tr>
					      <th scope="row">Gender</th>
					      <td><%= user.getGender() %></td>
					    </tr>
					    <tr>
					      <th scope="row">Status</th>
					      <td><%= user.getAbout() %></td>
					    </tr>
					  </tbody>
					</table>
				</div>
				
				<!-- profile edit -->
				<div id="profile-edit" style="display:none;">
					<h3 class="mt-2">Please Edit Here</h3>
					<form action="EditSevlet" method="POST" enctype="multipart/form-data">
						<table class="table">
							<tr>
								<td>Id :</td>
								<td><%= user.getUser_id() %></td>
							</tr>
							<tr>
								<td>Email :</td>
								<td> <input type="email" name="email" class="form-control" value="<%= user.getEmail()%>"> </td>
							</tr>
							<tr>
								<td>Name :</td>
								<td> <input type="text" name="user_name" class="form-control" value="<%= user.getUser_name()%>"> </td>
							</tr>
							<tr>
								<td>Password :</td>
								<td> <input type="password" name="password" class="form-control" value="<%= user.getPassword()%>"> </td>
							</tr>
							<tr>
								<td>About :</td>
								<td> 
									<textarea class="form-control" name="about" rows="2" cols="3">
										<%= user.getAbout() %>
									</textarea> 
								</td>
							</tr>
							<tr>
								<td>Edit Profile:</td>
								<td> <input type="file" name="profile-pic" class="form-control" ></td>
							</tr>
						</table>
						<div class="container">
							<button type="submit" class="btn btn-outline-success">Save</button>
						</div>
					</form>
				</div>
	        </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close <span class="  fa fa-close  "> </span> </button>
	        <button id="edit-profile-button" type="button" class="btn btn-primary">Edit <span class="	fa fa-pencil"></span> </button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- end of profile model -->
	
	
	<!-- post modal start -->
	
	<!-- Modal -->
	<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Add post</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      
	      <div class="modal-body">
	        
	        <form id="add-post-form" action="AddPostServlet" method="POST">
	        	<div class="form-group">
	        		<select class="form-cotrol" name="c_id">
	        			<option selected="selected" disabled="disabled">--Select Categories--</option>
	        			
	        			<%
	        			PostDao p = new PostDao(ConnectionProvider.getConnection());
	        			ArrayList<Categories> list = p.getAllCategories();
	        			
	        			for(Categories c : list){
	        			%>
	        			<option value="<%=c.getC_id()%>"><%= c.getC_name() %></option>
	        			<%
	        			}
	        			%>
	        			
	        		</select>
	        	</div>
	        	<div class="form-group">
	        		<input name="p_title" type="text" placeholder="Enter post title" class="form-control">
	        	</div>
	        	<div class="form-group">
	        		<textarea name="p_content" class="form-control" rows="" cols="" placeholder="Enter content here" style="height:200px"></textarea>
	        	</div>
	        	<div class="form-group">
	        		<textarea name="p_code" class="form-control" rows="" cols="" placeholder="Enter code here if any" style="height:150px"></textarea>
	        	</div>
	        	
	        	<div class="form-group">
	        		<label>Select image</label>
	        		<br>
	        		<input type="file" name="p_pic">
	        	</div>
	        	
	        	<div class="container text-center">
	        		<button type="submit" class="btn btn-outline-primary">Post</button>
	        	</div>
	        </form>
	        
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary">Save changes</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- post modal end -->
	
	
	<!-- comment modal start -->
	<div class="modal fade" id="add-comment-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Add Comment</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      
	      <div class="modal-body">
	      	<form action="AddCommentServlet" method="post">
	      		<textarea name="comments" class="form-control"  rows="3" cols="5" placeholder="Add comment here"></textarea><br>
	      		
	      	</form>
	      	<div class="container text-center">
	        		<a><button onclick="doComment(<%=post.getP_id() %>,<%=user.getUser_id()%>)" type="submit" class="btn btn-primary"><span class="fa fa-commenting-o  " >  </span>Comment</button></a>
	        	</div>
	      </div>
	      	
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- comment modal end -->
	
	
	
	
	
	
	
	<!-- JavaScript -->
	<script
  	src="https://code.jquery.com/jquery-3.6.0.min.js"
  	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
 	crossorigin="anonymous"></script></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	
	<!-- profile modal javascript -->
	<script type="text/javascript">
		$(document).ready(function(){
			let editStatus = false;
			
			$('#edit-profile-button').click(function(){				
				if(editStatus == false){
					$("#profile-details").hide()
					
					$("#profile-edit").show();
					editStatus = true;
					$(this).text("Back");
				}
				else{
					$("#profile-details").show()
					
					$("#profile-edit").hide();
					editStatus =false;
					$(this).text(" Edit ");
				}
			});
			
		});
	</script>
	
	<!-- now add post Javascript -->
	<script >
		$(document).ready(function(e){
			$('#add-post-form').on('submit',function(event){
				//this code is called when form is submitted...
				event.preventDefault();
				console.log("you have clicked submit");
				
				let form = new FormData(this);
				
				//now requesting to server
				$.ajax({
					url: "AddPostServlet",
					type: 'POST',
					data: form,
					success: function(data , textStatus, jqXHR){
						//success
						console.log(data);
						if(data.trim() == 'Post added'){
							swal("Good job!", "Post saved successfully", "success");
						}
						else{
							swal("Error!", "Something went wrong", "error");
						}
					},
					error: function(jqXHR, textStatus, errorThrown) {
						//error
						console.log("error.."+errorThrown);
						swal("Error!", "Something went wrong", "error");
					},
					processData: false,
					contentType: false
				})
			})
		})
	</script>
	
	<!-- like -->
	<script>
		function doLike(p_id,user_id){
			console.log(p_id+","+user_id)
			
			const d={
				user_id:user_id,
				p_id:p_id,
				operation: 'like'
			}
			
			$.ajax({
				url:"LikeServlet",
				type: 'POST',
				data: d,
				success:function(data, textStatus, jqXHR){
					console.log(data);
					if(data.trim()=='true'){
						let c=$(".like-counter").html();
						c++;
						$('.like-counter').html(c);
					}
				},
				error:function(jqXHR, textStatus, errorThrown){
					console.log("error.."+errorThrown);
				}
			
			})
		}
	</script>
	
	
	<script>
		function doComment(p_id,user_id){
			console.log(p_id+","+user_id)
			
			const d={
				user_id:user_id,
				p_id:p_id,
				comments:comments,
				operation: 'comment'
			}
			
			$.ajax({
				url:"AddCommentServlet",
				type: 'POST',
				data: d,
				success:function(data, textStatus, jqXHR){
					console.log(data);
					
				},
				error:function(jqXHR, textStatus, errorThrown){
					console.log("error.."+errorThrown);
				}
			
			})
		}
	</script>
	
	
</body>
</html>