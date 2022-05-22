
import model.Product;
import model.Bill;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name="ProductServlet",urlPatterns="/sellproduct")
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ProductServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		getServletContext().getRequestDispatcher("/products.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("pid")=="" || request.getParameter("quantity")=="") {
			request.setAttribute("error", "One of the fields is empty");
			doGet(request,response);
		}
		
		int pid=Integer.parseInt(request.getParameter("pid"));
		int qt=Integer.parseInt(request.getParameter("quantity"));
		
		
		try {
			if(Product.check(pid)) {
				//add to table
				if(Product.checkAvailability(pid,qt)){
					Product.sell(pid,qt);
					Bill.add(pid,qt);
				}
				else {
					request.setAttribute("error", "Product Quantity Out of Range");
				}
			}
			else {
				request.setAttribute("error", "Invalid Product ID");
			}
		} catch (ClassNotFoundException | SQLException e) {
			request.setAttribute("error", e.toString());
		}
		doGet(request, response);
	}

}
