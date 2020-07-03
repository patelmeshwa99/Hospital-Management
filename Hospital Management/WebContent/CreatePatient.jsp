<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>

label {
	font-weight: bold;
}

body{
	background-image: url("images/hosp.jpg");
	background-size: cover;
	background-attachment: fixed;
}


@media only screen and (max-width: 600px) {
	
	.container{
		width: 100% !important;
	}
}


@media only screen and (max-width: 1400px) {

	h3 {
  		font-size: 1.24rem !important;
  		font-weight:bold !important;
  }
}

.btn-dark {
    background-color: black !important;
}

</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script>
function check_ssn() {
	const ssnId = document.getElementById("ssn").value;
	if(ssnId.length==9){
		document.getElementById("myForm").action = "CreatePatient";
		return true;
	}
		alert("SSN should be 9 characters long!!");
		reset();
		
}

	function reset(){
	  document.getElementById("myForm").reset();
	}


</script>
</head>
<body>
<%

	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	if(session.getAttribute("username")==null){
		response.sendRedirect("login.jsp");
	}
%>

<%@ include file = "header.jsp" %>
	
	<center><h3 style="margin-top: 40px">Patient Registration</h3></center><br>
	<div class="container" style="width: 40%; margin-top:10px; margin-bottom:30px">
	    <form id="myForm" action="CreatePatient" method="POST" onsubmit="check_ssn()">
		    <div class="form-group">
		      <label for="email">Patient SSN Id: <span style="color:red">*</span></label>
		      <input type="number" id="ssn" name="ssnId" min="100000000" max="999999999" class="form-control" required>
		    </div>
		    <div class="form-group">
			  <label for="name">Patient Name: <span style="color:red">*</span></label>
		      <input type="text" id="name" name="name" class="form-control" required>
		    </div>
		    <div class="form-group">
			  <label for="age">Patient Age: <span style="color:red">*</span></label>
		      <input type="number" id="age" name="age" class="form-control" min="1" max="150" required>
		    </div>
		    <div class="form-group">
		      <label for="date">Date of Admission: <span style="color:red">*</span></label>
		      <input type="date" class="form-control" id="date" name="date" required>
		    </div>
		    <div class="form-group">
		      <label for="bed">Type of bed: <span style="color:red">*</span></label>
		      <select class="form-control" id="bed" name="bed">
			  	<option value="General ward">General ward</option>
				<option value="semi sharing">semi sharing</option>
				<option value="single room">single room</option>
	 		  </select>
		    </div>
		    <div class="form-group">
    			<label for="address">Address: <span style="color:red">*</span></label>
    			<textarea class="form-control" id="address" name="address" required></textarea>
  			</div>
		    <div class="form-group">
		      <label for="state">State: <span style="color:red">*</span></label>
		      <select class="form-control" id="state" name="state" required>
			  	<option value="Gujarat">Gujarat</option>
				<option value="Maharashtra">Maharashtra</option>
				<option value="West Bengal">West Bengal</option>
	 		  </select>
		    </div>
		    <div class="form-group">
		      <label for="state">City: <span style="color:red">*</span></label>
		      <select class="form-control" id="city" name="city" required>
			  	<option value="Ahmedabad">Ahmedabad</option>
				<option value="Gandhinagar">Gandhinagar</option>
				<option value="Surat">Surat</option>
	 		  </select>
		    </div>
		    <div class="row" style="padding-top: 20px">
				<div class="col-6"><button type="submit" style="width: 100%" class="btn btn-dark">Submit</button></div>
				<div class="col-6"><button type="button" style="width: 100%" onclick="reset()" class="btn btn-dark adv">Reset</button></div>
			</div>
   	    </form>
	</div>
	
<!-- <div class="jumbotron jumbotron-fluid" style="margin-top:20px;">
  <div class="container">
    <div class="row">
	    <div class="col-3"></div>
	    <div class="col-6">
	    <center><h3 style="margin-top: -20px">Patient Registration</h3></center><br>
	    	<form id="myForm" action="CreatePatient" method="POST" onsubmit="check_ssn()">
		    	<table class="table table-borderless">
				    <tr>
				      <th scope="col" class="first">Patient SSN Id: <span style="color:red">*</span></th>
				      <th scope="col"><input style="width: 100%" type="number" id="ssn" name="ssnId" min="100000000" max="999999999" required></th>
				    </tr>
				    <tr>
				      <th scope="col" class="first">Patients Name: <span style="color:red">*</span></th>
				      <th scope="col"><input style="width: 100%" type="text" id="fname" name="name" required></th>
				    </tr>
				    <tr>
				      <th scope="col" class="first">Patient Age: <span style="color:red">*</span></th>
				      <th scope="col"><input style="width: 100%" type="number" id="fname" name="age" min="1" max="150" required></th>
				    </tr>
				    <tr>
				      <th scope="col" class="first">Date of Admission: <span style="color:red">*</span></th>
				      <th scope="col"><input style="width: 100%" type="date" id="date" name="date" required></th>
				    </tr>
				    <tr>
				      <th scope="col" class="first">Type of bed: <span style="color:red">*</span></th>
				      <th scope="col">
				      	<select id="bed" name="bed">
						    <option value="General ward">General ward</option>
						    <option value="semi sharing">semi sharing</option>
						    <option value="single room">single room</option>
						  </select>
				      </th>
				    </tr>
				    <tr>
				      <th scope="col" class="first">Address: <span style="color:red">*</span></th>
				      <th scope="col"><textarea style="width: 100%" id="fname" name="address" required></textarea></th>
				    </tr>
				    <tr>
				      <th scope="col" class="first">State: <span style="color:red">*</span></th>
				      <th scope="col">
					      <select id="state" name="state">
						    <option value="Gujarat">Gujarat</option>
						    <option value="Maharashtra">Maharashtra</option>
						    <option value="West Bengal">West Bengal</option>
						    <option value="Delhi">Delhi</option>
						  </select>
					 </th>
				    </tr>
				    <tr>
				      <th scope="col" class="first">City: <span style="color:red">*</span></th>
				      <th scope="col">
				      	<select id="cars" name="city">
						    <option value="Ahmedabad">Ahmedabad</option>
						    <option value="Gandhinagar">Gandhinagar</option>
						    <option value="Rajkot">Rajkot</option>
						    <option value="Surat">Surat</option>
						  </select>
				      </th>
				    </tr>
				    <tr><th colspan="2"><span style="color: red">(*)Fields are mandatory</span></th></tr> 
				</table>
				<div class="row">
					<div class="col-6"><button type="submit" style="width: 100%" class="btn btn-dark">Submit</button></div>
					<div class="col-6"><button type="button" style="width: 100%" onclick="reset()" class="btn btn-dark adv">Reset</button></div>
				</div>
			</form>
	    </div>
    	<div class="col-3"></div>
  	</div>
  </div>
</div>
 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
</body>
</html>