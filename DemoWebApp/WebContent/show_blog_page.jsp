 <%@page import="com.tech.blog.entities.*"%> 
 <%@page errorPage="error_page.jsp"%>  
 <%@page import="com.tech.blog.dao.PostDao"%> 
 <%@page import="com.mysql.jdbc.Connection"%>
 <%@page import="com.tech.blog.helper.ConnectionProvider"%>
 <%
 User user=(User)session.getAttribute("currentUser");
 if(user==null)
 {
	 response.sendRedirect("Login.jsp");
 }
 %>
<%
  int postId=Integer.parseInt(request.getParameter("post_id"));
  PostDao postd = new PostDao((Connection)ConnectionProvider.getCon());
  Posts p=postd.getPostByPostId(postId);
%>	

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><%=p.getpTitle()%>Title of Post</title>
<!--css-->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/mystyle.css" type="text/css">
<style>
.post-title{
    font-weight:100;
    font-size:30px;
    }
.post-content{
    font-weight:100;
    font-size:25px;
    }  
.post-date{
  font-style:italic;
  font-weight:bold;
 }
 
 .post-user-info{
  font-size:20px;
  font-weight:300;
 }
 .row-user{
 border:1px solid #e2e2e2;
 padding-top:15px;
 }
</style>   
</head>

<body>

<!-- Start of navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="#">Let's Talk</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#"><span class="fa fa-home"></span> Home <span class="sr-only">(current)</span></a>
     
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Mental Health</a>
          <a class="dropdown-item" href="#">Social Anxiety</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Depression</a>
        </div>
      </li>
       </li>
      <li class="nav-item">
        <a class="nav-link disabled" href="#">More</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#"><span class="fa fa-address-book"></span> Contact Us</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#" data-toggle="modal" data-target="#askexpertmodal"><span class="fa fa-user-md"></span> Ask Expert</a>
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

<!-- Main content of body -->
<div class="container">
<div class="row my-4">
<div class="col-md-6 offset-md-2">
<div class="card">
<div id=23 class="card-header text-dark">
<b class="post-title"><%=p.getpTitle()%></b>
<div class="card-body">
<p class="post-content"><%=p.getpContent()%></p>
</div>
<div class="row my-3 row-user">
  <div class="col-md-8">
  <p class="post-user-info"><a href="#!">Divya Verma</a> has posted:</p>
  </div>
  <div class="col-md-4">
  <p class="post-date"><%=p.getpDate().toLocaleString()%>
  </div>
</div>
 <div class="card-footer primary-background ">
 <a href="#!" data-toggle="modal" data-target="#expertcomment" class="btn btn-outline-dark btn-sm"> <i class="fa fa-commenting-o"></i> <span></span>Comment</a>
 </div>
</div>
</div>
</div>
 <!-- End of Main content of body -->
 
<!-- Modal for Comment -->
<div class="modal fade" id="expertcomment" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Reply to User</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <div class="modal-body">
      <form id="add-comment-form" action="CommentServlet" method="post" name="this">
         <div class="form-group">
         <textarea name="cContent" class="form-control col-xs-12" rows="9" cols="50" placeholder="Enter your comment"></textarea>
         </div>
      </div>
         <div class="container text-center">
         <input type="submit" value="Submit" onClick="sendcomment(<%=postId%>,this.form.cContent.value)" class="btn btn-outline-primary">
         </div>
      </div>
      </div>
      </div>
     </form>
<!-- End Modal for Comment -->

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
        <h5 class="modal-title" id="exampleModalLabel">Share your issue with Expert in detail</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

      <!-- text area under modal -->
      <div class="modal-body">
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
  $("#add-post-modal").on("submit",function  (event){
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

<!-- Tried to send comments through jquery
<script>
$(document).ready(function(e){
  $("#add-comment-form").on("submit",function  (event){
		 //this code is called when form is submitted
			//event.preventDefault();
		    console.log("you have clicked on submit...");
			let form=new FormData(this);
			
			//now requesting to server
			$.ajax({
				url:"CommentServlet",
				type:'POST',
				data:  $('#add-comment-form').serialize() + "&pid" + <%=postId%>
				success:function(data,textStatus,jqXHR){
					//success...
					console.log(data);
					console.log("you have clicked on submit...");
					if(data.trim()=='done')
					{
					   swal("Good job!", "Your comment has been saved successfully", "success");
					}
					else
					{
					   swal("Oops", "Something went wrong", "error");
					}	
				},
				error:function(jqXHR,textStatus,errorThrown){
					//error...
					   swal("Oops", "Something went wrong", "error");
				},
				processData:false,
				contentType:false
			}) 
  })
})

</script> -->

<!-- Tried to send Comment through ajax-->
<script>
  function sendcomment(pid,cContent){
	  //var cContent = $("#cContent").val();
	   $.ajax({
			url: "CommentServlet",
			//data: {pid:pid,cc:cContent},
			//data: {cContent:cContent,pid:pid}
			data: {pid:pid,cContent:cContent},
			type: 'POST',
			success: function(data,textStatus,jqXHR){
				console.log(data);
				$("#loader").hide();
				$("post-container").show();
				$('#post-container').html(data);
			}
		      })
  }
</script> -->

<!--  <script>
function sendcomment()
{
    var vehicleTypes = document.getElementsByName("vehicle");
    var selectedVehicleTypes = [];
    for (var i = 0; i < vehicleTypes.length; i++) {
        if (vehicleTypes[i].checked) {
            selectedVehicleTypes.push(vehicleTypes[i].value);
        }
    }
    
    // Set the value of selectedVehicles to comma separated 
    // String of the selected vehicle types
    
    var hiddenSelectedVehicles = document.getElementById("selectedVehicles");
    hiddenSelectedVehicles.value = selectedVehicleTypes.join(",");
    
    // jQuery
    /* $("#selectedVehicles").value(selectedVehicleTypes.join(",")); */
    
    // Submit the form using javascript
    var form = document.getElementById("vehicles");
    form.submit();
    
    //jQuery
    /* $("#vehicles").submit(); */
}
</script> -->

  <h1>Going to show single blogs</h1>
  <h1>Post id: <%=postId%></h1>
</body>
</html>