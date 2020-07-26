<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!--css -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="css/mystyle.css" type="text/css">     

<!-- Card for home page -->
<meta name="viewport"  initial-scale=1">
<style>
.card {
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  transition: 0.3s;
  text-align: center;
  font-family: arial;
   padding:16px;
}
.column {
  width: 30%;
  padding: 20 30px;
  margin: auto;
}
.card:hover {
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}

</style>   

</head>
<body>
<%@include file="NormalNavBar.jsp" %>

<div class="row">
    <div class="column">
      <div class="card">
      <img class="container center-image"  src="img/Background.jpg">
      <h4><b>End of Depression</b></h4> 
    <p>Blissful You! aims to reduce the stigma, spread awareness and change the way we look at Mental Health. This is a platform where you can seek help for yourself or a loved one, find comprehensive knowledge, connect with professionals, and find comfort knowing that you are not alone.
    understand mental health</p>
      </div>
    </div>
     
    <div class="column">  
      <div class="card">
      <img class="container center-image"  src="img/write.jpg">
      <h4><b>Try Expressive Writing to Cope</b></h4> 
     <p>Expressive writing is the act of expressing ourselves through writing. 
     This writing is personal, allowing the writer to explore and express personal feelings.
     The piece may attempt to answer a question, state an opinion or recount one's personal experiences.</p> 
     </div>
    </div>
    
    <div class="column">  
      <div class="card">
      <img class="container center-image"  src="img/expert.jpg">
      <h4><b>Ask our Experts</b></h4> 
     <p>
       Talk to our Experts or call Emergency Helpline. 
     </p>
      </div>
    </div>
    
</div>    
</body>

<!-- Card close -->

  <!-- javascript -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    
<!-- To check if all scripts are loaded correctly 
<script>
$(document).ready(function(){alert("document loaded")})
</script>
-->
</body>
</html>