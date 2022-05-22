
import model.Employee;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name="EmployeeRegistrationServlet",urlPatterns="/empregister")
public class EmployeeRegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EmployeeRegistrationServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		getServletContext().getRequestDispatcher("/registration.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fname,lname,email,username,pass;
		fname=request.getParameter("first");
		lname=request.getParameter("last");
		email=request.getParameter("email");
		username=request.getParameter("username");
		pass=request.getParameter("pass");
		
		if(fname=="" || lname=="" || email=="" || username=="" || pass=="") {
			request.setAttribute("error", "You are missing one of the input");
		}
		else if(pass.length()<8) {
			request.setAttribute("error", "Password should be minimum 8 characters");
		}
		else {
			try {
				Employee.add(fname,lname,email,username,pass);
			} catch (ClassNotFoundException | SQLException e) {
				request.setAttribute("error", e.toString());
			}
			request.setAttribute("success", "Employee has been registered");
		}
		doGet(request, response);
		
	}

}
