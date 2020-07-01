<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous"><script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<link rel="stylesheet" href="//cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">

<style>

.jumbotron-fluid {
	background-color:transparent ! important;
} 

table{
  text-align: center ;
  border: 1px solid black;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
}

.btn-dark {
    background-color: black !important;
}

body{
	background-image: url("images/hosp.jpg");
	background-size: cover;
	background-attachment: fixed;
}

th{
  background-color: rgb(255, 224, 102);
  border: 1px solid black;
  border-collapse: collapse;
  padding: 10px;
}
td{
  padding: 10px;
  border: 1px solid black;
  border-collapse: collapse;
}
            
</style>
          
          
            
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
	<div class="panel-body">
		<table id="tbl-patient" class="table table-bordered" cellpadding="0" cellspacing="0" width="100%">
			<thead>
				<tr>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
				</tr>
			</thead>
		</table>
	</div>
	</div>
<script src="component/jquery/jquery.js" type="text/javascript"></script>
<script src="component/jquery/jquery.min.js" type="text/javascript"></script>
<script src="component/jquery.validate.min.js" type="text/javascript"></script>
<script src="//cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js" type="text/javascript"></script>

	
<script>
getall();
	function getall() 
	{
		$("#tbl-patient").dataTable().fnDestroy();
		$.ajax({
			url: "all_patients.jsp",
			type: "get",
			dataType: "json",
			success: function(data)
			{
				$("#tbl-patient").dataTable({
					
					"aaData": data,
					"scrollX": true,
					"aoColumns": [
							{"sTitle": "Patient Id", "mData": "patient_id"},
							{"sTitle": "Name", "mData": "name"},
							{"sTitle": "Age", "mData": "age"},
							{"sTitle": "Address", "mData": "address"},
							{"sTitle": "DOJ", "mData": "date"},
							{"sTitle": "Type of Room", "mData": "bed"},
							
						]
				});
			      console.log(data[0]["date"]);

			},
			reload: function(json){
			    $('#myInput').val( json.lastInput );
			},
			error: function(xhr, status, error) {
			      console.log("failure");
			   }
		});
	}
</script>
</body>

</html>