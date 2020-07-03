package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Service.MedicineService;


@WebServlet("/IssueMedicines")
public class IssueMedicines extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		System.out.println("in here");
		String med_name = request.getParameter("med_name");
		
		MedicineService ms = new MedicineService();
		boolean check = ms.checkAvailabilityByName(med_name);
		System.out.println(check);
		String msg="";
		if(check) {
			msg="Medicine available";
			request.setAttribute("msg",msg);
			RequestDispatcher rd = request.getRequestDispatcher("IssueMedicines.jsp");
			rd.forward(request, response);
			
		}
//		
	}

}
