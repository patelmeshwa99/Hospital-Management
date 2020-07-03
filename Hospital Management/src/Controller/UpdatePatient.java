package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import Bean.PatientBean;
import Service.PatientService;


@WebServlet("/UpdatePatient")
public class UpdatePatient extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession sess = request.getSession();
	
		if(request.getParameter("pat_id")==null || request.getParameter("pat_id").equals("")) 
		{	
			System.out.println("id null");
			if(sess.getAttribute("search").equals("search")){
				sess.setAttribute("search", "");
				RequestDispatcher rd = request.getRequestDispatcher("SearchPatient.jsp");
				rd.include(request, response);
			}
			else {
				if(sess.getAttribute("update").equals("update")){
					sess.setAttribute("update", "");
					RequestDispatcher rd = request.getRequestDispatcher("UpdatePatient.jsp");
					rd.include(request, response);
				}
				else
				{
					RequestDispatcher rd = request.getRequestDispatcher("DeletePatient.jsp");
					rd.include(request, response);
				}
			}
		}
		else 
		{
			int id = Integer.parseInt(request.getParameter("pat_id"));
			PatientService ps = new PatientService();
			PatientBean pb_old = ps.findPatientByPatientId(id);
			if(request.getParameter("update")==null && request.getParameter("delete")==null) {
				System.out.println("in getttt");
				if(pb_old!=null) 
				{
					response.setContentType("application/json");
			        response.setCharacterEncoding("utf-8");
					System.out.println("Hi");
					JSONObject json = new JSONObject();
				    
				    json.put("patient_id", id);
				    json.put("ssn", pb_old.getSsn_id());
			        json.put("name", pb_old.getName());
			        json.put("age", pb_old.getAge());
			        json.put("date", pb_old.getDate());
			        json.put("bed", pb_old.getBed());
			        json.put("address", pb_old.getAddress());
			        json.put("state", pb_old.getState());
			        json.put("city", pb_old.getCity());
			        System.out.println("innn");
					response.getWriter().write(json.toString());	
				}
				else
				{
					System.out.println("not found");
					if(sess.getAttribute("search")=="search") {
						response.sendRedirect("SearchPatient.jsp");
					}	
				}
			}
			else
			{
				PrintWriter out1 = response.getWriter();
				if(request.getParameter("update")!=null) {
					System.out.println("in updateee");
					PatientBean pb = new PatientBean();
					
					pb.setName(request.getParameter("name"));
					pb.setAge(Integer.parseInt(request.getParameter("age")));
					pb.setDate(request.getParameter("date"));
					pb.setBed(request.getParameter("bed"));
					pb.setAddress(request.getParameter("address"));
					pb.setState(request.getParameter("state"));
					pb.setCity(request.getParameter("city"));
					
					int rows_affected = ps.updatePatient(pb, id);
					
					if(rows_affected == 1) {
						out1.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
						out1.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
						out1.println("<script>");
						out1.println("$(document).ready(function(){");
						out1.println("swal ( '', 'Updated Successfully!!', 'success');");
						out1.println("});");
						out1.println("</script>");
					}
					else
					{
						out1.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
						out1.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
						out1.println("<script>");
						out1.println("$(document).ready(function(){");
						out1.println("swal ( '', 'Updation failed!!', 'error');");
						out1.println("});");
						out1.println("</script>");
						
					}
				}
				else
				{
					System.out.println("in deleteee");
					int rows_affected = ps.deletePatient(id);
					
					if(rows_affected == 1) {
						out1.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
						out1.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
						out1.println("<script>");
						out1.println("$(document).ready(function(){");
						out1.println("swal ( '', 'Customer Deleted Successfully!!', 'success');");
						out1.println("});");
						out1.println("</script>");
						
					}
					else
					{
						out1.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
						out1.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
						out1.println("<script>");
						out1.println("$(document).ready(function(){");
						out1.println("swal ( '', 'Customer deletion failed!!', 'error');");
						out1.println("});");
						out1.println("</script>");
						
					}
				}
				if(sess.getAttribute("search").equals("search")){
					sess.setAttribute("search", "");
					RequestDispatcher rd = request.getRequestDispatcher("SearchPatient.jsp");
					rd.include(request, response);
				}
				else {
					if(sess.getAttribute("update").equals("update")){
						sess.setAttribute("update", "");
						RequestDispatcher rd = request.getRequestDispatcher("UpdatePatient.jsp");
						rd.include(request, response);
					}
					else
					{
						RequestDispatcher rd = request.getRequestDispatcher("DeletePatient.jsp");
						rd.include(request, response);
					}
				}
		
			}	
		}
	}
}
	
