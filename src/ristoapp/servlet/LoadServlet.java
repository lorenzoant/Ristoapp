package ristoapp.servlet;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/LoadServlet")

public class LoadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoadServlet() {
        super();
 
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("caricamento...");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String whatsend = request.getParameter("whatsend");
		
		if(whatsend.equalsIgnoreCase("fine")) {
			//fine del caricamento javascript della bacheca
			System.out.println("--------------------------------");
			System.out.println("FINE CARICAMENTO\n");
			response.sendRedirect("bacheca.jsp");
		}
		
	}

}
