<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.tech.blog.entities.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<!--css -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/mystyle.css" type="text/css"> 
<title>Login</title>
</head>
<body>
 <%@include file="NormalNavBar.jsp" %>
 <main class="align-items-center" style="height: 60vh">
 <div class="container">
  <div class="row">
   <div class="col-md-4 offset-md-4">
    <div class="card">
     <div class="card-header">
     <p>Login Here</p>
     </div>
     <%
       Message m=(Message)session.getAttribute("msg");
       if(m!=null){
      %>
    <div class="alert <%=m.getCssClass()%>" role="alert">
    <%=m.getContent()%>
    </div> 
    <%
     session.removeAttribute("msg");
       }
    %> 
    </div>
  <div class="card-body">
  <form action="Login" method="post">
  <div class="form-group">
    <label for="exampleInputEmail1">Email id</label>
    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="uname">
   <!--  <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--> 
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" name="pass">
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
</div>
</main>
 
  <!-- javascript -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

 <!--<form action="Login" method="post">
    Enter Username: <input type="text" name="uname"><br>
    Enter Password: <input type="password" name="pass"><br>
    <input type="submit" value="Login"> -->
</body>
</html>