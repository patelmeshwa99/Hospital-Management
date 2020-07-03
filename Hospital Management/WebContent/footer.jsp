<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
  <style>
  
  @media only screen and (max-width: 480px) {
   	.navbar-brand {
    	font-size: 1rem !important;
    }
}


  @media only screen and (max-width: 375px) {
   	.navbar-brand {
    	font-size: 0.778rem !important;
    }
}

 @media only screen and (max-width: 992px) {
   	.navbar-brand {
    	font-size: 1.18rem !important;
    }
}

  </style>
</head>
<body>
<div class="container rounded bg-dark text-white" style="margin-top:20px;">
	<nav class="navbar navbar-expand-md bg-dark navbar-dark">
   		<div class="navbar-header">
	      <a class="navbar-brand" href="#">
	      	<img src="images/download.png" class="logo" style="width:30px;">
		  </a>
		  <a class="navbar-brand" href="#">ABC Hospital Management System</a>
    	</div>
	
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
	    	<span class="navbar-toggler-icon"></span>
	  	</button>
  
	  	<div class="collapse navbar-collapse" id="collapsibleNavbar">
    		<ul class="navbar-nav">
     		    <li class="nav-item dropdown">
			      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
			        Patient
			      </a>
			      <div class="dropdown-menu">
			        <a class="dropdown-item" href="CreatePatient.jsp">Register Patient</a>
			        <a class="dropdown-item" href="UpdatePatient.jsp">Update Patient</a>
			        <a class="dropdown-item" href="DeletePatient.jsp">Delete Patient</a>
			        <a class="dropdown-item" href="ViewPatients.jsp">View Patient</a>
			      </div>
			    </li>
			    <li class="nav-item dropdown">
			      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
			        Pharmacy
			      </a>
			      <div class="dropdown-menu">
			        <a class="dropdown-item" href="#">Link 1</a>
			        <a class="dropdown-item" href="#">Link 2</a>
			        <a class="dropdown-item" href="#">Link 3</a>
			      </div>
			    </li>  
			    <li class="nav-item dropdown">
			      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
			        Diagnostics
			      </a>
			      <div class="dropdown-menu">
			        <a class="dropdown-item" href="#">Link 1</a>
			        <a class="dropdown-item" href="#">Link 2</a>
			        <a class="dropdown-item" href="#">Link 3</a>
			      </div>
			    </li> 
    		</ul>
  		</div>  
	</nav>
</div>
</body>
</html>
