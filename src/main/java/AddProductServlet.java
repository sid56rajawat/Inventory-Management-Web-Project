
import model.Product;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name="/AddProductServlet",urlPatterns="/addproducts")
public class AddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AddProductServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		getServletContext().getRequestDispatcher("/addproducts.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("pid")=="" || request.getParameter("quantity")=="" || request.getParameter("name")=="" || request.getParameter("price")=="") {
			request.setAttribute("error", "One of the fields is empty");
			doGet(request,response);
		}
		
		int pid=Integer.parseInt(request.getParameter("pid"));
		String name=request.getParameter("name");
		float price = Float.parseFloat(request.getParameter("price"));
		int qt=Integer.parseInt(request.getParameter("quantity"));
		
		try {
			if(Product.check(pid)) {
				Product.update(pid,name,price,qt);
				request.setAttribute("success", "Product Already exist and Updated Successfully");
			}
			else {
				Product.add(pid,name,price,qt);
				request.setAttribute("success", "Product Added Successfully");
			}
		} catch (ClassNotFoundException | SQLException e) {
			request.setAttribute("error", e.toString());
		}
		doGet(request, response);
	}

}
