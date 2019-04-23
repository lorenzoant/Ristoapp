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

import ristoapp.bean.QueryPiattiPrenotatiBean;
import ristoapp.db.SaveMySQL;

@WebServlet("/visualizzaprenotazioneindettaglio")
public class VisualizzaPrenotazioneInDettaglio extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
    public VisualizzaPrenotazioneInDettaglio() {
        super();
    }

    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Se l'utente ha usato GET probabilmente non è loggato -> login
		response.sendRedirect("login.jsp");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String whatsend = request.getParameter("whatsend");
		
		if(whatsend.equalsIgnoreCase("visualizzaDettPrenotazione")) { // Scarico le informazioni sulla prenotazione
			int prenotazione = Integer.parseInt(request.getParameter("idPrenotazione"));
			
			SaveMySQL db = new SaveMySQL();
			
			try {
				ArrayList<QueryPiattiPrenotatiBean> p = db.prelevaDettagliPrenotazioneConPiatti(prenotazione);
				
				// Salvo in sessione per aprire nella JSP
				request.getSession().removeAttribute("DETTAGLIPRENOTAZIONECONPIATTO");
				request.getSession().setAttribute("DETTAGLIPRENOTAZIONECONPIATTO", p);
				
				// Reindirizzo alla pagina di visualizzazione
				response.sendRedirect("visualizzadettagliprenotazione.jsp");
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
