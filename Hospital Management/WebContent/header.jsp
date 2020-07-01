<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style>

.container {
	height: 100px;
}

nav{
	height: 42px;
}

.logo {
	float: left;
    max-width: 120%;
    max-height: 120%;
    margin: 0;
  	position: relative;
  	margin-right: 5%;
  	margin-left: -0.6%;
  	top: 50%;
  	-ms-transform: translateY(-50%);
  	transform: translateY(-50%);
}

.navbar-dark .navbar-nav .nav-item .nav-link {
    color: white;
    margin-right: 15px;
}

.navbar-dark .navbar-nav{
	margin-left: -25px;
}

@media only screen and (max-width: 993px) {
   	.var_size {
    	font-size: 1.5em;
    }
}

@media only screen and (max-width: 770px) {
   	.var_size {
    	font-size: 1.25em;
    }
}

@media only screen and (max-width: 430px) {
   	.var_size {
    	font-size: 0.9em;
    	font-weight: bold;
    }
}

</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container rounded p-3 my-3 bg-dark text-white">
		<img class="logo" src="images/download.png" alt="logo" />
  		<h3  class="var_size">ABC Hospital Management System</h3>
  		<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
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
			        <a class="dropdown-item" href="UpdatePatient.jsp">Delete Patient</a>
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