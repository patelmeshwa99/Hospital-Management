<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/spinkit.css">
<title>Login</title>
<style>
	
.container {
	height: 130px;
}
	
.rounded {
    border-radius:.25rem!important
}	
	
body{
	background-image: url("images/hosp.jpg");
	background-size: cover;
	background-attachment: fixed;
}

img {
	float: left;
    max-width: 100%;
    max-height: 100%;
    margin-right: 5%;
}
	
h1{
	margin: 0;
  	position: relative;
  	top: 45%;
  	-ms-transform: translateY(-50%);
  	transform: translateY(-50%);
}

.adv{
	margin: 0;
  	position: relative;
  	top: 45%;
  	-ms-transform: translateY(30%);
  	transform: translateY(30%);
}		

@media only screen and (max-width: 993px) {
   	h1 {
    	font-size: 1.9em;
    }
}

@media only screen and (max-width: 770px) {
   	h1 {
    	font-size: 1.5em;
    }
}
	
</style>
<script>

function validate() {
	
	const uname = document.getElementById("uname").value;
	const password= document.getElementById("pwd").value;
	const form = document.getElementById("form");
	
	var expr = /^[a-zA-Z0-9]{8,}$/;
	var passw = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{10}$/;
	
	if(!(uname.match(expr))){
		alert('Invalid username!!');
		
	}else if(!(password.match(passw))){
		alert('Invalid password!!');
	}else{
		form.action="LoginServlet";
	}
	
}
	
	$(document).ready(function() {
		//Preloader
		preloaderFadeOutTime = 1500;
		function hidePreloader() {
		var preloader = $('.spinner-wrapper');
		preloader.fadeOut(preloaderFadeOutTime);
		}
		hidePreloader();
	});
</script>
</head>
<body>
	<div class="spinner-wrapper">
		<div class="spinner"></div>
	</div>
	<div class="container rounded p-3 my-3 bg-dark text-white">
		<img src="images/download.png" alt="logo" />
  		<h1>ABC Hospital Management System</h1>
  	</div>
	<center>
		<div class="card adv" style="width:400px">
	    	<span class="border border-dark rounded">
			  	<div class="card bg-dark text-white">
			    	<div class="card-body" style="font-size: 1.2em;">Login</div>
			  	</div>
				<div class="card-body">
				    <form id="form" action="" onsubmit="validate()" method="POST">
						<input type="text" class="form-control" id="uname" placeholder="Username" name="uname"><br><div id="extra"></div>
					  	<input type="password" class="form-control" id="pwd" placeholder="Password" name="pswd"><br><div class="text-center"> 
				      	<button type="submit" class="btn btn-outline-dark">Login</button>
				    </form>
				</div>
			</span>
		</div>
	</center>

</body>
</html>