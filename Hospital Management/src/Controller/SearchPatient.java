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

@WebServlet("/SearchPatient")
public class SearchPatient extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession sess = request.getSession();
		System.out.println(sess.getAttribute("search"));
		if(request.getParameter("pat_id")==null || request.getParameter("pat_id").equals("")) 
		{	
			System.out.println("id null");
			RequestDispatcher rd = request.getRequestDispatcher("SearchPatient.jsp");
			rd.include(request, response);
		}
		else
		{
			int id = Integer.parseInt(request.getParameter("pat_id"));
			PatientService ps = new PatientService();
			PatientBean pb_old = ps.findPatientByPatientId(id);
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
				response.sendRedirect("SearchPatient.jsp");
			}
		}
	}

}
