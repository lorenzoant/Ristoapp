package ristoapp.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ristoapp.bean.RistorantiBean;
import ristoapp.db.SaveMySQL;

/**
 * Servlet implementation class BachecaServlet
 */
@WebServlet("/BachecaServlet")
public class BachecaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BachecaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String whatsend = request.getParameter("whatsend");
		int ID = Integer.parseInt(request.getParameter("IDRisto"));
		
	
		
		if(whatsend.equalsIgnoreCase("scheda")) { // Scarico le informazioni sulla prenotazione
			
			
			SaveMySQL db = new SaveMySQL();
			
			try {
				ArrayList<RistorantiBean> p = db.getInfoRistoID(ID);
	
				
				// Salvo in sessione per aprire nella JSP
				request.getSession().removeAttribute("DETRISTO");
				request.getSession().setAttribute("DETRISTO", p);
				
				// Reindirizzo alla pagina di visualizzazione
				response.sendRedirect("scheda.jsp");
				return;
			} catch (Exception e) {
				// Problema nel database, reindirizzo alla pagine di errore generico
				e.printStackTrace();
				
				ServletContext sc = request.getSession().getServletContext();
				RequestDispatcher rd = sc.getRequestDispatcher("/erroregenerico.jsp");
				rd.forward(request, response);
			}	
			
		}

		
	}

}
