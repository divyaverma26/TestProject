 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="com.tech.blog.entities.User"%>  
 <%@page import="java.util.*"%>  
 <%@page import="com.tech.blog.entities.Posts"%> 
 <%@page import="com.tech.blog.dao.PostDao"%> 
 <%@page import="com.mysql.jdbc.Connection"%>
 <%@page import="com.tech.blog.helper.ConnectionProvider"%>
 <%@page errorPage="error_page.jsp"%>   
 <%
 User user=(User)session.getAttribute("currentUser");
 int i=-1;
 if(user==null)
 {
	 response.sendRedirect("Login.jsp");
 }
 %>

<script>
            function display() {
        	 <%
             PostDao postd = new PostDao((Connection)ConnectionProvider.getCon());
             List<Posts> list = postd.getPostByUid(user.getId());
             for (Posts c : list) {
            	 System.out.println(c.getpContent());}
         %>
        
         }
         
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>JSP Page</title>

<!--css -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/mystyle.css" type="text/css">   

</head>
<body>
<!-- Start of navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="#">Blissful you</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

 <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp"  style="color:#3f51b5"><span class="fa fa-home"></span><b>Home</b><span class="sr-only">(current)</span></a>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" style="color:#3f51b5" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <b>Articles</b>
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="Depression.jsp">Depression</a>
          <a class="dropdown-item" href="SucidalFeelings.jsp">Suicidal Feelings</a>
          <a class="dropdown-item" href="PostTraumatic.jsp">Post Traumatic Stress Disorder (PTSD)</a>
          <a class="dropdown-item" href="OCD.jsp">Obsessive-compulsive disorder</a>
        </div>
       </li>
       </li>
       <li class="nav-item">
        <a class="nav-link" href="Contact.jsp" style="color:#3f51b5"><span class="fa fa-address-book"></span><b>Contact Us</b></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="About.jsp" style="color:#3f51b5"><b>About</b></a>
      </li>
    </ul>
    <!--<form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-primary my-2 my-sm-0 text-dark" type="submit">Search</button><br>
    </form>-->
    <br>
   <div type="button">
 
      <li class="nav-item">
        <a class="nav-link" href="#" data-toggle="modal" data-target="#askexpertmodal">Post</a>
      </li>
    </ul>
    <ul class="navbar-nav mr-right">
        <li class="nav-item">
        <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user-circle"></span> <%=user.getName()%></a>
      </li> 
        <li class="nav-item">
        <a class="nav-link" href="Logout"><span class="fa fa-sign-out" aria-hidden="true"></span> Logout</a>
      </li>
     </ul> 
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0">Search</button>
    </form>
  </div>
</nav>

<!-- End of navbar -->

<!-- Button trigger modal -->
<!--<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
  Launch demo modal
</button> -->

<!-- main body of the page -->
<main>
  <div class="container">
     <div class="row mt-4">
       <!-- first col -->
        <div class="col-md-4">
          <!-- categories -->
          <div class="list-group">
             <a href="#" onclick="getPosts(<%=user.getId()%>,this)" class="c-link list-group-item list-group-item-action">My Posts</a>
             <a href="#" onclick="getPosts(<%=i%>,this)" class="c-link list-group-item list-group-item-action">Show All Posts</a>
             <a href="#" class="c-link list-group-item list-group-item-action">Book an appointment with Expert</a>
             <a href="#" class="c-link list-group-item list-group-item-action">Take Emotional Intelligence Test</a>
             <a href="#" class="c-link list-group-item list-group-item-action">Try stress relieving techniques</a>
          </div>   
          </div>
        <!-- second col 
             <div class="col-md-8" id="post-container" >
                        <!--posts-->
                   <div class="container text-center" id="loader">
                    <i class="fa fa-refresh fa-4x fa-spin"></i>
                    <h3 class="mt-2">Loading...</h3>
                    </div>
                   <div class="container-fluid" id="post-container">
            </div>
      </div>
     </div>
  </div>
</main>
<!--end of main body of the page -->


<!-- Modal -->
<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-white" style="background-color:#26a69a">
        <h5 class="modal-title" id="exampleModalLabel">Profile Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <div class="container text-center">
      <img src="profilepics/<%= user.getProfile()%>" class="img-fluid" style="border-radius:90%;max-width:180px"></img>
        <br>
      <h5 class="modal-title mt-3" id="exampleModalLabel"><%=user.getName()%></h5>
   <div id="profile-details">   
      <table class="table">
  <tbody>
    <tr>
      <th scope="row">ID</th>
      <td><%=user.getId()%></td>
    </tr>
    <tr>
      <th scope="row">Email</th>
      <td><%=user.getEmail()%></td>
    </tr>
     <tr>
      <th scope="row">Registered On</th>
      <td><%=user.getDateTime().toString()%></td>
    </tr>
  </tbody>
</table>
    </div>
    <!-- profile edit -->
    <div id="profile-edit">
    </div>
      </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button id="edit-profile-button" type="button" class="btn btn-primary">EDIT</button>
      </div>
    </div>
  </div>
</div>
<!-- End of Profile Modal -->

<!--Start Ask Expert Modal-->
<div class="modal fade" id="askexpertmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
       <!-- <h5 class="modal-title" id="exampleModalLabel">Share your issue with Expert in detail</h5>-->
       <h5 class="modal-title" id="exampleModalLabel">My Post</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

      <!-- text area under modal -->
      <form id="add-post-form" action="AddPostServlet" method="post">
         <div class="form-group">
         <input name="pTitle" type="text" class="form-control" placeholder="Enter post Title"/>
         </div>
         
         <div class="form-group">
         <textarea name="pContent" class="form-control col-xs-12" rows="9" cols="50" placeholder="Enter your content"></textarea>
         </div>
      <!-- End of text area under modal -->
      </div>
         <div class="container text-center">
         <button type="submit" class="btn btn-outline-primary">Submit Post</button>
         </div>
      </div>
      </div>
      </div>
     </form>     
<!-- End of Ask Expert Modal -->
<!-- javascript --> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="js/myjs.js" type="text/javascript"></script>
<!-- 
<script>
$(document).ready(function(){
	$('#edit-profile-button').click(function()){
		// alert("Button Clicked")
		$("#profile-details".hide();
	    $("#profile-edit").show();		
	})
});
</script>
-->
<script>
$(document).ready(function(e){
  $("#add-post-form").on("submit",function  (event){
		 //this code is called when form is submitted
			//event.preventDefault();
		    console.log("you have clicked on submit...");
			let form=new FormData(this);
			
			//now requesting to server
			$.ajax({
				url:"AddPostServlet",
				type:'POST',
				data: form,
				success:function(data,textStatus,jqXHR){
					//success...
					console.log(data);
					console.log("you have clicked on submit...");
					if(data.trim()=='done')
					{
					   swal("Good job!", "Your post has been saved successfully", "success");
					}
					else
					{
					   swal("Oops", "Something went wrong", "success");
					}	
				},
				error:function(jqXHR,textStatus,errorThrown){
					//error...
					   swal("Oops", "Something went wrong", "success");
				},
				processData:false,
				contentType:false
			}) 
  })
})
</script>

<!--loading post using ajax  -->
<script>
  function getPosts(userId,temp){
	   $.ajax({
			url: "load_posts.jsp",
			data: {uid:userId},
			success: function(data,textStatus,jqXHR){
				console.log(data);
				$("#loader").hide();
				$("post-container").show();
				
				$('#post-container').html(data);
			}
		      })
  }
$(document).ready(function (e){
 	
})
</script>

</body>
</html>