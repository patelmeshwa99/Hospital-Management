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
function myFunction(){
		var form = $('#myForm');
		$.ajax({
			type: 'POST',
		data: form.serialize(),
		url: 'IssueMedicines',
			//success: function(result) {
				//$("#pat_id").val(result.patient_id);
				//$("#name").val(result.name);
				//if(result.name==undefined){
//					alert("Patient not found!!");
				//}
				//$("#age").val(result.age);
				//$("#address").val(result.address);
				//$("#bed").val(result.bed);
				//$("#date").val(result.date);
				//$("#state").val(result.state);
			//	$("#city").val(result.city);
			//}
		});
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
	
	<center><h3 style="margin-top: 40px">Issue Medicines</h3></center><br>

	<div class="container" style="width: 40%; margin-top:10px; margin-bottom:30px">
	    <form id="myForm" action="IssueMedicines" method="POST" onsubmit="check_ssn()">
			<div class="form-group">
			  <label for="med_name">Medicine Name: <span style="color:red">*</span></label>
			  <input type="text" id="med_name" name="med_name" class="form-control" required>
			  	<%
			  if(request.getAttribute("msg")!=null){
				  String error=(String)request.getAttribute("msg");
				  %>
				  <div><%=error%></div>
				  <%
				  System.out.println(error);
				  System.out.println(error);
			  }
			  	%>
			</div>
		    <div class="form-group">
			  <label for="quantity">Quantity:</label>
		      <input type="number" id="quantity" name="quantity" class="form-control">
		    </div>
		    <center><button type="submit" style="width: 40%;margin-top: 40px" id="check" name="check" onclick="myFunction()" class="btn btn-dark">Check</button></center>
		</form>
	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	
</body>
</html>