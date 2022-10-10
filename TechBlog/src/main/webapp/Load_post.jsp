<%@page import="java.util.List"%>
<%@ page import="com.tech.blog.dao.*,com.tech.blog.helper.*,com.tech.blog.entities.*" %>


<div class="row">
<%
	//load posts slowly to show loading... sticker
	Thread.sleep(800);
	
	User user = (User)session.getAttribute("currentUser");

	PostDao dao = new PostDao(ConnectionProvider.getConnection());

	//fetch cat_id from ajax to display posts according to category and if c_id is 0 means load all posts
	int c_id = Integer.parseInt(request.getParameter("c_id"));
	List<Post> list;
	
	if(c_id == 0){
		list = dao.getAllPost();
	}
	else{
		list = dao.getPostByCatId(c_id);
	}
	
	if(list.size()==0){
		out.println("<h3 class='display-3 text-center' style='font-family: sans-serif'>No posts found of this category...</h3>");
	}
	
	for(Post p : list){
%>
	
	<div class="col-md-6 mt-4 ">
		<div class="card offset-md-1" style="border-radius:10px;box-shadow: 5px 5px 7px 4px rgba(0,0,0,0.19), 6px 5px 6px rgba(0,0,0,0.23);">
		  <img class="card-img-top p-2" src="blog_pictures/<%=p.getP_pic() %>" alt="Blog post image">
			<div class="card-body">
				<h5><b><%=p.getP_title() %></b></h5>
				<p style="text-overflow: ellipsis;white-space: nowrap;display: block; overflow: hidden; width: 15em;"><%=p.getP_content() %></p>
			</div>
			<div class="card-footer bg-light">
				<a href="show_blog_page.jsp?p_id=<%= p.getP_id() %>" class="btn btn-outline-primary btn-sm">Read more.</a>
				<%
					LikeDao likedao = new LikeDao(ConnectionProvider.getConnection());
				%>
				
				<a onclick="doLike(<%=p.getP_id() %>,<%=user.getUser_id()%>)" href="#" class="btn btn-outline-primary btn-sm "> <i class="fa fa-thumbs-o-up "></i><span class="like-counter" ><%=likedao.countLikeOnPost(p.getP_id()) %></span> </a>
				<a href="#" class="btn btn-outline-primary btn-sm "><i class="fa fa-commenting-o"></i> <span>20</span> </a>
			</div>
		</div>
	</div>
	
<%	
	}


%>

</div>
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
	