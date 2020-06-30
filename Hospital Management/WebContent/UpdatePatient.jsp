<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>

.row{
	margin-bottom: 15px;
}

.table>tbody>tr>td,
.table>tbody>tr>th {
  border-top: none;
}

body{
	background-image: url("images/hosp.jpg");
	background-size: cover;
	background-attachment: fixed;
}

.jumbotron-fluid {
	background-color:transparent ! important;
} 

.first {
	width: 45%;
}


@media only screen and (max-width: 995px) {
  .top-navbar .navbar-nav .nav-link {
  font-size: 75%;
  }
 
  h3 {
  	font-size: 80%;
  }
  
  
  .first {
  font-size: 80%;
  }
  
}

.btn-dark {
    background-color: black !important;
}

</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script>

	$(document).ready(function(){
		$("#get").click(function(){
			var form = $('#myForm');
			$.ajax({
				type: 'POST',
				data: form.serialize(),
				url: 'SearchPatient',
				success: function(result) {
					$("#pat_id").val(result.patient_id);
					$("#name").val(result.name);
					$("#age").val(result.age);
					$("#address").val(result.address);
					$("#bed").val(result.bed);
					$("#date").val(result.date);
					$("#state").val(result.state);
					$("#city").val(result.city);
				}
			});
		});
	});
	


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
<div class="jumbotron jumbotron-fluid">
  <div class="container">
    <div class="row">
	    <div class="col-3"></div>
	    <div class="col-6">
	    <center><h3 style="margin-top: -20px">Update Patient</h3></center><br>
	    	<form id="myForm" action="SearchPatient" method='POST'>
		    	<table class="table table-borderless">
				    <tr>
				      <th scope="col" class="first">Patient Id: <span style="color:red">*</span></th>
				      <th scope="col"><input style="width: 100%" type="number" id="pat_id" name="pat_id" min="100000000" max="999999999" required></th>
				      <th><button type="button" style="width: 100%; line-height: 15px;" id="get" name="get" class="btn btn-dark">Get</button></th>
				    </tr>
				    <tr>
				      <th scope="col" class="first">Patients Name: </th>
				      <th scope="col"><input style="width: 100%" type="text" id="name" name="name"></th>
				    </tr>
				    <tr>
				      <th scope="col" class="first">Patient Age: </th>
				      <th scope="col"><input style="width: 100%" type="number" id="age" name="age" min="1" max="150"></th>
				    </tr>
				    <tr>
				      <th scope="col" class="first">Date of Admission: </th>
				      <th scope="col"><input style="width: 100%" type="date" id="date" name="date"></th>
				    </tr>
				    <tr>
				      <th scope="col" class="first">Type of bed: </th>
				      <th scope="col">
				      	<select id="bed" name="bed">
						    <option value="General ward">General ward</option>
						    <option value="semi sharing">semi sharing</option>
						    <option value="single room">single room</option>
						  </select>
				      </th>
				    </tr>
				    <tr>
				      <th scope="col" class="first">Address: </th>
				      <th scope="col"><textarea style="width: 100%" type="text" id="address" name="address"></textarea></th>
				    </tr>
				    <tr>
				      <th scope="col" class="first">State: </th>
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
				      <th scope="col" class="first">City: </th>
				      <th scope="col">
				      	<select id="city" name="city">
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
					<div class="col-6"><button type="submit" style="width: 100%" id="update" name="update" class="btn btn-dark">Update</button></div>
					<div class="col-6"><button type="submit" style="width: 100%" id="delete" name="delete" class="btn btn-dark">Delete</button></div>
				</div>
			</form>
	    </div>
    	<div class="col-3"></div>
  	</div>
  </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
</body>
</html>