package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.PatientBean;
import Service.PatientService;

@WebServlet("/CreatePatient")
public class CreatePatient extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("ssnId"));
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String date = request.getParameter("date");
		System.out.println(date);
		String bed = request.getParameter("bed");
		String address = request.getParameter("address");
		String state = request.getParameter("state");
		String city = request.getParameter("city");
		
		String errorMsg = "";
		
		PrintWriter out = response.getWriter();
		
		if(Integer.toString(id) == null || Integer.toString(id).equals("")) {
			errorMsg = "Customer SSM Id can't be null!";
		}
		if(name == null || name.equals("")) {
			errorMsg = "Name can't be null!";
		}
		if(Integer.toString(age)==null || Integer.toString(age).equals("")) {
			errorMsg = "Age can't be null!";
		}
		if(date==null || date.equals("")) {
			errorMsg = "Age can't be null!";
		}
		if(bed==null || bed.equals("")) {
			errorMsg = "Age can't be null!";
		}
		if(address == null || address.equals("")) {
			errorMsg = "Address can't be null!";
		}
		if(state == null || state.equals("")) {
			errorMsg = "State can't be null!";
		}
		if(city == null || city.equals("")) {
			errorMsg = "City can't be null!";
		}
		
		if(!errorMsg.equals("")) {
			response.sendRedirect("CreatePatient.jsp");
			System.out.println(errorMsg);
		}
		
		else {
			
			PatientService ps = new PatientService();
			if(ps.findPatientBySsnId(id)==null) {
				PatientBean patient = new PatientBean();
				patient.setSsn_id(id);
				patient.setName(name);
				patient.setAge(age);
				patient.setDate(date);
				patient.setBed(bed);
				patient.setAddress(address);
				patient.setState(state);
				patient.setCity(city);
		
				if(ps.insertPatient(patient)) {
				
					out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
					out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
					out.println("<script>");
					out.println("$(document).ready(function(){");
					out.println("swal ( 'Status', 'Patient registered successfully!!', 'success');");
					out.println("});");
					out.println("</script>");
					
					
					RequestDispatcher rd = request.getRequestDispatcher("CreatePatient.jsp");
					rd.include(request, response);

				}
				else
				{
					out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
					out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
					out.println("<script>");
					out.println("$(document).ready(function(){");
					out.println("swal ( 'Status', 'Customer registration failed!!', 'error');");
					out.println("});");
					out.println("</script>");
					
					RequestDispatcher rd = request.getRequestDispatcher("CreatePatient.jsp");
					rd.include(request, response);
	
	
				}
		}
			else {
				out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
				out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
				out.println("<script>");
				out.println("$(document).ready(function(){");
				out.println("swal ( 'Status', 'Customer with given SSN ID exists!!', 'error');");
				out.println("});");
				out.println("</script>");
				
				RequestDispatcher rd = request.getRequestDispatcher("CreatePatient.jsp");
				rd.include(request, response);

			}
		
	}


		
	}

}
