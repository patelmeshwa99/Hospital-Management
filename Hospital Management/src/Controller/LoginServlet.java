package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.LoginDao;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String uname = request.getParameter("uname");
		String pass = request.getParameter("pswd");
		
		LoginDao dao = new LoginDao();
		
		if(dao.check(uname, pass)) {
			dao.updateTimestamp(uname,pass);
			HttpSession session = request.getSession();
			session.setAttribute("username", request.getParameter("uname"));
			response.sendRedirect("CreatePatient.jsp");
		}
		else
		{
			response.sendRedirect("login.jsp");
		}
	}

}
