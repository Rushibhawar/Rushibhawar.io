/**
 * 
 */
 
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
				},
				error:function(jqXHR, textStatus, errorThrown){
					console.log("error.."+errorThrown);
				}
			
			})
		}